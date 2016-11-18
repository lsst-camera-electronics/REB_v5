-------------------------------------------------------------------------------
-- Title      : LSST SCI
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : LsstSciPackage.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-11-24
-------------------------------------------------------------------------------
-- Description: This contains the declarations of many of the blocks used
--              in the LSST SCI firmware.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package LsstSciPackage is

   -- Firmware revision number
   -- Version E is what went to the BNL test
   -- Version 12 adds an LSST header to the PGP frame
   -- Version 13 changes the frame size to accomodate a 64 MB image
   -- Version 14 changes the frame size to accomodate a 64 MB image w/ overscan
   -- Version 15 changes to 16 bit data with the lowest two bits truncated
   -- Version 16 adds reset output and chipscope control inputs
   -- Version XX changes the frame size to accomodate 112 MB of image data and
   --            changes the size of the version number to 12 bits
   -- Version 18 Reordering for reset implementation
   -- Version 19 trying to fix 16b truncation (and implement new flags)
   -- Version 1A Version for release
   -- Version 1B Fixed 32bit transfer bugs in DataEncoder and updated to
   --            latest version of PGP (includes VC timeout)
   -- Version 1C Added Data Format to Status Block
   -- Version 1D Recompiled Cores for Kintex7 part
   -- Version 1E Moved to Vivado build system/Changed to LSST from RCM
   -- Version 1F Turned off cell interleaving in K7 PGP core
   -- Version 20 Fixed 16-bit data fifo depth
   -- Version 21 Updated User Reset to use StdLib and moved LsstSci to modules
   --            and removed chipscope cores and interface ports
   -- Version 22 Added new 18-bit packed data format 
  constant LSST_SCI_VERSION : std_logic_vector(11 downto 0) := x"022";

   -- Image Data Format Version
   constant LSST_DATA_UNSPECIFIED     : std_logic_vector(3 downto 0) := x"0";
   constant LSST_DATA_32B_ZERO_EXTEND : std_logic_vector(3 downto 0) := x"1";
   constant LSST_DATA_16B_TRUNC_LOW_2 : std_logic_vector(3 downto 0) := x"2";
   constant LSST_DATA_18B_PACKED      : std_logic_vector(3 downto 0) := x"3";
   
   -- Convenience function for calculating bus widths
   function log2c(n: integer) return integer;
   
