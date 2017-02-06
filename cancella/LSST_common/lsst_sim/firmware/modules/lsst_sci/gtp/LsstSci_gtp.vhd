library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;


architecture LsstSci_gtp of LsstSci is

  ----------------------------------------------------------------------------
  -- PGP Clock/Reset Generator signals
  ----------------------------------------------------------------------------
  constant USE_OLD_PGP_CORE : boolean := true;
  signal pgpClk   : std_logic;
  signal pgpClk2x : std_logic;
  signal pgpRst   : std_logic;
  
  signal pgpRefClkIn  : std_logic;
  signal pgpRefClkOut : std_logic;

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

  ----------------------------------------------------------------------------
  -- MGT/PGP Protocol Core
  ----------------------------------------------------------------------------
  U_PgpRefClk : IBUFDS port map (I  => PgpClkP,
                                 IB => PgpClkM,
                                 O  => pgpRefClkIn);

  
  
  U_ClockResetBlock : entity work.Pgp2GtpClk
      generic map (
         UserFxDiv  => 5,
         UserFxMult => 4
      )
      port map (
         ponResetL  => FpgaRstL,
         locReset   => '0',
         pgpRefClk  => pgpRefClkOut,
         pgpClk     => pgpClk,
         pgpReset   => pgpRst,
         pgpClk2x   => pgpClk2x,
         userClk    => open,
         userReset  => open,
         pgpClkIn   => pgpClk,
         userClkIn  => '0'
      );


  U_gen_new_pgp_core: if USE_OLD_PGP_CORE = false generate
    
    U_PGPCore : entity work.Pgp2Gtp16FixedLat
      generic map (
        EnShortCells => 1,
        VcInterleave => 0)
      port map (
        pgpReset         => pgpRst,
        pgpTxClk         => pgpClk,
        pgpTxClk2x       => pgpClk2x,
        pgpRxRecClk      => open,
        pgpRxRecClk2x    => open,
        pgpRxRecClkRst   => open,
        pgpTxIn          => pgpTxIn,
        pgpTxOut         => pgpTxOut,
        pgpRxIn          => pgpRxIn,
        pgpRxOut         => pgpRxOut,
        pgpVcTxQuadIn    => pgpVcTxQuadIn,
        pgpVcTxQuadOut   => pgpVcTxQuadOut,
        pgpVcRxCommonOut => pgpVcRxCommonOut,
        pgpVcRxQuadOut   => pgpVcRxQuadOut,
        gtpLoopback => '0',
        gtpClkIn => pgpRefClkIn,
        gtpRefClkOut => pgpRefClkOut,
        gtpRxN => PgpRxM,
        gtpRxP => PgpRxP,
        gtpTxN => PgpTxM,
        gtpTxP => PgpTxP,
        debug => open);

  end generate;
  
  U_gen_old_pgp_core: if USE_OLD_PGP_CORE = true generate
    
    U_PGPCore : entity work.Pgp2Gtp16
    generic map (
      EnShortCells => 1,
      VcInterleave => 0
    )
    port map (
      pgpClk            => pgpClk,
      pgpClk2x          => pgpClk2x,
      pgpReset          => pgpRst,
      pgpFlush          => '0',
      pllTxRst          => '0',
      pllRxRst          => '0',
      pllRxReady        => open,
      pllTxReady        => open,
      pgpRemData        => open,
      pgpLocData        => (others => '0'),
      pgpTxOpCodeEn     => '0',
      pgpTxOpCode       => (others => '0'),
      pgpRxOpCodeEn     => open,
      pgpRxOpCode       => open,
      pgpLocLinkReady   => pgpTxOut.linkReady,
      pgpRemLinkReady   => pgpRxOut.remLinkReady,
      pgpRxCellError    => pgpRxOut.cellError,
      pgpRxLinkDown     => pgpRxOut.linkDown,
      pgpRxLinkError    => pgpRxOut.linkError,
      vc0FrameTxValid   => pgpVcTxQuadIn(0).valid,
      vc0FrameTxReady   => pgpVcTxQuadOut(0).ready,
      vc0FrameTxSOF     => pgpVcTxQuadIn(0).sof,
      vc0FrameTxEOF     => pgpVcTxQuadIn(0).eof,
      vc0FrameTxEOFE    => pgpVcTxQuadIn(0).eofe,
      vc0FrameTxData    => pgpVcTxQuadIn(0).data(0),
      vc0LocBuffAFull   => pgpVcTxQuadIn(0).locBuffAFull,
      vc0LocBuffFull    => pgpVcTxQuadIn(0).locBuffFull, 
      vc1FrameTxValid   => pgpVcTxQuadIn(1).valid,       
      vc1FrameTxReady   => pgpVcTxQuadOut(1).ready,      
      vc1FrameTxSOF     => pgpVcTxQuadIn(1).sof,         
      vc1FrameTxEOF     => pgpVcTxQuadIn(1).eof,         
      vc1FrameTxEOFE    => pgpVcTxQuadIn(1).eofe,        
      vc1FrameTxData    => pgpVcTxQuadIn(1).data(0),     
      vc1LocBuffAFull   => pgpVcTxQuadIn(1).locBuffAFull,
      vc1LocBuffFull    => pgpVcTxQuadIn(1).locBuffFull, 
      vc2FrameTxValid   => pgpVcTxQuadIn(2).valid,       
      vc2FrameTxReady   => pgpVcTxQuadOut(2).ready,      
      vc2FrameTxSOF     => pgpVcTxQuadIn(2).sof,         
      vc2FrameTxEOF     => pgpVcTxQuadIn(2).eof,         
      vc2FrameTxEOFE    => pgpVcTxQuadIn(2).eofe,        
      vc2FrameTxData    => pgpVcTxQuadIn(2).data(0),     
      vc2LocBuffAFull   => pgpVcTxQuadIn(2).locBuffAFull,
      vc2LocBuffFull    => pgpVcTxQuadIn(2).locBuffFull, 
      vc3FrameTxValid   => pgpVcTxQuadIn(3).valid,       
      vc3FrameTxReady   => pgpVcTxQuadOut(3).ready,      
      vc3FrameTxSOF     => pgpVcTxQuadIn(3).sof,         
      vc3FrameTxEOF     => pgpVcTxQuadIn(3).eof,         
      vc3FrameTxEOFE    => pgpVcTxQuadIn(3).eofe,        
      vc3FrameTxData    => pgpVcTxQuadIn(3).data(0),     
      vc3LocBuffAFull   => pgpVcTxQuadIn(3).locBuffAFull,
      vc3LocBuffFull    => pgpVcTxQuadIn(3).locBuffFull, 
      vcFrameRxSOF      => pgpVcRxCommonOut.sof,
      vcFrameRxEOF      => pgpVcRxCommonOut.eof,
      vcFrameRxEOFE     => pgpVcRxCommonOut.eofe,
      vcFrameRxData     => pgpVcRxCommonOut.data(0),
      vc0FrameRxValid   => pgpVcRxQuadOut(0).valid,
      vc0RemBuffAFull   => pgpVcRxQuadOut(0).remBuffAFull,
      vc0RemBuffFull    => pgpVcRxQuadOut(0).remBuffFull, 
      vc1FrameRxValid   => pgpVcRxQuadOut(1).valid,       
      vc1RemBuffAFull   => pgpVcRxQuadOut(1).remBuffAFull,
      vc1RemBuffFull    => pgpVcRxQuadOut(1).remBuffFull, 
      vc2FrameRxValid   => pgpVcRxQuadOut(2).valid,       
      vc2RemBuffAFull   => pgpVcRxQuadOut(2).remBuffAFull,
      vc2RemBuffFull    => pgpVcRxQuadOut(2).remBuffFull, 
      vc3FrameRxValid   => pgpVcRxQuadOut(3).valid,       
      vc3RemBuffAFull   => pgpVcRxQuadOut(3).remBuffAFull,
      vc3RemBuffFull    => pgpVcRxQuadOut(3).remBuffFull, 
      gtpLoopback       => '0',
      gtpClkIn          => pgpRefClkIn,
      gtpRefClkOut      => pgpRefClkOut,
      gtpRxRecClk       => open,
      gtpRxN            => PgpRxM,
      gtpRxP            => PgpRxP,
      gtpTxN            => PgpTxM,
      gtpTxP            => PgpTxP,
      debug             => open
      );

  end generate;
  
  -----------------------------------------------------------------------------
  -- LSST SCI Core
  -----------------------------------------------------------------------------
  U_LsstSciCore : entity work.LsstSciCore
    generic map (
      RAFT_DATA_CONVERSION => RAFT_DATA_CONVERSION,
      XIL_DEVICE_G => "VIRTEX5" )
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

end LsstSci_gtp;
