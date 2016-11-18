--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:36:01 07/07/2015
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/test_ad7490_and_mux/src/TB/tb_test_ad7490_and_mux_top.vhd
-- Project Name:  test_ad7490_and_mux
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ad7490_and_mux_top
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

use work.ad7490_and_mux_top_package.all;

 
ENTITY tb_test_ad7490_and_mux_top IS
END tb_test_ad7490_and_mux_top;
 
ARCHITECTURE behavior OF tb_test_ad7490_and_mux_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ad7490_and_mux_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_multiread : IN  std_logic;
         start_singleread : IN  std_logic;
         adc_and_mux_add : IN  std_logic_vector(7 downto 0);
         miso : IN  std_logic;
         mosi : OUT  std_logic;
         ss : OUT  std_logic;
         sclk : OUT  std_logic;
			link_busy				: out std_logic;
			mux_en	: out std_logic;
         mux_sel : OUT  std_logic_vector(2 downto 0);
         data_out : OUT  array724
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start_multiread : std_logic := '0';
   signal start_singleread : std_logic := '0';
   signal adc_and_mux_add : std_logic_vector(7 downto 0) := (others => '0');
   signal miso : std_logic := '0';

 	--Outputs
   signal mosi : std_logic;
   signal ss : std_logic;
   signal sclk : std_logic;
	signal link_busy				: std_logic;
   signal mux_en : std_logic;
   signal mux_sel : std_logic_vector(2 downto 0);
   signal data_out : array724;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant sclk_period : time := 10 ns;
 
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
	6		=> x"f0f0"
	);
		

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ad7490_and_mux_top PORT MAP (
          clk => clk,
          reset => reset,
          start_multiread => start_multiread,
          start_singleread => start_singleread,
          adc_and_mux_add => adc_and_mux_add,
          miso => miso,
          mosi => mosi,
          ss => ss,
          sclk => sclk,
			 link_busy => link_busy,
          mux_en => mux_en,
          mux_sel => mux_sel,
          data_out => data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
--   sclk_process :process
--   begin
--		sclk <= '0';
--		wait for sclk_period/2;
--		sclk <= '1';
--		wait for sclk_period/2;
--   end process;
-- 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		reset 	<= '0';
		
		wait for 3 us;
		
		start_multiread	<= '1';
		wait for clk_period*2;
		start_multiread	<= '0';
	
for j in 0 to 5 loop	
	wait until falling_edge (ss);
		miso 	<= data_to_miso(j)(0);
	for i in 1 to 15 loop
		wait until falling_edge (sclk);
		wait for 2 ns;
		miso 	<= data_to_miso(j)(i);
	end loop;
end loop;


wait for 3 us;

adc_and_mux_add		<= "01101111";
start_singleread	<= '1';
wait for clk_period*1;
start_singleread	<= '0';
wait for clk_period*1;
adc_and_mux_add		<= x"00";

	wait until rising_edge (ss);

	wait until falling_edge (ss);
		miso 	<= data_to_miso(0)(0);
	for i in 0 to 15 loop
		wait until rising_edge (sclk);
		miso 	<= data_to_miso(0)(i);
	end loop;

		
      wait;
   end process;

END;