--   component RcmSci is
--   generic (
--      -------------------------------------------------------------------------
--      -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
--      -- raft data into the 16 bit PGP pipe.
--      --
--      -- Currently, the choices are:
--      -- ZERO_EXTEND_32: Zero extend the data to 32 bits (halves bandwidth)
--      -- TRUNC_LOW_2   : Truncate the low 2 bits (loses precision)
--      -------------------------------------------------------------------------
--      RAFT_DATA_CONVERSION : string
--   );      
--   port (
--      -------------------------------------------------------------------------
--      -- FPGA Interface
--      -------------------------------------------------------------------------
--      RefClkIn : in std_logic;
--      FpgaRstL    : in std_logic;
--
--      PgpRxP      : in std_logic;
--      PgpRxM      : in std_logic;
--      PgpTxP      : out std_logic;
--      PgpTxM      : out std_logic;
--
--      -------------------------------------------------------------------------
--      -- Clock/Reset Generator Interface
--      -------------------------------------------------------------------------
--      ClkOut : out std_logic;
--      RstOut : out std_logic;
--
--      -------------------------------------------------------------------------
--      -- Debug Interface
--      -------------------------------------------------------------------------
--      PgpLocLinkReadyOut : out std_logic;
--      PgpRemLinkReadyOut : out std_logic;
--      
--      -------------------------------------------------------------------------
--      -- SCI Register Encoder/Decoder Interface
--      -------------------------------------------------------------------------
--      RegClk    :  in std_logic;
--      RegRst    :  in std_logic;
--      RegAddr   : out std_logic_vector(23 downto 0);
--      RegReq    : out std_logic;
--      RegOp     : out std_logic;
--      RegDataWr : out std_logic_vector(31 downto 0);
--      RegWrEn   : out std_logic_vector(31 downto 0);
--      RegAck    :  in std_logic;
--      RegFail   :  in std_logic;
--      RegDataRd :  in std_logic_vector(31 downto 0);
--
--      -------------------------------------------------------------------------
--      -- Data Encoder Interface
--      -------------------------------------------------------------------------
--      DataClk    : in std_logic;
--      DataWrEn   : in std_logic;
--      DataSOT    : in std_logic;
--      DataEOT    : in std_logic;
--      DataIn     : in std_logic_vector(17 downto 0);
--
--      -------------------------------------------------------------------------
--      -- Status Block Interface
--      -------------------------------------------------------------------------
--      StatusClk   :  in std_logic;
--      StatusRst   :  in std_logic;
--      StatusAddr  :  in std_logic_vector(23 downto 0);
--      StatusReg   : out std_logic_vector(31 downto 0);
--
--      -------------------------------------------------------------------------
--      -- Chipscope Control Bus
--      -------------------------------------------------------------------------
--      CScopeControl : inout std_logic_vector(35 downto 0)
--   );
--   end component;
--
--   component RcmSciDataEncoder is
--       generic (
--          ---------------------------------------------------------------------
--          -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
--          -- raft data into the 16 bit PGP pipe.
--          --
--          -- Currently, the choices are:
--          -- ZERO_EXTEND_32: Zero extend the data to 32 bits (halves bandwidth)
--          -- TRUNC_LOW_2   : Truncate the low 2 bits (loses precision)
--          ---------------------------------------------------------------------
--          RAFT_DATA_CONVERSION : string;
--
--          ---------------------------------------------------------------------
--          -- The PGP_FRAME_SIZE is the total size of the PGP frame that is
--          -- sent over the wire.
--          -- 
--          -- With the current configuration of the RCE, this frame is split
--          -- into PGP header and payload. This split is arbitrary and does
--          -- not mark a meaningful boundary in our data stream. If Jim
--          -- specifies the size of the payload, then the frame is
--          -- 32 bytes larger.
--          ---------------------------------------------------------------------
--          PGP_FRAME_SIZE : unsigned(31 downto 0);
--
--          ---------------------------------------------------------------------
--          -- Should we place the Chipscope ILA in this block
--          ---------------------------------------------------------------------
--          USE_CHIPSCOPE : boolean
--       );
--       port (
--          ---------------------------------------------------------------------
--          -- Data Encoder Input Interface
--          ---------------------------------------------------------------------
--          DataClk        : in std_logic;
--          DataWrEn       : in std_logic;
--          DataSOT        : in std_logic;
--          DataEOT        : in std_logic;
--          DataIn         : in std_logic_vector(17 downto 0);
--
--          ---------------------------------------------------------------------
--          -- PGP Frame interface
--          ---------------------------------------------------------------------
--          FrameClk     : in  std_logic;
--          FrameRst     : in  std_logic;
--          FrameTxValid : out std_logic;
--          FrameTxSOF   : out std_logic;
--          FrameTxEOF   : out std_logic;
--          FrameTxEOFE  : out std_logic;
--          FrameTxData  : out std_logic_vector(15 downto 0);
--          FrameTxAFull :  in std_logic;
--
--          ---------------------------------------------------------------------
--          -- Internal Status Interface
--          ---------------------------------------------------------------------
--          PgpStatusRst :  in std_logic;
--          ImagesSent   : out std_logic_vector(31 downto 0);
--          ImagesDisc   : out std_logic_vector(31 downto 0);
--          ImagesTrunc  : out std_logic_vector(31 downto 0);
--          DataFormat   : out std_logic_vector( 3 downto 0);
--
--          ---------------------------------------------------------------------
--          -- Chipscope Control bus
--          ---------------------------------------------------------------------
--          CScopeControl : inout std_logic_vector(35 downto 0)
--      );
--   end component;
--
--   component RcmSciStatusBlock is
--      port (
--         -- Application Logic Signals
--         StatusClk       :  in std_logic;
--         StatusRst       :  in std_logic;
--         StatusAddr      :  in std_logic_vector(23 downto 0);
--         StatusReg       : out std_logic_vector(31 downto 0);
--         
--         -- SCI side signals
--         PgpClk          :  in std_logic;
--         PgpRst          :  in std_logic;
--
--         PgpStatusRst    : out std_logic;
--         ImagesSent      :  in std_logic_vector(31 downto 0);
--         ImagesDisc      :  in std_logic_vector(31 downto 0);
--         ImagesTrunc     :  in std_logic_vector(31 downto 0);
--         DataFormat      :  in std_logic_vector( 3 downto 0);
--         
--         PgpLocLinkReady :  in std_logic;
--         PgpRemLinkReady :  in std_logic;
--         PgpRxCellError  :  in std_logic;
--         PgpRxLinkDown   :  in std_logic;
--         PgpRxLinkError  :  in std_logic;
--   
--         Vc0RxFrame      :  in std_logic;
--         Vc1RxFrame      :  in std_logic;
--         Vc2RxFrame      :  in std_logic;
--         Vc3RxFrame      :  in std_logic;
--   
--         Vc0TxFrame      :  in std_logic;
--         Vc1TxFrame      :  in std_logic;
--         Vc2TxFrame      :  in std_logic;
--         Vc3TxFrame      :  in std_logic;
--   
--         Vc0RemBuffAFull :  in std_logic;
--         Vc0RemBuffFull  :  in std_logic;
--         Vc0FrameTxReady :  in std_logic;
--         Vc1RemBuffAFull :  in std_logic;
--         Vc1RemBuffFull  :  in std_logic;
--         Vc1FrameTxReady :  in std_logic;
--         Vc2RemBuffAFull :  in std_logic;
--         Vc2RemBuffFull  :  in std_logic;
--         Vc2FrameTxReady :  in std_logic;
--         Vc3RemBuffAFull :  in std_logic;
--         Vc3RemBuffFull  :  in std_logic;
--         Vc3FrameTxReady :  in std_logic
--      );
--   
--   end component;
--   
--   
end LsstSciPackage;

package body LsstSciPackage is

   ----------------------------------------------------------------------------
   -- This function calculates the ceiling of the base 2 log of the argument.
   -- It is convenient to use to calculate the width of a bus needed to
   -- encode a given number. For example: a counter which counts up to
   -- CCD_MAX would need to be log2c(CCD_MAX) bits wide.
   ----------------------------------------------------------------------------
   function log2c(n: integer) return integer is
      variable m, p : integer;
   begin
      m := 0;
      p := 1;
      while p < n loop
         m := m + 1;
         p := P * 2;
      end loop;
      return m;
   end log2c;
   
end LsstSciPackage;
