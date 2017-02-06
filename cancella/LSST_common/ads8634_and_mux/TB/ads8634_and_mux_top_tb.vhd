-------------------------------------------------------------------------------
-- Title      : Testbench for design "ads8634_and_mux_top"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ads8634_and_mux_top_tb.vhd
-- Author     : Stefano Russo  <srusso@lsst-daq01.slac.stanford.edu>
-- Company    : 
-- Created    : 2016-02-10
-- Last update: 2016-02-11
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2016 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2016-02-10  1.0      srusso	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.ads8634_and_mux_top_package.all;

use work.ads8634_and_mux_top_package.all;

-------------------------------------------------------------------------------

entity ads8634_and_mux_top_tb is

end ads8634_and_mux_top_tb;

-------------------------------------------------------------------------------

architecture bheavior of ads8634_and_mux_top_tb is

  component ads8634_and_mux_top
    port (
      clk                  : in  std_logic;
      reset                : in  std_logic;
      start_multiread      : in  std_logic;
      start_singleread     : in  std_logic;
      start_read_adc_reg   : in  std_logic;
      mux_address_in       : in  std_logic_vector(5 downto 0);
      data_to_adc          : in  std_logic_vector(15 downto 0);
      miso                 : in  std_logic;
      mosi                 : out std_logic;
      ss                   : out std_logic;
      sclk                 : out std_logic;
      link_busy            : out std_logic;
      pwd_line             : out std_logic;
      mux_sam_en_out       : out std_logic;
      mux_bias_en_out      : out std_logic;
      mux_sam_address_out  : out std_logic_vector(2 downto 0);
      mux_bias_address_out : out std_logic_vector(2 downto 0);
      data_out             : out array716);
  end component;

  -- component ports
--  signal clk                  : std_logic;
  signal reset                : std_logic := '1';
  signal start_multiread      : std_logic := '0';
  signal start_singleread     : std_logic := '0';
  signal start_read_adc_reg   : std_logic := '0';
  signal mux_address_in       : std_logic_vector(5 downto 0) := (others => '0');
  signal data_to_adc          : std_logic_vector(15 downto 0) := (others => '0');
  signal miso                 : std_logic := '0';
  signal mosi                 : std_logic;
  signal ss                   : std_logic;
  signal sclk                 : std_logic;
  signal link_busy            : std_logic;
  signal pwd_line             : std_logic;
  signal mux_sam_en_out       : std_logic;
  signal mux_bias_en_out      : std_logic;
  signal mux_sam_address_out  : std_logic_vector(2 downto 0);
  signal mux_bias_address_out : std_logic_vector(2 downto 0);
  signal data_out             : array716;

  -- clock
  signal Clk : std_logic := '1';
  constant clk_period : time := 10 ns;


	-- data to send over miso
--	type data_typ is array (natural range <>) of std_logic_vector(15 downto 0);
	type data_typ is array (natural range <>) of std_logic_vector(0 to 15);
	constant data_to_miso : data_typ := (
	0		=> x"2769",
	1		=> x"0011",
	2		=> x"1100",
	3		=> x"f0f0",
	4		=> x"0011",
	5		=> x"1100",
	6		=> x"f0f0",
	7		=> x"1100",
	8		=> x"f0f0"
	);
		



begin  -- ads8634_and_muxtop_tb

  -- component instantiation
  DUT: ads8634_and_mux_top
    port map (
      clk                  => clk,
      reset                => reset,
      start_multiread      => start_multiread,
      start_singleread     => start_singleread,
      start_read_adc_reg   => start_read_adc_reg,
      mux_address_in       => mux_address_in,
      data_to_adc          => data_to_adc,
      miso                 => miso,
      mosi                 => mosi,
      ss                   => ss,
      sclk                 => sclk,
      link_busy            => link_busy,
      pwd_line             => pwd_line,
      mux_sam_en_out       => mux_sam_en_out,
      mux_bias_en_out      => mux_bias_en_out,
      mux_sam_address_out  => mux_sam_address_out,
      mux_bias_address_out => mux_bias_address_out,
      data_out             => data_out);

  -- clock generation
--  Clk <= not Clk after 10 ns;

clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

--    wait until Clk = '1';
	 
	    -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		reset 	<= '0';
		
--		wait for 3 us;
		
		start_multiread	<= '1';
		wait for clk_period*2;
		start_multiread	<= '0';
	
for j in 0 to 7 loop	
	wait until falling_edge (ss);
		miso 	<= data_to_miso(j)(0);
	for i in 1 to 15 loop
		wait until falling_edge (sclk);
		wait for 2 ns;
		miso 	<= data_to_miso(j)(i);
	end loop;
end loop;


wait for 20 us;

mux_address_in	<= "111000";
data_to_adc    <= x"8f01";
start_singleread	<= '1';
--wait for clk_period*1;
wait for 10 ns;
start_singleread	<= '0';


wait for 20 us;
data_to_adc    <= x"af01";
start_read_adc_reg	<= '1';
--wait for clk_period*1;
wait for 10 ns;
start_read_adc_reg	<= '0';


--
--adc_and_mux_add		<= "01101111";
--start_singleread	<= '1';
----wait for clk_period*1;
--wait for 10 ns;
--start_singleread	<= '0';
----wait for clk_period*1;
--wait for 10 ns;
--adc_and_mux_add		<= x"00";
--
--	wait until rising_edge (ss);
--
--	wait until falling_edge (ss);
--		miso 	<= data_to_miso(0)(0);
--	for i in 0 to 15 loop
--		wait until rising_edge (sclk);
--		miso 	<= data_to_miso(0)(i);
--	end loop;
--
--	
--	 
	 wait;
	 
  end process WaveGen_Proc;

  

end bheavior;

