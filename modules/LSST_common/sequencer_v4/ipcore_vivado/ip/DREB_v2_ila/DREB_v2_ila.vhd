-------------------------------------------------------------------------------
-- Copyright (c) 2015 Xilinx, Inc.
-- All Rights Reserved
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor     : Xilinx
-- \   \   \/     Version    : 14.4
--  \   \         Application: XILINX CORE Generator
--  /   /         Filename   : DREB_v2_ila.vhd
-- /___/   /\     Timestamp  : Mon Oct 19 17:31:45 CEST 2015
-- \   \  /  \
--  \___\/\___\
--
-- Design Name: VHDL Synthesis Wrapper
-------------------------------------------------------------------------------
-- This wrapper is used to integrate with Project Navigator and PlanAhead

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY DREB_v2_ila IS
  port (
    CONTROL: inout std_logic_vector(35 downto 0);
    CLK: in std_logic;
    TRIG0: in std_logic_vector(95 downto 0);
    TRIG1: in std_logic_vector(95 downto 0));
END DREB_v2_ila;

ARCHITECTURE DREB_v2_ila_a OF DREB_v2_ila IS
BEGIN

END DREB_v2_ila_a;
