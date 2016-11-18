--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:53:44 04/10/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/sequencer_v22/src/sequencer_v22/func_core_v22/TB/tb_function_v22.vhd
-- Project Name:  sequencer_v22
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: function_v22
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
 
ENTITY tb_function_v22 IS
END tb_function_v22;
 
ARCHITECTURE behavior OF tb_function_v22 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT function_v22
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         start_func : IN  std_logic;
			sequencer_busy		: in  std_logic; 
         time_mem_w_en : IN  std_logic;
         time_mem_in : IN  std_logic_vector(15 downto 0);
         time_mem_w_add : IN  std_logic_vector(7 downto 0);
         time_func_add : IN  std_logic_vector(3 downto 0);
         time_mem_out_2 : OUT  std_logic_vector(15 downto 0);
         out_mem_w_en : IN  std_logic;
         out_mem_in : IN  std_logic_vector(31 downto 0);
         out_mem_w_add : IN  std_logic_vector(7 downto 0);
         out_func_add : IN  std_logic_vector(3 downto 0);
         out_mem_out_2 : OUT  std_logic_vector(31 downto 0);
         end_func : OUT  std_logic;
         signal_out_func : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '1';
   signal clk : std_logic := '0';
   signal start_func : std_logic := '0';
	signal sequencer_busy		: std_logic:= '0'; 
   signal time_mem_w_en : std_logic := '0';
   signal time_mem_in : std_logic_vector(15 downto 0) := (others => '0');
   signal time_mem_w_add : std_logic_vector(7 downto 0) := (others => '0');
   signal time_func_add : std_logic_vector(3 downto 0) := (others => '0');
   signal out_mem_w_en : std_logic := '0';
   signal out_mem_in : std_logic_vector(31 downto 0) := (others => '0');
   signal out_mem_w_add : std_logic_vector(7 downto 0) := (others => '0');
   signal out_func_add : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal time_mem_out_2 : std_logic_vector(15 downto 0);
   signal out_mem_out_2 : std_logic_vector(31 downto 0);
   signal end_func : std_logic;
   signal signal_out_func : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: function_v22 PORT MAP (
          reset => reset,
          clk => clk,
          start_func => start_func,
			 sequencer_busy => sequencer_busy,
          time_mem_w_en => time_mem_w_en,
          time_mem_in => time_mem_in,
          time_mem_w_add => time_mem_w_add,
          time_func_add => time_func_add,
          time_mem_out_2 => time_mem_out_2,
          out_mem_w_en => out_mem_w_en,
          out_mem_in => out_mem_in,
          out_mem_w_add => out_mem_w_add,
          out_func_add => out_func_add,
          out_mem_out_2 => out_mem_out_2,
          end_func => end_func,
          signal_out_func => signal_out_func
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
		
		reset	<= '0';
		
		wait for 200 ns;
		
		time_func_add	<= x"1";
		out_func_add	<= x"1";
		
		-- time slice 0
		wait for clk_period*2;
		out_mem_w_en	<= '1';
		out_mem_w_add	<= x"10";
		out_mem_in 		<= x"1000_0032";
		
		time_mem_w_en	<= '1';
		time_mem_w_add	<= x"10";
		time_mem_in  	<= x"0020";
		wait for 10 ns;
		out_mem_w_en	<= '0';
		out_mem_w_add	<= x"00";
		out_mem_in 		<= x"0000_0000";
		
		time_mem_w_en	<= '0';
		time_mem_w_add	<= x"00";
		time_mem_in  	<= x"0000";
		
		-- time slice 1
		wait for clk_period*2;
		out_mem_w_en	<= '1';
		out_mem_w_add	<= x"11";
		out_mem_in 		<= x"1000_0010";
		
		time_mem_w_en	<= '1';
		time_mem_w_add	<= x"11";
		time_mem_in  	<= x"000a";
		wait for 10 ns;
		out_mem_w_en	<= '0';
		out_mem_w_add	<= x"00";
		out_mem_in 		<= x"0000_0000";
		
		time_mem_w_en	<= '0';
		time_mem_w_add	<= x"00";
		time_mem_in  	<= x"0000";
		
		-- time slice 2
		wait for clk_period*2;
		out_mem_w_en	<= '1';
		out_mem_w_add	<= x"12";
		out_mem_in 		<= x"1000_0001";
		
		time_mem_w_en	<= '1';
		time_mem_w_add	<= x"12";
		time_mem_in  	<= x"0001";
		wait for 10 ns;
		out_mem_w_en	<= '0';
		out_mem_w_add	<= x"00";
		out_mem_in 		<= x"0000_0000";
		
		time_mem_w_en	<= '0';
		time_mem_w_add	<= x"00";
		time_mem_in  	<= x"0000";
		
		
		wait for 100 ns;
		start_func		<='1';
		sequencer_busy	<= '1';
		wait for 10 ns;
		start_func	<= '0';
		

      wait;
   end process;

END;
