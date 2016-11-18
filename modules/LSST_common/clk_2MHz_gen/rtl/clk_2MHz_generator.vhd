----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:32:35 09/27/2013 
-- Design Name: 
-- Module Name:    clk_2MHz_generator - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity clk_2MHz_generator is
port (
		clk				: in  std_logic;
		reset				: in  std_logic;
		clk_2MHz_en		: in  std_logic;
		clk_2MHz_en_in	: in  std_logic;
		clk_2MHz_en_out: out std_logic;
		clk_2MHz_out	: out std_logic
		);

end clk_2MHz_generator;

architecture Behavioral of clk_2MHz_generator is

signal clk_2MHz_en_int		: std_logic;
signal d							: std_logic;
signal q							: std_logic;

begin


SRLC32E_inst : SRLC32E
   generic map (
      INIT => X"00000000")
   port map (
      Q 		=> q,     -- SRL data output
      Q31 	=> open,    								-- SRL cascade output pin
      A 		=> "11000", -- 25        				-- 5-bit shift depth select input
      CE 	=> clk_2MHz_en_int,      								-- Clock enable input
      CLK 	=> clk,    									-- Clock input
      D 		=> d         		-- SRL data input
   );

clk_enable : FDRE
generic map (
      INIT => '0') -- Initial value of register ('0' or '1')  
port map (
      Q => clk_2MHz_en_int,      -- Data output
      C => clk,      -- Clock input
      CE => clk_2MHz_en,    -- Clock enable input
      R => reset,      -- Synchronous reset input
      D => clk_2MHz_en_in       -- Data input
   );

d 					<= not q;
clk_2MHz_out	<= not q;
clk_2MHz_en_out<= clk_2MHz_en_int;

end Behavioral;

