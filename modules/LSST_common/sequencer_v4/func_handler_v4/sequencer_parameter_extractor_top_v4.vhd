----------------------------------------------------------------------------------
-- Company: 
-- Engineer:  
-- 
-- Create Date:    17:09:59 06/21/2012 
-- Design Name: 
-- Module Name:    sequencer_parameter_extractor_v4 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sequencer_parameter_extractor_top_v4 is

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

end sequencer_parameter_extractor_top_v4;

architecture Behavioral of sequencer_parameter_extractor_top_v4 is


  component parameter_extractor_fsm_v3 is
    port (
      clk                      : in  std_logic;
      reset                    : in  std_logic;
      start_sequence           : in  std_logic;
      fifo_param_full          : in  std_logic;
      op_code_error_reset      : in  std_logic;
      program_mem_data         : in  std_logic_vector(31 downto 0);
      data_from_stack          : in  std_logic_vector(31 downto 0);
      ind_rep_mem_data_out     : in  std_logic_vector(23 downto 0);
      ind_sub_add_mem_data_out : in  std_logic_vector (9 downto 0);
      ind_sub_rep_mem_data_out : in  std_logic_vector (15 downto 0);
      program_mem_init_add     : in  std_logic_vector(9 downto 0);
      op_code_error            : out std_logic;
      fifo_param_write         : out std_logic;
      sub_stack_w_en           : out std_logic;
      ind_sub_rep_flag         : out std_logic;
      fifo_mux_sel             : out std_logic_vector(1 downto 0);
      sub_stack_add            : out std_logic_vector(3 downto 0);
      sub_rep_cnt              : out std_logic_vector(15 downto 0);
      program_mem_add          : out std_logic_vector(9 downto 0)
      );
  end component;

  component generic_single_port_ram is
    generic(
      data_width : integer;
      add_width  : integer);
    port (
      clk          : in  std_logic;                                 -- clock
      ram_wr_en    : in  std_logic;                                 -- data in
      ram_add      : in  std_logic_vector(add_width-1 downto 0);
      ram_data_in  : in  std_logic_vector(data_width-1 downto 0);
      ram_data_out : out std_logic_vector(data_width-1 downto 0));  -- data out
  end component;

  component generic_dual_port_ram is
    generic(
      data_width : integer := 32;
      add_width  : integer := 8);
    port (
      clk            : in  std_logic;   -- clock
      ram_wr_en      : in  std_logic;   -- data in
      ram_wr_add     : in  std_logic_vector(add_width-1 downto 0);
      ram_rd_add     : in  std_logic_vector(add_width-1 downto 0);
      ram_data_in    : in  std_logic_vector(data_width-1 downto 0);
      ram_data_out_1 : out std_logic_vector(data_width-1 downto 0);
      ram_data_out_2 : out std_logic_vector(data_width-1 downto 0)
      );          
  end component;

  component dual_port_ram_ip
    port (
      a    : in  std_logic_vector(9 downto 0);
      d    : in  std_logic_vector(31 downto 0);
      dpra : in  std_logic_vector(9 downto 0);
      clk  : in  std_logic;
      we   : in  std_logic;
      spo  : out std_logic_vector(31 downto 0);
      dpo  : out std_logic_vector(31 downto 0)
      );
  end component;

  component dual_port_ram_4_4
    port (
      a    : in  std_logic_vector(3 downto 0);
      d    : in  std_logic_vector(3 downto 0);
      dpra : in  std_logic_vector(3 downto 0);
      clk  : in  std_logic;
      we   : in  std_logic;
      spo  : out std_logic_vector(3 downto 0);
      dpo  : out std_logic_vector(3 downto 0)
      );
  end component;

  component dual_port_ram_24_4
    port (
      a    : in  std_logic_vector(3 downto 0);
      d    : in  std_logic_vector(23 downto 0);
      dpra : in  std_logic_vector(3 downto 0);
      clk  : in  std_logic;
      we   : in  std_logic;
      spo  : out std_logic_vector(23 downto 0);
      dpo  : out std_logic_vector(23 downto 0)
      );
  end component;

  component dual_port_ram_10_4
    port (
      a    : in  std_logic_vector(3 downto 0);
      d    : in  std_logic_vector(9 downto 0);
      dpra : in  std_logic_vector(3 downto 0);
      clk  : in  std_logic;
      we   : in  std_logic;
      spo  : out std_logic_vector(9 downto 0);
      dpo  : out std_logic_vector(9 downto 0)
      );
  end component;

  component dual_port_ram_16_4
    port (
      a    : in  std_logic_vector(3 downto 0);
      d    : in  std_logic_vector(15 downto 0);
      dpra : in  std_logic_vector(3 downto 0);
      clk  : in  std_logic;
      we   : in  std_logic;
      spo  : out std_logic_vector(15 downto 0);
      dpo  : out std_logic_vector(15 downto 0)
      );
  end component;


  component seq_param_fifo_v3
    port (
      clk   : in  std_logic;
      srst  : in  std_logic;
      din   : in  std_logic_vector(31 downto 0);
      wr_en : in  std_logic;
      rd_en : in  std_logic;
      dout  : out std_logic_vector(31 downto 0);
      full  : out std_logic;
      empty : out std_logic
      );
  end component;

  component generic_reg_ce_init is
    generic (width : integer := 15);
    port (
      reset    : in  std_logic;         -- syncronus reset
      clk      : in  std_logic;         -- clock
      ce       : in  std_logic;         -- clock enable
      init     : in  std_logic;  -- signal to reset the reg (active high)
      data_in  : in  std_logic_vector(width downto 0);   -- data in
      data_out : out std_logic_vector(width downto 0));  -- data out
  end component;

  component generic_mux_bus_4_1_clk
    generic (
      width : integer := 32);
    port (
      reset    : in  std_logic;
      clk      : in  std_logic;
      selector : in  std_logic_vector(1 downto 0);
      bus_in_0 : in  std_logic_vector(width-1 downto 0);
      bus_in_1 : in  std_logic_vector(width-1 downto 0);
      bus_in_2 : in  std_logic_vector(width-1 downto 0);
      bus_in_3 : in  std_logic_vector(width-1 downto 0);
      bus_out  : out std_logic_vector(width-1 downto 0));
  end component;

  component ff_ce
    port (
      reset    : in  std_logic;
      clk      : in  std_logic;
      data_in  : in  std_logic;
      ce       : in  std_logic;
      data_out : out std_logic);
  end component;

  signal fifo_param_full          : std_logic;
  signal prog_mem_data_out        : std_logic_vector(31 downto 0);
  signal data_from_stack          : std_logic_vector(31 downto 0);
  signal fifo_param_we            : std_logic;
  signal fifo_param_we_reg        : std_logic;
  signal sub_stack_w_en           : std_logic;
  signal ind_sub_rep_flag         : std_logic;
  signal sub_stack_add            : std_logic_vector(3 downto 0);
  signal program_mem_rd_add       : std_logic_vector(9 downto 0);
  signal stack_data_in            : std_logic_vector(31 downto 0);
  signal sub_rep_cnt              : std_logic_vector(15 downto 0);
  signal program_mem_init_add_int : std_logic_vector(9 downto 0);
  signal ind_func_mem_data_out    : std_logic_vector(3 downto 0);
  signal ind_rep_mem_data_out     : std_logic_vector(23 downto 0);
  signal ind_sub_add_mem_data_out : std_logic_vector(9 downto 0);
  signal ind_sub_rep_mem_data_out : std_logic_vector(15 downto 0);
  signal fifo_in_mux_sel          : std_logic_vector(1 downto 0);
  signal prog_mem_rep_ind         : std_logic_vector(31 downto 0);
  signal prog_mem_func_ind        : std_logic_vector(31 downto 0);
  signal prog_mem_all_ind         : std_logic_vector(31 downto 0);
  signal fifo_in_bus              : std_logic_vector(31 downto 0);


