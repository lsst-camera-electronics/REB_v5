----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:15 04/10/2013 
-- Design Name: 
-- Module Name:    mux_2_1_bus_noclk - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_2_1_bus_noclk is

generic ( bus_width : integer := 4 );
port (
    
    selector   : in  std_logic;
	 bus_in_0 	: in  std_logic_vector(bus_width-1 downto 0);
	 bus_in_1 	: in  std_logic_vector(bus_width-1 downto 0);
	 
	 bus_out 	: out std_logic_vector(bus_width-1 downto 0)
	 );

end mux_2_1_bus_noclk;

architecture Behavioral of mux_2_1_bus_noclk is

begin
process (selector, bus_in_0, bus_in_1)
begin

case selector is
				when '0' => bus_out <= bus_in_0;
				when '1' => bus_out <= bus_in_1;
				when others => bus_out <= bus_in_0;
end case;

end process;

end Behavioral;

