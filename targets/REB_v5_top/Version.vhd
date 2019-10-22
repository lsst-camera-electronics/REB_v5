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
  

constant FPGA_VERSION_C : std_logic_vector(31 downto 0) := x"31385006"; -- MAKE_VERSION

constant BUILD_STAMP_C : string := "REB_v5_top: Vivado v2015.3 (x86_64) Built Tue Oct 22 16:20:51 PDT 2019 by srusso";

end Version;

-------------------------------------------------------------------------------
-- Revision History:
-- 00000000 First version (imported from REB v4_6)
-- 302c5001 serial clk pin assigment corrected. Video ADC machine corrected.
--          Jitter cleaner function added
-- 302c5002 synchronous command decoder for senqwuencer start added
-- 30335003 Look at me added, Temp busy and error fixed.
-- 31325004 multiboot remote update added
-- 31345004 new SCI version added and multiboot remote update added
-- 31375005 new SCI version added with a 60 LAM bits port and sync cmd set start address
-- 31375006 new onewire interface
-- 31385006 new SCI with new gtx configuration 
-- 30345005
-- 30345006

-------------------------------------------------------------------------------
