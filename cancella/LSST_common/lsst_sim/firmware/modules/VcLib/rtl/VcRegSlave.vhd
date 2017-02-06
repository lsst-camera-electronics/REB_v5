-------------------------------------------------------------------------------
-- Title      : Register Slave Block
-- Project    : General Purpose Core
-------------------------------------------------------------------------------
-- File       : VcRegSlave.vhd
-- Author     : Ryan Herbst, rherbst@slac.stanford.edu
-- Created    : 2013-07-22
-- Last update: 2014-01-07
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:
-- Slave block for Register protocol.
-- Packet is 16 bytes
-- Word 0   Data[1:0]   = VC
-- Word 0   Data[7:2]   = Dest_ID
-- Word 0   Data[15:8]  = TID[7:0]
-- Word 1   Data[15:0]  = TID[23:8]
-- Word 2   Data[15:0]  = Address[15:0]
-- Word 3   Data[15:14] = OpCode, 0x0=Read, 0x1=Write, 0x2=Set, 0x3=Clear
-- Word 3   Data[13:8]  = Don't Care
-- Word 3   Data[7:0]   = Address[23:16]
-- Word 4   Data[15:0]  = WriteData0[15:0] or ReadCount[8:0]
-- Word 5   Data[15:0]  = WriteData0[31:16]
-- Word N-3 Data[15:0]  = WriteData[15:0]
-- Word N-2 Data[15:0]  = WriteData[31:16]
-- Word N-1             = Don't Care
-- Word N   Data[15:2]  = Don't Care
-- Word N   Data[1]     = Timeout Flag (response data)
-- Word N   Data[0]     = Fail Flag (response data)
--
-- Dependencies:  ^/StdLib/trunk/rtl/Fifo.vhd
-------------------------------------------------------------------------------
-- Copyright (c) 2014 by Ryan Herbst. All rights reserved.
-------------------------------------------------------------------------------
-- Modification history:
-- 07/15/2013: created.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.VcPkg.all;

entity VcRegSlave is
   generic (
      TPD_G           : time                       := 1 ns;
      LANE_G          : integer range 0 to 3       := 0;
      RST_ASYNC_G     : boolean                    := false;
      GEN_SYNC_FIFO_G : boolean                    := false;
      BRAM_EN_G       : boolean                    := true;
      USE_DSP48_G     : string                     := "no";
      ALTERA_SYN_G    : boolean                    := false;
      ALTERA_RAM_G    : string                     := "M9K";
      USE_BUILT_IN_G  : boolean                    := false;  --if set to true, this module is only Xilinx compatible only!!!
      XIL_DEVICE_G    : string                     := "7SERIES";  --Xilinx only generic parameter    
      SYNC_STAGES_G   : integer range 3 to (2**24) := 3;
      ETH_MODE_G      : boolean                    := false);
   port (
      -- RX VC Signals (vcRxClk domain)
      vcRxOut       : in  VcRxOutType;
      vcRxCommonOut : in  VcRxCommonOutType;
      -- TX VC Signals (vcTxClk domain)
      vcTxIn        : out VcTxInType;
      vcTxOut       : in  VcTxOutType;
      -- REG Signals (locClk domain)
      regSlaveIn    : in  VcRegSlaveInType;
      regSlaveOut   : out VcRegSlaveOutType;
      -- Local clock and resets
      locClk        : in  sl;
      locRst        : in  sl := '0';
      -- VC Tx Clock And Resets
      vcTxClk       : in  sl;
      vcTxRst       : in  sl := '0';
      -- VC Rx Clock And Resets
      vcRxClk       : in  sl;
      vcRxRst       : in  sl := '0');

end VcRegSlave;

