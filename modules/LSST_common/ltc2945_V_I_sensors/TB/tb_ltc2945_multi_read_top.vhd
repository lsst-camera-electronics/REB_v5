--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:03:01 04/18/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/multi_i2c_read/src/tb_ltc2945_multi_read_top.vhd
-- Project Name:  multi_i2c_read
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ltc2945_multi_read_top
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
 
ENTITY tb_ltc2945_multi_read_top IS
END tb_ltc2945_multi_read_top;
 
ARCHITECTURE behavior OF tb_ltc2945_multi_read_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ltc2945_multi_read_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_procedure : IN  std_logic;
         busy : OUT  std_logic;
			error_v6_voltage	: out std_logic;
		v6_voltage_out		: out std_logic_vector(15 downto 0);
		
		error_v6_current	: out std_logic;
		v6_current_out		: out std_logic_vector(15 downto 0);
		
		error_v9_voltage	: out std_logic;
		v9_voltage_out		: out std_logic_vector(15 downto 0);
		
		error_v9_current	: out std_logic;
		v9_current_out		: out std_logic_vector(15 downto 0);
		
		error_v24_voltage	: out std_logic;
		v24_voltage_out	: out std_logic_vector(15 downto 0);
		
		error_v24_current	: out std_logic;
		v24_current_out	: out std_logic_vector(15 downto 0);
		
		error_v40_voltage	: out std_logic;
		v40_voltage_out	: out std_logic_vector(15 downto 0);
		
		error_v40_current	: out std_logic;
		v40_current_out	: out std_logic_vector(15 downto 0);
         sda : INOUT  std_logic;
         scl : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start_procedure : std_logic := '0';

	--BiDirs
   signal sda : std_logic := 'H';
   signal scl : std_logic := 'H';

 	--Outputs
   signal busy : std_logic;
	signal error_v6_voltage	: std_logic;
		signal v6_voltage_out		: std_logic_vector(15 downto 0);
		
		signal error_v6_current	: std_logic;
		signal v6_current_out		: std_logic_vector(15 downto 0);
		
		signal error_v9_voltage	: std_logic;
		signal v9_voltage_out		: std_logic_vector(15 downto 0);
		
		signal error_v9_current	: std_logic;
		signal v9_current_out		: std_logic_vector(15 downto 0);
		
		signal error_v24_voltage	: std_logic;
		signal v24_voltage_out	: std_logic_vector(15 downto 0);
		
		signal error_v24_current	:std_logic;
		signal v24_current_out	: std_logic_vector(15 downto 0);
		
		signal error_v40_voltage	: std_logic;
		signal v40_voltage_out	: std_logic_vector(15 downto 0);
		
		signal error_v40_current	: std_logic;
		signal v40_current_out	: std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ltc2945_multi_read_top PORT MAP (
          clk => clk,
          reset => reset,
          start_procedure => start_procedure,
          busy => busy,
			 error_v6_voltage	=> error_v6_voltage,
		v6_voltage_out		=> v6_voltage_out,
		
		error_v6_current	=> error_v6_current,
		v6_current_out		=> v6_current_out,
		
		error_v9_voltage	=> error_v9_voltage,
		v9_voltage_out		=> v9_voltage_out,
		
		error_v9_current	=> error_v9_current,
		v9_current_out		=> v9_current_out,
		
		error_v24_voltage	=> error_v24_voltage,
		v24_voltage_out	=> v24_voltage_out,
		
		error_v24_current	=> error_v24_current,
		v24_current_out	=> v24_current_out,
		
		error_v40_voltage	=> error_v40_voltage,
		v40_voltage_out	=> v40_voltage_out,
		
		error_v40_current	 => error_v40_current,
		v40_current_out	=> v40_current_out,
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
