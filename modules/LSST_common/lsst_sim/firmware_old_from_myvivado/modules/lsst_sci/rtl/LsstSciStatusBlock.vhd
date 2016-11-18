-------------------------------------------------------------------------------
-- Title      : LSST SCI
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : LsstSciStatusBlock.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-04-29
-------------------------------------------------------------------------------
-- Description: This block contains the PGP registers. Most are devoted
--              to collecting and presenting status for the 4 VCs.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.LsstSciPackage.all;

entity LsstSciStatusBlock is
   port (
      -- Application Logic Signals
      StatusClk       :  in std_logic;
      StatusRst       :  in std_logic;
      StatusAddr      :  in std_logic_vector(23 downto 0);
      StatusReg       : out std_logic_vector(31 downto 0);
      
      -- SCI side signals
      PgpClk          :  in std_logic;
      PgpRst          :  in std_logic;

      ImagesSent      :  in std_logic_vector(31 downto 0);
      ImagesDisc      :  in std_logic_vector(31 downto 0);
      ImagesTrunc     :  in std_logic_vector(31 downto 0);
      DataFormat      :  in std_logic_vector( 3 downto 0);
      
      PgpLocLinkReady :  in std_logic;
      PgpRemLinkReady :  in std_logic;
      PgpRxCellError  :  in std_logic;
      PgpRxLinkDown   :  in std_logic;
      PgpRxLinkError  :  in std_logic;

      Vc0RxFrame      :  in std_logic;
      Vc1RxFrame      :  in std_logic;
      Vc2RxFrame      :  in std_logic;
      Vc3RxFrame      :  in std_logic;

      Vc0TxFrame      :  in std_logic;
      Vc1TxFrame      :  in std_logic;
      Vc2TxFrame      :  in std_logic;
      Vc3TxFrame      :  in std_logic;

      Vc0RemBuffAFull :  in std_logic;
      Vc0RemBuffFull  :  in std_logic;
      Vc0FrameTxReady :  in std_logic;
      Vc1RemBuffAFull :  in std_logic;
      Vc1RemBuffFull  :  in std_logic;
      Vc1FrameTxReady :  in std_logic;
      Vc2RemBuffAFull :  in std_logic;
      Vc2RemBuffFull  :  in std_logic;
      Vc2FrameTxReady :  in std_logic;
      Vc3RemBuffAFull :  in std_logic;
      Vc3RemBuffFull  :  in std_logic;
      Vc3FrameTxReady :  in std_logic
   );

end LsstSciStatusBlock;

architecture LsstSciStatusBlock of LsstSciStatusBlock is

   -- Status Block Address Map
   constant VERSION_ADDR     : std_logic_vector(9 downto 0) := "00" & x"00";
   constant LNKSTAT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"01";
   constant CERR_CNT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"02";
   constant LDWN_CNT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"03";
   constant LERR_CNT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"04";
   constant VC_REM_FLAGS     : std_logic_vector(9 downto 0) := "00" & x"05";
   constant RX0_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"06";
   constant RX1_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"07";
   constant RX2_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"08";
   constant RX3_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"09";
   constant TX0_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"0A";
   constant TX1_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"0B";
   constant TX2_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"0C";
   constant TX3_CNT_ADDR     : std_logic_vector(9 downto 0) := "00" & x"0D";
   constant IMAGE_SENT_ADDR  : std_logic_vector(9 downto 0) := "00" & x"0E";
   constant IMAGE_DISC_ADDR  : std_logic_vector(9 downto 0) := "00" & x"0F";
   constant IMAGE_TRUNC_ADDR : std_logic_vector(9 downto 0) := "00" & x"10";
   constant DATA_FORMAT_ADDR : std_logic_vector(9 downto 0) := "00" & x"11";
   
   constant REG_MAX_ADDR : std_logic_vector(11 downto 0) := x"011";

   -- Update machine counter
   signal registerCounter : std_logic_vector(11 downto 0);

   -- Statistic counters
   signal iCellErrorCnt   : std_logic_vector(31 downto 0);
   signal iLinkDownCnt    : std_logic_vector(31 downto 0);
   signal iLinkErrorCnt   : std_logic_vector(31 downto 0);

   signal vc0RxCount      : std_logic_vector(31 downto 0);
   signal vc1RxCount      : std_logic_vector(31 downto 0);
   signal vc2RxCount      : std_logic_vector(31 downto 0);
   signal vc3RxCount      : std_logic_vector(31 downto 0);

   signal vc0TxCount      : std_logic_vector(31 downto 0);
   signal vc1TxCount      : std_logic_vector(31 downto 0);
   signal vc2TxCount      : std_logic_vector(31 downto 0);
   signal vc3TxCount      : std_logic_vector(31 downto 0);

   -- counter reset signals
   signal countReset      : std_logic;
   signal countResetReg0  : std_logic;
   signal countResetReg1  : std_logic;
   signal intPgpStatusRst : std_logic;
   
   -- block ram interface signals
   signal memWrClk  : std_logic;
   signal memWrEn   : std_logic; 
   signal memWrAddr : std_logic_vector( 9 downto 0);
   signal memWrData : std_logic_vector(31 downto 0);
   signal memRdClk  : std_logic;
   signal memRdAddr : std_logic_vector( 9 downto 0);
   signal memRdData : std_logic_vector(31 downto 0);
   