begin

  parameter_extractor_fsm_v3_0 : parameter_extractor_fsm_v3
    port map (
      clk                      => clk,
      reset                    => reset,
      start_sequence           => start_sequence,
      fifo_param_full          => fifo_param_full,
      op_code_error_reset      => op_code_error_reset,
      program_mem_data         => prog_mem_data_out,
      data_from_stack          => data_from_stack,
      ind_rep_mem_data_out     => ind_rep_mem_data_out,
      ind_sub_add_mem_data_out => ind_sub_add_mem_data_out,
      ind_sub_rep_mem_data_out => ind_sub_rep_mem_data_out,
      op_code_error            => op_code_error,
      program_mem_init_add     => program_mem_init_add_int,
      fifo_param_write         => fifo_param_we,
      sub_stack_w_en           => sub_stack_w_en,
      ind_sub_rep_flag         => ind_sub_rep_flag,
      fifo_mux_sel             => fifo_in_mux_sel,
      sub_stack_add            => sub_stack_add,
      sub_rep_cnt              => sub_rep_cnt,
      program_mem_add          => program_mem_rd_add
      );

  function_stack : generic_single_port_ram
    generic map(
      data_width => 32,
      add_width  => 4)
    port map (
      clk          => clk,
      ram_wr_en    => sub_stack_w_en,
      ram_add      => sub_stack_add,
      ram_data_in  => stack_data_in,
      ram_data_out => data_from_stack); 

