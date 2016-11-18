----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:40 04/10/2013 
-- Design Name: 
-- Module Name:    function_executor_v22 - Behavioral 
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

entity function_executor_v22 is

port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		fifo_empty			: in  std_logic;
		func_end				: in  std_logic;
		func_rep_cnt_end	: in  std_logic;
		func_inf_loop		: in  std_logic;
		prog_end_opcode	: in  std_logic;
		func_stop			: in  std_logic;
		func_step			: in  std_logic;
		func_rep_cnt_init	: out std_logic;
		fifo_read_en		: out std_logic;
		func_start			: out std_logic;
		func_rep_cnt_en	: out std_logic;
		sequencer_busy		: out std_logic;
		veto_out				: out std_logic;
		end_sequence		: out std_logic
		);

end function_executor_v22;

architecture Behavioral of function_executor_v22 is
type   state_type is (wait_start, start_func, func_exe, func_rep, infinite_loop, 
								wait_step, wait_stop, empting_fifo);
								
	signal pres_state, next_state : state_type;
	signal next_func_rep_cnt_init	: std_logic;
	signal next_fifo_read_en		: std_logic;
	signal next_func_start			: std_logic;
	signal next_func_rep_cnt_en	: std_logic;
	signal next_sequencer_busy		: std_logic;
	signal next_veto_out				: std_logic;
	signal next_end_sequence		: std_logic;

begin


process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state 			<= wait_start;
			func_rep_cnt_init <= '1';
			fifo_read_en		<= '0';
			func_start			<= '0';
			func_rep_cnt_en	<= '0';
			sequencer_busy		<= '0';
			veto_out				<= '0';
			end_sequence		<= '0';
      else
			pres_state 			<= next_state;
			func_rep_cnt_init <= next_func_rep_cnt_init;
			fifo_read_en		<= next_fifo_read_en;
			func_start			<= next_func_start;
			func_rep_cnt_en	<= next_func_rep_cnt_en;
			sequencer_busy		<= next_sequencer_busy;
			veto_out				<= next_veto_out;
			end_sequence		<= next_end_sequence;
      end if;
    end if;
  end process;
  
process (pres_state, fifo_empty, func_rep_cnt_end, func_inf_loop, func_stop,
			func_step, func_end, prog_end_opcode)
  begin

    -------------------- outputs defoult values --------------------
    
			next_func_rep_cnt_init	<= '0';
			next_fifo_read_en			<= '0';
			next_func_start			<= '0';
			next_func_rep_cnt_en		<= '0';
			next_sequencer_busy		<= '1';
			next_veto_out				<= '0';
			next_end_sequence			<= '0';

    case pres_state is
    
		when wait_start =>  
			if fifo_empty = '1' then
				next_state			<= wait_start;
				next_sequencer_busy		<= '0';
			else
				next_state 			<= start_func;
				next_fifo_read_en	<= '1';
			end if;
		
		when start_func =>  
			next_state			<= func_exe;
			next_func_start	<= '1';
			next_func_rep_cnt_en	<= '1';	
		
		when func_exe =>  
		if prog_end_opcode ='0' then
			if func_end = '0' then
				next_state			<= func_exe;
			else
				if func_inf_loop = '1' then
					next_state			<= infinite_loop;
					next_func_start	<= '1';
				else
					if func_rep_cnt_end = '0' then
							next_state				<= func_rep;
							next_func_rep_cnt_en	<= '1';
						else
							if fifo_empty = '0' then
								next_state 					<= start_func;
								next_fifo_read_en			<= '1';
								next_func_rep_cnt_init	<= '1';
							else
								next_state					<= wait_start;
								next_func_rep_cnt_init	<= '1';
								next_fifo_read_en			<= '1';
								next_end_sequence			<= '1';
							end if;
					end if;
				end if;
			end if;
			else
				next_state					<= wait_start;
				next_func_rep_cnt_init	<= '1';
				next_fifo_read_en			<= '1';
				next_end_sequence			<= '1';
			end if;
			
		when func_rep => 
			next_state			<= func_exe;
			next_func_start	<= '1';
		
		when infinite_loop => 
			if func_stop = '0' and func_step = '0' then
				next_state 			<= infinite_loop;
				next_func_start	<= '1';
			elsif func_stop = '1' and func_step = '0' then
				next_state			<= wait_stop;
			elsif func_stop = '0' and func_step = '1' then
				next_state			<= wait_step;
			else
				next_state					<= wait_start;
				next_func_rep_cnt_init	<= '1';
				next_end_sequence			<= '1';
			end if;
		
		when wait_stop	=> 
			if func_end = '0' then 
				next_state					<= wait_stop;
			else
				next_state					<= empting_fifo;
				next_fifo_read_en			<= '1';
				next_veto_out				<= '1';
			end if;
		
		when empting_fifo	=> 
			if fifo_empty = '0' then 
				next_state					<= empting_fifo;
				next_fifo_read_en			<= '1';
				next_veto_out				<= '1';
			else
				next_state					<= wait_start;
				next_func_rep_cnt_init	<= '1';
				next_end_sequence			<= '1';
			end if;
		
		when wait_step	=> 
			if func_end = '0' then 
				next_state					<= wait_step;
			else
				next_state 					<= start_func;
				next_fifo_read_en			<= '1';
				next_func_rep_cnt_init	<= '1';
			end if;
		
		end case;
	end process;

end Behavioral;

