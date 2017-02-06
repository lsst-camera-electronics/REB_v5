--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:42:21 11/22/2016
-- Design Name:   
-- Module Name:   C:/Users/srusso/Desktop/si5342_jitter_cleaner/src/TB/tb_si5342_jitter_cleaner_top.vhd
-- Project Name:  si5342_jitter_cleaner
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: si5342_jitter_cleaner_top
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
 
ENTITY tb_si5342_jitter_cleaner_top IS
END tb_si5342_jitter_cleaner_top;
 
ARCHITECTURE behavior OF tb_si5342_jitter_cleaner_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT si5342_jitter_cleaner_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_config : IN  std_logic;
			jc_config    : IN std_logic_vector(1 downto 0);
         config_busy : OUT  std_logic;
		   jc_clk_ready : out std_logic;
         miso : IN  std_logic;
         mosi : OUT  std_logic;
         chip_select : OUT  std_logic;
         sclk : OUT  std_logic;
         out_en : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start_config : std_logic := '0';
   signal jc_config : std_logic_vector(1 downto 0) := (others => '0');
   signal miso : std_logic := '0';

 	--Outputs
   signal config_busy : std_logic;
	signal jc_clk_ready : std_logic;
   signal mosi : std_logic;
   signal chip_select : std_logic;
   signal sclk : std_logic;
   signal out_en : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: si5342_jitter_cleaner_top PORT MAP (
          clk => clk,
          reset => reset,
          start_config => start_config,
          jc_config => jc_config,
          config_busy => config_busy,
			 jc_clk_ready => jc_clk_ready,
          miso => miso,
          mosi => mosi,
          chip_select => chip_select,
          sclk => sclk,
          out_en => out_en
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';

      wait for clk_period*10;

-- start power down
start_config <= '1';
jc_config 	 <= "00"; 
wait for 2*clk_period;
start_config <= '0';

wait for 20 us;

---- start power up
--start_config <= '1';
--jc_config 	 <= "01";
--wait for 2*clk_period;
--start_config <= '0';
--
--wait for 20 us;

-- start clock ON 
start_config <= '1';
jc_config 	 <= "01";
wait for 2*clk_period;
start_config <= '0';

wait for 3 ms;

-- start power down
start_config <= '1';
jc_config 	 <= "00"; 
wait for 2*clk_period;
start_config <= '0';


      wait;
   end process;

END;