--  program_memory : generic_dual_port_ram
--    generic map (
--      data_width => 32,
--      add_width  => 10)
--    port map (
--      clk            => clk,
--      ram_wr_en      => program_mem_we,
--      ram_wr_add     => seq_mem_w_add,
--      ram_rd_add     => program_mem_rd_add,
--      ram_data_in    => seq_mem_data_in,
--      ram_data_out_1 => prog_mem_data_out,
--      ram_data_out_2 => prog_mem_redbk);
  
  program_memory : dual_port_ram_ip
    port map (
      a    => seq_mem_w_add,
      d    => seq_mem_data_in,
      dpra => program_mem_rd_add,
      clk  => clk,
      we   => program_mem_we,
      spo  => prog_mem_redbk,
      dpo  => prog_mem_data_out
      );

--  indirect_func_mem : generic_dual_port_ram
--    generic map (
--      data_width => 4,
--      add_width  => 4)
--    port map (
--      clk            => clk,
--      ram_wr_en      => ind_func_mem_we,
--      ram_wr_add     => seq_mem_w_add(3 downto 0),
--      ram_rd_add     => prog_mem_data_out(27 downto 24),
--      ram_data_in    => seq_mem_data_in(3 downto 0),
--      ram_data_out_1 => ind_func_mem_data_out,
--      ram_data_out_2 => ind_func_mem_redbk); 
  
  indirect_func_mem : dual_port_ram_4_4
    port map (
      a    => seq_mem_w_add(3 downto 0),
      d    => seq_mem_data_in(3 downto 0),
      dpra => prog_mem_data_out(27 downto 24),
      clk  => clk,
      we   => ind_func_mem_we,
      spo  => ind_func_mem_redbk,
      dpo  => ind_func_mem_data_out
      );

--  indirect_rep_mem : generic_dual_port_ram
--    generic map (
--      data_width => 24,
--      add_width  => 4)
--    port map (
--      clk            => clk,
--      ram_wr_en      => ind_rep_mem_we,
--      ram_wr_add     => seq_mem_w_add(3 downto 0),
--      ram_rd_add     => prog_mem_data_out(3 downto 0),
--      ram_data_in    => seq_mem_data_in(23 downto 0),
--      ram_data_out_1 => ind_rep_mem_data_out,
--      ram_data_out_2 => ind_rep_mem_redbk); 
  
  
  indirect_rep_mem : dual_port_ram_24_4
    port map (
      a    => seq_mem_w_add(3 downto 0),
      d    => seq_mem_data_in(23 downto 0),
      dpra => prog_mem_data_out(3 downto 0),
      clk  => clk,
      we   => ind_rep_mem_we,
      spo  => ind_rep_mem_redbk,
      dpo  => ind_rep_mem_data_out
      );






  generic_mux_bus_4_1_clk_0 : generic_mux_bus_4_1_clk
    generic map (
      width => 32)
    port map (
      reset    => reset,
      clk      => clk,
      selector => fifo_in_mux_sel,
      bus_in_0 => prog_mem_data_out,
      bus_in_1 => prog_mem_func_ind,
      bus_in_2 => prog_mem_rep_ind,
      bus_in_3 => prog_mem_all_ind,
      bus_out  => fifo_in_bus);

