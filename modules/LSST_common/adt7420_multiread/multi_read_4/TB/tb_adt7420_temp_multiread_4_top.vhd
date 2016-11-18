--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:39:40 04/19/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/adt7420_temp_multiread/src/multi_read_4/TB/tb_adt7420_temp_multiread_4_top.vhd
-- Project Name:  adt7420_temp_multiread
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: adt7420_temp_multiread_4_top
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
 
ENTITY tb_adt7420_temp_multiread_4_top IS
END tb_adt7420_temp_multiread_4_top;
 
ARCHITECTURE behavior OF tb_adt7420_temp_multiread_4_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT adt7420_temp_multiread_4_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_procedure : IN  std_logic;
         busy : OUT  std_logic;
         error_T1 : OUT  std_logic;
         T1_out : OUT  std_logic_vector(15 downto 0);
         error_T2 : OUT  std_logic;
         T2_out : OUT  std_logic_vector(15 downto 0);
         error_T3 : OUT  std_logic;
         T3_out : OUT  std_logic_vector(15 downto 0);
         error_T4 : OUT  std_logic;
         T4_out : OUT  std_logic_vector(15 downto 0);
         sda : INOUT  std_logic;
         scl : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start_procedure : std_logic := '0';

	--BiDirs
   signal sda : std_logic;
   signal scl : std_logic;

 	--Outputs
   signal busy : std_logic;
   signal error_T1 : std_logic;
   signal T1_out : std_logic_vector(15 downto 0);
   signal error_T2 : std_logic;
   signal T2_out : std_logic_vector(15 downto 0);
   signal error_T3 : std_logic;
   signal T3_out : std_logic_vector(15 downto 0);
   signal error_T4 : std_logic;
   signal T4_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: adt7420_temp_multiread_4_top PORT MAP (
          clk => clk,
          reset => reset,
          start_procedure => start_procedure,
          busy => busy,
          error_T1 => error_T1,
          T1_out => T1_out,
          error_T2 => error_T2,
          T2_out => T2_out,
          error_T3 => error_T3,
          T3_out => T3_out,
          error_T4 => error_T4,
          T4_out => T4_out,
          sda => sda,
          scl => scl
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
		
		 wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		reset		<= '0';
		sda		<= 'H';
		scl		<='H';
		
		wait for 1 us;
		
		start_procedure		<= '1';
		wait for clk_period;
		start_procedure		<= '0';

      wait;
   end process;

END;
