----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:03:07 07/05/2011 
-- Design Name: 
-- Module Name:    demux_1_2_clk_def_1 - Behavioral 
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

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity demux_1_2_clk_def_1 is

port (
    reset     : in  std_logic;           -- syncronus reset
    clk       : in  std_logic;           -- clock
	 data_in  : in  std_logic;	 										-- data in
	 selector : in  std_logic;
	 data_out : out std_logic_vector(1 downto 0));          -- data out

end demux_1_2_clk_def_1;

architecture Behavioral of demux_1_2_clk_def_1 is

begin

process (clk)
begin


if clk'event and clk = '1' then  -- rising clock edge
    if reset = '1' then                  -- synchronous reset 
      data_out <= (others => '0');
    else

	 ----------- default values -----------
      data_out <= (others => '1');


   case selector is
      when '0' => data_out(0) 	<= data_in;
      when '1' => data_out(1) 	<= data_in;
		
      when others => data_out <= (others => '0');
   end case;
	end if;
end if;
end process;


end Behavioral;