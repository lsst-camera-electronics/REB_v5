----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:59:10 06/21/2012 
-- Design Name: 
-- Module Name:    generic_dual_port_ram - Behavioral 
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

entity generic_dual_port_ram is

generic( 
			data_width : integer := 32;
			add_width 	: integer := 8);

port (
		clk      		: in  std_logic;           -- clock
		ram_wr_en 		: in  std_logic;	 			-- data in
		ram_wr_add 	: in  std_logic_vector(add_width-1 downto 0);
		ram_rd_add 	: in  std_logic_vector(add_width-1 downto 0);
		ram_data_in	: in  std_logic_vector(data_width-1 downto 0);
		ram_data_out_1	: out std_logic_vector(data_width-1 downto 0);
		ram_data_out_2	: out std_logic_vector(data_width-1 downto 0)
		);          

end generic_dual_port_ram;

architecture Behavioral of generic_dual_port_ram is
type ram_type is array (2**add_width-1 downto 0) of std_logic_vector (data_width-1 downto 0);
signal ram: ram_type := (others => (others => '0'));

begin

process (clk)
begin
   if (clk'event and clk = '1') then
		if (ram_wr_en = '1') then
			ram(conv_integer(ram_wr_add)) <= ram_data_in;
		end if;
	

--ram_data_out_1 <= ram(conv_integer(ram_rd_add));
--ram_data_out_2 <= ram(conv_integer(ram_wr_add));
end if;
end process;

process (ram_rd_add)
begin
		ram_data_out_1 <= ram(conv_integer(ram_rd_add));
end process;

process (ram_wr_add)
begin
		ram_data_out_2 <= ram(conv_integer(ram_wr_add));
end process;

end Behavioral;
