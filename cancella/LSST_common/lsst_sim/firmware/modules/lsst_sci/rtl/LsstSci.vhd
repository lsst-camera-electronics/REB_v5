-------------------------------------------------------------------------------
-- Title      : RCM SCI
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : RcmSci.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-04-29
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

library unisim;
use unisim.vcomponents.all;

entity LsstSci is
  generic (
    -------------------------------------------------------------------------
    -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
    -- raft data into the 16 bit PGP pipe.
    --
    -- Currently, the choices are:
    -- ZERO_EXTEND_32: Zero extend the data to 32 bits (halves bandwidth)
    -- TRUNC_LOW_2   : Truncate the low 2 bits (loses precision)
    -------------------------------------------------------------------------
    RAFT_DATA_CONVERSION : string);
  
  port (
    -------------------------------------------------------------------------
    -- FPGA Interface
    -------------------------------------------------------------------------
    FpgaRstL :  in std_logic;
    
    PgpClkP  :  in std_logic;
    PgpClkM  :  in std_logic;
    PgpRxP   :  in std_logic;
    PgpRxM   :  in std_logic;
    PgpTxP   : out std_logic;
    PgpTxM   : out std_logic;

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
      
end LsstSci;
