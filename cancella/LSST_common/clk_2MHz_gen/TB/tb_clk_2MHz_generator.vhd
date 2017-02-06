--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:48:33 09/27/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/test_clk_2MHz/tb_clk_2MHz_generator.vhd
-- Project Name:  test_clk_2MHz
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: clk_2MHz_generator
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
 
ENTITY tb_clk_2MHz_generator IS
END tb_clk_2MHz_generator;
 
ARCHITECTURE behavior OF tb_clk_2MHz_generator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT clk_2MHz_generator
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         clk_2MHz_en : IN  std_logic;
         clk_2MHz_en_in : IN  std_logic;
         clk_2MHz_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal clk_2MHz_en : std_logic := '0';
   signal clk_2MHz_en_in : std_logic := '0';

 	--Outputs
   signal clk_2MHz_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: clk_2MHz_generator PORT MAP (
          clk => clk,
          reset => reset,
          clk_2MHz_en => clk_2MHz_en,
          clk_2MHz_en_in => clk_2MHz_en_in,
          clk_2MHz_out => clk_2MHz_out
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

      wait for clk_period*10;

      -- insert stimulus here 
		
		
		reset <= '0';
		
		wait for 100 ns;
		clk_2MHz_en		<= '1';
		clk_2MHz_en_in	<= '1';
		wait for 10 ns;
		clk_2MHz_en		<= '0';
		clk_2MHz_en_in	<= '0';
		

      wait;
   end process;

END;
