----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:22 06/06/2012 
-- Design Name: 
-- Module Name:    generic_counter_rst_load_ce - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_counter_rst_load_ce is

generic ( length_cnt : integer := 15 );

port (
	reset    	: in  std_logic;           				-- syncronus reset
   clk      	: in  std_logic;           				-- clock
   preset		: in  std_logic_vector (length_cnt downto 0);  -- maximum value the counter has to count
	enable    	: in  std_logic;  			 				-- enable
	load_lsw		: in  std_logic;
	load_MSW		: in  std_logic;
	q_out			: out std_logic_vector(length_cnt downto 0));

end generic_counter_rst_load_ce;

architecture Behavioral of generic_counter_rst_load_ce is
signal qi : std_logic_vector(length_cnt downto 0);

begin

	process (clk)
	begin  -- process
		if clk'event and clk = '1' then
			if reset ='1' then
				qi <= (others => '0');
			elsif load_lsw = '1' then
					qi(31 downto 0) <= preset(31 downto 0);
			elsif load_MSW = '1' then
					qi(63 downto 32) <= preset(63 downto 32);
			else 
				if enable = '1' then
					qi <= qi + 1;
				else
				   qi <= qi;
				end if;
			end if;
		end if;
end process;

q_out <= qi;

end Behavioral;

