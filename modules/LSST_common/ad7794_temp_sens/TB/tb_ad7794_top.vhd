--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:08:46 05/02/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/test_temp_sens_ad7794/src/TB/tb_ad7794_top.vhd
-- Project Name:  test_temp_sens_ad7794
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ad7794_top
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
 
ENTITY tb_ad7794_top IS
END tb_ad7794_top;
 
ARCHITECTURE behavior OF tb_ad7794_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ad7794_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         start_reset : IN  std_logic;
         read_write : IN  std_logic;
         ad7794_dout_rdy : IN  std_logic;
         reg_add : IN  std_logic_vector(2 downto 0);
         d_to_slave : IN  std_logic_vector(15 downto 0);
         ad7794_din : OUT  std_logic;
         ad7794_cs : OUT  std_logic;
         ad7794_sclk : OUT  std_logic;
         busy : OUT  std_logic;
         d_from_slave : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start : std_logic := '0';
   signal start_reset : std_logic := '0';
   signal read_write : std_logic := '0';
   signal ad7794_dout_rdy : std_logic := '0';
   signal reg_add : std_logic_vector(2 downto 0) := (others => '0');
   signal d_to_slave : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal ad7794_din : std_logic;
   signal ad7794_cs : std_logic;
   signal ad7794_sclk : std_logic;
   signal busy : std_logic;
   signal d_from_slave : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant ad7794_sclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ad7794_top PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          start_reset => start_reset,
          read_write => read_write,
          ad7794_dout_rdy => ad7794_dout_rdy,
          reg_add => reg_add,
          d_to_slave => d_to_slave,
          ad7794_din => ad7794_din,
          ad7794_cs => ad7794_cs,
          ad7794_sclk => ad7794_sclk,
          busy => busy,
          d_from_slave => d_from_slave
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
		reset 		<= '0';
		reg_add		<= "101";
		d_to_slave	<= x"aa00";
		
		wait for 1 us;
		
		start_reset			<= '1';
		wait for clk_period;
		start_reset			<= '0';
		
		wait for 5 us;
		
		start			<= '1';
		wait for clk_period;
		start			<= '0';
		
		wait for 5 us;
		read_write		<= '1';
		ad7794_dout_rdy			<= '1';
		reg_add		<= "011";
		
		wait for clk_period;
		start			<= '1';
		wait for clk_period;
		start			<= '0';
		
		wait for 1us;
		ad7794_dout_rdy			<= '0';
		
		wait for 100ns;
		ad7794_dout_rdy			<= '1';
		
		wait for 2244ns;
		ad7794_dout_rdy			<= '0';
		
		wait for 100ns;
		ad7794_dout_rdy			<= '1';

      wait;
   end process;

END;
