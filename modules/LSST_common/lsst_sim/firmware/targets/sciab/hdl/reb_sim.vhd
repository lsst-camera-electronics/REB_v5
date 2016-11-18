library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.LsstSciPackage.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity reb_sim is
  generic (
    SCI_ID               : std_logic_vector(7 downto 0);
    RAFT_DATA_CONVERSION : string);
  port (
     -- PGP signals
     PgpRefClk_P :  in std_logic;
     PgpRefClk_M :  in std_logic;
     PgpRx_P     :  in std_logic;
     PgpRx_M     :  in std_logic;
     PgpTx_P     : out std_logic;
     PgpTx_M     : out std_logic);
  
end reb_sim;

architecture reb_sim of reb_sim is

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

  -- Back end clock and reset synchronizations
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
        --RAFT_DATA_CONVERSION => "TRUNC_LOW_2"
        RAFT_DATA_CONVERSION => RAFT_DATA_CONVERSION
      )
      port map (
         FpgaRstL           => '1',
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
         Switch_addr   => SCI_ID,
         Resistor_addr => SCI_ID
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

end reb_sim;

