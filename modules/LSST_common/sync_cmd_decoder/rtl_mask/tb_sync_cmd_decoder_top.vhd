--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:32:03 05/17/2017
-- Design Name:   
-- Module Name:   C:/Users/srusso/Desktop/test_sync_cmd_decoder/rtl/tb_sync_cmd_decoder_top.vhd
-- Project Name:  test_sync_cmd_decoder
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sync_cmd_decoder_top
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
 
ENTITY tb_sync_cmd_decoder_top IS
END tb_sync_cmd_decoder_top;
 
ARCHITECTURE behavior OF tb_sync_cmd_decoder_top IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sync_cmd_decoder_top
    PORT(
         pgp_clk : IN  std_logic;
         pgp_reset : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         sync_cmd_en : IN  std_logic;
         delay_en : IN  std_logic;
         delay_in : IN  std_logic_vector(7 downto 0);
         delay_read : OUT  std_logic_vector(7 downto 0);
			sync_cmd_mask_en	: in  std_logic;
			sync_cmd_mask		: in  std_logic_vector(31 downto 0);
			sync_cmd_mask_read	: out std_logic_vector(31 downto 0);
         sync_cmd : IN  std_logic_vector(7 downto 0);
         sync_cmd_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal pgp_clk : std_logic := '0';
   signal pgp_reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal sync_cmd_en : std_logic := '0';
   signal delay_en : std_logic := '0';
   signal delay_in : std_logic_vector(7 downto 0) := (others => '0');
   signal sync_cmd : std_logic_vector(7 downto 0) := (others => '0');
	signal sync_cmd_mask_en	: std_logic := '0';
	signal sync_cmd_mask		: std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal delay_read : std_logic_vector(7 downto 0);
   signal sync_cmd_out : std_logic_vector(7 downto 0);
	signal sync_cmd_mask_read	: std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant pgp_clk_period : time := 10 ns;
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sync_cmd_decoder_top PORT MAP (
          pgp_clk => pgp_clk,
          pgp_reset => pgp_reset,
          clk => clk,
          reset => reset,
          sync_cmd_en => sync_cmd_en,
          delay_en => delay_en,
          delay_in => delay_in,
          delay_read => delay_read,
			 sync_cmd_mask_en =>	sync_cmd_mask_en,
			 sync_cmd_mask	=> sync_cmd_mask,
			 sync_cmd_mask_read => sync_cmd_mask_read,
          sync_cmd => sync_cmd,
          sync_cmd_out => sync_cmd_out
        );

   -- Clock process definitions
   pgp_clk_process :process
   begin
		pgp_clk <= '0';
		wait for pgp_clk_period/2;
		pgp_clk <= '1';
		wait for pgp_clk_period/2;
   end process;
 
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

      wait for pgp_clk_period*10;

      -- insert stimulus here 
		
		reset <= '0';
		
		wait for clk_period*10;
		
		sync_cmd_mask_en <= '1';
		sync_cmd_mask	<= x"00000004";
		
		wait for clk_period*2;
		
		sync_cmd_mask_en <= '0';
		sync_cmd_mask	<= x"00000000";
		
		wait for clk_period*10;
      
		sync_cmd_en <= '1';
		sync_cmd <= x"01";
		
		wait for clk_period;

		sync_cmd_en <= '0';
		sync_cmd <= x"00";

wait for clk_period*10;
      
		sync_cmd_en <= '1';
		sync_cmd <= x"02";
		
		wait for clk_period*2;

		sync_cmd_en <= '0';
		
		
		wait for clk_period*10;
		
		delay_en <= '1';
      delay_in <= x"03"; 
		
		wait for clk_period*2;
		
		delay_en <= '0';
      delay_in <= x"00"; 
		
		wait for clk_period*10;
      
		sync_cmd_en <= '1';
		sync_cmd <= x"02";
		
		wait for clk_period;

		sync_cmd_en <= '0';
		sync_cmd <= x"00";



      wait;
   end process;

END;
