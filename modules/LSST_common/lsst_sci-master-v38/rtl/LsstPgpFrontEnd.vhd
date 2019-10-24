
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;
use work.Pgp2bPkg.all;
use work.Gtx7CfgPkg.all;

library unisim;
use unisim.vcomponents.all;

entity LsstPgpFrontEnd is
  port ( 
    stableClk    : in  sl;
    stableRst    : in  sl;
    stablePOR    : in  sl;
    
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
    pgpRxClk     : out sl;
    pgpRxRst     : out sl;
    pgpTxClk     : out sl;
    pgpTxRst     : out sl;
    
    -- GT Pins
    gtRefClk     : in  sl;
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
  -- Get PGP configuration. 250MHz Ref clk. 3.125 Gbps line rate.
  constant GTX_CONFIG_C : Gtx7CPllCfgType := getGtx7CPllCfg(250.0E6, 3.125E9);

  signal cPllLock  : sl;
  
  signal intPgpRxOut  : Pgp2bRxOutType;

  signal intPgpTxClk : sl;
  signal intPgpTxClkBufg : sl;
  signal intPgpRxClk : sl;
  signal intPgpRxRst : sl;
  
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of
    Pgp2bGtx7Fixedlat_Inst : label is "TRUE";

begin

  TXOUTCLK_BUFG : BUFG
    port map (
      I => intPgpTxClk,
      O => intPgpTxClkBufg);

  pgpTxClk <= intPgpTxClkBufg;
  pgpTxRst <= stablePOR;
  pgpRxClk <= intPgpRxClk;
  pgpRxRst <= intPgpRxRst;
  
  -------------------------
  -- PGP Core
  -------------------------         
  Pgp2bGtx7Fixedlat_Inst : entity work.Pgp2bGtx7Fixedlat
    generic map (
      STABLE_CLOCK_PERIOD_G => 10.0E-9,
      -- CPLL Settings
      CPLL_FBDIV_G      => GTX_CONFIG_C.CPLL_FBDIV_G, 
      CPLL_FBDIV_45_G   => GTX_CONFIG_C.CPLL_FBDIV_45_G,
      CPLL_REFCLK_DIV_G => GTX_CONFIG_C.CPLL_REFCLK_DIV_G,
      RXOUT_DIV_G       => GTX_CONFIG_C.OUT_DIV_G,
      TXOUT_DIV_G       => GTX_CONFIG_C.OUT_DIV_G,
      RX_CLK25_DIV_G    => GTX_CONFIG_C.CLK25_DIV_G,
      TX_CLK25_DIV_G    => GTX_CONFIG_C.CLK25_DIV_G,
      RXDFEXYDEN_G      => '1',
      -- Configure PLL sources
      TX_PLL_G          => "CPLL",
      RX_PLL_G          => "CPLL",
      -- Allow TX to run in var lat mode by altering these generics
      TX_BUF_EN_G       => true,
      TX_OUTCLK_SRC_G   => "OUTCLKPMA",
      TX_PHASE_ALIGN_G  => "AUTO",
      -- Configure Number of Virtual Channels
      NUM_VC_EN_G       => 4,
      VC_INTERLEAVE_G   => 1)
    port map (
      -- GT Clocking
      stableClk         => stableClk,
      gtCPllRefClk      => gtRefClk,
      gtCPllLock        => cPllLock,
      gtRxRefClkBufg    => '0',
      gtTxOutClk        => intPgpTxClk,
      -- Gt Serial IO
      gtTxP             => gtTxP,
      gtTxN             => gtTxN,
      gtRxP             => gtRxP,
      gtRxN             => gtRxN,
      -- Tx Clocking
      pgpTxReset        => stablePOR,
      pgpTxClk          => intPgpTxClkBufg,
      -- Rx clocking
      pgpRxReset        => stablePOR,
      pgpRxRecClk       => intPgpRxClk,
      pgpRxRecClkRst    => intPgpRxRst,
      pgpRxClk          => intPgpRxClk,
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
      pgpRxCtrl         => pgpRxCtrl,
      txPreCursor       => "00111",
      txPostCursor      => "10100",
      txDiffCtrl        => "1100");


end mapping;
