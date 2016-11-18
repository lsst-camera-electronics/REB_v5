--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:01:40 04/10/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/sequencer_v3/src/sequencer_v3/function_v3/tb_sequencer_v3_top.vhd
-- Project Name:  sequencer_v3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sequencer_v3_top
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
 
ENTITY tb_sequencer_v22_top IS
END tb_sequencer_v22_top;
 
ARCHITECTURE behavior OF tb_sequencer_v22_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sequencer_v22_top
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         start_sequence : IN  std_logic;
         program_mem_we : IN  std_logic;
         program_mem_w_add : IN  std_logic_vector(9 downto 0);
         program_mem_data_in : IN  std_logic_vector(31 downto 0);
         prog_mem_redbk : OUT  std_logic_vector(31 downto 0);
         time_mem_w_en : IN  std_logic;
         time_mem_in : IN  std_logic_vector(15 downto 0);
         time_mem_w_add : IN  std_logic_vector(7 downto 0);
         time_mem_readbk : OUT  std_logic_vector(15 downto 0);
         out_mem_w_en : IN  std_logic;
         out_mem_in : IN  std_logic_vector(31 downto 0);
         out_mem_w_add : IN  std_logic_vector(7 downto 0);
         out_mem_readbk : OUT  std_logic_vector(31 downto 0);
         stop_sequence : IN  std_logic;
         step_sequence : IN  std_logic;
         sequencer_out : OUT  std_logic_vector(31 downto 0);
         end_sequence : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '1';
   signal clk : std_logic := '0';
   signal start_sequence : std_logic := '0';
   signal program_mem_we : std_logic := '0';
   signal program_mem_w_add : std_logic_vector(9 downto 0) := (others => '0');
   signal program_mem_data_in : std_logic_vector(31 downto 0) := (others => '0');
   signal time_mem_w_en : std_logic := '0';
   signal time_mem_in : std_logic_vector(15 downto 0) := (others => '0');
   signal time_mem_w_add : std_logic_vector(7 downto 0) := (others => '0');
   signal out_mem_w_en : std_logic := '0';
   signal out_mem_in : std_logic_vector(31 downto 0) := (others => '0');
   signal out_mem_w_add : std_logic_vector(7 downto 0) := (others => '0');
   signal stop_sequence : std_logic := '0';
   signal step_sequence : std_logic := '0';

 	--Outputs
   signal prog_mem_redbk : std_logic_vector(31 downto 0);
   signal time_mem_readbk : std_logic_vector(15 downto 0);
   signal out_mem_readbk : std_logic_vector(31 downto 0);
   signal sequencer_out : std_logic_vector(31 downto 0);
   signal end_sequence : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sequencer_v22_top PORT MAP (
          reset => reset,
          clk => clk,
          start_sequence => start_sequence,
          program_mem_we => program_mem_we,
          program_mem_w_add => program_mem_w_add,
          program_mem_data_in => program_mem_data_in,
          prog_mem_redbk => prog_mem_redbk,
          time_mem_w_en => time_mem_w_en,
          time_mem_in => time_mem_in,
          time_mem_w_add => time_mem_w_add,
          time_mem_readbk => time_mem_readbk,
          out_mem_w_en => out_mem_w_en,
          out_mem_in => out_mem_in,
          out_mem_w_add => out_mem_w_add,
          out_mem_readbk => out_mem_readbk,
          stop_sequence => stop_sequence,
          step_sequence => step_sequence,
          sequencer_out => sequencer_out,
          end_sequence => end_sequence
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
		
		-- set up sequencer
		--default state
		out_mem_w_en	<= '1';
		out_mem_in		<= x"ffff_ffff";
		out_mem_w_add	<= x"00";
		wait for clk_period*2;
		out_mem_w_en	<= '0';
		out_mem_in		<= x"0000_0000";
		out_mem_w_add	<= x"00";
		
--		-- function 1
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1000_0032";
--		out_mem_w_add	<= x"10";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0020";
--		time_mem_w_add	<= x"10";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1100_0010";
--		out_mem_w_add	<= x"11";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"11";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 2
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1200_0032";
--		out_mem_w_add	<= x"12";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0020";
--		time_mem_w_add	<= x"12";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 3
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1300_0010";
--		out_mem_w_add	<= x"13";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"13";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		
--		
--		
--		-- function 2
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0011";
--		out_mem_w_add	<= x"20";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0032";
--		time_mem_w_add	<= x"20";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0020";
--		out_mem_w_add	<= x"21";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0032";
--		time_mem_w_add	<= x"21";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 2
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0032";
--		out_mem_w_add	<= x"22";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0032";
--		time_mem_w_add	<= x"22";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 3
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0100";
--		out_mem_w_add	<= x"23";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"1388";
--		time_mem_w_add	<= x"23";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 4
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0200";
--		out_mem_w_add	<= x"24";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"1388";
--		time_mem_w_add	<= x"24";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		-- time slice 5
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0400";
--		out_mem_w_add	<= x"25";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"1388";
--		time_mem_w_add	<= x"25";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		-- time slice 6
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0800";
--		out_mem_w_add	<= x"26";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"1388";
--		time_mem_w_add	<= x"26";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		
--		-- function 3
--		-- time slice 0		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0032";
--		out_mem_w_add	<= x"30";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0020";
--		time_mem_w_add	<= x"30";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 1		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3100_0001";
--		out_mem_w_add	<= x"31";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0001";
--		time_mem_w_add	<= x"31";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= x"00";	
--		
--		
--		-- time slice 2		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3200_0002";
--		out_mem_w_add	<= x"32";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0002";
--		time_mem_w_add	<= x"32";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 3		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3300_0010";
--		out_mem_w_add	<= x"33";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"33";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	



--		-- function 1
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"000046A0";
--		out_mem_w_add	<= x"20";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0009";
--		time_mem_w_add	<= x"20";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 1
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"000046E8";
--		out_mem_w_add	<= x"21";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000A";
--		time_mem_w_add	<= x"21";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 2
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"000046CC";
--		out_mem_w_add	<= x"22";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000A";
--		time_mem_w_add	<= x"22";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 3
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000464C";
--		out_mem_w_add	<= x"23";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0014";
--		time_mem_w_add	<= x"23";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 4
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004640";
--		out_mem_w_add	<= x"24";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0005";
--		time_mem_w_add	<= x"24";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 5
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004642";
--		out_mem_w_add	<= x"25";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0028";
--		time_mem_w_add	<= x"25";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 6
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004652";
--		out_mem_w_add	<= x"26";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000A";
--		time_mem_w_add	<= x"26";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 7
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004610";
--		out_mem_w_add	<= x"27";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0014";
--		time_mem_w_add	<= x"27";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 8
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004611";
--		out_mem_w_add	<= x"28";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0032";
--		time_mem_w_add	<= x"28";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 9
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004630";
--		out_mem_w_add	<= x"29";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000A";
--		time_mem_w_add	<= x"29";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice A
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004620";
--		out_mem_w_add	<= x"2A";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000A";
--		time_mem_w_add	<= x"2A";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice B
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00005620";
--		out_mem_w_add	<= x"2B";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0002";
--		time_mem_w_add	<= x"2B";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice C
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"00004620";
--		out_mem_w_add	<= x"2C";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0005";
--		time_mem_w_add	<= x"2C";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
		
		
--		-- function 3
--		-- time slice 0		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0032";
--		out_mem_w_add	<= x"30";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0020";
--		time_mem_w_add	<= x"30";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 1		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3100_0001";
--		out_mem_w_add	<= x"31";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0001";
--		time_mem_w_add	<= x"31";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= x"00";	
--		
--		
--		-- time slice 2		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3200_0002";
--		out_mem_w_add	<= x"32";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0002";
--		time_mem_w_add	<= x"32";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 3		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3300_0010";
--		out_mem_w_add	<= x"33";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"33";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	

		-- write program memory		
		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"12000002";
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"40000000";
--		
		
		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"11000002";

--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"30000000";
--		
--		wait for clk_period;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"11000002";
--
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"02";
--		program_mem_data_in <= x"13000003";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"03";
--		program_mem_data_in <= x"11000001";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"04"; -- jump to add A
--		program_mem_data_in <= x"20280002";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"05";
--		program_mem_data_in <= x"40000000";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"0A"; -- jump to add D
--		program_mem_data_in <= x"20340002";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"0B";
--		program_mem_data_in <= x"11000003";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"0C";
--		program_mem_data_in <= x"30000000";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"0D";
--		program_mem_data_in <= x"13000001";
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"0E";
--		program_mem_data_in <= x"11000002";
--
--		
--		wait for clk_period;
--		program_mem_w_add	<= "00" & x"0F";
--		program_mem_data_in <= x"30000000";
--		
--		wait for clk_period;
--		program_mem_we <= '0';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"00000000";
--		
--		
--		wait for 300 ns;
--		program_mem_w_add	<= "00" & x"01";
--		
--		wait for clk_period*2;
--		out_mem_w_add	<= x"32";
--		wait for clk_period*2;
--		time_mem_w_add	<= x"32";
--		wait for clk_period*2;
		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"12000001";
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"11000001";
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"20140009";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"03";
--		program_mem_data_in <= x"40000000";	
--
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"05";
--		program_mem_data_in <= x"12000001";
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"06";
--		program_mem_data_in <= x"11000001";
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"07";
--		program_mem_data_in <= x"30000000";	


---- CCD acq test START

-- function 1 shutter
		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1001_0600";
--		out_mem_w_add	<= x"10";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"10";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1001_0600";
--		out_mem_w_add	<= x"11";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"11";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		
--		-- function 2 Parallel clocks
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_06b8";
--		out_mem_w_add	<= x"20";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"20";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_06b8";
--		out_mem_w_add	<= x"21";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"21";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 2
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_0cb8";
--		out_mem_w_add	<= x"22";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"22";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 3
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_09b8";
--		out_mem_w_add	<= x"23";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"23";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 4
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_03b8";
--		out_mem_w_add	<= x"24";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"24";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		-- time slice 5
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_0688";
--		out_mem_w_add	<= x"25";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"25";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		-- time slice 6
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_0638";
--		out_mem_w_add	<= x"26";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"26";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		-- time slice 7
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_0638";
--		out_mem_w_add	<= x"27";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"27";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		-- time slice 8
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_0630";
--		out_mem_w_add	<= x"28";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0fa0";
--		time_mem_w_add	<= x"28";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";
--		
--		
--		-- function 3 serial clocks
--		-- time slice 0		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_06a0";
--		out_mem_w_add	<= x"30";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000c";
--		time_mem_w_add	<= x"30";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 1		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_06a8";
--		out_mem_w_add	<= x"31";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000c";
--		time_mem_w_add	<= x"31";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= x"00";	
--		
--		
--		-- time slice 2		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_16a8";
--		out_mem_w_add	<= x"32";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000c";
--		time_mem_w_add	<= x"32";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 3		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_06ac";
--		out_mem_w_add	<= x"33";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0008";
--		time_mem_w_add	<= x"33";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 4		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_06ec";
--		out_mem_w_add	<= x"34";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"34";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 5		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_064c";
--		out_mem_w_add	<= x"35";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0014";
--		time_mem_w_add	<= x"35";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 6		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0640";
--		out_mem_w_add	<= x"36";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0008";
--		time_mem_w_add	<= x"36";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 7		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0642";
--		out_mem_w_add	<= x"37";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0032";
--		time_mem_w_add	<= x"37";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 8		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0650";
--		out_mem_w_add	<= x"38";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"38";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice 9		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0610";
--		out_mem_w_add	<= x"39";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"001c";
--		time_mem_w_add	<= x"39";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";
--
--		-- time slice a		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0611";
--		out_mem_w_add	<= x"3a";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0032";
--		time_mem_w_add	<= x"3a";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--		
--		-- time slice b		
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"3000_0630";
--		out_mem_w_add	<= x"3b";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"3b";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- write program memory
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"11000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"202807e4";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"02";
--		program_mem_data_in <= x"40000000";	
--
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"0a";
--		program_mem_data_in <= x"12000001";
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"0b";
--		program_mem_data_in <= x"13000226";
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"0c";
--		program_mem_data_in <= x"30000000";	
--		
--		-- sequencer trigger
--		wait for clk_period*20;
--		start_sequence <= '1';
--		
--		wait for clk_period*2;
--		start_sequence <= '0';
		
-- CCD acq test END


-- Simple sequence START
-- function 1 
		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1000_0010";
--		out_mem_w_add	<= x"10";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"10";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1100_0001";
--		out_mem_w_add	<= x"11";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0001";
--		time_mem_w_add	<= x"11";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 2
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1200_0010";
--		out_mem_w_add	<= x"12";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"12";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--
--		-- write program memory
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"11000002";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"40000000";	
--
--		-- sequencer trigger
--		wait for clk_period*20;
--		start_sequence <= '1';
--		
--		wait for clk_period*2;
--		start_sequence <= '0';
--		
--		-- sequencer trigger
--		wait for 10 us;
--		start_sequence <= '1';
--		
--		wait for clk_period*2;
--		start_sequence <= '0';
		
-- Simple sequence END



-- Infinite loop sequence START
-- function 1 
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1000_0010";
--		out_mem_w_add	<= x"10";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"10";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1100_0001";
--		out_mem_w_add	<= x"11";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0001";
--		time_mem_w_add	<= x"11";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 2
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"1200_0010";
--		out_mem_w_add	<= x"12";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"12";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
----
----		-- write program memory
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"11000002";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"40000000";	
--		
--		-- function 2 
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_0010";
--		out_mem_w_add	<= x"20";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"20";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2100_0001";
--		out_mem_w_add	<= x"21";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"0001";
--		time_mem_w_add	<= x"21";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		-- time slice 2
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2200_0010";
--		out_mem_w_add	<= x"22";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"22";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
----
----		-- write program memory
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"11800000";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"12000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"02";
--		program_mem_data_in <= x"12000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"03";
--		program_mem_data_in <= x"12000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"04";
--		program_mem_data_in <= x"12000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"05";
--		program_mem_data_in <= x"40000000";	
--		
--
--		-- sequencer trigger
--		wait for clk_period*20;
--		start_sequence <= '1';
--		
--		wait for clk_period*2;
--		start_sequence <= '0';
--		
--		-- sequencer stop
--		wait for 10 us;
--		stop_sequence <= '1';
--		
--		wait for clk_period*2;
--		stop_sequence <= '0';
--		
--		-- sequencer trigger
--		wait for 4 us;
--		start_sequence <= '1';
--		
--		wait for clk_period*2;
--		start_sequence <= '0';
--		
--		-- sequencer step
--		wait for 10 us;
--		step_sequence <= '1';
--		
--		wait for clk_period*2;
--		step_sequence <= '0';
--
--
----		-- write program memory
--		wait for 10 us;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"20280001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"40000000";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"0a";
--		program_mem_data_in <= x"11800000";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"0b";
--		program_mem_data_in <= x"12000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"0c";
--		program_mem_data_in <= x"12000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"0d";
--		program_mem_data_in <= x"30000000";	
--		
--
--		-- sequencer trigger
--		wait for clk_period*20;
--		start_sequence <= '1';
--		
--		wait for clk_period*2;
--		start_sequence <= '0';
--		
--		-- sequencer stop
--		wait for 10 us;
--		stop_sequence <= '1';
--		
--		wait for clk_period*2;
--		stop_sequence <= '0';
--		
--		-- sequencer trigger
--		wait for 4 us;
--		start_sequence <= '1';
--		
--		wait for clk_period*2;
--		start_sequence <= '0';
--		
--		-- sequencer step
--		wait for 10 us;
--		step_sequence <= '1';
--		
--		wait for clk_period*2;
--		step_sequence <= '0';
		
-- Infinite loop sequence END


---- DOUBLE START TEST
----function 1
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"10";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"10";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"11";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"00ff";
--		time_mem_w_add	<= x"11";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--		
--		
---- function 2 
--		-- time slice 0
--		wait for clk_period*2;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"2000_0010";
--		out_mem_w_add	<= x"20";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"000a";
--		time_mem_w_add	<= x"20";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= x"0000";
--		time_mem_w_add	<= x"00";	
--
--		-- time slice 1
--		wait for clk_period*5;
--		out_mem_w_en	<= '1';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"21";
--		
--		time_mem_w_en	<= '1';
--		time_mem_in		<= x"00ff";
--		time_mem_w_add	<= x"21";
--		wait for clk_period*2;
--		out_mem_w_en	<= '0';
--		out_mem_in		<= x"0000_0000";
--		out_mem_w_add	<= x"00";
--		time_mem_w_en	<= '0';
--		time_mem_in		<= X"0000";
--		time_mem_w_add	<= X"00";	
--				
----
----		-- write program memory
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"00";
--		program_mem_data_in <= x"110000ff";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"01";
--		program_mem_data_in <= x"12000001";	
--		
--		wait for 100 ns;
--		program_mem_we <= '1';
--		program_mem_w_add	<= "00" & x"02";
--		program_mem_data_in <= x"40000000";	
		

-- Infinite CLK TEST
--function 1
		-- time slice 0
		wait for clk_period*2;
		out_mem_w_en	<= '1';
		out_mem_in		<= x"ffff_ffff";
		out_mem_w_add	<= x"10";
		
		time_mem_w_en	<= '1';
		time_mem_in		<= x"0004";
		time_mem_w_add	<= x"10";
		wait for clk_period*2;
		out_mem_w_en	<= '0';
		out_mem_in		<= x"0000_0000";
		out_mem_w_add	<= x"00";
		time_mem_w_en	<= '0';
		time_mem_in		<= x"0000";
		time_mem_w_add	<= x"00";	

		-- time slice 1
		wait for clk_period*5;
		out_mem_w_en	<= '1';
		out_mem_in		<= x"0000_0000";
		out_mem_w_add	<= x"11";
		
		time_mem_w_en	<= '1';
		time_mem_in		<= x"0001";
		time_mem_w_add	<= x"11";
		wait for clk_period*2;
		out_mem_w_en	<= '0';
		out_mem_in		<= x"0000_0000";
		out_mem_w_add	<= x"00";
		time_mem_w_en	<= '0';
		time_mem_in		<= X"0000";
		time_mem_w_add	<= X"00";	
		
				
--
--		-- write program memory
		wait for 100 ns;
		program_mem_we <= '1';
		program_mem_w_add	<= "00" & x"00";
		program_mem_data_in <= x"11800000";	
			
		wait for 100 ns;
		program_mem_we <= '1';
		program_mem_w_add	<= "00" & x"01";
		program_mem_data_in <= x"40000000";	



		-- sequencer trigger
		wait for clk_period*20;
		start_sequence <= '1';
		
		wait for clk_period*2;
		start_sequence <= '0';
		
	
      wait;
   end process;

END;