architecture rtl of VcRegSlave is

   -- Local Signals
   signal rxFifoDin      : slv(17 downto 0);
   signal rxFifoDout     : slv(17 downto 0);
   signal rxFifoRd       : sl;
   signal rxFifoCount    : slv(9 downto 0);
   signal rxFifoEmpty    : sl;
   signal rxFifoErr      : sl;
   signal rxFifoFull     : sl;
   signal locRxSOF       : sl;
   signal locRxEOF       : sl;
   signal locRxEOFE      : sl;
   signal locRxData      : slv(15 downto 0);
   signal intAddress     : slv(23 downto 0);
   signal intData        : slv(31 downto 0);
   signal nxtData        : slv(31 downto 0);
   signal intInp         : sl;
   signal nxtInp         : sl;
   signal intReq         : sl;
   signal nxtReq         : sl;
   signal intOp          : sl;
   signal nxtOp          : sl;
   signal intFail        : sl;
   signal nxtFail        : sl;
   signal intTout        : sl;
   signal nxtTout        : sl;
   signal intEOFE        : sl;
   signal nxtEOFE        : sl;
   signal intReqCnt      : slv(23 downto 0);
   signal regStart       : sl;
   signal regDone        : sl;
   signal intWrData      : slv(31 downto 0);
   signal intOpCode      : slv(1 downto 0);
   signal locTxWr        : sl;
   signal nxtTxWr        : sl;
   signal countEn        : sl;
   signal intCount       : slv(9 downto 0);
   signal locTxSOF       : sl;
   signal nxtTxSOF       : sl;
   signal locTxEOF       : sl;
   signal nxtTxEOF       : sl;
   signal locTxEOFE      : sl;
   signal nxtTxEOFE      : sl;
   signal locTxData      : slv(15 downto 0);
   signal nxtTxData      : slv(15 downto 0);
   signal txFifoValid    : sl;
   signal txFifoRd       : sl;
   signal txFifoWr       : sl;
   signal txFifoDout     : slv(17 downto 0);
   signal txFifoDin      : slv(17 downto 0);
   signal txFifoFull     : sl;
   signal txFifoEmpty    : sl;
   signal txFifoAFull    : sl;
   signal txFifoCount    : slv(9 downto 0);
   signal vcLocBuffAFull : sl;
   signal vcLocBuffFull  : sl;

   -- Master state machine states
   signal   curState   : slv(3 downto 0);
   signal   nxtState   : slv(3 downto 0);
   constant ST_IDLE    : slv(3 downto 0) := "0001";
   constant ST_HEAD_A  : slv(3 downto 0) := "0010";
   constant ST_HEAD_B  : slv(3 downto 0) := "0011";
   constant ST_HEAD_C  : slv(3 downto 0) := "0100";
   constant ST_HEAD_D  : slv(3 downto 0) := "0101";
   constant ST_READ    : slv(3 downto 0) := "0110";
   constant ST_WRITE_A : slv(3 downto 0) := "0111";
   constant ST_WRITE_B : slv(3 downto 0) := "1000";
   constant ST_REQ     : slv(3 downto 0) := "1001";
   constant ST_NEXT    : slv(3 downto 0) := "1010";
   constant ST_DUMP    : slv(3 downto 0) := "1011";
   constant ST_DONE_A  : slv(3 downto 0) := "1100";
   constant ST_DONE_B  : slv(3 downto 0) := "1101";

   -- Register access states
   signal   curRegState  : slv(2 downto 0);
   signal   nxtRegState  : slv(2 downto 0);
   constant ST_REG_IDLE  : slv(2 downto 0) := "001";
   constant ST_REG_WRITE : slv(2 downto 0) := "010";
   constant ST_REG_READ  : slv(2 downto 0) := "011";
   constant ST_REG_SET   : slv(2 downto 0) := "100";
   constant ST_REG_CLEAR : slv(2 downto 0) := "101";
   constant ST_REG_WAIT  : slv(2 downto 0) := "110";
   constant ST_REG_DONE  : slv(2 downto 0) := "111";

