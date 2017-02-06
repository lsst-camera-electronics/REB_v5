
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;
use work.Pgp2bPkg.all;

library unisim;
use unisim.vcomponents.all;

entity LsstPgpFrontEnd is
  port ( 
    -- Frame Transmit Interface - 1 Lane, Array of 4 VCs
    pgpTxMasters : in  AxiStreamMasterArray(3 downto 0);
    pgpTxSlaves  : out AxiStreamSlaveArray(3 downto 0);

    -- Frame Receive Interface - 1 Lane, Array of 4 VCs
    pgpRxMasters : out AxiStreamMasterArray(3 downto 0);
    pgpRxCtrl    : in  AxiStreamCtrlArray(3 downto 0);

    -- Non VC PGP Signals
    pgpRxIn      : in  Pgp2bRxInType;
    pgpRxOut     : out Pgp2bRxOutType;
    pgpTxIn      : in  Pgp2bTxInType;
    pgpTxOut     : out Pgp2bTxOutType;

    -- Clock, Resets, and Status Signals
    fpgaRstL     : in  sl;
    pgpClk       : out sl;
    pgpRst       : out sl;

    -- GT Pins
    refClkP      : in  sl;
    refClkN      : in  sl;
    gtTxP        : out sl;
    gtTxN        : out sl;
    gtRxP        : in  sl;
    gtRxN        : in  sl);        

end LsstPgpFrontEnd;

-- Define architecture
architecture mapping of LsstPgpFrontEnd is
  constant TPD_G : time := 1 ns;

  ----------------------------------------------------------------------------
  -- PGP Clock and Reset Signals
  ----------------------------------------------------------------------------
  component PgpClkCore
    port(
      -- Clock in ports
      clk_in1 : in  sl;
      -- Clock out ports
      pgpClk  : out sl;
      -- Status and control signals
      reset   : in  sl;
      locked  : out sl);
  end component;

  attribute SYN_BLACK_BOX               : boolean;
  attribute SYN_BLACK_BOX of PgpClkCore : component is true;

  attribute BLACK_BOX_PAD_PIN               : string;
  attribute BLACK_BOX_PAD_PIN of PgpClkCore : component is "clk_in1,pgpClk,reset,locked";

  signal stableClk : sl;
  signal stableRst : sl;
  signal gtClkDiv2 : sl;
  signal intPgpClk : sl;
  signal intPgpRst : sl;
  signal pgpLocked : sl;
  
begin

  pgpClk <= intPgpClk;
  pgpRst <= intPgpRst;
  
  -------------------------
  -- SCI Clk/Rst Generation
  -------------------------         
  IBUFDS_GTE2_Inst : IBUFDS_GTE2
    port map (
      I     => refClkP,
      IB    => refClkN,
      CEB   => '0',
      ODIV2 => gtClkDiv2,
      O     => open);

  BUFG_Inst : BUFG
    port map (
      I => gtClkDiv2,
      O => stableClk);

  -- Power Up Reset      
  PwrUpRst_Inst : entity work.PwrUpRst
    generic map (
      IN_POLARITY_G => '0')
    port map (
      arst   => fpgaRstL,
      clk    => stableClk,
      rstOut => stableRst);

  -- PGP Clock
  PgpClkCore_Inst : PgpClkCore
    port map (
      -- Clock in ports
      clk_in1 => stableClk,
      -- Clock out ports  
      pgpClk  => intPgpClk,
      -- Status and control signals                
      reset   => stableRst,
      locked  => pgpLocked);

  PgpRst_Inst : entity work.RstSync
    generic map(
      IN_POLARITY_G  => '0',
      OUT_POLARITY_G => '1')
    port map(
      clk      => intPgpClk,
      asyncRst => pgpLocked,
      syncRst  => intPgpRst);  

  -------------------------
  -- PGP Core
  -------------------------         
  Pgp2bGtx7MultiLane_Inst : entity work.Pgp2bGtx7MultiLane
    generic map (
      -- CPLL Settings
      CPLL_REFCLK_SEL_G => "111",
      CPLL_FBDIV_G      => 4,
      CPLL_FBDIV_45_G   => 5,
      CPLL_REFCLK_DIV_G => 1,
      RXOUT_DIV_G       => 2,
      TXOUT_DIV_G       => 2,
      RX_CLK25_DIV_G    => 13,
      TX_CLK25_DIV_G    => 13,
      -- Configure PLL sources
      TX_PLL_G          => "CPLL",
      RX_PLL_G          => "CPLL",
      -- Configure Number of Virtual Channels
      NUM_VC_EN_G       => 4,
      VC_INTERLEAVE_G   => 1,
      -- Configure Number of Lanes
      LANE_CNT_G        => 1)
    port map (
      -- GT Clocking
      stableClk         => stableClk,
      gtCPllRefClk      => intPgpClk,
      gtCPllLock        => open,
      gtQPllRefClk      => '0',
      gtQPllClk         => '0',
      gtQPllLock        => '1',
      gtQPllRefClkLost  => '0',
      gtQPllReset       => open,
      -- Gt Serial IO
      gtTxP(0)          => gtTxP,
      gtTxN(0)          => gtTxN,
      gtRxP(0)          => gtRxP,
      gtRxN(0)          => gtRxN,
      -- Tx Clocking
      pgpTxReset        => intPgpRst,
      pgpTxClk          => intPgpClk,
      pgpTxMmcmReset    => open,
      pgpTxMmcmLocked   => '1',
      -- Rx clocking
      pgpRxReset        => intPgpRst,
      pgpRxRecClk       => open,
      pgpRxClk          => intPgpClk,
      pgpRxMmcmReset    => open,
      pgpRxMmcmLocked   => '1',
      -- Non VC Rx Signals
      pgpRxIn           => pgpRxIn,
      pgpRxOut          => pgpRxOut,
      -- Non VC Tx Signals
      pgpTxIn           => pgpTxIn,
      pgpTxOut          => pgpTxOut,
      -- Frame Transmit Interface - 1 Lane, Array of 4 VCs
      pgpTxMasters      => pgpTxMasters,
      pgpTxSlaves       => pgpTxSlaves,
      -- Frame Receive Interface - 1 Lane, Array of 4 VCs
      pgpRxMasters      => pgpRxMasters,
      pgpRxMasterMuxed  => open,
      pgpRxCtrl         => pgpRxCtrl);    
 
end mapping;