--  ff_ce_1 : ff_ce
--    port map (
--      reset    => reset,
--      clk      => clk,
--      data_in  => fifo_param_we,
--      ce       => '1',
--      data_out => fifo_param_we_reg);

  fifo_param_we_reg <= fifo_param_we;

-- indirect_sub_add_mem : generic_dual_port_ram
--    generic map (
--      data_width => 10,
--      add_width  => 4)
--    port map (
--      clk            => clk,
--      ram_wr_en      => ind_sub_add_mem_we,
--      ram_wr_add     => seq_mem_w_add(3 downto 0),
--      ram_rd_add     => prog_mem_data_out(19 downto 16),
--      ram_data_in    => seq_mem_data_in(9 downto 0),
--      ram_data_out_1 => ind_sub_add_mem_data_out,
--      ram_data_out_2 => ind_sub_add_mem_redbk); 

  indirect_sub_add_mem : dual_port_ram_10_4
    port map (
      a    => seq_mem_w_add(3 downto 0),
      d    => seq_mem_data_in(9 downto 0),
      dpra => prog_mem_data_out(19 downto 16),
      clk  => clk,
      we   => ind_sub_add_mem_we,
      spo  => ind_sub_add_mem_redbk,
      dpo  => ind_sub_add_mem_data_out
      );



--  indirect_sub_rep_mem : generic_dual_port_ram
--    generic map (
--      data_width => 16,
--      add_width  => 4)
--    port map (
--      clk            => clk,
--      ram_wr_en      => ind_sub_rep_mem_we,
--      ram_wr_add     => seq_mem_w_add(3 downto 0),
--      ram_rd_add     => prog_mem_data_out(3 downto 0),
--      ram_data_in    => seq_mem_data_in(15 downto 0),
--      ram_data_out_1 => ind_sub_rep_mem_data_out,
--      ram_data_out_2 => ind_sub_rep_mem_redbk); 


  indirect_sub_rep_mem : dual_port_ram_16_4
    port map (
      a    => seq_mem_w_add(3 downto 0),
      d    => seq_mem_data_in(15 downto 0),
      dpra => prog_mem_data_out(3 downto 0),
      clk  => clk,
      we   => ind_sub_rep_mem_we,
      spo  => ind_sub_rep_mem_redbk,
      dpo  => ind_sub_rep_mem_data_out
      );



  seq_param_fifo_v3_0 : seq_param_fifo_v3
    port map (
      clk   => clk,
      srst  => reset,
      din   => fifo_in_bus,
      wr_en => fifo_param_we_reg,
      rd_en => fifo_param_re,
      dout  => fifo_param_out,
      full  => fifo_param_full,
      empty => fifo_param_empty
      );

  --prog_mem_init_add_reg : generic_reg_ce_init
  --  generic map (width => 9)
  --  port map (
  --    reset    => reset,
  --    clk      => clk,
  --    ce       => program_mem_init_en,
  --    init     => '0',
  --    data_in  => seq_mem_data_in(9 downto 0),
  --    data_out => program_mem_init_add_int);

  program_mem_init_add_int <= program_mem_init_add_in;
  program_mem_init_add_rbk <= program_mem_init_add_int;

--stack_data_in <= program_mem_rd_add & prog_mem_data_out(17 downto 0);
  stack_data_in <= '0' & ind_sub_rep_flag & program_mem_rd_add & x"0" & sub_rep_cnt;

  prog_mem_rep_ind  <= prog_mem_data_out(31 downto 24) & ind_rep_mem_data_out;
  prog_mem_func_ind <= prog_mem_data_out(31 downto 28) & ind_func_mem_data_out & prog_mem_data_out(23 downto 0);
  prog_mem_all_ind  <= prog_mem_data_out(31 downto 28) & ind_func_mem_data_out & ind_rep_mem_data_out;

  op_code_error_add <= program_mem_rd_add;
  
end Behavioral;

