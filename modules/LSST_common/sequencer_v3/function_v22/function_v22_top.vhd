----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:43:16 04/10/2013 
-- Design Name: 
-- Module Name:    function_v22_top - Behavioral 
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

entity function_v22_top is

port (
		reset    				: in  std_logic;           -- syncronus reset
		clk      				: in  std_logic;           -- clock
		
		time_mem_w_en			: in  std_logic;
		time_mem_in 	 		: in  std_logic_vector(15 downto 0);
		time_mem_w_add			: in  std_logic_vector(7 downto 0);
		time_mem_readbk 		: out std_logic_vector(15 downto 0);
		
		out_mem_w_en			: in  std_logic;
		out_mem_in 	 			: in  std_logic_vector(31 downto 0);
		out_mem_w_add			: in  std_logic_vector(7 downto 0);
		out_mem_readbk 		: out std_logic_vector(31 downto 0);
		
		fifo_empty				: in  std_logic;
		fifo_read_en			: out std_logic;
		fifo_param_out			: in  std_logic_vector(28 downto 0);
		
		stop_sequence			: in  std_logic;
		step_sequence			: in  std_logic;
		
		sequencer_busy			: out std_logic;
		sequencer_out			: out std_logic_vector(31 downto 0);
		end_sequence			: out std_logic
		);

end function_v22_top;

architecture Behavioral of function_v22_top is

component function_executor_v22 is
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
end component;

component generic_counter_comparator_ce_init is
generic ( length_cnt : integer := 15 );
port (
    reset    	: in  std_logic;           				-- syncronus reset
    clk      	: in  std_logic;           				-- clock
    max_value	: in  std_logic_vector (length_cnt downto 0);  -- maximum value the counter has to count
	 enable    	: in  std_logic;  			 				-- enable
	 init			: in  std_logic;  			 				
    cnt_end 	: out std_logic;          				-- signal = 1 when the counter reach the maximum
	 q_out		: out std_logic_vector(length_cnt downto 0));
end component;

component function_v22 is
generic (time_bus_width		: integer	:= 16;
			out_bus_width		: integer	:= 32;
			time_slice_num		: integer	:= 16;
			function_num		: integer	:= 15
			);
port (
    reset    				: in  std_logic;           -- syncronus reset
    clk      				: in  std_logic;           -- clock
    start_func				: in  std_logic;	
 	 sequencer_busy		: in  std_logic; 
	 
	 time_mem_w_en			: in  std_logic;
	 time_mem_in 	 		: in  std_logic_vector(time_bus_width-1 downto 0);
	 time_mem_w_add		: in  std_logic_vector(7 downto 0);
 	 time_func_add			: in  std_logic_vector(3 downto 0);
	 time_mem_out_2 		: out std_logic_vector(time_bus_width-1 downto 0);

	 out_mem_w_en			: in  std_logic;
	 out_mem_in 	 		: in  std_logic_vector(out_bus_width-1 downto 0);
	 out_mem_w_add			: in  std_logic_vector(7 downto 0);
 	 out_func_add			: in  std_logic_vector(3 downto 0);
	 out_mem_out_2 		: out std_logic_vector(out_bus_width-1 downto 0);

	 end_func				: out std_logic;
	 signal_out_func		: out std_logic_vector(out_bus_width-1 downto 0));
end component;

component generic_reg_ce_init is
generic ( width : integer := 15 );
port (
    reset    : in  std_logic;           							-- syncronus reset
    clk      : in  std_logic;           							-- clock
    ce       : in  std_logic;  			 							-- clock enable
	 init	    : in  std_logic;											-- signal to reset the reg (active high)
	 data_in  : in  std_logic_vector(width downto 0);  			-- data in
	 data_out : out std_logic_vector(width downto 0));				-- data out
end component;

component ff_ce is
port (
    reset    : in  std_logic;           -- syncronus reset
    clk      : in  std_logic;           -- clock
    data_in  : in  std_logic;  			 -- data in
	 ce       : in  std_logic;  			 -- clock enable
    data_out : out std_logic);          -- data out
end component;

signal end_rep_cnt 				: std_logic;
signal init_rep_cnt				: std_logic;
signal en_rep_cnt					: std_logic;
signal start_func					: std_logic;
signal end_func					: std_logic;
signal sequencer_busy_int		: std_logic;

signal out_ce						: std_logic;
signal out_ce_1					: std_logic;
signal out_ce_2					: std_logic;
signal sequencer_out_mem		: std_logic_vector(31 downto 0);

signal veto_out					: std_logic;



begin

function_executor_0 : function_executor_v22
port map (
		clk 					=> clk,
		reset					=> reset,
		fifo_empty			=> fifo_empty,
		func_end				=> end_func,
		func_rep_cnt_end	=> end_rep_cnt,
		func_inf_loop		=> fifo_param_out(23),
		prog_end_opcode	=> fifo_param_out(28),
		func_stop			=> stop_sequence,
		func_step			=> step_sequence,
		func_rep_cnt_init	=> init_rep_cnt,
		fifo_read_en		=> fifo_read_en,
		func_start			=> start_func,
		func_rep_cnt_en	=> en_rep_cnt,
		sequencer_busy		=> sequencer_busy_int,
		veto_out				=> veto_out,
		end_sequence		=> end_sequence
		);	

rep_counter : generic_counter_comparator_ce_init 
generic map ( length_cnt => 22 )
port map (
    reset    	=> reset,         				-- syncronus reset
    clk      	=> clk,           				-- clock
    max_value	=> fifo_param_out(22 downto 0),  -- maximum value the counter has to count
	 enable    	=> en_rep_cnt,  			 				-- enable
	 init			=> init_rep_cnt,  			 				
    cnt_end 	=> end_rep_cnt);          				-- signal = 1 when the counter reach the maximum

function_v22_0 : function_v22 
generic map (time_bus_width	=> 16,
				 out_bus_width		=> 32,
				 time_slice_num	=> 16,
				 function_num		=> 15
			)
port map (
    reset    				=> reset,           -- syncronus reset
    clk      				=> clk,           -- clock
    start_func				=> start_func,	
 	 sequencer_busy		=> sequencer_busy_int, 
	 
	 time_mem_w_en			=> time_mem_w_en,
	 time_mem_in 	 		=> time_mem_in,
	 time_mem_w_add		=> time_mem_w_add,
 	 time_func_add			=> fifo_param_out(27 downto 24),
	 time_mem_out_2 		=> time_mem_readbk,

	 out_mem_w_en			=> out_mem_w_en,
	 out_mem_in 	 		=> out_mem_in,
	 out_mem_w_add			=> out_mem_w_add,
 	 out_func_add			=> fifo_param_out(27 downto 24),
	 out_mem_out_2 		=> out_mem_readbk,

	 end_func				=> end_func,
	 signal_out_func		=> sequencer_out_mem
	 );

output_reg : generic_reg_ce_init
generic map ( width => 31)
port map (
    reset    => reset,
    clk      => clk, 
    ce       => out_ce,
	 init	    => '0',											-- signal to reset the reg (active high)
	 data_in  => sequencer_out_mem,
	 data_out => sequencer_out);				

out_ce_delay_1 : ff_ce 
port map (
    reset    => reset,
    clk      => clk, 
    data_in  => out_ce_1,
	 ce       => '1',
    data_out => out_ce_2);
	 
out_ce <= not (out_ce_1 or out_ce_2);
out_ce_1 <= end_func or veto_out;

sequencer_busy <= sequencer_busy_int;

end Behavioral;

