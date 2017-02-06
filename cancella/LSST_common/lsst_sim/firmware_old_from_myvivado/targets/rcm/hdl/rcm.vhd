-------------------------------------------------------------------------------
-- Title      : RCM SCI
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : rcm_sim.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-05-18
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

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity rcm is
   port (
      -- Clock and Reset signals
      Pwron_Rst_L        :  in std_logic;

      PgpRefClk_P      :  in std_logic;
      PgpRefClk_M      :  in std_logic;

      Clk_200_P        : in std_logic;
      Clk_200_M        : in std_logic;
      Clk_150_P        : in std_logic;
      Clk_150_M        : in std_logic;
      
      -- PGP signals
      PgpRx_P          :  in std_logic;
      PgpRx_M          :  in std_logic;
      PgpTx_P          : out std_logic;
      PgpTx_M          : out std_logic;

      -- Voltage Status signals
      Vin_ok_F         : in std_logic;
      Vout_ok_F        : in std_logic;
      V3_3v_ok_F       : in std_logic;
      V2_5v_ok_F       : in std_logic;
      V1_8v_ok_F       : in std_logic;
      V1_5v_ok_F       : in std_logic;
      V1_0v_ok_F       : in std_logic;
      Mgt_Avcc_ok_F    : in std_logic;
      Mgt_Avtt_ok_F    : in std_logic;
      Mgt_Avccpll_ok_F : in std_logic;

      -- Addresses                                   
      SW_Addr0         : in std_logic;
      SW_Addr1         : in std_logic;
      SW_Addr2         : in std_logic;
      SW_Addr3         : in std_logic;
      SW_Addr4         : in std_logic;
      SW_Addr5         : in std_logic;
      SW_Addr6         : in std_logic;
      SW_Addr7         : in std_logic;
      
      R_Addr0          : in std_logic;
      R_Addr1          : in std_logic;
      R_Addr2          : in std_logic;
      R_Addr3          : in std_logic;
      R_Addr4          : in std_logic;
      R_Addr5          : in std_logic;
      R_Addr6          : in std_logic;
      R_Addr7          : in std_logic;
      
      -- Test Point signals
      Test_7           :   out std_logic;
      Test_6           :   out std_logic;
      Test_5           :   out std_logic;
      Test_4           :   out std_logic;
      Test_3           :   out std_logic;
      Test_2           :   out std_logic;
      Test_1           :   out std_logic;
      Test_0           :   out std_logic;

      TestLed_2        :   out std_logic;
      TestLed_1        :   out std_logic
   );
end rcm;

