-------------------------------------------------------------------------------
-- Title      : Command Slave Block
-- Project    : General Purpose Core
-------------------------------------------------------------------------------
-- File       : VcCmdSlave.vhd
-- Author     : Ryan Herbst, rherbst@slac.stanford.edu
-- Created    : 2013-07-22
-- Last update: 2014-03-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:
-- Slave block for Command protocol over the VC.
-- Packet is 16 bytes. The 16 bit values passed over the VC will be:
-- Word 0 Data[1:0]  = VC
-- Word 0 Data[7:2]  = Dest_ID
-- Word 0 Data[15:8] = TID[7:0]
-- Word 1 Data[15:0] = TID[23:8]
-- Word 2 Data[7:0]  = OpCode[7:0]
-- Word 2 Data[15:8] = Don't Care
-- Word 3 Data[15:0] = Don't Care
-- Word 4            = Don't Care
-- Word 5            = Don't Care
-- Word 6            = Don't Care
-- Word 7            = Don't Care
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

entity VcCmdSlave is
   generic (
      TPD_G           : time                       := 1 ns;
      RST_ASYNC_G     : boolean                    := false;
      RX_LANE_G       : integer range 0 to 3       := 0;
      DEST_ID_G       : natural range 0 to 63      := 0;  -- Destination ID Value To Match
      DEST_MASK_G     : natural range 0 to 63      := 0;  -- Destination ID Mask For Match    
      GEN_SYNC_FIFO_G : boolean                    := false;
      USE_DSP48_G     : string                     := "no";
      ALTERA_SYN_G    : boolean                    := false;
      ALTERA_RAM_G    : string                     := "M9K";
      USE_BUILT_IN_G  : boolean                    := false;  --if set to true, this module is only xilinx compatible only!!!
      XIL_DEVICE_G    : string                     := "7SERIES";  --xilinx only generic parameter    
      SYNC_STAGES_G   : integer range 3 to (2**24) := 3;
      ETH_MODE_G      : boolean                    := false);
   port (
      -- RX VC Signals (vcRxClk domain)
      vcRxOut             : in  VcRxOutType;
      vcRxCommonOut       : in  VcRxCommonOutType;
      vcTxIn_locBuffAFull : out sl;
      vcTxIn_locBuffFull  : out sl;
      -- Command Signals (locClk domain)
      cmdSlaveOut         : out VcCmdSlaveOutType;
      -- Local clock and resets
      locClk              : in  sl;
      locRst              : in  sl := '0';
      -- VC Rx Clock And Resets
      vcRxClk             : in  sl;
      vcRxRst             : in  sl := '0');        
end VcCmdSlave;

architecture rtl of VcCmdSlave is

   signal intDestId      : slv(5 downto 0);
   signal selDestId      : slv(5 downto 0);
   signal selDestMask    : slv(5 downto 0);
   signal intCmdEn       : sl;
   signal intCmdOpCode   : slv(7 downto 0);
   signal intCmdCtxOut   : slv(23 downto 0);
   signal fifoDin        : slv(17 downto 0);
   signal fifoDout       : slv(17 downto 0);
   signal fifoRd         : sl;
   signal fifoRdDly      : sl;
   signal fifoCount      : slv(9 downto 0);
   signal fifoEmpty      : sl;
   signal locSOF         : sl;
   signal locEOF         : sl;
   signal locEOFE        : sl;
   signal locData        : slv(15 downto 0);
   signal intCnt         : slv(2 downto 0);
   signal intCntEn       : sl;
   signal fifoErr        : sl;
   signal fifoFull       : sl;
   signal vcLocBuffAFull : sl;
   signal vcLocBuffFull  : sl;

