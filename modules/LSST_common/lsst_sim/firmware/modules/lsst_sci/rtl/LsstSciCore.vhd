-------------------------------------------------------------------------------
-- Title      : RCM SCI
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : RcmSci.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-05-01
-------------------------------------------------------------------------------
-- Description: This is the wrapper for the various PGP blocks. It
--              connects the reigster slave to VC0 and the Data Encoder
--              to VC1.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use work.Pgp2CoreTypesPkg.all;
use work.VcPkg.all;

entity LsstSciCore is
  generic (
    -------------------------------------------------------------------------
    -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
    -- raft data into the 16 bit PGP pipe.
    --
    -- Currently, the choices are:
    -- ZERO_EXTEND_32: Zero extend the data to 32 bits (halves bandwidth)
    -- TRUNC_LOW_2   : Truncate the low 2 bits (loses precision)
    -------------------------------------------------------------------------
    RAFT_DATA_CONVERSION : string;
    
    -------------------------------------------------------------------------
    -- Device Type
    -------------------------------------------------------------------------
    XIL_DEVICE_G : string);      

  port (
    -------------------------------------------------------------------------
    -- PGP Front End Interface
    -------------------------------------------------------------------------
    PgpClk           :  in std_logic;
    PgpRst           :  in std_logic;
    PgpRxIn          : out PgpRxInType;
    PgpRxOut         :  in PgpRxOutType;
    PgpTxIn          : out PgpTxInType;
    PgpTxOut         :  in PgpTxOutType;
    PgpVcTxQuadIn    : out VcTxQuadInType;
    PgpVcTxQuadOut   :  in VcTxQuadOutType;
    PgpVcRxCommonOut :  in VcRxCommonOutType;
    PgpVcRxQuadOut   :  in VcRxQuadOutType;
    
    -------------------------------------------------------------------------
    -- Clock/Reset Generator Interface
    -------------------------------------------------------------------------
    ClkOut : out std_logic;
    RstOut : out std_logic;
    
    -------------------------------------------------------------------------
    -- Debug Interface
    -------------------------------------------------------------------------
    PgpLocLinkReadyOut : out std_logic;
    PgpRemLinkReadyOut : out std_logic;
    
    -------------------------------------------------------------------------
    -- SCI Register Encoder/Decoder Interface
    -------------------------------------------------------------------------
    RegClk    :  in std_logic;
    RegRst    :  in std_logic;
    RegAddr   : out std_logic_vector(23 downto 0);
    RegReq    : out std_logic;
    RegOp     : out std_logic;
    RegDataWr : out std_logic_vector(31 downto 0);
    RegWrEn   : out std_logic_vector(31 downto 0);
    RegAck    :  in std_logic;
    RegFail   :  in std_logic;
    RegDataRd :  in std_logic_vector(31 downto 0);
    
    -------------------------------------------------------------------------
    -- Data Encoder Interface
    -------------------------------------------------------------------------
    DataClk    : in std_logic;
    DataWrEn   : in std_logic;
    DataSOT    : in std_logic;
    DataEOT    : in std_logic;
    DataIn     : in std_logic_vector(17 downto 0);
    
    -------------------------------------------------------------------------
    -- Status Block Interface
    -------------------------------------------------------------------------
    StatusClk   :  in std_logic;
    StatusRst   :  in std_logic;
    StatusAddr  :  in std_logic_vector(23 downto 0);
    StatusReg   : out std_logic_vector(31 downto 0)
  );
      
end LsstSciCore;

