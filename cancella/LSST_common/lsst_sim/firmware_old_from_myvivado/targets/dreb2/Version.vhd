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

  -- 00000001 Initial dreb2 attempt
  -- 00000002 Update to LsstSci version 0x21 and new 100MHz beeClk
constant FPGA_VERSION_C : std_logic_vector(31 downto 0) := x"00000002"; -- MAKE_VERSION

constant BUILD_STAMP_C : string := "dreb2: Vivado v2014.4 (x86_64) Built Fri May  1 14:44:20 PDT 2015 by jgt";

end Version;

-------------------------------------------------------------------------------
-- Revision History:
-- 
-------------------------------------------------------------------------------
