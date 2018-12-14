library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.Pgp2bPkg.all;
use work.LsstSciPackage.all;

entity LsstSciStatusBlock is
  port (
    -- Application Logic Signals
    StatusClk   :  in std_logic;
    StatusRst   :  in std_logic;
    StatusAddr  :  in std_logic_vector(23 downto 0);
    StatusReg   : out std_logic_vector(31 downto 0);
    
    -- SCI side signals
    PgpRxClk      :  in std_logic;
    PgpRxRst      :  in std_logic;
    PgpTxClk      :  in std_logic;
    PgpTxRst      :  in std_logic;

    ImageStatus : in LsstSciImageStatusArray(2 downto 0);

    NoticeSent  :  in std_logic;
    NoticeLast  :  in std_logic_vector(63 downto 0);
    
    PgpRxOut    :  in Pgp2bRxOutType;
    PgpTxOut    :  in Pgp2bTxOutType);
  
end LsstSciStatusBlock;

architecture LsstSciStatusBlock of LsstSciStatusBlock is
  constant TPD_G : time := 1 ns;

  type RxStatusType is record
     pgpRxOut          : Pgp2bRxOutType;
     frameCount        : std_logic_vector(31 downto 0);
     frameErrCount     : std_logic_vector(31 downto 0);
     cellErrCount      : std_logic_vector(31 downto 0);
     linkDownCount     : std_logic_vector(31 downto 0);
     linkErrCount      : std_logic_vector(31 downto 0);
     remOverflow0Count : std_logic_vector(31 downto 0);
     remOverflow1Count : std_logic_vector(31 downto 0);
     remOverflow2Count : std_logic_vector(31 downto 0);
     remOverflow3Count : std_logic_vector(31 downto 0);
     opCodeCount       : std_logic_vector(31 downto 0);
     opCodeLast        : std_logic_vector( 7 downto 0);
     remLinkData       : std_logic_vector( 7 downto 0);
  end record RxStatusType;

  
  constant RX_STATUS_INIT_C : RxStatusType := (
     pgpRxOut => PGP2B_RX_OUT_INIT_C,
     frameCount        => (others => '0'),
     frameErrCount     => (others => '0'),
     cellErrCount      => (others => '0'),
     linkDownCount     => (others => '0'),
     linkErrCount      => (others => '0'),
     remOverflow0Count => (others => '0'),
     remOverflow1Count => (others => '0'),
     remOverflow2Count => (others => '0'),
     remOverflow3Count => (others => '0'),
     opCodeCount       => (others => '0'),
     opCodeLast        => (others => '0'),
     remLinkData       => (others => '0'));
     
  type TxStatusType is record
     pgpTxOut       : Pgp2bTxOutType;
     noticeLast     : std_logic_vector(63 downto 0);
     noticeCount    : std_logic_vector(31 downto 0);
     sent0Count     : std_logic_vector(31 downto 0);
     trunc0Count    : std_logic_vector(31 downto 0);
     disc0Count     : std_logic_vector(31 downto 0);
     sent1Count     : std_logic_vector(31 downto 0);
     trunc1Count    : std_logic_vector(31 downto 0);
     disc1Count     : std_logic_vector(31 downto 0);
     sent2Count     : std_logic_vector(31 downto 0);
     trunc2Count    : std_logic_vector(31 downto 0);
     disc2Count     : std_logic_vector(31 downto 0);
     overflow0Count : std_logic_vector(31 downto 0);
     overflow1Count : std_logic_vector(31 downto 0);
     overflow2Count : std_logic_vector(31 downto 0);
     overflow3Count : std_logic_vector(31 downto 0);
     frameCount     : std_logic_vector(31 downto 0);
     frameErrCount  : std_logic_vector(31 downto 0);
  end record TxStatusType;

  constant TX_STATUS_INIT_C : TxStatusType := (
     pgpTxOut       => PGP2B_TX_OUT_INIT_C,
     noticeLast     => (others => '0'),
     noticeCount    => (others => '0'),
     sent0Count     => (others => '0'),
     trunc0Count    => (others => '0'),
     disc0Count     => (others => '0'),
     sent1Count     => (others => '0'),
     trunc1Count    => (others => '0'),
     disc1Count     => (others => '0'),
     sent2Count     => (others => '0'),
     trunc2Count    => (others => '0'),
     disc2Count     => (others => '0'),
     overflow0Count => (others => '0'),
     overflow1Count => (others => '0'),
     overflow2Count => (others => '0'),
     overflow3Count => (others => '0'),
     frameCount     => (others => '0'),
     frameErrCount  => (others => '0'));
     
  
  -- Status Block Address Map
  constant VERSION_ADDR       : std_logic_vector(23 downto 0) := x"000000";

  constant LNKSTAT_ADDR       : std_logic_vector(23 downto 0) := x"000001";
  constant REM_DATA_ADDR      : std_logic_vector(23 downto 0) := x"000002";
  constant CERR_CNT_ADDR      : std_logic_vector(23 downto 0) := x"000003";
  constant LDWN_CNT_ADDR      : std_logic_vector(23 downto 0) := x"000004";
  constant LERR_CNT_ADDR      : std_logic_vector(23 downto 0) := x"000005";
  constant REM_OFLOW_VC0_ADDR : std_logic_vector(23 downto 0) := x"000006";
  constant REM_OFLOW_VC1_ADDR : std_logic_vector(23 downto 0) := x"000007";
  constant REM_OFLOW_VC2_ADDR : std_logic_vector(23 downto 0) := x"000008";
  constant REM_OFLOW_VC3_ADDR : std_logic_vector(23 downto 0) := x"000009";
  constant REM_PAUSE_VC0_ADDR : std_logic_vector(23 downto 0) := x"00000A"; 
  constant REM_PAUSE_VC1_ADDR : std_logic_vector(23 downto 0) := x"00000B";
  constant REM_PAUSE_VC2_ADDR : std_logic_vector(23 downto 0) := x"00000C";
  constant REM_PAUSE_VC3_ADDR : std_logic_vector(23 downto 0) := x"00000D";
  constant RX_ERR_CNT_ADDR    : std_logic_vector(23 downto 0) := x"00000E";
  constant RX_CNT_ADDR        : std_logic_vector(23 downto 0) := x"00000F";
  constant LOC_OFLOW_VC0_ADDR : std_logic_vector(23 downto 0) := x"000010";
  constant LOC_OFLOW_VC1_ADDR : std_logic_vector(23 downto 0) := x"000011";
  constant LOC_OFLOW_VC2_ADDR : std_logic_vector(23 downto 0) := x"000012";
  constant LOC_OFLOW_VC3_ADDR : std_logic_vector(23 downto 0) := x"000013";
  constant LOC_PAUSE_VC0_ADDR : std_logic_vector(23 downto 0) := x"000014"; 
  constant LOC_PAUSE_VC1_ADDR : std_logic_vector(23 downto 0) := x"000015";
  constant LOC_PAUSE_VC2_ADDR : std_logic_vector(23 downto 0) := x"000016";
  constant LOC_PAUSE_VC3_ADDR : std_logic_vector(23 downto 0) := x"000017";
  constant TX_ERR_CNT_ADDR    : std_logic_vector(23 downto 0) := x"000018";
  constant TX_CNT_ADDR        : std_logic_vector(23 downto 0) := x"000019";

  constant OPCODE_CNT_ADDR    : std_logic_vector(23 downto 0) := x"000020";
  constant OPCODE_LAST_ADDR   : std_logic_vector(23 downto 0) := x"000021";
  constant NOTICE_CNT_ADDR    : std_logic_vector(23 downto 0) := x"000022";
  constant NOTICE_LAST_ADDR_0 : std_logic_vector(23 downto 0) := x"000023";
  constant NOTICE_LAST_ADDR_1 : std_logic_vector(23 downto 0) := x"000024";

  constant IMAGE_SENT0_ADDR   : std_logic_vector(23 downto 0) := x"000030";
  constant IMAGE_DISC0_ADDR   : std_logic_vector(23 downto 0) := x"000031";
  constant IMAGE_TRUNC0_ADDR  : std_logic_vector(23 downto 0) := x"000032";
  constant IMAGE_FORMAT0_ADDR : std_logic_vector(23 downto 0) := x"000033";

  constant IMAGE_SENT1_ADDR   : std_logic_vector(23 downto 0) := x"000040";
  constant IMAGE_DISC1_ADDR   : std_logic_vector(23 downto 0) := x"000041";
  constant IMAGE_TRUNC1_ADDR  : std_logic_vector(23 downto 0) := x"000042";
  constant IMAGE_FORMAT1_ADDR : std_logic_vector(23 downto 0) := x"000043";

  constant IMAGE_SENT2_ADDR   : std_logic_vector(23 downto 0) := x"000050";
  constant IMAGE_DISC2_ADDR   : std_logic_vector(23 downto 0) := x"000051";
  constant IMAGE_TRUNC2_ADDR  : std_logic_vector(23 downto 0) := x"000052";
  constant IMAGE_FORMAT2_ADDR : std_logic_vector(23 downto 0) := x"000053";

  
  signal rxSync   : RxStatusType := RX_STATUS_INIT_C;
  signal txSync   : TxStatusType := TX_STATUS_INIT_C;
  signal rxSyncIn : RxStatusType;
  signal txSyncIn : TxStatusType;

  signal pgpRxStatus : std_logic_vector(18 downto 0);
  signal pgpTxStatus : std_logic_vector(21 downto 0);

  signal pgpRxStatusCntOut : SlVectorArray(18 downto 0, 31 downto 0);
  signal pgpTxStatusCntOut : SlVectorArray(21 downto 0, 31 downto 0);
  