architecture LsstSciCore of LsstSciCore is

   ----------------------------------------------------------------------------
   -- PGP Clock/Reset Generator signals
   ----------------------------------------------------------------------------
   signal intPgpClk : std_logic;
   signal intPgpRst : std_logic;
   
   ----------------------------------------------------------------------------
   -- PGP Protocol Core signals
   ----------------------------------------------------------------------------
   signal intPgpRemData    : std_logic_vector(7 downto 0);
   signal intPgpLocData    : std_logic_vector(7 downto 0);
   signal intPgpRxIn       : PgpRxInType := PGP_RX_IN_INIT_C;
   signal intPgpRxOut      : PgpRxOutType;
   signal intPgpTxIn       : PgpTxInType  := PGP_TX_IN_INIT_C;
   signal intPgpTxOut      : PgpTxOutType;
   signal intVcTxQuadIn    : VcTxQuadInType := VC_TX_QUAD_IN_INIT_C;
   signal intVcTxQuadOut   : VcTxQuadOutType;
   signal intVcRxCommonOut : VcRxCommonOutType;
   signal intVcRxQuadOut   : VcRxQuadOutType;  

   ----------------------------------------------------------------------------
   -- User/Application Logic Reset signals
   ----------------------------------------------------------------------------
   constant REM_DATA_RESET_PATTERN : std_logic_vector(7 downto 0) := x"a5";
   signal reqRstOut    : std_logic;
   signal intRstOut    : std_logic;
   signal intRst       : std_logic;

   ----------------------------------------------------------------------------
   -- Register Encode/Decode Block signals
   ----------------------------------------------------------------------------
   signal regSlaveIn    : VcRegSlaveInType;
   signal regSlaveOut   : VcRegSlaveOutType;
   signal regSlaveClk   : std_logic;
   signal regSlaveRst   : std_logic;

   ----------------------------------------------------------------------------
   -- Data Encoder PGP signals
   ----------------------------------------------------------------------------
   signal encoderFrameTxData  : std_logic_vector(15 downto 0);
   signal encoderFrameTxValid : std_logic;
   signal encoderFrameTxEOFE  : std_logic;
   signal encoderFrameTxEOF   : std_logic;
   signal encoderFrameTxSOF   : std_logic;
   signal encoderFrameTxAFull : std_logic;

   signal encoderVcTxIn : VcTxInType;
   signal encoderVcTxOut : VcTxOutType;
   signal encoderVcRxOut : VcRxOutType;

   signal encoderUsBuffIn : VcUsBuff16InType;
   signal encoderUsBuffOut : VcUsBuff16OutType;

   ----------------------------------------------------------------------------
   -- PGP Status monitor signals
   ----------------------------------------------------------------------------
   signal vc0RxFrame      : std_logic;
   signal vc1RxFrame      : std_logic;
   signal vc2RxFrame      : std_logic;
   signal vc3RxFrame      : std_logic;

   signal vc0TxFrame      : std_logic;
   signal vc1TxFrame      : std_logic;
   signal vc2TxFrame      : std_logic;
   signal vc3TxFrame      : std_logic;

   signal imagesSent      : std_logic_vector(31 downto 0);   
   signal imagesDisc      : std_logic_vector(31 downto 0);   
   signal imagesTrunc     : std_logic_vector(31 downto 0);   
   signal dataFormat      : std_logic_vector( 3 downto 0);

