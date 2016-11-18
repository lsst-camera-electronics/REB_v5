-------------------------------------------------------------------------------
-- Title         : Version File
-- Project       : 
-------------------------------------------------------------------------------
-- File          : 
-- Author        : 
-- Created       : 
-------------------------------------------------------------------------------
-- Description:
-- Version Constant Module.
-------------------------------------------------------------------------------
-- Copyright (c) 2010 by SLAC National Accelerator Laboratory. All rights reserved.
-------------------------------------------------------------------------------
-- Modification history:
-- 
-------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

package Version is
-------------------------------------------------------------------------------
-- Version History
-------------------------------------------------------------------------------
  -- 00000001 Initial wgreb attempt
  -- 00000002 Changed MGT clock params for 125MHz ref clock and 3.125 Gbps link
  -- 00000003 Same as version 2 but using PGP channel 1
  -- 00000004 Same as version 2 but using 250MHz RefClk
  -- 00000005 Same as version 4 but using PGP channel 1
  -- 00000006 Same as version 4 but w/ changes to help debug Owen's problems
  -- 00000007 Turned off VC Interleaving in K7 PGP Core (ZX Data Format)
  -- 00000008 Same as version 7 but with truncated data
  -- 00000009 Same as version 8 with fixed FIFO depth (SCI 0x20)
  -- 0000000a Uses LsstSci version 0x21 and new 100MHz beeClk
constant FPGA_VERSION_C : std_logic_vector(31 downto 0) := x"0000000A"; -- MAKE_VERSION

constant BUILD_STAMP_C : string := "wgreb: Vivado v2015.3 (x86_64) Built Tue Nov 10 09:40:58 PST 2015 by jgt";

end Version;

-------------------------------------------------------------------------------
-- Revision History:
-- 
-------------------------------------------------------------------------------
