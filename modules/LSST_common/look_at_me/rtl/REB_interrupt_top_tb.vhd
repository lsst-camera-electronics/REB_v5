-------------------------------------------------------------------------------
-- Title      : Testbench for design "REB_interrupt_top"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : REB_interrupt_top_tb.vhd
-- Author     : srusso  <srusso@lpnws4225.in2p3.fr>
-- Company    : 
-- Created    : 2019-12-17
-- Last update: 2019-12-17
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-12-17  1.0      srusso	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity REB_interrupt_top_tb is

end entity REB_interrupt_top_tb;

-------------------------------------------------------------------------------

architecture DUT of REB_interrupt_top_tb is

  -- component generics
  constant interrupt_bus_width : integer := 32;

  -- component ports
  signal clk               : std_logic;
  signal reset             : std_logic;
  signal edge_en           : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal interrupt_bus_in  : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal mask_bus_in_en    : std_logic;
  signal mask_bus_in       : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal mask_bus_out      : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal interrupt_en_out  : std_logic;
  signal interrupt_bus_out : std_logic_vector(interrupt_bus_width-1 downto 0);

  -- clock
  signal Clk : std_logic := '1';

begin  -- architecture DUT

  -- component instantiation
  DUT: entity work.REB_interrupt_top
    generic map (
      interrupt_bus_width => interrupt_bus_width)
    port map (
      clk               => clk,
      reset             => reset,
      edge_en           => edge_en,
      interrupt_bus_in  => interrupt_bus_in,
      mask_bus_in_en    => mask_bus_in_en,
      mask_bus_in       => mask_bus_in,
      mask_bus_out      => mask_bus_out,
      interrupt_en_out  => interrupt_en_out,
      interrupt_bus_out => interrupt_bus_out);

  -- clock generation
  Clk <= not Clk after 10 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    wait until Clk = '1';
  end process WaveGen_Proc;

  

end architecture DUT;

-------------------------------------------------------------------------------

configuration REB_interrupt_top_tb_DUT_cfg of REB_interrupt_top_tb is
  for DUT
  end for;
end REB_interrupt_top_tb_DUT_cfg;

-------------------------------------------------------------------------------
