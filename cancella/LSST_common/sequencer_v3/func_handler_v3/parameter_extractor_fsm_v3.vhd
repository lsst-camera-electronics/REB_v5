----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:10 06/20/2012 
-- Design Name: 
-- Module Name:    parameter_extractor_fsm_v3 - Behavioral 
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.sequencer_v3_package.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity parameter_extractor_fsm_v3 is

  port (
    clk                  : in  std_logic;
    reset                : in  std_logic;
    start_sequence       : in  std_logic;
    fifo_param_full      : in  std_logic;
	 op_code_error_reset	 : in  std_logic;
    program_mem_data     : in  std_logic_vector(31 downto 0);
    data_from_stack      : in  std_logic_vector(31 downto 0);
	 ind_rep_mem_data_out     : in  std_logic_vector(23 downto 0);
	 ind_sub_add_mem_data_out : in  std_logic_vector (9 downto 0);
	 ind_sub_rep_mem_data_out : in  std_logic_vector (15 downto 0);
    program_mem_init_add : in  std_logic_vector(9 downto 0);
    op_code_error		    : out std_logic;
	 fifo_param_write     : out std_logic;
    sub_stack_w_en       : out std_logic;
	 ind_sub_rep_flag		 : out std_logic;
    fifo_mux_sel         : out std_logic_vector(1 downto 0);
    sub_stack_add        : out std_logic_vector(3 downto 0);
    sub_rep_cnt          : out std_logic_vector(15 downto 0);
    program_mem_add      : out std_logic_vector(9 downto 0)

    );

end parameter_extractor_fsm_v3;

architecture Behavioral of parameter_extractor_fsm_v3 is

  type   state_type is (wait_start, op_code_eval, sub_jump, simple_func_op, ind_func_call, 
							   ind_rep_call, all_ind_call, ind_sub_add_jump, 
--								ind_sub_rep_jump, 
								ind_sub_all_jump,  
								write_fifo, wait_fifo,
								trailer_op, rep_sub, op_code_error_state);
  signal pres_state, next_state : state_type;
  signal next_op_code_error	  : std_logic;
  signal next_fifo_param_write  : std_logic;
  signal next_sub_stack_w_en    : std_logic;
  signal next_ind_sub_rep_flag  : std_logic;
  signal next_fifo_mux_sel      : std_logic_vector(1 downto 0);
  signal next_sub_stack_add     : std_logic_vector(3 downto 0);
  signal next_program_mem_add   : std_logic_vector(9 downto 0);
  signal next_sub_rep_cnt       : std_logic_vector(15 downto 0);



  signal sub_rep_cnt_int     : std_logic_vector(15 downto 0);
  signal sub_stack_add_int   : std_logic_vector(3 downto 0);
  signal program_mem_add_int : std_logic_vector(9 downto 0);
  signal op_code             : std_logic_vector(3 downto 0);
  signal func_call_rep		  : std_logic_vector(23 downto 0);
  signal jump_to_add_rep	  : std_logic_vector(15 downto 0);

  

begin


  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state          <= wait_start;
        op_code_error		 <= '0';
		  fifo_param_write    <= '0';
        sub_stack_w_en      <= '0';
		  ind_sub_rep_flag	 <= '0';
        fifo_mux_sel        <= (others => '0');
        sub_stack_add_int   <= (others => '0');
        program_mem_add_int <= (others => '0');
        sub_rep_cnt_int     <= (others => '0');
        
      else
        pres_state          <= next_state;
        op_code_error		 <= next_op_code_error;
		  fifo_param_write    <= next_fifo_param_write;
        sub_stack_w_en      <= next_sub_stack_w_en;
		  ind_sub_rep_flag	 <= next_ind_sub_rep_flag;
        fifo_mux_sel        <= next_fifo_mux_sel;
        sub_stack_add_int   <= next_sub_stack_add;
        program_mem_add_int <= next_program_mem_add;
        sub_rep_cnt_int     <= next_sub_rep_cnt;

      end if;
    end if;
  end process;

  process (pres_state, start_sequence, op_code, program_mem_data, data_from_stack, fifo_param_full, 
			  program_mem_init_add, sub_stack_add_int, program_mem_add_int, sub_rep_cnt_int, ind_sub_add_mem_data_out, 
			  op_code_error_reset, ind_rep_mem_data_out, func_call_rep, jump_to_add_rep, ind_sub_rep_mem_data_out)
  begin

    -------------------- outputs defoult values --------------------
    
    next_op_code_error	  <= '0';
	 next_fifo_param_write <= '0';
    next_sub_stack_w_en   <= '0';
	 next_ind_sub_rep_flag <= '0';
    next_fifo_mux_sel     <= (others => '0');
    next_sub_stack_add    <= sub_stack_add_int;
    next_program_mem_add  <= program_mem_add_int;
    next_sub_rep_cnt      <= sub_rep_cnt_int;

    case pres_state is
      
      when wait_start =>
        if start_sequence = '0' then
          next_state           <= wait_start;
          next_sub_stack_add   <= (others => '0');
          --next_program_mem_add <= (others => '0');
          next_program_mem_add <= program_mem_init_add;
          next_sub_rep_cnt     <= (others => '0');
        else
          next_state <= op_code_eval;
        end if;
        
      when op_code_eval =>
        if fifo_param_full = '1' then
          next_state <= op_code_eval;
        else
          if op_code = func_call_opcode then
            if func_call_rep	= x"000000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else
					next_state            <= simple_func_op;
