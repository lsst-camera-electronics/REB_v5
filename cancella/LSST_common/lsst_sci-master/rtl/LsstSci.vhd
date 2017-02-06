library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.AxiLitePkg.all;
use work.AxiStreamPkg.all;
use work.SsiPkg.all;
use work.SsiCmdMasterPkg.all;
use work.Pgp2bPkg.all;

entity LsstSci is
  port (
    -------------------------------------------------------------------------
    -- FPGA Interface
    -------------------------------------------------------------------------
    FpgaRstL : in std_logic;

    PgpClkP : in  std_logic;
    PgpClkM : in  std_logic;
    PgpRxP  : in  std_logic;
    PgpRxM  : in  std_logic;
    PgpTxP  : out std_logic;
    PgpTxM  : out std_logic;

    -------------------------------------------------------------------------
    -- Clock/Reset Generator Interface
    -------------------------------------------------------------------------
    ClkOut : out std_logic;
    RstOut : out std_logic;
    ClkIn  : in  std_logic;
    RstIn  : in  std_logic;
    
    -------------------------------------------------------------------------
    -- SCI Register Encoder/Decoder Interface
    -------------------------------------------------------------------------
    RegAddr   : out std_logic_vector(23 downto 0);
    RegReq    : out std_logic;
    RegOp     : out std_logic;
    RegDataWr : out std_logic_vector(31 downto 0);
    RegWrEn   : out std_logic_vector(31 downto 0);
    RegAck    : in  std_logic;
    RegFail   : in  std_logic;
    RegDataRd : in  std_logic_vector(31 downto 0);

    -------------------------------------------------------------------------
    -- Data Encoder Interface
    -------------------------------------------------------------------------
    DataWrEn : in std_logic;
    DataSOT  : in std_logic;
    DataEOT  : in std_logic;
    DataIn   : in std_logic_vector(17 downto 0);

    -------------------------------------------------------------------------
    -- Notification Interface
    -------------------------------------------------------------------------
    NoticeEn : in std_logic;
    Notice   : in std_logic_vector(31 downto 0);

    -------------------------------------------------------------------------
    -- Synchronous Command Interface
    -------------------------------------------------------------------------
    SyncCmdEn : out std_logic;
    SyncCmd   : out std_logic_vector(7 downto 0);

    -------------------------------------------------------------------------
    -- Status Block Interface
    -------------------------------------------------------------------------
    StatusAddr : in  std_logic_vector(23 downto 0);
    StatusReg  : out std_logic_vector(31 downto 0);
    StatusRst  : in std_logic;

    -------------------------------------------------------------------------
    -- Debug Interface
    -------------------------------------------------------------------------
    PgpLocLinkReadyOut : out std_logic;
    PgpRemLinkReadyOut : out std_logic);

  
end LsstSci;

architecture LsstSci_axi of LsstSci is
  ----------------------------------------------------------------------------
  -- PGP VC signals, 1 Lane, array of 4 VCs
  ----------------------------------------------------------------------------
  signal pgpTxMasters : AxiStreamMasterArray(3 downto 0);
  signal pgpTxSlaves  : AxiStreamSlaveArray(3 downto 0);
  signal pgpRxMasters : AxiStreamMasterArray(3 downto 0);
  signal pgpRxCtrl    : AxiStreamCtrlArray(3 downto 0);
  
  ----------------------------------------------------------------------------
  -- Non VC Tx/Rx Signals
  ----------------------------------------------------------------------------
  signal pgpTxIn  : Pgp2bTxInType := PGP2B_TX_IN_INIT_C;
  signal pgpTxOut : Pgp2bTxOutType;
  signal pgpRxIn  : Pgp2bRxInType := PGP2B_RX_IN_INIT_C;
  signal pgpRxOut : Pgp2bRxOutType;

  -----------------------------------------------------------------------------
  -- User/Application Logic Reset signals
  -----------------------------------------------------------------------------
  constant REM_DATA_RESET_PATTERN : slv(7 downto 0) := x"a5";
  signal   reqSysRst : slv(0 downto 0);

  signal pgpClk     : sl;
  signal pgpRst     : sl;
  signal sciRst     : sl;
  signal sysClk     : sl;
  signal sysRst     : sl;
  
  signal imagesSent : sl;
  signal imagesTrunc: sl;
  signal imagesDisc : sl;
  signal dataFormat : slv( 3 downto 0);

  signal noticeSent : sl;
  signal noticeLast : slv(31 downto 0);
  
