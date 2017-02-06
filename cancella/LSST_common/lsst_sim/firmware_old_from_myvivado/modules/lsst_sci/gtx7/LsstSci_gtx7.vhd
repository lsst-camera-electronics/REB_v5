library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

architecture LsstSci_gtx7 of LsstSci is

  ----------------------------------------------------------------------------
  -- PGP Clock/Reset Generator signals
  ----------------------------------------------------------------------------
  signal pllLock  : std_logic;
  signal locRst   : std_logic;
  signal extRst   : std_logic;

  signal pgpClk : std_logic;
  signal pgpRst : std_logic;
  
  signal loopback : std_logic_vector(2 downto 0);

  ----------------------------------------------------------------------------
  -- PGP Protocol Core signals
  ----------------------------------------------------------------------------
  signal pgpRxIn          : PgpRxInType;
  signal pgpRxOut         : PgpRxOutType;
  signal pgpTxIn          : PgpTxInType;
  signal pgpTxOut         : PgpTxOutType;
  signal pgpVcTxQuadIn    : VcTxQuadInType;
  signal pgpVcTxQuadOut   : VcTxQuadOutType;
  signal pgpVcRxCommonOut : VcRxCommonOutType;
  signal pgpVcRxQuadOut   : VcRxQuadOutType;

begin

  extRst <= (not FpgaRstL);

  ----------------------------------------------------------------------------
  -- MGT/PGP Protocol Core
  ----------------------------------------------------------------------------
  U_PGPCore : entity work.Pgp2Gtx7VarLatWrapper
    generic map (
      -- The following are to take 250MHz RefClk to 3.125 Gbps
      MMCM_CLKIN_PERIOD_G => 8.000,
      MMCM_CLKFBOUT_MULT_G => 7.500,
      MMCM_GTCLK_DIVIDE_G => 6.000,
      MMCM_TXCLK_DIVIDE_G => 6,
      RX_CLK25_DIV_G => 13,
      TX_CLK25_DIV_G => 13,
      NUM_VC_EN_G => 4 )
    port map (
      extRst           => extRst,
      pllLock          => pllLock,
      locClk           => pgpClk,
      locRst           => pgpRst,
      stableClk        => open,
      pgpTxIn          => pgpTxIn,
      pgpTxOut         => pgpTxOut,
      pgpRxIn          => pgpRxIn,
      pgpRxOut         => pgpRxOut,
      pgpVcTxQuadIn    => pgpVcTxQuadIn,
      pgpVcTxQuadOut   => pgpVcTxQuadOut,
      pgpVcRxCommonOut => pgpVcRxCommonOut,
      pgpVcRxQuadOut   => pgpVcRxQuadOut,
      loopback         => loopback,
      gtClkP           => PgpClkP,
      gtClkN           => PgpClkM,
      gtTxP            => PgpTxP,
      gtTxN            => PgpTxM,
      gtRxP            => PgpRxP,
      gtRxN            => PgpRxM
    );
  
  loopback <= "000";

  -----------------------------------------------------------------------------
  -- LSST SCI Core
  -----------------------------------------------------------------------------
  U_LsstSciCore : entity work.LsstSciCore
    generic map (
      RAFT_DATA_CONVERSION => RAFT_DATA_CONVERSION,
      XIL_DEVICE_G => "7SERIES" )
    port map (
      -- PGP Front End
      PgpClk           => pgpClk,        
      PgpRst           => pgpRst,        
      PgpRxIn          => pgpRxIn,         
      PgpRxOut         => pgpRxOut,        
      PgpTxIn          => pgpTxIn,         
      PgpTxOut         => pgpTxOut,        
      PgpVcTxQuadIn    => pgpVcTxQuadIn,   
      PgpVcTxQuadOut   => pgpVcTxQuadOut,  
      PgpVcRxCommonOut => pgpVcRxCommonOut,
      PgpVcRxQuadOut   => pgpVcRxQuadOut,  
      -- Clock/Reset
      ClkOut           => ClkOut,
      RstOut           => RstOut,
      --Debug Interface
      PgpLocLinkReadyOut => PgpLocLinkReadyOut,
      PgpRemLinkReadyOut => PgpRemLinkReadyOut,
      -- Register Interface
      RegClk    => RegClk,   
      RegRst    => RegRst,   
      RegAddr   => RegAddr,  
      RegReq    => RegReq,   
      RegOp     => RegOp,    
      RegDataWr => RegDataWr,
      RegWrEn   => RegWrEn,  
      RegAck    => RegAck,   
      RegFail   => RegFail,  
      RegDataRd => RegDataRd,
      -- Data Encoder Interface
      DataClk    => DataClk, 
      DataWrEn   => DataWrEn,
      DataSOT    => DataSOT, 
      DataEOT    => DataEOT, 
      DataIn     => DataIn,  
      -- Status Block Interface
      StatusClk   => StatusClk, 
      StatusRst   => StatusRst, 
      StatusAddr  => StatusAddr,
      StatusReg   => StatusReg
    ); 

end LsstSci_gtx7;
