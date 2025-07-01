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


constant FPGA_VERSION_C : std_logic_vector(31 downto 0) := x"31395012"; -- MAKE_VERSION

constant BUILD_STAMP_C : string := "REB_v5_top_UCDavis: Vivado v2018.3 (x86_64) Built Tue Jul  1 14:31:03 PDT 2025 by jgt";

end Version;

-------------------------------------------------------------------------------
-- Revision History: Cloned from REB_v5_top
-- 31395011 Version with Bias thresholds moved into Generics, but not set differently
-- 31395012 Version that fixes reset to not cause CCS to power down sensors or open bias switch.
-------------------------------------------------------------------------------
