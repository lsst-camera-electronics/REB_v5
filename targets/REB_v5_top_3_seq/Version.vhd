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
  

constant FPGA_VERSION_C : std_logic_vector(31 downto 0) := x"313A510E"; -- MAKE_VERSION

constant BUILD_STAMP_C : string := "REB_v5_top_3_seq: Vivado v2018.3 (x86_64) Built Thu Jul 21 19:51:50 PDT 2022 by jgt";

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
-- 31375105 new SCI version added with a 60 LAM bits port and sync cmd set start
--          address and 3 sequencers 
-- 30345106 new onewire interface
-- 30345107 look at me various fixes (masked at start and other errors). Now the
-- version shuld be identical to GREB 2007 and following
-- 31395107 new SCI block with A and B link switch
-- 31395108 Changed ADC conversion time from 750ns to 800ns
-- 31395109 Changed ADC conversion time from 750ns to 700ns
-- 3139510B Retured ADC conversion time to 750ns
--          Added STOP Synchronous command 0x30
--          Fixed bug that caused 160ns of 0 on output when
--           entering default state
-- 3139510C Added register START command that specifies MAIN
-- 3139510D Masked sequencer start with sequencer busy to reject triggers
--          when already running.
-- 3139510E Fixed Serial Number Readback
--          Added FPGA_VERSION to UserID in bitfile
--          Fixed zero sensor data for non-zero sensors
-- 313A510E New SCI increasing PGP buffering
-------------------------------------------------------------------------------
