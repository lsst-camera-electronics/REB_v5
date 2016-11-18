----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:12 11/26/2009 
-- Design Name: 
-- Module Name:    rising_edge_detector - Behavioral 
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

entity rising_edge_detector is

Port    ( reset 	   				: in  std_logic;
          clk   	   				: in  std_logic;
			 signal_2_detect			: in  std_logic;
			 output						: out std_logic);  -- this signal is 1 for 1 clk cycle if on the "signal_2_detect" a rising edge is detected

end rising_edge_detector;

architecture Behavioral of rising_edge_detector is

  signal qout  : std_logic;
  signal q_int : std_logic;

begin

process(clk)
   begin
   if ( clk'event and clk='1') then
		if reset='1' then
			qout<='0';
		else  
			qout<=signal_2_detect;
		end if;
	end if;
  end process;

   q_int  <= signal_2_detect;
   output <= (not (qout) and q_int);

end Behavioral;

