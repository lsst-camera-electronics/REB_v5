-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : VcPrbsRx.vhd
-- Author     : Larry Ruckman  <ruckman@slac.stanford.edu>
-- Company    : SLAC National Accelerator Laboratory
-- Created    : 2014-04-02
-- Last update: 2014-04-04
-- Platform   : Vivado 2013.3
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:   This module generates 
--                PseudoRandom Binary Sequence (PRBS) on Virtual Channel Lane.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.StdRtlPkg.all;
use work.VcPkg.all;

entity VcPrbsRx is
   generic (
      TPD_G              : time                       := 1 ns;
      LANE_NUMBER_G      : integer range 0 to 255     := 0;
      VC_NUMBER_G        : integer range 0 to 3       := 0;
      RST_ASYNC_G        : boolean                    := false;
      GEN_SYNC_FIFO_G    : boolean                    := false;
      BRAM_EN_G          : boolean                    := true;
      FIFO_ADDR_WIDTH_G  : integer range 4 to 48      := 9;
      USE_DSP48_G        : string                     := "no";
      ALTERA_SYN_G       : boolean                    := false;
      ALTERA_RAM_G       : string                     := "M9K";
      USE_BUILT_IN_G     : boolean                    := false;  --if set to true, this module is only Xilinx compatible only!!!
      LITTLE_ENDIAN_G    : boolean                    := false;
      XIL_DEVICE_G       : string                     := "7SERIES";  --Xilinx only generic parameter    
      FIFO_SYNC_STAGES_G : integer range 3 to (2**24) := 3;
      FIFO_INIT_G        : slv                        := "0";
      FIFO_FULL_THRES_G  : integer range 1 to (2**24) := 256;    -- Almost full at 1/2 capacity
      FIFO_EMPTY_THRES_G : integer range 0 to (2**24) := 0);
   port (
      -- Input RX VC Signals (vcRxClk domain)
      vcRxOut              : in  VcRxOutType;
      vcRxCommonOut        : in  VcRxCommonOutType;
      vcTxIn_locBuffAFull  : out sl;
      vcTxIn_locBuffFull   : out sl;
      -- TX VC Signals (vcTxClk domain)
      vcTxIn               : out VcTxInType;
      vcTxOut              : in  VcTxOutType := (others => '1');
      vcRxOut_remBuffAFull : in  sl          := '0';
      vcRxOut_remBuffFull  : in  sl          := '0';
      -- Error Detection Signals (vcRxClk domain)
      updatedResults       : out sl;
      busy                 : out sl;
      errMissedPacket      : out sl;
      errLength            : out sl;
      errEofe              : out sl;
      errWordCnt           : out slv(31 downto 0);
      errbitCnt            : out slv(31 downto 0);
      packetRate           : out slv(31 downto 0);
      packetLength         : out slv(31 downto 0);
      -- Clocks and Resets
      vcRxClk              : in  sl;
      vcRxRst              : in  sl;
      vcTxClk              : in  sl;
      vcTxRst              : in  sl); 
end VcPrbsRx;

architecture rtl of VcPrbsRx is

   constant TAP_C         : NaturalArray(0 to 0) := (others => 16);
   constant MAX_ERR_CNT_C : slv(31 downto 0)     := (others => '1');

   type StateType is (
      IDLE_S,
      UPPER_S,
      LOWER_S,
      DATA_S,
      BIT_ERR_S,
      SEND_RESULT_S);   
   type RegType is record
      busy            : sl;
      packetLength    : slv(31 downto 0);
      eof             : sl;
      eofe            : sl;
      errLength       : sl;
      updatedResults  : sl;
      errMissedPacket : sl;
      errorBits       : slv(15 downto 0);
      bitPntr         : slv(3 downto 0);
      errWordCnt      : slv(31 downto 0);
      errbitCnt       : slv(31 downto 0);
      eventCnt        : slv(15 downto 0);
      randomData      : slv(31 downto 0);
      dataCnt         : slv(31 downto 0);
      stopTime        : slv(31 downto 0);
      startTime       : slv(31 downto 0);
      packetRate      : slv(31 downto 0);
      dsBuff16In      : VcDsBuff16InType;
      usBuff32In      : VcUsBuff32InType;
      state           : StateType;
   end record;
   constant REG_INIT_C : RegType := (
      '1',
      toSlv(3, 32),
      '0',
      '0',
      '0',
      '0',
      '0',
      (others => '0'),
      (others => '0'),
      (others => '0'),
      (others => '0'),
      (others => '0'),
      (others => '0'),
      (others => '0'),
      (others => '0'),
      (others => '1'),
      (others => '1'),
      VC_DS_BUFF16_IN_INIT_C,
      VC_US_BUFF32_IN_INIT_C,
      IDLE_S);
   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

   signal dsBuff16In  : VcDsBuff16InType;
   signal dsBuff16Out : VcDsBuff16OutType;

   signal usBuff32In  : VcUsBuff32InType;
   signal usBuff32Out : VcUsBuff32OutType;
   