begin

  -----------------------------------------------------------------------------
  -- PGP signals
  -----------------------------------------------------------------------------
  intPgpClk        <= PgpClk;
  intPgpRst        <= PgpRst;
  PgpRxIn          <= intPgpRxIn;      
  intPgpRxOut      <= PgpRxOut;     
  PgpTxIn          <= intPgpTxIn;      
  intPgpTxOut      <= PgpTxOut;     
  PgpVcTxQuadIn    <= intVcTxQuadIn;   
  intVcTxQuadOut   <= PgpVcTxQuadOut;  
  intVcRxCommonOut <= PgpVcRxCommonOut;
  intVcRxQuadOut   <= PgpVcRxQuadOut;  

  intPgpTxIn.locLinkReady <= intPgpRxOut.linkReady;
  intPgpTxIn.locData      <= intPgpLocData;
  intPgpRemData           <= intPgpRxOut.remLinkData;
  
  -----------------------------------------------------------------------------
  -- Debug Signals
  -----------------------------------------------------------------------------
  PgpLocLinkReadyOut <= intPgpTxOut.linkReady;
  PgpRemLinkReadyOut <= intPgpRxOut.remlinkReady;
  
  -----------------------------------------------------------------------------
  -- Clock/Reset
  -----------------------------------------------------------------------------
  RstOut    <= intRstOut;
  ClkOut    <= intPgpClk;

  ----------------------------------------------------------------------------
  -- User Logic Reset
  ----------------------------------------------------------------------------

  -- There are two resets that are generated, one for the SCI and one for
  -- the back end logic which should continue for 4 ticks after the SCI
  -- reset.

  intPgpLocData <= intPgpRemData when intPgpRst = '0' else (others => '0');
  reqRstOut <= '1' when (intPgpRemData = REM_DATA_RESET_PATTERN or intPgpRst = '1') else '0';
  
  U_userReset : entity work.RstSync
    generic map (
      RELEASE_DELAY_G => 8)
    port map (
      clk      => intPgpClk,
      asyncRst => reqRstOut,
      syncRst  => intRstOut);

  U_internalReset : entity work.RstSync
    generic map (
      RELEASE_DELAY_G => 4)
    port map (
      clk      => intPgpClk,
      asyncRst => reqRstOut,
      syncRst  => intRst);
  
  ----------------------------------------------------------------------------
  -- RCM Status Block
  ----------------------------------------------------------------------------
  -- PGP Status monitor signals
  vc0RxFrame <= intVcRxQuadOut(0).valid and intVcRxCommonOut.eof;
  vc1RxFrame <= intVcRxQuadOut(1).valid and intVcRxCommonOut.eof;
  vc2RxFrame <= intVcRxQuadOut(2).valid and intVcRxCommonOut.eof;
  vc3RxFrame <= intVcRxQuadOut(3).valid and intVcRxCommonOut.eof;

  vc0TxFrame <= intVcTxQuadOut(0).ready and intVcTxQuadIn(0).valid and intVcTxQuadIn(0).eof;
  vc1TxFrame <= intVcTxQuadOut(1).ready and intVcTxQuadIn(1).valid and intVcTxQuadIn(1).eof;
  vc2TxFrame <= intVcTxQuadOut(2).ready and intVcTxQuadIn(2).valid and intVcTxQuadIn(2).eof;
  vc3TxFrame <= intVcTxQuadOut(3).ready and intVcTxQuadIn(3).valid and intVcTxQuadIn(3).eof;
  
  U_Status_block : entity work.LsstSciStatusBlock
    port map (
      StatusClk => StatusClk,
      StatusRst => StatusRst,
      StatusAddr => StatusAddr,
      StatusReg => StatusReg,          
      PgpClk => intPgpClk,
      PgpRst => intRst,
      ImagesSent => imagesSent,
      ImagesDisc => imagesDisc,
      ImagesTrunc => imagesTrunc,
      DataFormat => dataFormat,
      PgpLocLinkReady => intPgpTxOut.linkReady,
      PgpRemLinkReady => intPgpRxOut.remLinkReady,
      PgpRxCellError => intPgpRxOut.cellError,
      PgpRxLinkDown => intPgpRxOut.linkDown,
      PgpRxLinkError => intPgpRxOut.linkError,
      Vc0RxFrame => vc0RxFrame,
      Vc1RxFrame => vc1RxFrame,
      Vc2RxFrame => vc2RxFrame,
      Vc3RxFrame => vc3RxFrame,
      Vc0TxFrame => vc0TxFrame,
      Vc1TxFrame => vc1TxFrame,
      Vc2TxFrame => vc2TxFrame,
      Vc3TxFrame => vc3TxFrame,
      Vc0RemBuffAFull => intVcRxQuadOut(0).remBuffAFull,
      Vc0RemBuffFull  => intVcRxQuadOut(0).remBuffFull,
      Vc0FrameTxReady => intVcTxQuadOut(0).ready,
      Vc1RemBuffAFull => intVcRxQuadOut(1).remBuffAFull,
      Vc1RemBuffFull  => intVcRxQuadOut(1).remBuffFull,
      Vc1FrameTxReady => intVcTxQuadOut(1).ready,
      Vc2RemBuffAFull => intVcRxQuadOut(2).remBuffAFull,
      Vc2RemBuffFull  => intVcRxQuadOut(2).remBuffFull,
      Vc2FrameTxReady => intVcTxQuadOut(2).ready,
      Vc3RemBuffAFull => intVcRxQuadOut(3).remBuffAFull,
      Vc3RemBuffFull  => intVcRxQuadOut(3).remBuffFull,
      Vc3FrameTxReady => intVcTxQuadOut(3).ready);
   
  ----------------------------------------------------------------------------
  -- RCM SCI Data Encoder
  ----------------------------------------------------------------------------
  U_Data_encoder : entity work.LsstSciDataEncoder
    generic map (
      RAFT_DATA_CONVERSION => RAFT_DATA_CONVERSION,
      PGP_FRAME_SIZE => x"0001bdcc",   -- 16 bit words
      XIL_DEVICE_G => XIL_DEVICE_G)
    port map (
      DataClk => DataClk,
      DataWrEn => DataWrEn,
      DataSOT => DataSOT,
      DataEOT => DataEOT,
      DataIn => DataIn,
      FrameClk => intPgpClk,
      FrameRst => intRst,
      FrameTxValid => encoderFrameTxValid,
      FrameTxSOF => encoderFrameTxSOF,
      FrameTxEOF => encoderFrameTxEOF,
      FrameTxEOFE => encoderFrameTxEOFE,
      FrameTxData => encoderFrameTxData,
      FrameTxAFull => encoderFrameTxAFull,
      ImagesSent => imagesSent,
      ImagesDisc => imagesDisc,
      ImagesTrunc => imagesTrunc,
      DataFormat => dataFormat);

  encoderUsBuffIn.valid <= encoderFrameTxValid;
  encoderUsBuffIn.sof <= encoderFrameTxSOF;
  encoderUsBuffIn.eof <= encoderFrameTxEOF;
  encoderUsBuffIn.eofe <= encoderFrameTxEOFE;
  encoderUsBuffIn.data <= encoderFrameTxData;
  
  encoderFrameTxAFull <= encoderUsBuffOut.almostFull;
  
  U_PgpDataBuffer : entity work.VcUsBuff16
    generic map (
      XIL_DEVICE_G => XIL_DEVICE_G )
    port map (
      vcTxIn  => intVcTxQuadIn(1),
      vcTxOut => intVcTxQuadOut(1),
      vcRxOut => intVcRxQuadOut(1),
      usBuff16In => encoderUsBuffIn,
      usBuff16Out => encoderUsBuffOut,
      locClk => intPgpClk,
      locRst => intRst,
      vcTxClk => intPgpClk,
      vcTxRst => intPgpRst); 
   
  ----------------------------------------------------------------------------
  -- RCM SCI Register Encode/Decode
  ----------------------------------------------------------------------------
  U_RegControl : entity work.VcRegSlave
    generic map (
      LANE_G => 0,
      XIL_DEVICE_G => XIL_DEVICE_G )
    port map (
      vcRxOut       => intVcRxQuadOut(0),
      vcRxCommonOut => intVcRxCommonOut,
      vcTxIn        => intVcTxQuadIn(0),
      vcTxOut       => intVcTxQuadOut(0),
      regSlaveIn    => regSlaveIn,
      regSlaveOut   => regSlaveOut,
      locClk        => regSlaveClk,
      locRst        => regSlaveRst,
      vcTxClk       => intPgpClk,
      vcTxRst       => intPgpRst,
      vcRxClk       => intPgpClk,
      vcRxRst       => intPgpRst);

  regSlaveClk <= RegClk;
  regSlaveRst <= RegRst;
  
  regSlaveIn.ack <= RegAck;
  regSlaveIn.fail <= RegFail;
  regSlaveIn.rdData <= RegDataRd;
  
  RegReq <= regSlaveOut.req;
  RegOp <= regSlaveOut.op;
  RegDataWr <= regSlaveOut.wrData;
  RegAddr <= regSlaveOut.addr;
  RegWrEn <= x"FFFFFFFF";

  -----------------------------------------------------------------------------

end LsstSciCore;
