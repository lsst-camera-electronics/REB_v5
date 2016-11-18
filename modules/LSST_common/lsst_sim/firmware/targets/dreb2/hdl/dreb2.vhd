-------------------------------------------------------------------------------
-- Title      : RCM SCI
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : rcm_sim.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-05-01
-------------------------------------------------------------------------------
-- Description: This is the top level file for the SCI portion of the
--              LSST RCM. 
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

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity dreb2 is
   port (
      -- Clock and Reset signals
      Pwron_Rst_L        :  in std_logic;

      PgpRefClk_P      :  in std_logic;
      PgpRefClk_M      :  in std_logic;

      -- PGP signals
      PgpRx_P          :  in std_logic;
      PgpRx_M          :  in std_logic;
      PgpTx_P          : out std_logic;
      PgpTx_M          : out std_logic;

      -- Addresses                                   
      R_Addr0          : in std_logic;
      R_Addr1          : in std_logic;
      R_Addr2          : in std_logic;
      R_Addr3          : in std_logic;
      R_Addr4          : in std_logic;
      R_Addr5          : in std_logic;
      R_Addr6          : in std_logic;
      R_Addr7          : in std_logic;
      
      -- Test Point signals
      Test_12          :   out std_logic;
      Test_11          :   out std_logic;
      Test_10          :   out std_logic;
      Test_9           :   out std_logic;
      Test_8           :   out std_logic;
      Test_7           :   out std_logic;
      Test_6           :   out std_logic;
      Test_5           :   out std_logic;
      Test_4           :   out std_logic;
      Test_3           :   out std_logic;
      Test_2           :   out std_logic;
      Test_1           :   out std_logic;
      Test_0           :   out std_logic;

      TestLed_5        :   out std_logic;
      TestLed_4        :   out std_logic;
      TestLed_3        :   out std_logic;
      TestLed_2        :   out std_logic;
      TestLed_1        :   out std_logic;
      TestLed_0        :   out std_logic
   );
end dreb2;

architecture dreb2 of dreb2 is

   signal sciClk : std_logic;
   signal sciRst : std_logic;

   signal clkOut : std_logic_vector(0 downto 0);
   signal rstOut : std_logic_vector(0 downto 0);
   signal beeClk : std_logic;
   signal beeRst : std_logic;

   signal pgpRefClkP : std_logic;
   signal pgpRefClkM : std_logic;

   signal pgpRxP : std_logic;
   signal pgpRxM : std_logic;
   signal pgpTxP : std_logic;
   signal pgpTxM : std_logic;

   -- Addresses
   signal r_addr  : std_logic_vector(7 downto 0);
   
   -- misc
   signal test_port : std_logic_vector(12 downto 0);
   signal test_led  : std_logic_vector(5 downto 0);

   signal pgpLocLinkReady : std_logic;
   signal pgpRemLinkReady : std_logic;

   -- Status block interface signals
   signal statusClk  : std_logic;
   signal statusAddr : std_logic_vector(23 downto 0);
   signal statusReg  : std_logic_vector(31 downto 0);
   signal statusRst  : std_logic;
   
   -- Register interface signals
   signal regAck           : std_logic;
   signal regFail          : std_logic;
   signal regDataRd        : std_logic_vector(31 downto 0);
   signal regReq           : std_logic;
   signal regOp            : std_logic;
   signal regAddr          : std_logic_vector(23 downto 0);
   signal regDataWr        : std_logic_vector(31 downto 0);
   signal regWrEn          : std_logic_vector(31 downto 0);
   signal regNoAck         : std_logic;
   
   signal exampleRegAck    : std_logic;
   signal exampleRegFail   : std_logic;
   signal exampleRegDataRd : std_logic_vector(31 downto 0);

   signal simRegAck        : std_logic;
   signal simRegFail       : std_logic;
   signal simRegDataRd     : std_logic_vector(31 downto 0);
   
   -- Data Encoder interface signals
   signal dataWrEn : std_logic;
   signal dataSOT  : std_logic;
   signal dataEOT  : std_logic;
   signal dataClk  : std_logic;
   signal dataIn   : std_logic_vector(17 downto 0);

