
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
    pgpSide      : out sl;
    
    -- GT Pins
    gtRefClk     : in  sl;
    gtTxP        : out slv(1 downto 0);
    gtTxN        : out slv(1 downto 0);
    gtRxP        : in  slv(1 downto 0);
    gtRxN        : in  slv(1 downto 0));

end LsstPgpFrontEnd;

-- Define architecture
architecture mapping of LsstPgpFrontEnd is
  constant TPD_G : time := 1 ns;

  ----------------------------------------------------------------------------
  -- PGP Clock and Reset Signals
  ----------------------------------------------------------------------------
  -- Get PGP configuration. 250MHz Ref clk. 3.125 Gbps line rate.
  constant GTX_CONFIG_C : Gtx7CPllCfgType := getGtx7CPllCfg(250.0E6, 3.125E9);

  signal pgpLinkUpStable : slv(1 downto 0);
  signal pgpLinkUpRx     : slv(1 downto 0);
  signal pgpTxLinkReady  : slv(1 downto 0);
  
  -- Internal PGP signals
  signal intCPllLock     : slv(1 downto 0);
  signal intPgpTxClk     : slv(1 downto 0);
  signal intPgpRxClk     : slv(1 downto 0);
  signal intPgpRxRst     : slv(1 downto 0);
  signal intPgpRxIn      : Pgp2bRxInArray(1 downto 0);
  signal intPgpRxOut     : Pgp2bRxOutArray(1 downto 0);
  signal intPgpTxIn      : Pgp2bTxInArray(1 downto 0);
  signal intPgpTxOut     : Pgp2bTxOutArray(1 downto 0);
  signal intPgpTxMasters : AxiStreamQuadMasterArray(1 downto 0);
  signal intPgpTxSlaves  : AxiStreamQuadSlaveArray(1 downto 0);
  signal intPgpRxMasters : AxiStreamQuadMasterArray(1 downto 0);
  signal intPgpRxCtrl    : AxiStreamQuadCtrlArray(1 downto 0);

  signal intPgpTxClkBufg : sl;

  signal intPgpSide      : sl;

begin

  -- Select the side based on which has link. Choose A if both do.
  intPgpSide <= '1' when pgpLinkUpStable = "10" else '0';
  pgpSide    <= intPgpSide;

  -- For now us the Tx clock from one links for both
  TXOUTCLK_BUFG : BUFG
    port map (
      I => intPgpTxClk(0),
      O => intPgpTxClkBufg);

  pgpTxClk <= intPgpTxClkBufg;
  pgpTxRst <= stablePOR;

  -- Mux the output
  RXOUTCLK_BUFG : BUFGMUX
    port map (
      I0 => intPgpRxClk(0),
      I1 => intPgpRxClk(1),
      O  => pgpRxClk,
      S  => intPgpSide);

  pgpTxSlaves  <= intPgpTxSlaves(1)  when intPgpSide = '1' else intPgpTxSlaves(0);
  pgpRxMasters <= intPgpRxMasters(1) when intPgpSide = '1' else intPgpRxMasters(0);
  pgpRxOut     <= intPgpRxOut(1)     when intPgpSide = '1' else intPgpRxOut(0);
  pgpTxOut     <= intPgpTxOut(1)     when intPgpSide = '1' else intPgpTxOut(0);
  pgpRxRst     <= intPgpRxRst(1)     when intPgpSide = '1' else intPgpRxRst(0);
  
  -------------------------
  -- PGP Core
  -------------------------         
  PgpCore : for i in 1 downto 0 generate

    -- Send inputs to both links
    intPgpTxMasters(i) <= pgpTxMasters;
    intPgpRxCtrl(i)    <= pgpRxCtrl;
    intPgpRxIn(i)      <= pgpRxIn;
    intPgpTxIn(i)      <= pgpTxIn;

    -- link up
    TxLinkSync : entity work.Synchronizer
      port map (
        clk     => intPgpRxClk(i),
        dataIn  => intPgpTxOut(i).linkReady,
        dataOut => pgpTxLinkReady(i));

    pgpLinkUpRx(i) <= pgpTxLinkReady(i) and intPgpRxOut(i).linkReady and intPgpRxOut(i).remLinkReady;

    LinkUpSync : entity work.Synchronizer
      port map (
        clk     => intPgpRxClk(i),
        dataIn  => pgpLinkUpRx(i),
        dataOut => pgpLinkUpStable(i));

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
        gtCPllLock        => intCPllLock(i),
        gtRxRefClkBufg    => '0',
        gtTxOutClk        => intPgpTxClk(i),
        -- Gt Serial IO
        gtTxP             => gtTxP(i),
        gtTxN             => gtTxN(i),
        gtRxP             => gtRxP(i),
        gtRxN             => gtRxN(i),
        -- Tx Clocking
        pgpTxReset        => stablePOR,
        pgpTxClk          => intPgpTxClkBufg,
        -- Rx clocking
        pgpRxReset        => stablePOR,
        pgpRxRecClk       => intPgpRxClk(i),
        pgpRxRecClkRst    => intPgpRxRst(i),
        pgpRxClk          => intPgpRxClk(i),
        -- Non VC Rx Signals
        pgpRxIn           => intPgpRxIn(i),
        pgpRxOut          => intPgpRxOut(i),
        -- Non VC Tx Signals
        pgpTxIn           => intPgpTxIn(i),
        pgpTxOut          => intPgpTxOut(i),
        -- Frame Transmit Interface - 1 Lane, Array of 4 VCs
        pgpTxMasters      => intPgpTxMasters(i),
        pgpTxSlaves       => intPgpTxSlaves(i),
        -- Frame Receive Interface - 1 Lane, Array of 4 VCs
        pgpRxMasters      => intPgpRxMasters(i),
        pgpRxMasterMuxed  => open,
        pgpRxCtrl         => intPgpRxCtrl(i));

  end generate;

end mapping;