begin

   -------------------------------------
   -- Inbound FIFO
   -------------------------------------

   -- Data going into Rx FIFO
   rxFifoDin(17 downto 16) <= "11" when vcRxCommonOut.eofe = '1' or rxFifoErr = '1' else
                              "10" when vcRxCommonOut.eof = '1' else
                              "01" when vcRxCommonOut.sof = '1' else
                              "00";
   rxFifoDin(15 downto 0) <= vcRxCommonOut.data(LANE_G);

   RX_Fifo : entity work.Fifo
      generic map (
         TPD_G           => TPD_G,
         RST_ASYNC_G     => RST_ASYNC_G,
         GEN_SYNC_FIFO_G => GEN_SYNC_FIFO_G,
         BRAM_EN_G       => BRAM_EN_G,
         USE_DSP48_G     => USE_DSP48_G,
         ALTERA_SYN_G    => ALTERA_SYN_G,
         ALTERA_RAM_G    => ALTERA_RAM_G,
         USE_BUILT_IN_G  => USE_BUILT_IN_G,
         XIL_DEVICE_G    => XIL_DEVICE_G,
         SYNC_STAGES_G   => SYNC_STAGES_G,
         DATA_WIDTH_G    => 18,
         ADDR_WIDTH_G    => 10)
      port map (
         rst           => vcRxRst,
         din           => rxFifoDin,
         rd_clk        => locClk,
         rd_en         => rxFifoRd,
         wr_clk        => vcRxClk,
         wr_en         => vcRxOut.valid,
         dout          => rxFifoDout,
         empty         => rxFifoEmpty,
         full          => rxFifoFull,
         wr_data_count => rxFifoCount);           

   -- Data coming out of Rx FIFO
   locRxSOF  <= '1' when rxFifoDout(17 downto 16) = "01" else '0';
   locRxEOF  <= rxFifoDout(17);
   locRxEOFE <= '1' when rxFifoDout(17 downto 16) = "11" else '0';
   locRxData <= rxFifoDout(15 downto 0);

   vcTxIn.locBuffAFull <= vcLocBuffAFull;
   vcTxIn.locBuffFull  <= vcLocBuffFull;

   -- Generate flow control
   process (vcRxClk, vcRxRst)
   begin
      if RST_ASYNC_G and vcRxRst = '1' then
         vcLocBuffAFull <= '0' after TPD_G;
         vcLocBuffFull  <= '0' after TPD_G;
         rxFifoErr      <= '0' after TPD_G;
      elsif rising_edge(vcRxClk) then
         if RST_ASYNC_G = false and vcRxRst = '1' then
            vcLocBuffAFull <= '0' after TPD_G;
            vcLocBuffFull  <= '0' after TPD_G;
            rxFifoErr      <= '0' after TPD_G;
         else
            -- Generate full error
            if rxFifoCount >= 1020 or rxFifoFull = '1' then
               rxFifoErr <= '1' after TPD_G;
            else
               rxFifoErr <= '0' after TPD_G;
            end if;

            -- Almost full at 1/4 capacity
            vcLocBuffAFull <= rxFifoFull or rxFifoCount(9) or rxFifoCount(8);

            -- Full at 1/2 capacity
            vcLocBuffFull <= rxFifoFull or rxFifoCount(9);
         end if;
      end if;
   end process;

   -------------------------------------
   -- Master State Machine
   -------------------------------------

   -- Master State Machine, Sync Logic
   process (locClk, locRst)
   begin
      if RST_ASYNC_G and locRst = '1' then
         intCount   <= (others => '0') after TPD_G;
         intAddress <= (others => '0') after TPD_G;
         intOpCode  <= (others => '0') after TPD_G;
         intWrData  <= (others => '0') after TPD_G;
         locTxWr    <= '0'             after TPD_G;
         locTxSOF   <= '0'             after TPD_G;
         locTxEOF   <= '0'             after TPD_G;
         locTxEOFE  <= '0'             after TPD_G;
         locTxData  <= (others => '0') after TPD_G;
         intEOFE    <= '0'             after TPD_G;
         curState   <= ST_IDLE         after TPD_G;
      elsif rising_edge(locClk) then
         if RST_ASYNC_G = false and locRst = '1' then
            intCount   <= (others => '0') after TPD_G;
            intAddress <= (others => '0') after TPD_G;
            intOpCode  <= (others => '0') after TPD_G;
            intWrData  <= (others => '0') after TPD_G;
            locTxWr    <= '0'             after TPD_G;
            locTxSOF   <= '0'             after TPD_G;
            locTxEOF   <= '0'             after TPD_G;
            locTxEOFE  <= '0'             after TPD_G;
            locTxData  <= (others => '0') after TPD_G;
            intEOFE    <= '0'             after TPD_G;
            curState   <= ST_IDLE         after TPD_G;
         else
            -- Length Counter
            if curState = ST_READ then
               intCount <= locRxData(9 downto 0) after TPD_G;
            elsif countEn = '1' then
               intCount <= intCount -1 after TPD_G;
            end if;

            -- Address counter
            if (((curState = ST_HEAD_C) and ETH_MODE_G) or
                ((curState = ST_HEAD_D) and not ETH_MODE_G)) then
               intAddress(23 downto 16) <= locRxData(7 downto 0) after TPD_G;

            elsif (((curState = ST_HEAD_D) and ETH_MODE_G) or
                   ((curState = ST_HEAD_C) and not ETH_MODE_G)) then
               intAddress(15 downto 0) <= locRxData after TPD_G;

            elsif countEn = '1' then
               intAddress <= intAddress + 1 after TPD_G;
            end if;

            -- Store opcode
            if (((curState = ST_HEAD_D) and not ETH_MODE_G) or
                ((curState = ST_HEAD_C) and ETH_MODE_G)) then
               intOpCode <= locRxData(15 downto 14) after TPD_G;
            end if;

            -- Write data
            if (((curState = ST_WRITE_A) and ETH_MODE_G) or
                ((curState = ST_WRITE_B) and not ETH_MODE_G)) then
               intWrData(31 downto 16) <= locRxData after TPD_G;

            elsif (((curState = ST_WRITE_B) and ETH_MODE_G) or
                   ((curState = ST_WRITE_A) and not ETH_MODE_G)) then
               intWrData(15 downto 0) <= locRxData after TPD_G;
            end if;

            -- EOFE tracker
            intEOFE <= nxtEOFE after TPD_G;

            -- Outbound data
            locTxWr   <= nxtTxWr   after TPD_G;
            locTxSOF  <= nxtTxSOF  after TPD_G;
            locTxEOF  <= nxtTxEOF  after TPD_G;
            locTxEOFE <= nxtTxEOFE after TPD_G;
            locTxData <= nxtTxData after TPD_G;

            -- State transition
            curState <= nxtState after TPD_G;
         end if;
      end if;
   end process;


   -- Master state engine
   process (curState, intCount, intData, intEOFE, intFail, intOpCode, intTout,
            locRxData, locRxEOF, locRxEOFE, locRxSOF, regDone, rxFifoEmpty,
            txFifoAFull) 
   begin

      -- States
      case curState is

         -- IDLE, Wait for data
         when ST_IDLE =>
            regStart  <= '0';
            nxtEOFE   <= '0';
            nxtTxWr   <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= (others => '0');
            countEn   <= '0';

            -- Data is ready
            if rxFifoEmpty = '0' and txFifoAFull = '0' then
               rxFifoRd <= '1';
               nxtState <= ST_HEAD_A;
            else
               rxFifoRd <= '0';
               nxtState <= curState;
            end if;

            -- Read Header A
         when ST_HEAD_A =>
            regStart  <= '0';
            nxtEOFE   <= '0';
            nxtTxSOF  <= '1';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= locRxData;
            countEn   <= '0';

            -- Bad alignment
            if locRxSOF = '0' or locRxEOF = '1' then
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= ST_IDLE;

               -- Data is ready
            elsif rxFifoEmpty = '0' then
               nxtTxWr  <= '1';
               rxFifoRd <= '1';
               nxtState <= ST_HEAD_B;
            else
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= curState;
            end if;

            -- Read Header B
         when ST_HEAD_B =>
            regStart  <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= locRxData;
            countEn   <= '0';

            -- Alignment Error
            if locRxSOF = '1' or locRxEOF = '1' then
               nxtEOFE  <= '1';
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= ST_DUMP;

               -- Data is ready
            elsif rxFifoEmpty = '0' then
               nxtEOFE  <= '0';
               nxtTxWr  <= '1';
               rxFifoRd <= '1';
               nxtState <= ST_HEAD_C;
            else
               nxtEOFE  <= '0';
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= curState;
            end if;

            -- Read Header C
         when ST_HEAD_C =>
            regStart  <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= locRxData;
            countEn   <= '0';

            -- Alignment Error
            if locRxSOF = '1' or locRxEOF = '1' then
               nxtEOFE  <= '1';
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= ST_DUMP;

               -- Data is ready
            elsif rxFifoEmpty = '0' then
               nxtEOFE  <= '0';
               nxtTxWr  <= '1';
               rxFifoRd <= '1';
               nxtState <= ST_HEAD_D;
            else
               nxtEOFE  <= '0';
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= curState;
            end if;

            -- Read Header D
         when ST_HEAD_D =>
            regStart  <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= locRxData;
            countEn   <= '0';

            -- Alignment Error
            if locRxSOF = '1' or locRxEOF = '1' then
               nxtEOFE  <= '1';
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= ST_DUMP;

               -- Data is ready
            elsif rxFifoEmpty = '0' then
               nxtEOFE  <= '0';
               nxtTxWr  <= '1';
               rxFifoRd <= '1';

               -- Read
               -- Not sure of the ETH_MODE_G switch is necessary here, but leaving it just in case
               if (ETH_MODE_G and (intOpCode = "00")) or
                  (not ETH_MODE_G and (locRxData(15 downto 14) = "00")) then
                  nxtState <= ST_READ;
               else
                  nxtState <= ST_WRITE_A;
               end if;
            else
               nxtEOFE  <= '0';
               nxtTxWr  <= '0';
               rxFifoRd <= '0';
               nxtState <= curState;
            end if;

            -- Read command, frame word 0
         when ST_READ =>
            regStart  <= '0';
            nxtTxWr   <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= (others => '0');
            countEn   <= '0';
            rxFifoRd  <= '0';

            -- Alignment Error
            if locRxSOF = '1' or locRxEOF = '1' then
               nxtEOFE  <= '1';
               nxtState <= ST_DUMP;

               -- Data is ready
            elsif rxFifoEmpty = '0' then
               nxtEOFE  <= '0';
               nxtState <= ST_REQ;
            else
               nxtEOFE  <= '0';
               nxtState <= curState;
            end if;

            -- Low Write Data
         when ST_WRITE_A =>
            regStart  <= '0';
            nxtTxWr   <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= (others => '0');
            countEn   <= '0';

            -- Alignment Error
            if locRxSOF = '1' or locRxEOF = '1' then
               nxtEOFE  <= '1';
               rxFifoRd <= '0';
               nxtState <= ST_DUMP;

               -- Data is ready
            elsif rxFifoEmpty = '0' then
               nxtEOFE  <= '0';
               rxFifoRd <= '1';
               nxtState <= ST_WRITE_B;
            else
               nxtEOFE  <= '0';
               rxFifoRd <= '0';
               nxtState <= curState;
            end if;

            -- High Write Data
         when ST_WRITE_B =>
            regStart  <= '0';
            nxtTxWr   <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= (others => '0');
            countEn   <= '0';
            rxFifoRd  <= '0';

            -- Alignment Error
            if locRxSOF = '1' then
               nxtEOFE  <= '1';
               nxtState <= ST_DUMP;

               -- EOF
            elsif locRxEOF = '1' then
               nxtEOFE  <= locRxEOFE;
               nxtState <= ST_DONE_A;

               -- Request write cycle
            else
               nxtEOFE  <= '0';
               nxtState <= ST_REQ;
            end if;

            -- Transaction Request
         when ST_REQ =>
            regStart  <= '1';
            nxtEOFE   <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= intData(15 downto 0);
            rxFifoRd  <= '0';
            countEn   <= '0';

            -- Machine is done, write lower bits of return data
            if regDone = '1' then
               nxtTxWr  <= '1';
               nxtState <= ST_NEXT;
            else
               nxtTxWr  <= '0';
               nxtState <= curState;
            end if;

            -- Determine next command, write upper bits of return data
         when ST_NEXT =>
            regStart  <= '0';
            nxtEOFE   <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= intData(31 downto 16);

            -- An error occured
            if intTout = '1' or intFail = '1' then
               rxFifoRd <= '0';
               nxtTxWr  <= '1';
               countEn  <= '0';
               nxtState <= ST_DUMP;

               -- Read command
            elsif intOpCode = "00" then
               rxFifoRd <= '0';

               -- Read is done
               if intCount = 0 then
                  nxtTxWr  <= '1';
                  countEn  <= '0';
                  nxtState <= ST_DUMP;

                                        -- Room in transmit FIFO
               elsif txFifoAFull = '0' then
                  nxtTxWr  <= '1';
                  countEn  <= '1';
                  nxtState <= ST_REQ;
               else
                  nxtTxWr  <= '0';
                  countEn  <= '0';
                  nxtState <= curState;
               end if;

               -- Other command, data is ready
            elsif rxFifoEmpty = '0' and txFifoAFull = '0' then
               rxFifoRd <= '1';
               nxtTxWr  <= '1';
               countEn  <= '1';
               nxtState <= ST_WRITE_A;
            else
               rxFifoRd <= '0';
               nxtTxWr  <= '0';
               countEn  <= '0';
               nxtState <= curState;
            end if;

            -- Dump receive data
         when ST_DUMP =>
            regStart  <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= (others => '0');
            nxtTxWr   <= '0';
            countEn   <= '0';

            -- Data is done
            if locRxEOF = '1' then
               nxtEOFE  <= intEOFE or locRxEOFE;
               rxFifoRd <= '0';
               nxtState <= ST_DONE_A;
            else
               nxtEOFE  <= intEOFE;
               rxFifoRd <= not rxFifoEmpty;
               nxtState <= curState;
            end if;

            -- Done word 0
         when ST_DONE_A =>
            regStart  <= '0';
            nxtEOFE   <= intEOFE;
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= (others => '0');
            nxtTxWr   <= '1';
            rxFifoRd  <= '0';
            countEn   <= '0';
            nxtState  <= ST_DONE_B;

            -- Done word 1
         when ST_DONE_B =>
            regStart               <= '0';
            nxtEOFE                <= intEOFE;
            nxtTxSOF               <= '0';
            nxtTxEOF               <= '1';
            nxtTxEOFE              <= intEOFE;
            nxtTxData(15 downto 2) <= (others => '0');
            nxtTxData(1)           <= intTout;
            nxtTxData(0)           <= intFail;
            nxtTxWr                <= '1';
            rxFifoRd               <= '0';
            countEn                <= '0';
            nxtState               <= ST_IDLE;

            -- default
         when others =>
            regStart  <= '0';
            nxtEOFE   <= '0';
            nxtTxSOF  <= '0';
            nxtTxEOF  <= '0';
            nxtTxEOFE <= '0';
            nxtTxData <= (others => '0');
            nxtTxWr   <= '0';
            rxFifoRd  <= '0';
            countEn   <= '0';
            nxtState  <= ST_IDLE;

      end case;
   end process;

   -------------------------------------
   -- Outbound FIFO
   -------------------------------------

   -- Data going into tx fifo
   process (locClk, locRst)
   begin
      if RST_ASYNC_G and locRst = '1' then
         txFifoWr    <= '0'             after TPD_G;
         txFifoDin   <= (others => '0') after TPD_G;
         txFifoAFull <= '0'             after TPD_G;
      elsif rising_edge(locClk) then
         if RST_ASYNC_G = false and locRst = '1' then
            txFifoWr    <= '0'             after TPD_G;
            txFifoDin   <= (others => '0') after TPD_G;
            txFifoAFull <= '0'             after TPD_G;
         else

            -- Write control
            txFifoWr <= locTxWr after TPD_G;

            -- Write Data
            if locTxEOFE = '1' then
               txFifoDin(17 downto 16) <= "11" after TPD_G;
            elsif locTxEOF = '1' then
               txFifoDin(17 downto 16) <= "10" after TPD_G;
            elsif locTxSOF = '1' then
               txFifoDin(17 downto 16) <= "01" after TPD_G;
            else
               txFifoDin(17 downto 16) <= "00" after TPD_G;
            end if;
            txFifoDin(15 downto 0) <= locTxData;

            -- Almost full
            if txFifoCount > 1000 or txFifoFull = '1' then
               txFifoAFull <= '1' after TPD_G;
            else
               txFifoAFull <= '0' after TPD_G;
            end if;
         end if;
      end if;
   end process;

   TX_Fifo : entity work.Fifo
      generic map (
         TPD_G           => TPD_G,
         RST_ASYNC_G     => RST_ASYNC_G,
         GEN_SYNC_FIFO_G => GEN_SYNC_FIFO_G,
         BRAM_EN_G       => BRAM_EN_G,
         USE_DSP48_G     => USE_DSP48_G,
         ALTERA_SYN_G    => ALTERA_SYN_G,
         ALTERA_RAM_G    => ALTERA_RAM_G,
         USE_BUILT_IN_G  => USE_BUILT_IN_G,
         XIL_DEVICE_G    => XIL_DEVICE_G,
         SYNC_STAGES_G   => SYNC_STAGES_G,
         DATA_WIDTH_G    => 18,
         ADDR_WIDTH_G    => 10)
      port map (
         rst           => vcTxRst,
         din           => txFifoDin,
         rd_clk        => vcTxClk,
         rd_en         => txFifoRd,
         wr_clk        => locClk,
         wr_en         => txFifoWr,
         dout          => txFifoDout,
         empty         => txFifoEmpty,
         full          => txFifoFull,
         wr_data_count => txFifoCount);    

   -- Data valid
   process (vcTxClk, vcTxRst)
   begin
      if RST_ASYNC_G and vcTxRst = '1' then
         txFifoValid <= '0' after TPD_G;
      elsif rising_edge(vcTxClk) then
         if RST_ASYNC_G = false and vcTxRst = '1' then
            txFifoValid <= '0' after TPD_G;
         else
            if txFifoRd = '1' then
               txFifoValid <= '1' after TPD_G;
            elsif vcTxOut.ready = '1' then
               txFifoValid <= '0' after TPD_G;
            end if;
         end if;
      end if;
   end process;

   -- Control reads
   txFifoRd <= (not txFifoEmpty) and (not vcRxOut.remBuffAFull) and (not vcRxOut.remBuffFull) and
               ((not txFifoValid) or vcTxOut.ready);

   -- Outgoing signals
   vcTxIn.valid        <= txFifoValid;
   vcTxIn.sof          <= '1' when txFifoDout(17 downto 16) = "01" else '0';
   vcTxIn.eof          <= txFifoDout(17);
   vcTxIn.eofe         <= '1' when txFifoDout(17 downto 16) = "11" else '0';
   vcTxIn.data(LANE_G) <= txFifoDout(15 downto 0);

   -------------------------------------
   -- Register Access Control
   -------------------------------------

   -- Drive address bus
   regSlaveOut.addr   <= intAddress;
   regSlaveOut.wrData <= intData;
   regSlaveOut.inp    <= intInp;
   regSlaveOut.req    <= intReq;
   regSlaveOut.op     <= intOp;

   -- Register State Machine, Sync Logic
   process (locClk, locRst)
   begin
      if RST_ASYNC_G and locRst = '1' then
         intInp      <= '0'             after TPD_G;
         intReq      <= '0'             after TPD_G;
         intOp       <= '0'             after TPD_G;
         intData     <= (others => '0') after TPD_G;
         intReqCnt   <= (others => '0') after TPD_G;
         intFail     <= '0'             after TPD_G;
         intTout     <= '0'             after TPD_G;
         curRegState <= ST_REG_IDLE     after TPD_G;
      elsif rising_edge(locClk) then
         if RST_ASYNC_G = false and locRst = '1' then
            intInp      <= '0'             after TPD_G;
            intReq      <= '0'             after TPD_G;
            intOp       <= '0'             after TPD_G;
            intData     <= (others => '0') after TPD_G;
            intReqCnt   <= (others => '0') after TPD_G;
            intFail     <= '0'             after TPD_G;
            intTout     <= '0'             after TPD_G;
            curRegState <= ST_REG_IDLE     after TPD_G;
         else
            -- State transition
            curRegState <= nxtRegState after TPD_G;

            -- Opcode and write data
            intInp <= nxtInp after TPD_G;
            intReq <= nxtReq after TPD_G;
            intOp  <= nxtOp  after TPD_G;

            -- Data Storage
            intData <= nxtData after TPD_G;

            -- Timeout & fail flags
            intFail <= nxtFail after TPD_G;
            intTout <= nxtTout after TPD_G;

            -- Timeout counter
            if intReq <= '0' then
               intReqCnt <= (others => '0') after TPD_G;
            elsif intReqCnt /= x"FFFFFF" then
               intReqCnt <= intReqCnt + 1 after TPD_G;
            end if;
         end if;
      end if;
   end process;

   -- Register state engine
   process (curRegState, intData, intFail, intOpCode, intReqCnt, intTout,
            intWrData, regSlaveIn, regStart) 
   begin

      -- States
      case curRegState is

         -- IDLE, Wait for enable from read logic
         when ST_REG_IDLE =>
            regDone <= '0';
            nxtInp  <= '0';
            nxtReq  <= '0';
            nxtOp   <= '0';

            -- Register data
            nxtdata <= intWrData;

            -- Start
            if regStart = '1' then
               nxtFail <= '0';
               nxtTout <= '0';

               -- Write Command
               if intOpCode = "01" then
                  nxtRegState <= ST_REG_WRITE;

                                        -- Read, Set Bit, Clear Bit
               else
                  nxtRegState <= ST_REG_READ;
               end if;
            else
               nxtFail     <= intFail;
               nxtTout     <= intTout;
               nxtRegState <= curRegState;
            end if;

            -- Write State
         when ST_REG_WRITE =>
            regDone <= '0';
            nxtInp  <= '1';
            nxtReq  <= '1';
            nxtOp   <= '1';
            nxtdata <= intData;

            -- Ack is passed
            if regSlaveIn.ack = '1' then

               -- Done
               nxtRegState <= ST_REG_WAIT;

               -- Store fail flag, no timeout
               nxtFail <= regSlaveIn.fail;
               nxtTout <= '0';

               -- Timeout
            elsif intReqCnt = x"FFFFFF" then

               -- Done
               nxtRegState <= ST_REG_WAIT;

               -- No Fail, set timeout
               nxtFail <= '0';
               nxtTout <= '1';

               -- Keep waiting
            else
               nxtRegState <= curRegState;
               nxtFail     <= '0';
               nxtTout     <= '0';
            end if;

            -- Read State
         when ST_REG_READ =>
            regDone <= '0';
            nxtInp  <= '1';
            nxtReq  <= '1';
            nxtOp   <= '0';

            -- Take read data
            nxtdata <= regSlaveIn.rdData;

            -- Ack is passed
            if regSlaveIn.ack = '1' then

               -- Fail
               if regSlaveIn.fail = '1' then

                                        -- Store fail flag, no timeout, done
                  nxtFail     <= regSlaveIn.fail;
                  nxtTout     <= '0';
                  nxtRegState <= ST_REG_WAIT;

                                        -- Normal termination
               else

                                        -- No fail or timeout
                  nxtFail <= '0';
                  nxtTout <= '0';

                                        -- Set bit command
                  if intOpCode = "10" then
                     nxtRegState <= ST_REG_SET;

                                        -- Clear bit command
                  elsif intOpCode = "11" then
                     nxtRegState <= ST_REG_CLEAR;

                                        -- Read command
                  else
                     nxtRegState <= ST_REG_WAIT;
                  end if;
               end if;

               -- Timeout
            elsif intReqCnt = x"FFFFFF" then

               -- done
               nxtRegState <= ST_REG_WAIT;

               -- No Fail, set timeout
               nxtFail <= '0';
               nxtTout <= '1';

               -- Keep waiting
            else
               nxtRegState <= curRegState;
               nxtFail     <= '0';
               nxtTout     <= '0';
            end if;

            -- Set Bit Command
         when ST_REG_SET =>
            regDone <= '0';
            nxtInp  <= '1';
            nxtReq  <= '0';
            nxtOp   <= '0';

            -- Set bits
            nxtdata <= intData or intWrData;

            -- No errors
            nxtFail <= '0';
            nxtTout <= '0';

            -- Go to write state
            -- Wait for ack from previous command to clear
            if regSlaveIn.ack = '0' then
               nxtRegState <= ST_REG_WRITE;
            else
               nxtRegState <= curRegState;
            end if;

            -- Clear Bit Command
         when ST_REG_CLEAR =>
            regDone <= '0';
            nxtInp  <= '1';
            nxtReq  <= '0';
            nxtOp   <= '0';

            -- Clear bits
            nxtdata <= intData and (not intWrData);

            -- No errors
            nxtFail <= '0';
            nxtTout <= '0';

            -- Go to write state
            -- Wait for ack from previous command to clear
            if regSlaveIn.ack = '0' then
               nxtRegState <= ST_REG_WRITE;
            else
               nxtRegState <= curRegState;
            end if;

            -- Done
         when ST_REG_WAIT =>
            regDone <= '0';
            nxtInp  <= '0';
            nxtReq  <= '0';
            nxtOp   <= '0';
            nxtdata <= intData;
            nxtFail <= intFail;
            nxtTout <= intTout;

            -- Wait for ack to clear
            if regSlaveIn.ack = '0' then
               nxtRegState <= ST_REG_DONE;
            else
               nxtRegState <= curRegState;
            end if;

            -- Done
         when ST_REG_DONE =>
            regDone     <= '1';
            nxtInp      <= '0';
            nxtReq      <= '0';
            nxtOp       <= '0';
            nxtdata     <= intData;
            nxtFail     <= intFail;
            nxtTout     <= intTout;
            nxtRegState <= ST_REG_IDLE;

         when others =>
            regDone     <= '0';
            nxtReq      <= '0';
            nxtInp      <= '0';
            nxtOp       <= '0';
            nxtdata     <= (others => '0');
            nxtFail     <= '0';
            nxtTout     <= '0';
            nxtRegState <= ST_REG_IDLE;
      end case;
   end process;

end rtl;

