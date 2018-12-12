----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:24:09 12/03/2018 
-- Design Name: 
-- Module Name:    sequencer_v4_top - Behavioral 
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
--this version differs from v3 because the prog_mem_init reg is now getting
--outside of this block
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity sequencer_v4_top is

  port (
    reset           : in  std_logic;    -- syncronus reset
    clk             : in  std_logic;    -- clock
    start_sequence  : in  std_logic;
    program_mem_we  : in  std_logic;
    seq_mem_w_add   : in  std_logic_vector(9 downto 0);
    seq_mem_data_in : in  std_logic_vector(31 downto 0);
    prog_mem_redbk  : out std_logic_vector(31 downto 0);

    program_mem_init_add_in  : in  std_logic_vector(9 downto 0);
    program_mem_init_add_rbk : out std_logic_vector(9 downto 0);

    ind_func_mem_we    : in  std_logic;
    ind_func_mem_redbk : out std_logic_vector(3 downto 0);

    ind_rep_mem_we    : in  std_logic;
    ind_rep_mem_redbk : out std_logic_vector(23 downto 0);

    ind_sub_add_mem_we    : in  std_logic;
    ind_sub_add_mem_redbk : out std_logic_vector(9 downto 0);

    ind_sub_rep_mem_we    : in  std_logic;
    ind_sub_rep_mem_redbk : out std_logic_vector(15 downto 0);

    time_mem_w_en   : in  std_logic;
    time_mem_readbk : out std_logic_vector(15 downto 0);

    out_mem_w_en   : in  std_logic;
    out_mem_readbk : out std_logic_vector(31 downto 0);

    stop_sequence : in std_logic;
    step_sequence : in std_logic;

    op_code_error_reset : in  std_logic;
    op_code_error       : out std_logic;
    op_code_error_add   : out std_logic_vector(9 downto 0);

    sequencer_busy : out std_logic;
    sequencer_out  : out std_logic_vector(31 downto 0);
    end_sequence   : out std_logic
    );

end sequencer_v4_top;

architecture Behavioral of sequencer_v4_top is

  component sequencer_parameter_extractor_top_v4 is
    port (
      clk             : in std_logic;
      reset           : in std_logic;
      start_sequence  : in std_logic;
      program_mem_we  : in std_logic;
      seq_mem_w_add   : in std_logic_vector(9 downto 0);
      seq_mem_data_in : in std_logic_vector(31 downto 0);

      program_mem_init_add_in  : in  std_logic_vector(9 downto 0);
      program_mem_init_add_rbk : out std_logic_vector(9 downto 0);

      ind_func_mem_we    : in  std_logic;
      ind_func_mem_redbk : out std_logic_vector(3 downto 0);

      ind_rep_mem_we    : in  std_logic;
      ind_rep_mem_redbk : out std_logic_vector(23 downto 0);

      ind_sub_add_mem_we    : in  std_logic;
      ind_sub_add_mem_redbk : out std_logic_vector(9 downto 0);

      ind_sub_rep_mem_we    : in  std_logic;
      ind_sub_rep_mem_redbk : out std_logic_vector(15 downto 0);

      fifo_param_re : in std_logic;

      op_code_error_reset : in  std_logic;
      op_code_error       : out std_logic;
      op_code_error_add   : out std_logic_vector(9 downto 0);


      prog_mem_redbk   : out std_logic_vector(31 downto 0);
      fifo_param_empty : out std_logic;
      fifo_param_out   : out std_logic_vector(31 downto 0)
      );
  end component;

  component function_v3_top is
    port (
      reset : in std_logic;             -- syncronus reset
      clk   : in std_logic;             -- clock

      time_mem_w_en   : in  std_logic;
      time_mem_in     : in  std_logic_vector(15 downto 0);
      time_mem_w_add  : in  std_logic_vector(7 downto 0);
      time_mem_readbk : out std_logic_vector(15 downto 0);

      out_mem_w_en   : in  std_logic;
      out_mem_in     : in  std_logic_vector(31 downto 0);
      out_mem_w_add  : in  std_logic_vector(7 downto 0);
      out_mem_readbk : out std_logic_vector(31 downto 0);

      fifo_empty     : in  std_logic;
      fifo_read_en   : out std_logic;
      fifo_param_out : in  std_logic_vector(31 downto 0);

      stop_sequence : in std_logic;
      step_sequence : in std_logic;

      sequencer_busy : out std_logic;
      sequencer_out  : out std_logic_vector(31 downto 0);
      end_sequence   : out std_logic
      );
  end component;


  signal fifo_param_empty : std_logic;
  signal fifo_param_re    : std_logic;
  signal fifo_param_out   : std_logic_vector(31 downto 0);

begin

  sequencer_parameter_extractor_top_v4_0 : sequencer_parameter_extractor_top_v4
    port map (
      clk             => clk,
      reset           => reset,
      start_sequence  => start_sequence,
      program_mem_we  => program_mem_we,
      seq_mem_w_add   => seq_mem_w_add,
      seq_mem_data_in => seq_mem_data_in,

      program_mem_init_add_in  => program_mem_init_add_in,
      program_mem_init_add_rbk => program_mem_init_add_rbk,

      ind_func_mem_we    => ind_func_mem_we,
      ind_func_mem_redbk => ind_func_mem_redbk,

      ind_rep_mem_we    => ind_rep_mem_we,
      ind_rep_mem_redbk => ind_rep_mem_redbk,

      ind_sub_add_mem_we    => ind_sub_add_mem_we,
      ind_sub_add_mem_redbk => ind_sub_add_mem_redbk,

      ind_sub_rep_mem_we    => ind_sub_rep_mem_we,
      ind_sub_rep_mem_redbk => ind_sub_rep_mem_redbk,

      fifo_param_re => fifo_param_re,

      op_code_error_reset => op_code_error_reset,
      op_code_error       => op_code_error,
      op_code_error_add   => op_code_error_add,

      prog_mem_redbk   => prog_mem_redbk,
      fifo_param_empty => fifo_param_empty,
      fifo_param_out   => fifo_param_out
      );

  function_v3_top_0 : function_v3_top
    port map (
      reset => reset,
      clk   => clk,

      time_mem_w_en   => time_mem_w_en,
      time_mem_in     => seq_mem_data_in(15 downto 0),
      time_mem_w_add  => seq_mem_w_add(7 downto 0),
      time_mem_readbk => time_mem_readbk,

      out_mem_w_en   => out_mem_w_en,
      out_mem_in     => seq_mem_data_in,
      out_mem_w_add  => seq_mem_w_add(7 downto 0),
      out_mem_readbk => out_mem_readbk,

      fifo_empty     => fifo_param_empty,
      fifo_read_en   => fifo_param_re,
      fifo_param_out => fifo_param_out,

      stop_sequence => stop_sequence,
      step_sequence => step_sequence,

      sequencer_busy => sequencer_busy,
      sequencer_out  => sequencer_out,
      end_sequence   => end_sequence
      );

end Behavioral;