begin

  -------------------------
  -- SCI System Clock/Reset
  -------------------------         
  sciRst <= '1' when (pgpRxOut.remLinkData = REM_DATA_RESET_PATTERN
                      or pgpRst = '1') else '0';

  -- Hold reqSysRst for a time after sciRst
  ReqSysRst_delay : entity work.SlvDelay
    generic map (
      DELAY_G => 16,
      WIDTH_G => 1,
      INIT_G  => x"FFFF")
    port map (
      clk => pgpClk,
      rst => sciRst,
      din => "0",
      dout => reqSysRst);
  
  pgpTxIn.locData <= pgpRxOut.remLinkData;
  
  ClkOut <= pgpClk;
  RstOut <= reqSysRst(0) or sciRst;
  sysClk <= ClkIn;
  sysRst <= RstIn;
  
  -------------------------
  -- PGP Block
  -------------------------         
  LsstPgpFrontEnd_Inst : entity work.LsstPgpFrontEnd
    port map (
      -- VC PGP Signals (array of 4 VCs)
      pgpTxMasters => pgpTxMasters,
      pgpTxSlaves  => pgpTxSlaves,
      pgpRxMasters => pgpRxMasters,
      pgpRxCtrl    => pgpRxCtrl,
      -- Non VC PGP Signals
      pgpRxIn      => pgpRxIn,
      pgpRxOut     => pgpRxOut,
      pgpTxIn      => pgpTxIn,
      pgpTxOut     => pgpTxOut,
      -- Clock, Resets, and Status Signals
      fpgaRstL     => FpgaRstL,
      pgpClk       => pgpClk,
      pgpRst       => pgpRst,
      -- GT Pins
      refClkP      => PgpClkP,
      refClkN      => PgpClkM,
      gtTxP        => PgpTxP,
      gtTxN        => PgpTxM,
      gtRxP        => PgpRxP,
      gtRxN        => PgpRxM);        

  ------------------------------
  -- SCI Register Interface VC0
  ------------------------------         
  LsstSciRegEncoder_Inst : entity work.LsstSciRegEncoder
    port map (
      sAxisClk    => pgpClk,
      sAxisRst    => sciRst,
      sAxisMaster => pgpRxMasters(0),
      sAxisCtrl   => pgpRxCtrl(0),
      mAxisClk    => pgpClk,
      mAxisRst    => sciRst,
      mAxisMaster => pgpTxMasters(0),
      mAxisSlave  => pgpTxSlaves(0),
      regClk      => sysClk,
      regRst      => sysRst,
      regReq      => regReq,
      regOp       => regOp,
      regAddr     => regAddr,
      regDataWr   => regDataWr,
      regAck      => regAck,
      regFail     => regFail,
      regDataRd   => regDataRd);            

  RegWrEn <= (others => '1');
  
  ------------------------------
  -- SCI Image Interface VC1
  ------------------------------         
  LsstSciDataEncoder_Inst : entity work.LsstSciDataEncoder
    generic map (
      RAFT_DATA_CONVERSION => "18B_PACK")
    port map (
      sysClk      => sysClk,
      sysRst      => sysRst,
      pgpClk      => pgpClk,
      pgpRst      => sciRst,
      dataWrEn    => dataWrEn,
      dataSOT     => dataSOT,
      dataEOT     => dataEOT,
      dataIn      => dataIn,
      mAxisMaster => pgpTxMasters(1),
      mAxisSlave  => pgpTxSlaves(1),
      imagesSent  => imagesSent,
      imagesTrunc => imagesTrunc,
      imagesDisc  => imagesDisc,
      dataFormat  => dataFormat);

  pgpRxMasters(1) <= AXI_STREAM_MASTER_INIT_C;
  pgpRxCtrl(1)    <= AXI_STREAM_CTRL_INIT_C;

  ------------------------------
  -- SCI Notifications VC2
  ------------------------------         
  LsstSciNoticeEncoder_Inst : entity work.LsstSciNoticeEncoder
    port map (
      sysClk      => sysClk,
      sysRst      => sysRst,
      pgpClk      => pgpClk,
      pgpRst      => sciRst,
      noticeEn    => NoticeEn,
      notice      => Notice,
      mAxisMaster => pgpTxMasters(2),
      mAxisSlave  => pgpTxSlaves(2),
      noticeSent  => noticeSent,
      noticeLast  => noticeLast);
  
  pgpRxMasters(2) <= AXI_STREAM_MASTER_INIT_C;
  pgpRxCtrl(2)    <= AXI_STREAM_CTRL_INIT_C;
  
  ------------------------------
  -- SCI Status Block
  ------------------------------         
  LsstSciStatusBlock_Inst : entity work.LsstSciStatusBlock
    port map (
      StatusClk  => sysClk,
      StatusRst  => StatusRst,
      StatusAddr => StatusAddr,
      StatusReg  => StatusReg,
      PgpClk     => pgpClk,
      PgpRst     => sciRst,
      ImagesSent => imagesSent,
      ImagesTrunc=> imagesTrunc,
      ImagesDisc => imagesDisc,
      DataFormat => dataFormat,
      NoticeSent => noticeSent,
      NoticeLast => noticeLast,
      PgpRxOut   => pgpRxOut,
      PgpTxOut   => pgpTxOut);

  PgpLocLinkReadyOut <= pgpRxOut.linkReady;
  PgpRemLinkReadyOut <= pgpRxOut.remLinkReady;

  ------------------------------
  -- SCI Sync Commands
  ------------------------------         
  SyncCmdEn <= pgpRxOut.opCodeEn;
  SyncCmd   <= pgpRxOut.opCode;

  ------------------------------
  -- Unused VC3
  ------------------------------         
  pgpTxMasters(3) <= AXI_STREAM_MASTER_INIT_C;
  pgpRxCtrl(3)    <= AXI_STREAM_CTRL_UNUSED_C;
      
end LsstSci_axi;