--					next_fifo_param_write <= '1';
				end if;
          elsif op_code = ind_func_call_opcode then
				 if func_call_rep	= x"000000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else
					next_state            <= ind_func_call;
--					next_fifo_param_write <= '1';
					next_fifo_mux_sel     <= "01";
				end if;
          elsif op_code = ind_rep_call_opcode then
				if ind_rep_mem_data_out = x"000000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else
					next_state            <= ind_rep_call;
--					next_fifo_param_write <= '1';
					next_fifo_mux_sel     <= "10";
				end if;
          elsif op_code = ind_all_call_opcode then
				if ind_rep_mem_data_out = x"000000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else
					next_state            <= all_ind_call;
--					next_fifo_param_write <= '1';
					next_fifo_mux_sel     <= "11";
				end if;
          elsif op_code = jump_to_add_opcode then
				 if jump_to_add_rep	= x"0000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else
					next_state          <= sub_jump;
					next_sub_rep_cnt    <= sub_rep_cnt_int + 1;
					next_sub_stack_w_en <= '1';
				end if;
          elsif op_code = sub_trailer_opcode then
            next_state         <= trailer_op;
            next_sub_stack_add <= sub_stack_add_int - 1;
			 elsif op_code = ind_add_jump_opcode then
				if jump_to_add_rep	= x"0000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else
					next_state          <= ind_sub_add_jump;
					next_sub_rep_cnt    <= sub_rep_cnt_int + 1;
					next_sub_stack_w_en <= '1';
				end if;
			 elsif op_code = ind_rep_jump_opcode then
				if ind_sub_rep_mem_data_out = x"0000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else			 
					next_state          <= sub_jump;
					next_sub_rep_cnt    <= sub_rep_cnt_int + 1;
					next_sub_stack_w_en <= '1';
					next_ind_sub_rep_flag <= '1';
				end if;
			 elsif op_code = ind_all_jump_opcode then
				if ind_sub_rep_mem_data_out = x"0000" then
					next_state           <= op_code_eval;
					next_program_mem_add <= program_mem_add_int + 1;
				else	
					next_state          <= ind_sub_all_jump;
					next_sub_rep_cnt    <= sub_rep_cnt_int + 1;
					next_sub_stack_w_en <= '1';
					next_ind_sub_rep_flag <= '1';
				end if;
			 elsif op_code = end_sequence_opcode then  -- this opcode is also used in function_executor_v3
            next_state            <= wait_start;
            next_fifo_param_write <= '1';  -- test return to zero
          else
            next_state <= op_code_error_state;
				next_op_code_error	<= '1';
          end if;
        end if;
      
		when simple_func_op =>
        next_state           <= write_fifo;
		  next_fifo_param_write <= '1';
		
      when write_fifo =>
        next_state           <= wait_fifo;
        next_program_mem_add <= program_mem_add_int + 1;
		  
		when wait_fifo => 
		  next_state           <= op_code_eval;
        
      when sub_jump =>
        next_state           <= op_code_eval;
        next_program_mem_add <= program_mem_data(25 downto 16);
        next_sub_stack_add   <= sub_stack_add_int + 1;
        next_sub_rep_cnt     <= (others => '0');

		when ind_sub_add_jump =>
        next_state           <= op_code_eval;
        next_program_mem_add <= ind_sub_add_mem_data_out;
        next_sub_stack_add   <= sub_stack_add_int + 1;
        next_sub_rep_cnt     <= (others => '0');    
    
	   when ind_sub_all_jump =>
        next_state           <= op_code_eval;
        next_program_mem_add <= ind_sub_add_mem_data_out;
        next_sub_stack_add   <= sub_stack_add_int + 1;
        next_sub_rep_cnt     <= (others => '0'); 
	 
      when trailer_op =>
        next_state           <= rep_sub;
        next_program_mem_add <= data_from_stack(29 downto 20);

      when ind_func_call =>
        next_state           <= write_fifo;
		  next_fifo_param_write <= '1';

      when ind_rep_call =>
        next_state           <= write_fifo;
		  next_fifo_param_write <= '1';

      when all_ind_call =>
        next_state           <= write_fifo;
		  next_fifo_param_write <= '1';
        
      when rep_sub =>
        if data_from_stack(30)= '0' then
			if program_mem_data(15 downto 0) = data_from_stack(15 downto 0) then
				next_state       <= write_fifo;
				next_sub_rep_cnt <= (others => '0');
			else
				next_state       <= op_code_eval;
				next_sub_rep_cnt <= data_from_stack(15 downto 0);
			end if;
		else
			if ind_sub_rep_mem_data_out = data_from_stack(15 downto 0) then
				next_state       <= write_fifo;
				next_sub_rep_cnt <= (others => '0');
			else
				next_state       <= op_code_eval;
				next_sub_rep_cnt <= data_from_stack(15 downto 0);
        end if;
		 end if;
		  
		when op_code_error_state =>
			if op_code_error_reset	= '1' then
				next_state		<= wait_start;
			else
				next_state <= op_code_error_state;
				next_op_code_error	<= '1';
         end if;
        
    end case;
  end process;

  sub_stack_add   <= sub_stack_add_int;
  sub_rep_cnt     <= sub_rep_cnt_int;
  program_mem_add <= program_mem_add_int;
  op_code         <= program_mem_data(31 downto 28);
  func_call_rep	<= program_mem_data(23 downto 0);
  jump_to_add_rep	<= program_mem_data(15 downto 0);
  
end Behavioral;

