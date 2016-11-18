--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:57:18 12/01/2014
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/test_dual_ad53xx/src/TB/tb_dual_ad53xx_DAC_top.vhd
-- Project Name:  test_dual_ad53xx
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: dual_ad53xx_DAC_top
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
 
ENTITY tb_dual_ad53xx_DAC_top IS
END tb_dual_ad53xx_DAC_top;
 
ARCHITECTURE behavior OF tb_dual_ad53xx_DAC_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT dual_ad53xx_DAC_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_write : IN  std_logic;
         start_ldac : IN  std_logic;
         d_to_slave : IN  std_logic_vector(16 downto 0);
         mosi : OUT  std_logic;
         ss_dac_0 : OUT  std_logic;
         ss_dac_1 : OUT  std_logic;
         sclk : OUT  std_logic;
         ldac : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start_write : std_logic := '0';
   signal start_ldac : std_logic := '0';
   signal d_to_slave : std_logic_vector(16 downto 0) := (others => '0');

 	--Outputs
   signal mosi : std_logic;
   signal ss_dac_0 : std_logic;
   signal ss_dac_1 : std_logic;
   signal sclk : std_logic;
   signal ldac : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: dual_ad53xx_DAC_top PORT MAP (
          clk => clk,
          reset => reset,
          start_write => start_write,
          start_ldac => start_ldac,
          d_to_slave => d_to_slave,
          mosi => mosi,
          ss_dac_0 => ss_dac_0,
          ss_dac_1 => ss_dac_1,
          sclk => sclk,
          ldac => ldac
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

      -- insert stimulus here 

		reset <= '0';
		
		d_to_slave	<= '0' & x"ffff";
		
		wait for 23 ns;
		
		start_write	<= '1';
		wait for 2*clk_period;
		start_write	<= '0';
		
		wait for 2 us;
		
		d_to_slave	<= '1' & x"f00f";
		
		wait for 23 ns;
		
		start_write	<= '1';
		wait for 2*clk_period;
		start_write	<= '0';
		
		wait for 2 us;
		start_ldac	<= '1';
		wait for 2*clk_period;
		start_ldac	<= '0';

		
		

      wait;
   end process;

END;
