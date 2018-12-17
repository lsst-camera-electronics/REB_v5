--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:31 04/24/2017
-- Design Name:   
-- Module Name:   C:/Users/srusso/Desktop/REB_interrupt/src/tb_REB_interrupt_top.vhd
-- Project Name:  REB_interrupt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: REB_interrupt_top
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
 
ENTITY tb_REB_interrupt_top IS
END tb_REB_interrupt_top;
 
ARCHITECTURE behavior OF tb_REB_interrupt_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT REB_interrupt_top
	 GENERIC (edge_en : std_logic_vector(15 downto 0):= x"0000");
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         interrupt_bus_in : IN  std_logic_vector(15 downto 0);
         mask_bus_in_en : IN  std_logic;
         mask_bus_in : IN  std_logic_vector(15 downto 0);
         mask_bus_out : OUT  std_logic_vector(15 downto 0);
         interrupt_en_out : OUT  std_logic;
         interrupt_bus_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal interrupt_bus_in : std_logic_vector(15 downto 0) := (others => '0');
   signal mask_bus_in_en : std_logic := '0';
   signal mask_bus_in : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal interrupt_en_out : std_logic;
   signal interrupt_bus_out : std_logic_vector(15 downto 0);
	signal mask_bus_out : std_logic_vector(15 downto 0);


   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: REB_interrupt_top 
	GENERIC MAP (edge_en => x"0003")
	PORT MAP (
          clk => clk,
          reset => reset,
          interrupt_bus_in => interrupt_bus_in,
          mask_bus_in_en => mask_bus_in_en,
          mask_bus_in => mask_bus_in,
          mask_bus_out => mask_bus_out,
          interrupt_en_out => interrupt_en_out,
          interrupt_bus_out => interrupt_bus_out
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

wait for 7 ns;

interrupt_bus_in(0) <= '1';
wait for clk_period;
interrupt_bus_in(0) <= '0';

wait for 300 ns;

interrupt_bus_in(1) <= '1';
wait for clk_period*10;
interrupt_bus_in(1) <= '0';

wait for 300 ns;

interrupt_bus_in(2) <= '1';
wait for clk_period*10;
interrupt_bus_in(2) <= '0';

wait for 300 ns;

mask_bus_in_en <= '1';
mask_bus_in <= x"0001";
wait for clk_period;
mask_bus_in_en <= '0';
mask_bus_in <= x"0000";

wait for clk_period*10;

interrupt_bus_in(0) <= '1';
wait for clk_period;
interrupt_bus_in(0) <= '0';


      wait;
   end process;

END;