begin

  pgpRefClkM <= PgpRefClk_M;
  pgpRefClkP <= PgpRefClk_P;

  PgpTx_M <= pgpTxM;
  PgpTx_P <= pgpTxP;
  
  pgpRxM <= PgpRx_M;
  pgpRxP <= PgpRx_P;

  r_addr(0) <= R_Addr0;
  r_addr(1) <= R_Addr1;
  r_addr(2) <= R_Addr2;
  r_addr(3) <= R_Addr3;
  r_addr(4) <= R_Addr4;
  r_addr(5) <= R_Addr5;
  r_addr(6) <= R_Addr6;
  r_addr(7) <= R_Addr7;
  
  TestLed_0  <= test_led(0);
  TestLed_1  <= test_led(1);
  TestLed_2  <= test_led(2);
  TestLed_3  <= test_led(3);
  TestLed_4  <= test_led(4);
  TestLed_5  <= test_led(5);

  Test_0  <= test_port(0);
  Test_1  <= test_port(1);
  Test_2  <= test_port(2);
  Test_3  <= test_port(3);
  Test_4  <= test_port(4);
  Test_5  <= test_port(5);
  Test_6  <= test_port(6);
  Test_7  <= test_port(7);
  Test_8  <= test_port(8);
  Test_9  <= test_port(9);
  Test_10 <= test_port(10);
  Test_11 <= test_port(11);
  Test_12 <= test_port(12);

  test_led(0)		<= pgpLocLinkReady;
  test_led(1)		<= pgpRemLinkReady;
  test_led(2)		<= '0';
  test_led(3)		<= '0';
  test_led(4)		<= '0';
  test_led(5)		<= '0';
  
  test_port(0)  <= '0';
  test_port(1)  <= '0';
  test_port(2)  <= '0';
  test_port(3)  <= '0';
  test_port(4)  <= '0';
  test_port(5)  <= '0';
  test_port(6)  <= '0';
  test_port(7)  <= '0';
  test_port(8)  <= '0';
  test_port(9)  <= '0';
  test_port(10) <= '0';
  test_port(11) <= '0';
  test_port(12) <= '0';
  
  -- Back end clock and reset synchronization
  beeClk <= clkOut(0);
  beeRst <= rstOut(0);

  U_BeeClk : entity work.ClockManager7
    generic map (
      NUM_CLOCKS_G => 1,
      CLKIN_PERIOD_G => 6.4,
      DIVCLK_DIVIDE_G => 5,
      CLKFBOUT_MULT_F_G => 32.0,
      CLKOUT0_DIVIDE_F_G => 10.0)
    port map (
      clkIn => sciClk,
      rstIn => sciRst,
      clkOut => clkOut,
      rstOut => rstOut,
      locked => open);

  
   U_LsstSci : entity work.LsstSci
      generic map (
        --RAFT_DATA_CONVERSION => "ZERO_EXTEND_32"
        RAFT_DATA_CONVERSION => "TRUNC_LOW_2"
      )
      port map (
         FpgaRstL           => Pwron_Rst_L,
         PgpClkP            => pgpRefClkP,
         PgpClkM            => pgpRefClkM,
         PgpRxP             => pgpRxP,
         PgpRxM             => pgpRxM,
         PgpTxP             => pgpTxP,
         PgpTxM             => pgpTxM,
         ClkOut             => sciClk,
         RstOut             => sciRst,
         PgpLocLinkReadyOut => pgpLocLinkReady,
         PgpRemLinkReadyOut => pgpRemLinkReady,
         RegClk             => beeClk,
         RegRst             => beeRst,
         RegReq             => regReq,
         RegOp              => regOp,
         RegAddr            => regAddr,
         RegDataWr          => regDataWr,
         RegAck             => regAck,
         RegFail            => regFail,
         RegDataRd          => regDataRd,
         RegWrEn            => regWrEn,
         DataWrEn           => dataWrEn,
         DataSOT            => dataSOT,
         DataEOT            => dataEOT,
         DataClk            => dataClk,
         DataIn             => dataIn,
         StatusClk          => beeClk,
         StatusAddr         => statusAddr,
         StatusReg          => statusReg,
         StatusRst          => statusRst
       );

   process (beeClk, beeRst)
   begin
      if beeRst = '1' then
         regNoAck <= '0';
      elsif rising_edge(beeClk) then
         regNoAck <= regReq;
      end if;
   end process;
   
   regAck    <= exampleRegAck or simRegAck or regNoAck;
   regFail   <= exampleRegFail   when exampleRegAck = '1' else
                simRegFail       when simRegAck     = '1' else
                '1'              when regNoAck      = '1' else '0';
   regDataRd <= exampleRegDataRd when exampleRegAck = '1' else
                simRegDataRd     when simRegAck     = '1' else (others => '0');
   
   U_RcmExampleRegs : entity work.RcmExampleRegs
      port map (
         BeeClk        => beeClk,
         BeeRst        => beeRst,
         StatusClk     => statusClk,
         StatusAddr    => statusAddr,
         StatusReg     => statusReg,
         StatusRst     => statusRst,
         RegReq        => regReq,
         RegOp         => regOp,
         RegAddr       => regAddr,
         RegDataWr     => regDataWr,
         RegAck        => exampleRegAck,
         RegFail       => exampleRegFail,
         RegDataRd     => exampleRegDataRd,
         Vin_ok        => '0',
         Vout_ok       => '0',
         V3_3v_ok      => '0',
         V2_5v_ok      => '0',
         V1_8v_ok      => '0',
         V1_5v_ok      => '0',
         V1_0v_ok      => '0',
         Mgt_avcc_ok   => '0',
         Mgt_avtt_ok   => '0',
         Mgt_accpll_ok => '0',
         Switch_addr   => (others => '0'),
         Resistor_addr => r_addr
      );


   U_RaftDataSim : entity work.RaftDataSim
     generic map (
       XIL_DEVICE_G => "7SERIES"
     )
      port map (
         usrClk    => beeClk,
         usrRst    => beeRst,
         regReq    => regReq,
         regOp     => regOp,
         regAddr   => regAddr,
         regDataWr => regDataWr,
         regAck    => simRegAck,
         regFail   => simRegFail,
         regDataRd => simRegDataRd,
         raftWrEn  => dataWrEn,
         raftSOT   => dataSOT,
         raftEOT   => dataEOT,
         raftClk   => dataClk,
         raftData  => dataIn
      );

end dreb2;

