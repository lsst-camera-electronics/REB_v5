-------------------------------------------------------------------------------
-- Title      : Testbench for design "REB_interrupt_top"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : REB_interrupt_top_tb.vhd
-- Author     : srusso  <srusso@lpnws4225.in2p3.fr>
-- Company    : 
-- Created    : 2019-12-17
-- Last update: 2020-01-07
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-12-17  1.0      srusso  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity REB_interrupt_top_tb is

end entity REB_interrupt_top_tb;

-------------------------------------------------------------------------------

architecture DUT of REB_interrupt_top_tb is

  -- component generics
  constant interrupt_bus_width : integer := 2;

  -- component ports
  signal clk               : std_logic                                        := '0';
  signal reset             : std_logic                                        := '1';
  signal edge_en           : std_logic_vector(interrupt_bus_width-1 downto 0) := (others => '0');
  signal interrupt_bus_in  : std_logic_vector(interrupt_bus_width-1 downto 0) := (others => '0');
  signal mask_bus_in_en    : std_logic                                        := '0';
  signal mask_bus_in       : std_logic_vector(interrupt_bus_width-1 downto 0) := (others => '0');
  signal mask_bus_out      : std_logic_vector(interrupt_bus_width-1 downto 0);
  signal interrupt_en_out  : std_logic;
  signal interrupt_bus_out : std_logic_vector(interrupt_bus_width-1 downto 0);

  -- Clock period definitions
  constant clk_period : time := 10 ns;
  

begin  -- architecture DUT

  -- component instantiation
  DUT : entity work.REB_interrupt_top
    generic map (
      interrupt_bus_width => 2)
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

  -- Clock process definitions
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
  end process;

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here

    -- hold reset state for 100 ns.
    wait for 100 ns;

    wait for clk_period*10;

    -- insert stimulus here 

    reset <= '0';
    edge_en <= "01";

    wait for 7 ns;

     interrupt_bus_in(0) <= '1';
    wait for 100 ns;
    interrupt_bus_in(0) <= '0';

    wait for 300 ns;
    interrupt_bus_in(1) <= '1';
    wait for 100 ns;
    interrupt_bus_in(1) <= '0';

    wait for 100 ns;

    mask_bus_in_en <= '1';
    mask_bus_in <= "00";
    wait for 10 ns;
    mask_bus_in_en <= '0';
    

    wait for 300 ns;

    interrupt_bus_in(0) <= '1';
    wait for 100 ns;
    interrupt_bus_in(0) <= '0';

    wait for 300 ns;
    interrupt_bus_in(1) <= '1';
    wait for 100 ns;
    interrupt_bus_in(1) <= '0';

    


    wait;
  end process WaveGen_Proc;

  

end architecture DUT;

-------------------------------------------------------------------------------

configuration REB_interrupt_top_tb_DUT_cfg of REB_interrupt_top_tb is
  for DUT
  end for;
end REB_interrupt_top_tb_DUT_cfg;

-------------------------------------------------------------------------------
