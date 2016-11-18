----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:47:47 07/04/2011 
-- Design Name: 
-- Module Name:    generic_reg_ce_init - Behavioral 
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

entity generic_reg_ce_init is

generic ( width : integer := 15 );
port (
    reset    : in  std_logic;           							-- syncronus reset
    clk      : in  std_logic;           							-- clock
    ce       : in  std_logic;  			 							-- clock enable
	 init	    : in  std_logic;											-- signal to reset the reg (active high)
	 data_in  : in  std_logic_vector(width downto 0);  			-- data in
	 data_out : out std_logic_vector(width downto 0));				-- data out

end generic_reg_ce_init;

architecture Behavioral of generic_reg_ce_init is

signal data_out_i : std_logic_vector(width downto 0);

begin

process (clk)
  begin  -- process
  if clk'event and clk = '1' then  -- rising clock edge
    if reset = '1' or init = '1' then                  -- synchronous reset 
      data_out_i <= (others => '0');
    else
		if ce = '1' then
			data_out_i <= data_in;
		else 
			data_out_i <= data_out_i;
		end if;  
	 end if;
  end if;	 
  end process;

  data_out <= data_out_i;

end Behavioral;

