----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:25:51 06/21/2012 
-- Design Name: 
-- Module Name:    generic_single_port_ram - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_single_port_ram is
generic( 
			data_width : integer := 32;
			add_width 	: integer := 8);
port (			
		clk      		: in  std_logic;           -- clock
		ram_wr_en 		: in  std_logic;	 			-- data in
		ram_add 			: in  std_logic_vector(add_width-1 downto 0);
		ram_data_in		: in  std_logic_vector(data_width-1 downto 0);
		ram_data_out	: out std_logic_vector(data_width-1 downto 0));          -- data out

end generic_single_port_ram;

architecture Behavioral of generic_single_port_ram is

type ram_type is array (2**add_width-1 downto 0) of std_logic_vector (data_width-1 downto 0);
signal ram: ram_type := (others => (others => '0'));

begin

process (clk)
begin
   if (clk'event and clk = '1') then
		if (ram_wr_en = '1') then
			ram(conv_integer(ram_add)) <= ram_data_in;
		end if;
	end if;
end process;

ram_data_out <= ram(conv_integer(ram_add));


end Behavioral;

