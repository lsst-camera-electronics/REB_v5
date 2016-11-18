--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:24:01 09/23/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/test_sequencer_aligner_shifter/src/tb_sequencer_aligner_shifter_top.vhd
-- Project Name:  test_sequencer_aligner_shifter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sequencer_aligner_shifter_top
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
 
ENTITY tb_sequencer_aligner_shifter_top IS
END tb_sequencer_aligner_shifter_top;
 
ARCHITECTURE behavior OF tb_sequencer_aligner_shifter_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sequencer_aligner_shifter_top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         shift_on_en : IN  std_logic;
         shift_on : IN  std_logic;
         init_shift : IN  std_logic;
         sequencer_in : IN  std_logic_vector(31 downto 0);
         sequencer_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal shift_on_en : std_logic := '0';
   signal shift_on : std_logic := '0';
   signal init_shift : std_logic := '0';
   signal sequencer_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal sequencer_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sequencer_aligner_shifter_top PORT MAP (
          clk => clk,
          reset => reset,
          shift_on_en => shift_on_en,
          shift_on => shift_on,
          init_shift => init_shift,
          sequencer_in => sequencer_in,
          sequencer_out => sequencer_out
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
      wait for clk_period*10;

      -- insert stimulus here 
		reset		<= '0';

     wait for clk_period*10;
		shift_on_en		<= '1';
		shift_on			<= '1';
	  wait for clk_period*1;
		shift_on_en		<= '0';
		shift_on			<= '0';

for I in 0 to 260 loop		
		wait for 2.57 us;
		sequencer_in(12) 	<= '1';
		sequencer_in(11) 	<= '1'; 
		wait for 10 ns;
		sequencer_in(12) 	<= '0'; 
		sequencer_in(11) 	<= '0';
end loop;		
	

wait for clk_period*10;
		init_shift			<= '1';
	  wait for clk_period*1;
		init_shift			<= '0';
		
	 wait for clk_period*10;
		shift_on_en		<= '1';
		shift_on			<= '0';
	  wait for clk_period*1;
		shift_on_en		<= '0';
		shift_on			<= '0';
		
		wait for 100 ns;
		sequencer_in(12) 	<= '1';
		sequencer_in(11) 	<= '1'; 
		wait for 10 ns;
		sequencer_in(12) 	<= '0'; 
		sequencer_in(11) 	<= '0';


      wait;
   end process;

END;