begin

   RxOpCodeSync : entity work.SynchronizerFifo
      generic map (
         DATA_WIDTH_G => 8,
         ADDR_WIDTH_G => 2,
         INIT_G       => "0")
      port map (
         rst    => StatusRst,
         wr_clk => pgpRxClk,
         wr_en  => pgpRxOut.opCodeEn,
         din    => pgpRxOut.opCode,
         rd_clk => StatusClk,
         rd_en  => '1',
         dout   => rxSyncIn.opCodeLast);

   RxDataSync : entity work.SynchronizerFifo
      generic map (
         DATA_WIDTH_G => 8,
         ADDR_WIDTH_G => 2,
         INIT_G       => "0")
      port map (
         rst    => StatusRst,
         wr_clk => pgpRxClk,
         wr_en  => '1',
         din    => pgpRxOut.remLinkData,
         rd_clk => StatusClk,
         rd_en  => '1',
         valid  => open,
         dout   => rxSyncIn.remLinkData);

   RxStatusSync : entity work.SyncStatusVector
      generic map (
         SYNTH_CNT_G => "1111110000111100000",
         CNT_RST_EDGE_G => false,
         CNT_WIDTH_G => 32,
         WIDTH_G => 19)
      port map (
         statusIn(0)             => pgpRxOut.phyRxReady,
         statusIn(1)             => pgpRxOut.linkReady,
         statusIn(3  downto 2)   => pgpRxOut.linkPolarity,
         statusIn(4)             => pgpRxOut.remLinkReady,
         statusIn(8  downto 5)   => pgpRxOut.remOverflow,
         statusIn(12 downto 9)   => pgpRxOut.remPause,
         statusIn(13)            => pgpRxOut.cellError,
         statusIn(14)            => pgpRxOut.linkDown,
         statusIn(15)            => pgpRxOut.linkError,
         statusIn(16)            => pgpRxOut.frameRxErr,
         statusIn(17)            => pgpRxOut.opCodeEn,
         statusIn(18)            => pgpRxOut.frameRx,
         statusOut               => pgpRxStatus,
         cntRstIn                => StatusRst,
         rollOverEnIn            => (others => '0'),
         cntOut                  => pgpRxStatusCntOut,
         wrClk                   => PgpRxClk,
         wrRst                   => PgpRxRst,
         rdClk                   => StatusClk,
         rdRst                   => StatusRst);

   rxSyncIn.pgpRxOut.phyRxReady   <= pgpRxStatus(0);
   rxSyncIn.pgpRxOut.linkReady    <= pgpRxStatus(1);
   rxSyncIn.pgpRxOut.linkPolarity <= pgpRxStatus(3 downto 2);
   rxSyncIn.pgpRxOut.remLinkReady <= pgpRxStatus(4);
   rxSyncIn.pgpRxOut.remOverflow  <= pgpRxStatus(8 downto 5);
   rxSyncIn.pgpRxOut.remPause     <= pgpRxStatus(12 downto 9);
   rxSyncIn.pgpRxOut.cellError    <= pgpRxStatus(13);
   rxSyncIn.pgpRxOut.linkDown     <= pgpRxStatus(14);
   rxSyncIn.pgpRxOut.linkError    <= pgpRxStatus(15);
   rxSyncIn.pgpRxOut.frameRxErr   <= pgpRxStatus(16);
   rxSyncIn.pgpRxOut.opCodeEn     <= pgpRxStatus(17);
   rxSyncIn.pgpRxOut.frameRx      <= pgpRxStatus(18);

   rxSyncIn.frameCount        <= muxSlVectorArray(pgpRxStatusCntOut,18);
   rxSyncIn.frameErrCount     <= muxSlVectorArray(pgpRxStatusCntOut,16);
   rxSyncIn.cellErrCount      <= muxSlVectorArray(pgpRxStatusCntOut,13);
   rxSyncIn.linkDownCount     <= muxSlVectorArray(pgpRxStatusCntOut,14);
   rxSyncIn.linkErrCount      <= muxSlVectorArray(pgpRxStatusCntOut,15);
   rxSyncIn.remOverflow0Count <= muxSlVectorArray(pgpRxStatusCntOut,5);
   rxSyncIn.remOverflow1Count <= muxSlVectorArray(pgpRxStatusCntOut,6);
   rxSyncIn.remOverflow2Count <= muxSlVectorArray(pgpRxStatusCntOut,7);
   rxSyncIn.remOverflow3Count <= muxSlVectorArray(pgpRxStatusCntOut,8);
   rxSyncIn.opCodeCount       <= muxSlVectorArray(pgpRxStatusCntOut,17);
   

   TxNoticeSync : entity work.SynchronizerFifo
      generic map (
         DATA_WIDTH_G  => 64,
         ADDR_WIDTH_G  => 2,
         INIT_G        => "0"
      ) port map (
         rst           => StatusRst,
         wr_clk        => PgpTxClk,
         wr_en         => NoticeSent,
         din           => NoticeLast,
         rd_clk        => StatusClk,
         rd_en         => '1',
         valid         => open,
         dout          => txSyncIn.noticeLast
      );


   TxStatusSync : entity work.SyncStatusVector
      generic map (
         SYNTH_CNT_G => "1111111111110000111100",
         CNT_RST_EDGE_G => false,
         CNT_WIDTH_G => 32,
         WIDTH_G => 22)
      port map (
         statusIn(0)            => pgpTxOut.phyTxReady,
         statusIn(1)            => pgpTxOut.linkReady,
         statusIn(5 downto 2)   => pgpTxOut.locOverflow,
         statusIn(9 downto 6)   => pgpTxOut.locPause,
         statusIn(10)           => pgpTxOut.frameTxErr,
         statusIn(11)           => NoticeSent,
         statusIn(12)           => pgpTxOut.frameTx,
         statusIn(13)           => ImageStatus(0).sent,
         statusIn(14)           => ImageStatus(0).trunc,
         statusIn(15)           => ImageStatus(0).disc,
         statusIn(16)           => ImageStatus(1).sent,
         statusIn(17)           => ImageStatus(1).trunc,
         statusIn(18)           => ImageStatus(1).disc,
         statusIn(19)           => ImageStatus(2).sent,
         statusIn(20)           => ImageStatus(2).trunc,
         statusIn(21)           => ImageStatus(2).disc,
         statusOut              => pgpTxStatus,
         cntRstIn               => StatusRst,
         cntOut                 => pgpTxStatusCntOut,
         wrClk                  => PgpTxClk,
         wrRst                  => PgpTxRst,
         rdClk                  => StatusClk,
         rdRst                  => StatusRst);

   txSyncIn.pgpTxOut.locOverflow <= pgpTxStatus(5 downto 2);
   txSyncIn.pgpTxOut.locPause    <= pgpTxStatus(9 downto 6);
   txSyncIn.pgpTxOut.phyTxReady  <= pgpTxStatus(0);
   txSyncIn.pgpTxOut.linkReady   <= pgpTxStatus(1);

   txSyncIn.noticeCount    <= muxSlVectorArray(pgpTxStatusCntOut,11);
   txSyncIn.sent0Count     <= muxSlVectorArray(pgpTxStatusCntOut,13);
   txSyncIn.trunc0Count    <= muxSlVectorArray(pgpTxStatusCntOut,14);
   txSyncIn.disc0Count     <= muxSlVectorArray(pgpTxStatusCntOut,15);
   txSyncIn.sent1Count     <= muxSlVectorArray(pgpTxStatusCntOut,16);
   txSyncIn.trunc1Count    <= muxSlVectorArray(pgpTxStatusCntOut,17);
   txSyncIn.disc1Count     <= muxSlVectorArray(pgpTxStatusCntOut,18);
   txSyncIn.sent2Count     <= muxSlVectorArray(pgpTxStatusCntOut,19);
   txSyncIn.trunc2Count    <= muxSlVectorArray(pgpTxStatusCntOut,20);
   txSyncIn.disc2Count     <= muxSlVectorArray(pgpTxStatusCntOut,21);
   txSyncIn.overflow0Count <= muxSlVectorArray(pgpTxStatusCntOut,2);
   txSyncIn.overflow1Count <= muxSlVectorArray(pgpTxStatusCntOut,3);
   txSyncIn.overflow2Count <= muxSlVectorArray(pgpTxStatusCntOut,4);
   txSyncIn.overflow3Count <= muxSlVectorArray(pgpTxStatusCntOut,5);
   txSyncIn.frameCount     <= muxSlVectorArray(pgpTxStatusCntOut,12);
   txSyncIn.frameErrCount  <= muxSlVectorArray(pgpTxStatusCntOut,10);


   process (StatusClk) is
   begin
      if(rising_edge(StatusClk)) then
         txSync <= txSyncIn;
         rxSync <= rxSyncIn;
      end if;
   end process;
   
   process (StatusRst, StatusAddr, rxSync, txSync) is
   begin
      case StatusAddr is
         when VERSION_ADDR => 
            StatusReg(31 downto 8) <= (others => '0');
            StatusReg( 7 downto 0) <= LSST_SCI_VERSION;
         -- These Registers are the same as the RCE PGP registers
         when LNKSTAT_ADDR =>
            StatusReg <= "0000"
                         & txSync.pgpTxOut.locOverflow
                         & rxSync.pgpRxOut.remOverflow
                         & txSync.pgpTxOut.locPause
                         & rxSync.pgpRxOut.remPause
                         & "00"
                         & rxSync.pgpRxOut.linkPolarity
                         & "000"
                         & txSync.pgpTxOut.linkReady
                         & rxSync.pgpRxOut.remLinkReady
                         & rxSync.pgpRxOut.linkReady
                         & txSync.pgpTxOut.phyTxReady
                         & rxSync.pgpRxOut.phyRxReady;
         when REM_DATA_ADDR =>
            StatusReg <= x"000000" & rxSync.pgpRxOut.remLinkData;
         when CERR_CNT_ADDR =>
            StatusReg <= rxSync.cellErrCount;
         when LDWN_CNT_ADDR =>
            StatusReg <= rxSync.linkDownCount;
         when LERR_CNT_ADDR =>
            StatusReg <= rxSync.linkErrCount;
         when REM_OFLOW_VC0_ADDR =>
            StatusReg <= rxSync.remOverflow0Count;
         when REM_OFLOW_VC1_ADDR =>
            StatusReg <= rxSync.remOverflow1Count;
         when REM_OFLOW_VC2_ADDR =>
            StatusReg <= rxSync.remOverflow2Count;
         when REM_OFLOW_VC3_ADDR =>
            StatusReg <= rxSync.remOverflow3Count;
         when RX_ERR_CNT_ADDR =>
            StatusReg <= rxSync.frameErrCount;
         when RX_CNT_ADDR =>
            StatusReg <= rxSync.frameCount;
         when LOC_OFLOW_VC0_ADDR =>
            StatusReg <= txSync.overflow0Count;
         when LOC_OFLOW_VC1_ADDR =>
            StatusReg <= txSync.overflow1Count;
         when LOC_OFLOW_VC2_ADDR =>
            StatusReg <= txSync.overflow2Count;
         when LOC_OFLOW_VC3_ADDR =>
            StatusReg <= txSync.overflow3Count;
         when TX_ERR_CNT_ADDR =>
            StatusReg <= txSync.frameErrCount;
         when TX_CNT_ADDR =>
            StatusReg <= txSync.frameCount;

         when IMAGE_SENT0_ADDR =>
            StatusReg <= txSync.sent0Count;
         when IMAGE_DISC0_ADDR =>
            StatusReg <= txSync.disc0Count;
         when IMAGE_TRUNC0_ADDR =>
            StatusReg <= txSync.trunc0Count;
         when IMAGE_FORMAT0_ADDR =>
            StatusReg <= x"0000000" & ImageStatus(0).format;

         when IMAGE_SENT1_ADDR =>
            StatusReg <= txSync.sent1Count;
         when IMAGE_DISC1_ADDR =>
            StatusReg <= txSync.disc1Count;
         when IMAGE_TRUNC1_ADDR =>
            StatusReg <= txSync.trunc1Count;
         when IMAGE_FORMAT1_ADDR =>
            StatusReg <= x"0000000" & ImageStatus(1).format;

         when IMAGE_SENT2_ADDR =>
            StatusReg <= txSync.sent2Count;
         when IMAGE_DISC2_ADDR =>
            StatusReg <= txSync.disc2Count;
         when IMAGE_TRUNC2_ADDR =>
            StatusReg <= txSync.trunc2Count;
         when IMAGE_FORMAT2_ADDR =>
            StatusReg <= x"0000000" & ImageStatus(2).format;
            
         when OPCODE_CNT_ADDR =>
            StatusReg <= rxSync.opCodeCount;
         when OPCODE_LAST_ADDR =>
            StatusReg <= x"000000" & rxSync.opCodeLast;

         when NOTICE_CNT_ADDR =>
            StatusReg <= txSync.noticeCount;
         when NOTICE_LAST_ADDR_0 =>
            StatusReg <= txSync.noticeLast(31 downto  0);
         when NOTICE_LAST_ADDR_1 =>
            StatusReg <= txSync.noticeLast(63 downto 32);

         when others =>
            StatusReg <= (others => '0');
      end case;
   end process;
      
   
end LsstSciStatusBlock;
