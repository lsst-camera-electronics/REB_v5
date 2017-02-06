----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:15 03/26/2013 
-- Design Name: 
-- Module Name:    mux_bus_2_8_bit_clk - Behavioral 
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

entity mux_bus_2_8_bit_clk is

port (
    reset    	: in  std_logic;           -- syncronus reset
    clk      	: in  std_logic;           -- clock
    selector   : in  std_logic;
	 bus_in_0 	: in  std_logic_vector(7 downto 0);
	 bus_in_1 	: in  std_logic_vector(7 downto 0);
	 
	 bus_out 	: out std_logic_vector(7 downto 0)
	 );

end mux_bus_2_8_bit_clk;

architecture Behavioral of mux_bus_2_8_bit_clk is

begin


process (clk)
begin
if clk'event and clk = '1' then  -- rising clock edge
    if reset = '1' then                  -- synchronous reset 
      bus_out <= bus_in_0;
    else
   case selector is
      when '0' => bus_out <= bus_in_0;
      when '1' => bus_out <= bus_in_1;
		
      when others => bus_out <= bus_in_0;
   end case;
 end if;
 end if;
end process;

end Behavioral;