architecture rcm of rcm is

   -- Input LVDS signals
   signal clk_200_in : std_logic;
   signal clk_200    : std_logic;
   signal clk_150_in : std_logic;
   signal clk_150    : std_logic;

   signal clk_0 : std_logic;
   signal clkfb : std_logic;
   signal clk_div : std_logic;
   signal clk_div_int : std_logic;
   
   signal sciClk : std_logic;
   signal sciRst : std_logic;

   signal beeClk : std_logic;
   signal beeRst : std_logic;
   
   signal syncBeeRst   : std_logic_vector(2 downto 0);
   signal beeRstCnt    : std_logic_vector(3 downto 0);
   
   -- Reset
   signal rst    : std_logic;
   signal n_rst  : std_logic;
   
   -- Addresses
   signal sw_addr : std_logic_vector(7 downto 0);
   signal r_addr  : std_logic_vector(7 downto 0);
   
   -- misc
   signal test_port : std_logic_vector(7 downto 0);
   signal test_led  : std_logic_vector(1 downto 0);

   signal vinv_ok_i       : std_logic;  -- 12V  OK
   signal voutv_ok_i      : std_logic;  -- 6V OK
   signal v3_3v_ok_i      : std_logic;  -- 3.3V OK
   signal v2_5v_ok_i      : std_logic;  -- 2.5V OK
   signal v1_8v_ok_i      : std_logic;  -- 1.8V OK
   signal v1_5v_ok_i      : std_logic;  -- 1.5V OK
   signal v1_0v_ok_i      : std_logic;  -- 1.0V OK
   signal mgt_avtt_ok_i   : std_logic;  -- MGT AVTT  voltage OK
   signal mgt_avcc_ok_i   : std_logic;  -- MGT voltage OK
   signal mgt_avccpll_ok_i : std_logic; -- MGT PLL voltage OK
	
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

   rst 	<= not(Pwron_Rst_L);

   test_led(0)		<= pgpLocLinkReady;
   test_led(1)		<= pgpRemLinkReady;

   test_port(0) <= regReq;
   test_port(1) <= regAck;
   test_port(2) <= pgpLocLinkReady;
   test_port(3) <= pgpRemLinkReady;
   test_port(4) <= beeClk;
   test_port(5) <= '0';
   test_port(6) <= clk_200;
   test_port(7) <= clk_150;

   -- Back end clock and reset synchronization
   beeClk <= clk_div;

   U_beeRst : entity work.RstSync
     port map (
       clk => beeClk,
       asyncRst => sciRst,
       syncRst => beeRst);
   
   U_LsstSci : entity work.LsstSci
      generic map (
        --RAFT_DATA_CONVERSION => "ZERO_EXTEND_32"
        RAFT_DATA_CONVERSION => "TRUNC_LOW_2"
         )
      port map (
         FpgaRstL           => Pwron_Rst_L,
         PgpClkP            => PgpRefClk_P,
         PgpClkM            => PgpRefClk_M,
         PgpRxP             => pgpRx_P,
         PgpRxM             => pgpRx_M,
         PgpTxP             => pgpTx_P,
         PgpTxM             => pgpTx_M,
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
         Vin_ok        => vinv_ok_i,
         Vout_ok       => voutv_ok_i,
         V3_3v_ok      => v3_3v_ok_i,
         V2_5v_ok      => v2_5v_ok_i,
         V1_8v_ok      => v1_8v_ok_i,
         V1_5v_ok      => v1_5v_ok_i,
         V1_0v_ok      => v1_0v_ok_i,
         Mgt_avcc_ok   => mgt_avtt_ok_i,
         Mgt_avtt_ok   => mgt_avcc_ok_i,
         Mgt_accpll_ok => mgt_avccpll_ok_i,
         Switch_addr   => sw_addr,
         Resistor_addr => r_addr
      );


   U_RaftDataSim : entity work.RaftDataSim
     generic map (
       XIL_DEVICE_G => "VIRTEX5"
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
         raftData  => dataIn);

   U_rcm_dcm: DCM_ADV
      generic map (
         DFS_FREQUENCY_MODE    => "LOW",       
         DLL_FREQUENCY_MODE    => "HIGH",
         CLKIN_DIVIDE_BY_2     => FALSE,
         CLK_FEEDBACK          => "1X",        
         CLKOUT_PHASE_SHIFT    => "NONE",
         STARTUP_WAIT          => false,       
         PHASE_SHIFT           => 0,
         CLKFX_MULTIPLY        => 2,
         CLKFX_DIVIDE          => 4,
         CLKDV_DIVIDE          => 2.0,         
         CLKIN_PERIOD          => 5.0,
         DCM_PERFORMANCE_MODE  => "MAX_SPEED", 
         FACTORY_JF            => X"F0F0",
         DESKEW_ADJUST         => "SYSTEM_SYNCHRONOUS"
      )
      port map (
         CLKIN    => clk_200,       CLKFB    => clkfb,
         CLK0     => clk_0,         CLK90    => open,
         CLK180   => open,          CLK270   => open, 
         CLK2X    => open,          CLK2X180 => open,
         CLKDV    => clk_div_int,   CLKFX    => open,
         CLKFX180 => open,          LOCKED   => open,
         PSDONE   => open,          PSCLK    => '0',
         PSINCDEC => '0',           PSEN     => '0',
         DCLK     => '0',           DADDR    => (others=>'0'),
         DI       => (others=>'0'), DO       => open,
         DRDY     => open,          DWE      => '0',
         DEN      => '0',           RST      => rst
      );

   BUFG_feed : BUFG
   port map (
      O => clkfb,     -- Clock buffer output
      I => clk_0      -- Clock buffer input
   );

   BUFG_clk_100 : BUFG
   port map (
      O => clk_div,
      I => clk_div_int
   );
   
   -- IO's from here down
   Uclk_200 : IBUFGDS port map (I  => Clk_200_P,
                                IB => Clk_200_M,
                                O  => clk_200_in);
   Uclk_150 : IBUFGDS port map (I  => Clk_150_P,
                                IB => Clk_150_M,
                                O  => clk_150_in);

   Udly_clk0 : BUFG port map (I => clk_200_in, O => clk_200);
   Udly_clk1 : BUFG port map (I => clk_150_in, O => clk_150);
   
   -- LVCMOS I/O's
   Utest0: OBUF port map (O => Test_0, I => test_port(0));
   Utest1: OBUF port map (O => Test_1, I => test_port(1));
   Utest2: OBUF port map (O => Test_2, I => test_port(2));
   Utest3: OBUF port map (O => Test_3, I => test_port(3));
   Utest4: OBUF port map (O => Test_4, I => test_port(4));
   Utest5: OBUF port map (O => Test_5, I => test_port(5));
   Utest6: OBUF port map (O => Test_6, I => test_port(6));
   Utest7: OBUF port map (O => Test_7, I => test_port(7));
   
   Uswaddr0: IBUF port map (O => sw_addr(0), I => SW_Addr0);
   Uswaddr1: IBUF port map (O => sw_addr(1), I => SW_Addr1);
   Uswaddr2: IBUF port map (O => sw_addr(2), I => SW_Addr2);
   Uswaddr3: IBUF port map (O => sw_addr(3), I => SW_Addr3);
   Uswaddr4: IBUF port map (O => sw_addr(4), I => SW_Addr4);
   Uswaddr5: IBUF port map (O => sw_addr(5), I => SW_Addr5);
   Uswaddr6: IBUF port map (O => sw_addr(6), I => SW_Addr6);
   Uswaddr7: IBUF port map (O => sw_addr(7), I => SW_Addr7);
   
   Uraddr0: IBUF port map (O => r_addr(0), I => R_Addr0);
   Uraddr1: IBUF port map (O => r_addr(1), I => R_Addr1);
   Uraddr2: IBUF port map (O => r_addr(2), I => R_Addr2);
   Uraddr3: IBUF port map (O => r_addr(3), I => R_Addr3);
   Uraddr4: IBUF port map (O => r_addr(4), I => R_Addr4);
   Uraddr5: IBUF port map (O => r_addr(5), I => R_Addr5);
   Uraddr6: IBUF port map (O => r_addr(6), I => R_Addr6);
   Uraddr7: IBUF port map (O => r_addr(7), I => R_Addr7);
   
   UtestLed1: OBUF port map (O => TestLed_1, I => test_led(0));
   UtestLed2: OBUF port map (O => TestLed_2, I => test_led(1));
   
   
   Uv12_ok: IBUF port map (O => vinv_ok_i, I => Vin_ok_F);
   Uv6_ok: IBUF port map (O => voutv_ok_i, I => Vout_ok_F);
   Uv33_ok: IBUF port map (O => v3_3v_ok_i, I => V3_3v_ok_F);
   Uv25_ok: IBUF port map (O => v2_5v_ok_i, I => V2_5v_ok_F);
   Uv18_ok: IBUF port map (O => v1_8v_ok_i, I => V1_8v_ok_F);
   Uv15_ok: IBUF port map (O => v1_5v_ok_i, I => V1_5v_ok_F);
   Uv10_ok: IBUF port map (O => v1_0v_ok_i, I => V1_0v_ok_F);
   Uavtt_ok: IBUF port map (O => mgt_avtt_ok_i, I => Mgt_Avtt_ok_F);
   Uavcc_ok: IBUF port map (O => mgt_avcc_ok_i, I => Mgt_Avcc_ok_F);
   Uavccpll_ok: IBUF port map (O => mgt_avccpll_ok_i, I => Mgt_Avccpll_ok_F);

end rcm;