begin

   -- Output signal
   cmdSlaveOut.valid   <= intCmdEn;
   cmdSlaveOut.opCode  <= intCmdOpCode;
   cmdSlaveOut.ctxOut  <= intCmdCtxOut;
   vcTxIn_locBuffAFull <= vcLocBuffAFull;
   vcTxIn_locBuffFull  <= vcLocBuffFull;

   -- Convert destnation ID and Mask
   selDestId   <= conv_std_logic_vector(DEST_ID_G, 6);
   selDestMask <= conv_std_logic_vector(DEST_MASK_G, 6);

   -- Data going into Rx FIFO
   fifoDin(17 downto 16) <= "11" when vcRxCommonOut.eofe = '1' or fifoErr = '1' else
                            "10" when vcRxCommonOut.eof = '1' else
                            "01" when vcRxCommonOut.sof = '1' else
                            "00";
   fifoDin(15 downto 0) <= vcRxCommonOut.data(RX_LANE_G);

   Fifo_Inst : entity work.Fifo
      generic map (
         TPD_G           => TPD_G,
         RST_ASYNC_G     => RST_ASYNC_G,
         GEN_SYNC_FIFO_G => GEN_SYNC_FIFO_G,
         BRAM_EN_G       => true,
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
         din           => fifoDin,
         rd_clk        => locClk,
         rd_en         => fifoRd,
         wr_clk        => vcRxClk,
         wr_en         => vcRxOut.valid,
         dout          => fifoDout,
         empty         => fifoEmpty,
         full          => fifoFull,
         wr_data_count => fifoCount);    

   -- Data coming out of Rx FIFO
   locSOF  <= '1' when fifoDout(17 downto 16) = "01" else '0';
   locEOF  <= fifoDout(17);
   locEOFE <= '1' when fifoDout(17 downto 16) = "11" else '0';
   locData <= fifoDout(15 downto 0);

   -- FIFO Read Control
   fifoRd <= not fifoEmpty;

   -- Generate flow control
   process (vcRxClk, vcRxRst)
   begin
      if RST_ASYNC_G and vcRxRst = '1' then
         vcLocBuffAFull <= '0' after TPD_G;
         vcLocBuffFull  <= '0' after TPD_G;
         fifoErr        <= '0' after TPD_G;
      elsif rising_edge(vcRxClk) then
         if RST_ASYNC_G = false and vcRxRst = '1' then
            vcLocBuffAFull <= '0' after TPD_G;
            vcLocBuffFull  <= '0' after TPD_G;
            fifoErr        <= '0' after TPD_G;
         else

            -- Generate full error
            if fifoCount >= 1020 or fifoFull = '1' then
               fifoErr <= '1' after TPD_G;
            else
               fifoErr <= '0' after TPD_G;
            end if;

            -- Almost full at 1/4 capacity
            vcLocBuffAFull <= fifoFull or fifoCount(9) or fifoCount(8);

            -- Full at 1/2 capacity
            vcLocBuffFull <= fifoFull or fifoCount(9);
         end if;
      end if;
   end process;

   -- Receive Data Processor
   process (locClk, locRst)
   begin
      if RST_ASYNC_G and locRst = '1' then
         intCmdEn     <= '0'             after TPD_G;
         intCmdOpCode <= (others => '0') after TPD_G;
         intCmdCtxOut <= (others => '0') after TPD_G;
         intDestId    <= (others => '0') after TPD_G;
         fifoRdDly    <= '0'             after TPD_G;
         intCnt       <= (others => '0') after TPD_G;
         intCntEn     <= '0'             after TPD_G;
      elsif rising_edge(locClk) then
         if RST_ASYNC_G = false and locRst = '1' then
            intCmdEn     <= '0'             after TPD_G;
            intCmdOpCode <= (others => '0') after TPD_G;
            intCmdCtxOut <= (others => '0') after TPD_G;
            intDestId    <= (others => '0') after TPD_G;
            fifoRdDly    <= '0'             after TPD_G;
            intCnt       <= (others => '0') after TPD_G;
            intCntEn     <= '0'             after TPD_G;
         else
            -- Generate delayed read
            fifoRdDly <= fifoRd after TPD_G;
            -- Only process when data has been read
            if fifoRdDly = '1' then
               -- Receive Data Counter
               -- Reset on SOF or EOF, Start counter on SOF
               if locSOF = '1' or locEOF = '1' then
                  intCnt   <= (others => '0') after TPD_G;
                  intCntEn <= not locEOF      after TPD_G;
               elsif intCntEn = '1' and intCnt /= "110" then
                  intCnt <= intCnt + 1 after TPD_G;
               end if;
               -- SOF Received
               if locSOF = '1' then
                  if (not ETH_MODE_G) then
                     intCmdCtxOut(7 downto 0) <= locData(15 downto 8) after TPD_G;
                     intDestId                <= locData(7 downto 2)  after TPD_G;
                     intCmdEn                 <= '0'                  after TPD_G;
                  else
                     intCmdCtxOut(23 downto 8) <= locData after TPD_G;
                     intCmdEn                  <= '0'     after TPD_G;
                  end if;
                  -- Rest of Frame
               else
                  case intCnt is
                     -- Word 1 
                     when "000" =>
                        if (not ETH_MODE_G) then
                           intCmdCtxOut(23 downto 8) <= locData after TPD_G;
                           intCmdEn                  <= '0'     after TPD_G;
                        else
                           intCmdCtxOut(7 downto 0) <= locData(15 downto 8) after TPD_G;
                           intDestId                <= locData(7 downto 2)  after TPD_G;
                           intCmdEn                 <= '0'                  after TPD_G;
                        end if;
                        -- Word 2 
                     when "001" =>
                        if (not ETH_MODE_G) then
                           intCmdOpCode <= locData(7 downto 0) after TPD_G;
                           intCmdEn     <= '0'                 after TPD_G;
                        end if;
                        -- Word 3
                     when "010" =>
                        if (ETH_MODE_G) then
                           intCmdOpCode <= locData(7 downto 0) after TPD_G;
                           intCmdEn     <= '0'                 after TPD_G;
                        end if;

                        -- Word 7, Last word 
                     when "110" =>
                        -- No error and destination ID matches
                        if locEOF = '1' and locEOFE = '0' and
                           (intDestId and selDestMask) = selDestId then
                           intCmdEn <= '1' after TPD_G;
                        else
                           intCmdEn <= '0' after TPD_G;
                        end if;
                        -- Do nothing for others
                     when others =>
                        intCmdEn <= '0' after TPD_G;
                  end case;
               end if;

            else
               intCmdEn <= '0' after TPD_G;
            end if;
         end if;
      end if;
   end process;

end architecture rtl;