begin

   VcDsBuff16_Inst : entity work.VcDsBuff16
      generic map (
         TPD_G              => TPD_G,
         RST_ASYNC_G        => RST_ASYNC_G,
         RX_LANES_G         => 1,
         GEN_SYNC_FIFO_G    => true,    -- locClk and vcRxClk are the same clock
         BRAM_EN_G          => BRAM_EN_G,
         FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
         USE_DSP48_G        => USE_DSP48_G,
         ALTERA_SYN_G       => ALTERA_SYN_G,
         ALTERA_RAM_G       => ALTERA_RAM_G,
         USE_BUILT_IN_G     => USE_BUILT_IN_G,
         LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
         XIL_DEVICE_G       => XIL_DEVICE_G,
         FIFO_SYNC_STAGES_G => FIFO_SYNC_STAGES_G,
         FIFO_INIT_G        => FIFO_INIT_G,
         FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
         FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)
      port map (
         -- RX VC Signals (vcRxClk domain)
         vcRxOut             => vcRxOut,
         vcRxCommonOut       => vcRxCommonOut,
         vcTxIn_locBuffAFull => vcTxIn_locBuffAFull,
         vcTxIn_locBuffFull  => vcTxIn_locBuffFull,
         -- DS signals  (locClk domain)
         dsBuff16In          => dsBuff16In,
         dsBuff16Out         => dsBuff16Out,
         -- Local clock and resets
         locClk              => vcRxClk,
         locRst              => vcRxRst,
         -- VC Tx Clock And Resets
         vcRxClk             => vcRxClk,
         vcRxRst             => vcRxRst); 

   comb : process (dsBuff16Out, r, usBuff32Out, vcRxRst) is
      variable v : RegType;
   begin
      -- Latch the current value
      v := r;

      -- Reset strobe signals
      v.usBuff32In.valid := '0';
      v.usBuff32In.sof   := '0';
      v.usBuff32In.eof   := '0';
      v.usBuff32In.eofe  := '0';
      v.updatedResults   := '0';

      -- Check for roll over
      if r.stopTime /= r.startTime then
         -- Increment the rate counter
         v.stopTime := r.stopTime + 1;
      end if;

      case (r.state) is
         ----------------------------------------------------------------------
         when IDLE_S =>
            -- Reset the busy flag
            v.busy             := '0';
            -- Ready to receive data
            v.dsBuff16In.ready := '1';
            -- Check for a FIFO read
            if (dsBuff16Out.valid = '1') and (r.dsBuff16In.ready = '1') then
               -- Check for a start of frame
               if dsBuff16Out.sof = '1' then
                  -- Calculate the time between this packet and the previous one
                  v.packetRate      := r.stopTime - r.startTime;
                  v.startTime       := r.stopTime;
                  -- Reset the error counters
                  v.errWordCnt      := (others => '0');
                  v.errbitCnt       := (others => '0');
                  v.errMissedPacket := '0';
                  v.errLength       := '0';
                  v.eof             := '0';
                  v.eofe            := '0';
                  -- Check if we have missed a packet 
                  if dsBuff16Out.data /= r.eventCnt then
                     -- Set the error flag
                     v.errMissedPacket := '1';
                  end if;
                  -- Align the event counter to the next packet
                  v.eventCnt   := dsBuff16Out.data + 1;
                  -- Latch the SEED for the randomization
                  v.randomData := (x"0000" & dsBuff16Out.data);
                  -- Set the busy flag
                  v.busy       := '1';
                  -- Increment the counter
                  v.dataCnt    := r.dataCnt + 1;
                  -- Next State
                  v.state      := UPPER_S;
               end if;
            end if;
         ----------------------------------------------------------------------
         when UPPER_S =>
            -- Check for a FIFO read
            if (dsBuff16Out.valid = '1') and (r.dsBuff16In.ready = '1') then
               -- Latch the upper packetLength value
               v.packetLength(31 downto 16) := dsBuff16Out.data;
               -- Increment the counter
               v.dataCnt                    := r.dataCnt + 1;
               -- Next State
               v.state                      := LOWER_S;
            end if;
         ----------------------------------------------------------------------
         when LOWER_S =>
            -- Check for a FIFO read
            if (dsBuff16Out.valid = '1') and (r.dsBuff16In.ready = '1') then
               -- Calculate the next data word
               v.randomData                := lfsrShift(r.randomData, TAP_C);
               -- Latch the lower packetLength value
               v.packetLength(15 downto 0) := dsBuff16Out.data;
               -- Increment the counter
               v.dataCnt                   := r.dataCnt + 1;
               -- Next State
               v.state                     := DATA_S;
            end if;
         ----------------------------------------------------------------------
         when DATA_S =>
            -- Check for a FIFO read
            if (dsBuff16Out.valid = '1') and (r.dsBuff16In.ready = '1') then
               -- Calculate the next data word
               v.randomData := lfsrShift(r.randomData, TAP_C);
               -- Increment the data counter
               v.dataCnt    := r.dataCnt + 1;
               -- Compare the data word to calculated data word
               if r.randomData(15 downto 0) /= dsBuff16Out.data then
                  -- Check for roll over
                  if r.errWordCnt /= MAX_ERR_CNT_C then
                     -- Increment the word error counter
                     v.errWordCnt := r.errWordCnt + 1;
                  end if;
                  -- Latch the bits with error
                  v.errorBits        := (r.randomData(15 downto 0) xor dsBuff16Out.data);
                  -- Stop reading the FIFO
                  v.dsBuff16In.ready := '0';
                  -- Check the eof flag
                  if (r.dataCnt = r.packetLength) or (dsBuff16Out.eof = '1') then
                     -- Reset the counter
                     v.dataCnt := (others => '0');
                     -- Set the local eof flag
                     v.eof     := '1';
                     -- Latch the packets eofe flag
                     v.eofe    := dsBuff16Out.eofe;
                     -- Check the data packet length
                     if (r.dataCnt /= r.packetLength) or (dsBuff16Out.eof = '0') then
                        -- wrong length detected
                        v.errLength := '1';
                     end if;
                  end if;
                  -- Next State
                  v.state := BIT_ERR_S;
               -- Valid Data has been detected
               -- Now going to check the eof flag and packet length
               elsif (r.dataCnt = r.packetLength) or (dsBuff16Out.eof = '1') then
                  -- Reset the counter
                  v.dataCnt := (others => '0');
                  -- Set the local eof flag
                  v.eof     := '1';
                  -- Latch the packets eofe flag
                  v.eofe    := dsBuff16Out.eofe;
                  -- Check the data packet length
                  if (r.dataCnt /= r.packetLength) or (dsBuff16Out.eof = '0') then
                     -- wrong length detected
                     v.errLength := '1';
                  end if;
                  -- Stop reading the FIFO
                  v.dsBuff16In.ready := '0';
                  -- Next State
                  v.state            := SEND_RESULT_S;
               end if;
            end if;
         ----------------------------------------------------------------------
         when BIT_ERR_S =>
            -- Increment the counter
            v.bitPntr := r.bitPntr + 1;
            -- Check for an error bit
            if r.errorBits(conv_integer(r.bitPntr)) = '1' then
               -- Check for roll over
               if r.errbitCnt /= MAX_ERR_CNT_C then
                  -- Increment the bit error counter
                  v.errbitCnt := r.errbitCnt + 1;
               end if;
            end if;
            -- Check the bit pointer
            if r.bitPntr = 15 then
               -- Reset the counter
               v.bitPntr := (others => '0');
               -- Check if there was an eof flag
               if r.eof = '1' then
                  -- Next State
                  v.state := SEND_RESULT_S;
               else
                  -- Ready for more data
                  v.dsBuff16In.ready := '1';
                  -- Next State
                  v.state            := DATA_S;
               end if;
            end if;
         ----------------------------------------------------------------------
         when SEND_RESULT_S =>
            -- Check the upstream buffer status
            if usBuff32Out.almostFull = '0' then
               -- Sending Data 
               v.usBuff32In.valid := '1';
               -- Increment the data counter
               v.dataCnt          := r.dataCnt + 1;
               -- Send data w.r.t. the counter
               case (r.dataCnt) is
                  when toSlv(0, 32) =>
                     -- Update strobe for the results
                     v.updatedResults                := '1';
                     -- Write the data to the TX virtual channel
                     v.usBuff32In.sof                := '1';
                     v.usBuff32In.data(31 downto 16) := x"FFFF";  -- static pattern for software alignment
                     v.usBuff32In.data(15 downto 8)  := toSlv(LANE_NUMBER_G, 8);  -- pointer to the Virtual Channel
                     v.usBuff32In.data(7 downto 0)   := toSlv(VC_NUMBER_G, 8);  -- pointer to the Virtual Channel
                  when toSlv(1, 32) =>
                     v.usBuff32In.data := r.packetLength;
                  when toSlv(2, 32) =>
                     v.usBuff32In.data := r.packetRate;
                  when toSlv(3, 32) =>
                     v.usBuff32In.data := r.errWordCnt;
                  when toSlv(4, 32) =>
                     v.usBuff32In.data := r.errbitCnt;
                  when others =>
                     -- Reset the counter
                     v.dataCnt                      := (others => '0');
                     -- Send the last word
                     v.usBuff32In.eof               := '1';
                     v.usBuff32In.data(31 downto 3) := (others => '0');
                     v.usBuff32In.data(2)           := r.eofe;
                     v.usBuff32In.data(1)           := r.errLength;
                     v.usBuff32In.data(0)           := r.errMissedPacket;
                     -- Ready to receive data
                     v.dsBuff16In.ready             := '1';
                     -- Reset the busy flag
                     v.busy                         := '0';
                     -- Next State
                     v.state                        := IDLE_S;
               end case;
            end if;
      ----------------------------------------------------------------------
      end case;

      -- Reset
      if (vcRxRst = '1') then
         v := REG_INIT_C;
      end if;

      -- Register the variable for next clock cycle
      rin <= v;

      -- Outputs
      dsBuff16In      <= r.dsBuff16In;
      usBuff32In      <= r.usBuff32In;
      updatedResults  <= r.updatedResults;
      errMissedPacket <= r.errMissedPacket;
      errLength       <= r.errLength;
      errEofe         <= r.eofe;
      errWordCnt      <= r.errWordCnt;
      errbitCnt       <= r.errbitCnt;
      packetRate      <= r.packetRate;
      busy            <= r.busy;
      packetLength    <= r.packetLength;
      
   end process comb;

   seq : process (vcRxClk) is
   begin
      if rising_edge(vcRxClk) then
         r <= rin after TPD_G;
      end if;
   end process seq;

   VcUsBuff32_Inst : entity work.VcUsBuff32
      generic map (
         TPD_G              => TPD_G,
         RST_ASYNC_G        => RST_ASYNC_G,
         TX_LANES_G         => 1,
         GEN_SYNC_FIFO_G    => GEN_SYNC_FIFO_G,
         BRAM_EN_G          => BRAM_EN_G,
         FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
         USE_DSP48_G        => USE_DSP48_G,
         ALTERA_SYN_G       => ALTERA_SYN_G,
         ALTERA_RAM_G       => ALTERA_RAM_G,
         USE_BUILT_IN_G     => USE_BUILT_IN_G,
         LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
         XIL_DEVICE_G       => XIL_DEVICE_G,
         FIFO_SYNC_STAGES_G => FIFO_SYNC_STAGES_G,
         FIFO_INIT_G        => FIFO_INIT_G,
         FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
         FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)
      port map (
         -- TX VC Signals (vcTxClk domain)
         vcTxIn               => vcTxIn,
         vcTxOut              => vcTxOut,
         vcRxOut.valid        => '0',   --unused signal in the module
         vcRxOut.remBuffAFull => vcRxOut_remBuffAFull,
         vcRxOut.remBuffFull  => vcRxOut_remBuffFull,
         -- UP signals  (locClk domain)
         usBuff32In           => usBuff32In,
         usBuff32Out          => usBuff32Out,
         -- Local clock and resets
         locClk               => vcRxClk,
         locRst               => vcRxRst,
         -- VC Tx Clock And Resets
         vcTxClk              => vcTxClk,
         vcTxRst              => vcTxRst);    
end rtl;
