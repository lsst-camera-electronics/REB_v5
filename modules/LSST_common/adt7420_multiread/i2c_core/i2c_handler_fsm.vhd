----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:03 03/22/2013 
-- Design Name: 
-- Module Name:    i2c_handler_fsm - Behavioral 
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

entity i2c_handler_fsm is

port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		start_i2c			: in  std_logic;
		read_nwrite			: in  std_logic;
		double_read			: in  std_logic;
		i2c_busy				: in  std_logic;
		i2c_ena				: out std_logic;
		i2c_rw				: out std_logic;
		latch_word_1		: out std_logic;
		latch_word_2		: out std_logic;
		data_in_sel			: out std_logic;
		end_procedure		: out std_logic
		);

end i2c_handler_fsm;

architecture Behavioral of i2c_handler_fsm is

	type   state_type is (wait_start, wait_i2c_start, write_add, i2c_write_1, i2c_write_2, i2c_write_3,
								 i2c_read, i2c_read_sing_1, i2c_read_sing_2,
								 i2c_read_doub_1, i2c_read_doub_2, i2c_read_doub_3, i2c_read_doub_4);
	signal pres_state, next_state : state_type;
	signal next_i2c_ena				: std_logic;
	signal next_i2c_rw				: std_logic;
	signal next_latch_word_1		: std_logic;
	signal next_latch_word_2		: std_logic;
	signal next_data_in_sel			: std_logic;
	signal next_end_procedure		: std_logic;

begin

 process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state 			<= wait_start;
			i2c_ena				<= '0';
			i2c_rw				<= '0';
			latch_word_1		<= '0';
			latch_word_2		<= '0';
			data_in_sel			<= '0';
			end_procedure		<= '0';
        
      else
			pres_state 			<= next_state;
			i2c_ena				<= next_i2c_ena;
			i2c_rw				<= next_i2c_rw;
			latch_word_1		<= next_latch_word_1;
			latch_word_2		<= next_latch_word_2;
			data_in_sel			<= next_data_in_sel;
			end_procedure		<= next_end_procedure;

      end if;
    end if;
  end process;

process (pres_state, start_i2c, read_nwrite, double_read, i2c_busy)
 
  begin

    -------------------- outputs defoult values --------------------
    
	next_i2c_ena			<= '0';
	next_i2c_rw				<= '0';
	next_latch_word_1		<= '0';
	next_latch_word_2		<= '0';
	next_data_in_sel		<= '0';
	next_end_procedure	<= '0';


case pres_state is
    
		when wait_start =>
			if start_i2c = '0' then
				next_state 	<= wait_start;
			else
				next_state		<= wait_i2c_start;
				next_i2c_ena	<= '1';
			end if;
			
		when wait_i2c_start =>
			if i2c_busy = '0' then
				next_state		<= wait_i2c_start;
				next_i2c_ena	<= '1';
			else
				next_state		<= write_add;
				next_i2c_ena	<= '1';
			end if;
			
		when write_add => 
			if read_nwrite = '0' then
				next_state			<= i2c_write_1;
				next_i2c_ena		<= '1';
				next_data_in_sel	<= '1';
			else 
				next_state			<= i2c_read;
				next_i2c_ena		<= '1';
				next_i2c_rw			<= '1';
			end if;
		
		when i2c_write_1 =>
			if i2c_busy = '1' then
				next_state			<= i2c_write_1;
				next_i2c_ena		<= '1';
				next_data_in_sel	<= '1';
			else
				next_state			<= i2c_write_2;
			end if;
			
		when i2c_write_2 =>
			if i2c_busy = '0' then
				next_state	<= i2c_write_2;
			else
				next_state	<= i2c_write_3;
			end if;
			
		when i2c_write_3	=> 
			if i2c_busy = '1' then
				next_state	<= i2c_write_3;
			else
				next_state				<= wait_start;
				next_end_procedure	<= '1';
			end if;
			
		when i2c_read => 
			if i2c_busy = '1' then
				next_state			<= i2c_read;
				next_i2c_ena		<= '1';
				next_i2c_rw			<= '1';
			else
				if double_read = '0' then
					next_state			<= i2c_read_sing_1;
					next_i2c_rw			<= '1';
				else
					next_state			<= i2c_read_doub_1;
					next_i2c_ena		<= '1';
					next_i2c_rw			<= '1';
				end if;
			end if;
			
		when i2c_read_sing_1 =>
			if i2c_busy = '0' then
				next_state		<= i2c_read_sing_1;
			else
				next_state		<= i2c_read_sing_2;
			end if;
		
		when i2c_read_sing_2 => 
			if i2c_busy = '1' then
				next_state		<= i2c_read_sing_2;
			else
				next_state				<= wait_start;
				next_latch_word_1		<= '1';
				next_end_procedure	<= '1';
			end if;
		
		when i2c_read_doub_1 => 
			if i2c_busy = '0' then
				next_state		<= i2c_read_doub_1;
				next_i2c_ena	<= '1';
				next_i2c_rw		<= '1';
			else
				next_state		<= i2c_read_doub_2;
				next_i2c_ena		<= '1';
				next_i2c_rw			<= '1';
			end if;
			
		when i2c_read_doub_2 =>
			if i2c_busy = '1' then
				next_state		<= i2c_read_doub_2;
				next_i2c_ena	<= '1';
				next_i2c_rw		<= '1';
			else
				next_state				<= i2c_read_doub_3;
				next_i2c_rw				<= '1';
				next_latch_word_1		<= '1';
			end if;
			
		when i2c_read_doub_3 => 
			if i2c_busy = '0' then
				next_state		<= i2c_read_doub_3;
				next_i2c_rw		<= '1';
			else
				next_state		<= i2c_read_doub_4;
				next_i2c_rw		<= '1';
			end if;
			
		when i2c_read_doub_4 =>
			if i2c_busy = '1' then
				next_state		<= i2c_read_doub_4;
			else
				next_state				<= wait_start;
				next_latch_word_2		<= '1';
				next_end_procedure	<= '1';
			end if;			
		
		end case;
	end process;	
end Behavioral;

