-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : VcPrbsTx.vhd
-- Author     : Larry Ruckman  <ruckman@slac.stanford.edu>
-- Company    : SLAC National Accelerator Laboratory
-- Created    : 2014-04-02
-- Last update: 2014-04-21
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

entity VcPrbsTx is
   generic (
      TPD_G              : time                       := 1 ns;
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
      FIFO_EMPTY_THRES_G : integer range 1 to (2**24) := 1);
   port (
      -- Trigger Signal (locClk domain)
      trig         : in  sl;
      packetLength : in  slv(31 downto 0);
      busy         : out sl;
      -- TX VC Signals (vcTxClk domain)
      vcTxIn       : out VcTxInType;
      vcTxOut      : in  VcTxOutType;
      vcRxOut      : in  VcRxOutType;
      -- Clocks and Resets
      locClk       : in  sl;
      locRst       : in  sl;
      vcTxClk      : in  sl;
      vcTxRst      : in  sl);        
end VcPrbsTx;

architecture rtl of VcPrbsTx is

   constant TAP_C : NaturalArray(0 to 0) := (others => 16);

   type StateType is (
      IDLE_S,
      SEED_RAND_S,
      UPPER_S,
      LOWER_S,
      DATA_S);   
   type RegType is record
      busy         : sl;
      packetLength : slv(31 downto 0);
      eventCnt     : slv(15 downto 0);
      randomData   : slv(31 downto 0);
      dataCnt      : slv(31 downto 0);
      usBuff16In   : VcUsBuff16InType;
      state        : StateType;
   end record;
   constant REG_INIT_C : RegType := (
      '1',
      (others => '0'),
      (others => '0'),
      (others => '0'),
      (others => '0'),
      VC_US_BUFF16_IN_INIT_C,
      IDLE_S);
   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

   signal usBuff16In  : VcUsBuff16InType  := VC_US_BUFF16_IN_INIT_C;
   signal usBuff16Out : VcUsBuff16OutType := VC_US_BUFF16_OUT_INIT_C;
   
begin

   comb : process (locRst, packetLength, r, trig, usBuff16Out) is
      variable v : RegType;
   begin
      -- Latch the current value
      v := r;

      -- Reset strobe signals
      v.usBuff16In.valid := '0';
      v.usBuff16In.sof   := '0';
      v.usBuff16In.eof   := '0';
      v.usBuff16In.eofe  := '0';

      case (r.state) is
         ----------------------------------------------------------------------
         when IDLE_S =>
            -- Reset the busy flag
            v.busy := '0';
            -- Check for a trigger
            if trig = '1' then
               -- Latch the generator seed
               v.randomData := x"0000" & r.eventCnt;
               -- Set the busy flag
               v.busy       := '1';
               -- Check the packet length request value
               if packetLength = 0 then
                  -- Force minimum packet length of 3 (+1)
                  v.packetLength := toSlv(3, 32);
               elsif packetLength = 1 then
                  -- Force minimum packet length of 3 (+1)
                  v.packetLength := toSlv(3, 32);
               elsif packetLength = 2 then
                  -- Force minimum packet length of 3 (+1)
                  v.packetLength := toSlv(3, 32);
               else
                  -- Latch the packet length
                  v.packetLength := packetLength;
               end if;
               -- Next State
               v.state := SEED_RAND_S;
            end if;
         ----------------------------------------------------------------------
         when SEED_RAND_S =>
            -- Check the FIFO status
            if usBuff16Out.almostFull = '0' then
               -- Send the random seed word
               v.usBuff16In.valid := '1';
               v.usBuff16In.sof   := '1';
               v.usBuff16In.data  := r.eventCnt;
               -- Generate the next random data word
               v.randomData       := lfsrShift(r.randomData, TAP_C);
               -- Increment the counter
               v.eventCnt         := r.eventCnt + 1;
               -- Increment the counter
               v.dataCnt          := r.dataCnt + 1;
               -- Next State
               v.state            := UPPER_S;
            end if;
         ----------------------------------------------------------------------
         when UPPER_S =>
            -- Check the FIFO status
            if usBuff16Out.almostFull = '0' then
               -- Send the upper packetLength value
               v.usBuff16In.valid := '1';
               v.usBuff16In.data  := r.packetLength(31 downto 16);
               -- Increment the counter
               v.dataCnt          := r.dataCnt + 1;
               -- Next State
               v.state            := LOWER_S;
            end if;
         ----------------------------------------------------------------------
         when LOWER_S =>
            -- Check the FIFO status
            if usBuff16Out.almostFull = '0' then
               -- Send the lower packetLength value
               v.usBuff16In.valid := '1';
               v.usBuff16In.data  := r.packetLength(15 downto 0);
               -- Increment the counter
               v.dataCnt          := r.dataCnt + 1;
               -- Next State
               v.state            := DATA_S;
            end if;
         ----------------------------------------------------------------------
         when DATA_S =>
            -- Check the FIFO status
            if usBuff16Out.almostFull = '0' then
               -- Send the random data word
               v.usBuff16In.valid := '1';
               v.usBuff16In.data  := r.randomData(15 downto 0);
               -- Generate the next random data word
               v.randomData       := lfsrShift(r.randomData, TAP_C);
               -- Increment the counter
               v.dataCnt          := r.dataCnt + 1;
               -- Check the counter
               if r.dataCnt = r.packetLength then
                  -- Reset the counter
                  v.dataCnt        := (others => '0');
                  -- Set the end of frame flag
                  v.usBuff16In.eof := '1';
                  -- Reset the busy flag
                  v.busy           := '0';
                  -- Next State
                  v.state          := IDLE_S;
               end if;
            end if;
      ----------------------------------------------------------------------
      end case;

      -- Reset
      if (locRst = '1') then
         v := REG_INIT_C;
      end if;

      -- Register the variable for next clock cycle
      rin <= v;

      -- Outputs
      usBuff16In <= r.usBuff16In;
      busy       <= r.busy;
      
   end process comb;

   seq : process (locClk) is
   begin
      if rising_edge(locClk) then
         r <= rin after TPD_G;
      end if;
   end process seq;

   VcUsBuff16_Inst : entity work.VcUsBuff16
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
         vcTxIn      => vcTxIn,
         vcTxOut     => vcTxOut,
         vcRxOut     => vcRxOut,
         -- UP signals  (locClk domain)
         usBuff16In  => usBuff16In,
         usBuff16Out => usBuff16Out,
         -- Local clock and resets
         locClk      => locClk,
         locRst      => locRst,
         -- VC Tx Clock And Resets
         vcTxClk     => vcTxClk,
         vcTxRst     => vcTxRst);    
end rtl;
