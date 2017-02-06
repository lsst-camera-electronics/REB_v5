--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package ltc2945_add_package is

constant V6_dev_add			: std_logic_vector (6 downto 0) := x"D"&"111";
constant V24_dev_add			: std_logic_vector (6 downto 0) := x"D"&"011";
constant V40_dev_add			: std_logic_vector (6 downto 0) := x"D"&"110";
constant V9_dev_add			: std_logic_vector (6 downto 0) := x"D"&"010";

constant V_reg_add			: std_logic_vector (7 downto 0) := x"1E";
constant I_reg_add			: std_logic_vector (7 downto 0) := x"14";


end ltc2945_add_package;

package body ltc2945_add_package is

end ltc2945_add_package;
