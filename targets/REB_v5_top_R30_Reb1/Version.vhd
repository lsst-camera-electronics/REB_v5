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
  

constant FPGA_VERSION_C : std_logic_vector(31 downto 0) := x"31395011"; -- MAKE_VERSION

constant BUILD_STAMP_C : string := "REB_v5_top_R30_Reb1: Vivado v2018.3 (x86_64) Built Wed Apr 30 14:16:49 PDT 2025 by jgt";

end Version;

-------------------------------------------------------------------------------
-- Revision History: Cloned from REB_v5_top
-- 31395011 Version with Bias thresholds moved into Generics, but not set differently
-------------------------------------------------------------------------------
