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
  

  constant FPGA_VERSION_C : std_logic_vector(31 downto 0) := x"302c5001"; -- MAKE_VERSION

constant BUILD_STAMP_C : string := "REB_v5_top: Vivado v2015.3 (x86_64) Built Mon Feb  6 13:53:05 PST 2017 by srusso";

end Version;

-------------------------------------------------------------------------------
-- Revision History:
-- 00000000 First version (imported from REB v4_6)
-- 302c5001 serial clk pin assigment corrected. Video ADC machine corrected.
--          Jitter cleaner function added 
-------------------------------------------------------------------------------
