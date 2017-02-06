----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:19:08 11/20/2009 
-- Design Name: 
-- Module Name:    ff_ce - Behavioral 
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

entity ff_ce_pres is

port (
    preset   : in  std_logic;           -- syncronus reset
    clk      : in  std_logic;           -- clock
    data_in  : in  std_logic;  			 -- data in
	 ce       : in  std_logic;  			 -- clock enable
    data_out : out std_logic);          -- data out

end ff_ce_pres;

architecture Behavioral of ff_ce_pres is

signal data_out_i : std_logic;

begin

process (clk)
  begin  -- process
  if clk'event and clk = '1' then  -- rising clock edge
    if preset = '1' then                  -- synchronous reset 
      data_out_i <= '1';
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