begin

   countReset   <= StatusRst;
   
   ----------------------------------------------------------------------------
   -- Block Memory
   ----------------------------------------------------------------------------
   memWrClk  <= PgpClk;

   memRdClk  <= StatusClk;
   statusReg <= memRdData;
   memRdAddr <= StatusAddr(9 downto 0);
   
   U_status_block_mem : entity work.SimpleDualPortRam
     generic map (
       DATA_WIDTH_G => 32,
       ADDR_WIDTH_G => 10
     )
     port map (
       clka => memWrClk,
       ena  => '1',
       wea => memWrEn,
       addra => memWrAddr,
       dina => memWrData,
       clkb => memRdClk,
       enb => '1',
       rstb => '0',
       addrb => memRdAddr,
       doutb => memRdData);
   
   ----------------------------------------------------------------------------
   -- Update Machine
   ----------------------------------------------------------------------------
   process (PgpClk, PgpRst)
   begin
      if PgpRst = '1' then
         registerCounter <=  (others => '0');
      elsif rising_edge(PgpClk) then
         if registerCounter /= REG_MAX_ADDR then
            registerCounter <= registerCounter + 1;
         else
            registerCounter <= x"000";
         end if;
      end if;
   end process;

   process (registerCounter, PgpLocLinkReady, PgpRemLinkReady,
            Vc3FrameTxReady, Vc3RemBuffFull, Vc3RemBuffAFull,
            Vc2FrameTxReady, Vc2RemBuffFull, Vc2RemBuffAFull,
            Vc1FrameTxReady, Vc1RemBuffFull, Vc1RemBuffAFull,
            Vc0FrameTxReady, Vc0RemBuffFull, Vc0RemBuffAFull,
            vc0RxCount, vc0TxCount, vc1RxCount, vc1TxCount,
            vc2RxCount, vc2TxCount, vc3RxCount, vc3TxCount,
            iLinkErrorCnt, iLinkDownCnt, iCellErrorCnt,
            ImagesSent, ImagesDisc, ImagesTrunc, DataFormat)
   begin
      memWrEn   <= '0';
      memWrData <= (others => '0');
      memWrAddr <= (others => '0');
      case registerCounter is
         when x"000" => 
            memWrEn   <= '1';
            memWrAddr <= VERSION_ADDR;
            memWrData(31 downto 12) <= (others => '0');
            memWrData(11 downto  0) <= LSST_SCI_VERSION;
         when x"001" =>
            memWrEn <= '1';
            memWrAddr <= LNKSTAT_ADDR;
            memWrData <= x"0000000" & "00" & PgpLocLinkReady & PgpRemLinkReady;
         when x"002" =>
            memWrEn <= '1';
            memWrAddr <= CERR_CNT_ADDR;
            memWrData <= iCellErrorCnt;
         when x"003" =>
            memWrEn <= '1';
            memWrAddr <= LDWN_CNT_ADDR;
            memWrData <= iLinkDownCnt;
         when x"004" =>
            memWrEn <= '1';
            memWrAddr <= LERR_CNT_ADDR;
            memWrData <= iLinkErrorCnt;
         when x"005" =>
            memWrEn <= '1';
            memWrAddr <= VC_REM_FLAGS;
            memWrData <= "00000"
                         & Vc3FrameTxReady & Vc3RemBuffFull & Vc3RemBuffAFull
                         & "00000"
                         & Vc2FrameTxReady & Vc2RemBuffFull & Vc2RemBuffAFull
                         & "00000"
                         & Vc1FrameTxReady & Vc1RemBuffFull & Vc1RemBuffAFull
                         & "00000"
                         & Vc0FrameTxReady & Vc0RemBuffFull & Vc0RemBuffAFull;
         when x"006" =>
            memWrEn <= '1';
            memWrAddr <= RX0_CNT_ADDR;
            memWrData <= vc0RxCount;
         when x"007" =>
            memWrEn <= '1';
            memWrAddr <= RX1_CNT_ADDR;
            memWrData <= vc1RxCount;
         when x"008" =>
            memWrEn <= '1';
            memWrAddr <= RX2_CNT_ADDR;
            memWrData <= vc2RxCount;
         when x"009" =>
            memWrEn <= '1';
            memWrAddr <= RX3_CNT_ADDR;
            memWrData <= vc3RxCount;
         when x"00A" =>
            memWrEn <= '1';
            memWrAddr <= TX0_CNT_ADDR;
            memWrData <= vc0TxCount;
         when x"00B" =>
            memWrEn <= '1';
            memWrAddr <= TX1_CNT_ADDR;
            memWrData <= vc1TxCount;
         when x"00C" =>
            memWrEn <= '1';
            memWrAddr <= TX2_CNT_ADDR;
            memWrData <= vc2TxCount;
         when x"00D" =>
            memWrEn <= '1';
            memWrAddr <= TX3_CNT_ADDR;
            memWrData <= vc3TxCount;
         when x"00E" =>
            memWrEn <= '1';
            memWrAddr <= IMAGE_SENT_ADDR;
            memWrData <= ImagesSent;
         when x"00F" =>
            memWrEn <= '1';
            memWrAddr <= IMAGE_DISC_ADDR;
            memWrData <= ImagesDisc;
         when x"010" =>
            memWrEn <= '1';
            memWrAddr <= IMAGE_TRUNC_ADDR;
            memWrData <= ImagesTrunc;
         when x"011" =>
            memWrEn <= '1';
            memWrAddr <= DATA_FORMAT_ADDR;
            memWrData <= x"0000000" & DataFormat;
         when others =>
            memWrEn   <= '0';
            memWrAddr <= (others => '0');
            memWrData <= (others => '0');
      end case;
   end process;
               
   ----------------------------------------------------------------------------
   -- PGP Counters
   ----------------------------------------------------------------------------
   intPgpStatusRst <= countResetReg1;

   process (PgpClk, PgpRst)
   begin
      if PgpRst = '1' then
         iCellErrorCnt  <= (others => '0');
         iLinkDownCnt   <= (others => '0');
         iLinkErrorCnt  <= (others => '0');
         vc0RxCount     <= (others => '0');
         vc1RxCount     <= (others => '0');
         vc2RxCount     <= (others => '0');
         vc3RxCount     <= (others => '0');
         vc0TxCount     <= (others => '0');
         vc1TxCount     <= (others => '0');
         vc2TxCount     <= (others => '0');
         vc3TxCount     <= (others => '0');
         countResetReg0 <= '0';
         countResetReg1 <= '0';
      elsif rising_edge(PgpClk) then

         -- Sync count reset
         countResetReg0 <= countReset;
         countResetReg1 <= countResetReg0;

         -- Cell Error Count
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            iCellErrorCnt <= (others => '0');
         elsif pgpRxCellError = '1' and iCellErrorCnt /= x"FFFFFFFF" then
            iCellErrorCnt <=  iCellErrorCnt + 1;
         end if;

         -- Link Down Count
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            iLinkDownCnt <= (others => '0');
         elsif pgpRxLinkDown = '1' and iLinkDownCnt /= x"FFFFFFFF" then
            iLinkDownCnt <=  iLinkDownCnt + 1;
         end if;

         -- Link Error Count
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            iLinkErrorCnt <= (others => '0');
         elsif pgpRxLinkError = '1' and iLinkErrorCnt /= x"FFFFFFFF" then
            iLinkErrorCnt <=  iLinkErrorCnt + 1;
         end if;

         -- Recieve Counters
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc0RxCount <= (others => '0');
         elsif vc0RxFrame = '1' then
            vc0RxCount <= vc0RxCount + 1;
         end if;
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc1RxCount <= (others => '0');
         elsif vc1RxFrame = '1' then
            vc1RxCount <= vc1RxCount + 1;
         end if;
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc2RxCount <= (others => '0');
         elsif vc2RxFrame = '1' then
            vc2RxCount <= vc2RxCount + 1;
         end if;
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc3RxCount <= (others => '0');
         elsif vc3RxFrame = '1' then
            vc3RxCount <= vc3RxCount + 1;
         end if;

         -- Xmit Counters
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc0TxCount <= (others => '0');
         elsif vc0TxFrame = '1' then
            vc0TxCount <= vc0TxCount + 1;
         end if;
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc1TxCount <= (others => '0');
         elsif vc1TxFrame = '1' then
            vc1TxCount <= vc1TxCount + 1;
         end if;
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc2TxCount <= (others => '0');
         elsif vc2TxFrame = '1' then
            vc2TxCount <= vc2TxCount + 1;
         end if;
         if intPgpStatusRst = '1' or pgpLocLinkReady = '0' then
            vc3TxCount <= (others => '0');
         elsif vc3TxFrame = '1' then
            vc3TxCount <= vc3TxCount + 1;
         end if;
         
      end if;
   end process;

end LsstSciStatusBlock;
