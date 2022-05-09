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

package sequencer_v3_package is

constant func_call_opcode	: std_logic_vector (3 downto 0) 		:= x"1";
constant ind_func_call_opcode	: std_logic_vector (3 downto 0) 		:= x"2";
constant ind_rep_call_opcode	: std_logic_vector (3 downto 0) 		:= x"3";
constant ind_all_call_opcode	: std_logic_vector (3 downto 0) 		:= x"4";
constant jump_to_add_opcode	: std_logic_vector (3 downto 0) 		:= x"5";
constant ind_add_jump_opcode	: std_logic_vector (3 downto 0) 		:= x"6";
constant ind_rep_jump_opcode	: std_logic_vector (3 downto 0) 		:= x"7";
constant ind_all_jump_opcode	: std_logic_vector (3 downto 0) 		:= x"8";
constant sub_trailer_opcode	: std_logic_vector (3 downto 0) 		:= x"E";
constant end_sequence_opcode	: std_logic_vector (3 downto 0) 		:= x"F";

end sequencer_v3_package;

package body sequencer_v3_package is
 
end sequencer_v3_package;
