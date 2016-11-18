--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:23:18 04/30/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/test_temp_sens_ad7794/src/TB/tb_ad7794_programmer.vhd
-- Project Name:  test_temp_sens_ad7794
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ad7794_programmer
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
 
ENTITY tb_ad7794_programmer IS
END tb_ad7794_programmer;
 
ARCHITECTURE behavior OF tb_ad7794_programmer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ad7794_programmer
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         read_write : IN  std_logic;
         dout_rdy : IN  std_logic;
         reg_add : IN  std_logic_vector(2 downto 0);
         d_to_slave : IN  std_logic_vector(15 downto 0);
         din : OUT  std_logic;
         cs : OUT  std_logic;
         sclk : OUT  std_logic;
         busy : OUT  std_logic;
         d_from_slave_ready : OUT  std_logic;
         d_from_slave : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start : std_logic := '0';
   signal read_write : std_logic := '0';
   signal dout_rdy : std_logic := '0';
   signal reg_add : std_logic_vector(2 downto 0) := (others => '0');
   signal d_to_slave : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal din : std_logic;
   signal cs : std_logic;
   signal sclk : std_logic;
   signal busy : std_logic;
   signal d_from_slave_ready : std_logic;
   signal d_from_slave : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant sclk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ad7794_programmer PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          read_write => read_write,
          dout_rdy => dout_rdy,
          reg_add => reg_add,
          d_to_slave => d_to_slave,
          din => din,
          cs => cs,
          sclk => sclk,
          busy => busy,
          d_from_slave_ready => d_from_slave_ready,
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
		d_to_slave	<= x"f0f0";
		
		wait for 1 us;
		
		start			<= '1';
		wait for clk_period;
		start			<= '0';
		
		wait for 5 us;
		read_write		<= '1';
		dout_rdy			<= '1';
		reg_add		<= "111";
		
		wait for clk_period;
		start			<= '1';
		wait for clk_period;
		start			<= '0';
		
		wait for 1us;
		dout_rdy			<= '0';
		
		wait for clk_period;
		dout_rdy			<= '1';
      wait;
   end process;

END;
