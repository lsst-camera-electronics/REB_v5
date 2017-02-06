--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:01:51 04/17/2013
-- Design Name:   
-- Module Name:   /home/srusso/Xilinx_prj/LSST_prj/SPI_write/src/tb_spi_write.vhd
-- Project Name:  SPI_write
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SPI_write
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
 
ENTITY tb_spi_write IS
END tb_spi_write;
 
ARCHITECTURE behavior OF tb_spi_write IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SPI_write
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start_write : IN  std_logic;
         d_to_slave : IN  std_logic_vector(15 downto 0);
         mosi : OUT  std_logic;
         ss : OUT  std_logic;
         sclk : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '1';
   signal start_write : std_logic := '0';
   signal d_to_slave : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal mosi : std_logic;
   signal ss : std_logic;
   signal sclk : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SPI_write PORT MAP (
          clk => clk,
          reset => reset,
          start_write => start_write,
          d_to_slave => d_to_slave,
          mosi => mosi,
          ss => ss,
          sclk => sclk
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
		
		d_to_slave <= (others => '1');
		
		wait for 200 ns;
		start_write <= '1';
		wait for clk_period;
		start_write <= '0';

      wait;
   end process;

END;
