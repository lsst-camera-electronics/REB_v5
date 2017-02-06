----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:53 04/10/2013 
-- Design Name: 
-- Module Name:    function_v3 - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity function_v3 is

  generic (time_bus_width : integer := 16;
           out_bus_width  : integer := 32;
           time_slice_num : integer := 16;
           function_num   : integer := 15
           );

  port (
    reset          : in std_logic;      -- syncronus reset
    clk            : in std_logic;      -- clock
    start_func     : in std_logic;
    sequencer_busy : in std_logic;

    time_mem_w_en  : in  std_logic;
    time_mem_in    : in  std_logic_vector(time_bus_width-1 downto 0);
    time_mem_w_add : in  std_logic_vector(7 downto 0);
    time_func_add  : in  std_logic_vector(3 downto 0);
--       time_mem_out_1         : out std_logic_vector(time_bus_width-1 downto 0);
    time_mem_out_2 : out std_logic_vector(time_bus_width-1 downto 0);

    out_mem_w_en  : in  std_logic;
    out_mem_in    : in  std_logic_vector(out_bus_width-1 downto 0);
    out_mem_w_add : in  std_logic_vector(7 downto 0);
    out_func_add  : in  std_logic_vector(3 downto 0);
--       out_mem_out_1                  : out std_logic_vector(out_bus_width-1 downto 0);
    out_mem_out_2 : out std_logic_vector(out_bus_width-1 downto 0);

    end_func        : out std_logic;
    signal_out_func : out std_logic_vector(out_bus_width-1 downto 0));

end function_v3;

architecture Behavioral of function_v3 is

  component function_fsm_v3 is
    port (
      reset               : in  std_logic;
      clk                 : in  std_logic;
      start_function      : in  std_logic;
      func_time_in        : in  std_logic_vector(15 downto 0);
      func_time_in_plus1  : in  std_logic_vector(15 downto 0);
      func_time_add       : out std_logic_vector(3 downto 0);
      func_time_add_plus1 : out std_logic_vector(3 downto 0);
      func_out_add        : out std_logic_vector(3 downto 0);
      function_end        : out std_logic
      );
  end component;

--  component generic_dual_port_ram_reg is
--    generic(
--      data_width : integer := 32;
--      add_width  : integer := 8);
--    port (
--      clk            : in  std_logic;
--      ram_wr_en      : in  std_logic;   -- data in
--      ram_wr_add     : in  std_logic_vector(add_width-1 downto 0);
--      ram_rd_add     : in  std_logic_vector(add_width-1 downto 0);
--      ram_data_in    : in  std_logic_vector(data_width-1 downto 0);
--      ram_data_out_1 : out std_logic_vector(data_width-1 downto 0);
--      ram_data_out_2 : out std_logic_vector(data_width-1 downto 0)
--      );          
--  end component;

COMPONENT dual_port_ram_8_16
  PORT (
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    d : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    dpra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    dpo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

COMPONENT dual_port_ram_8_32
  PORT (
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    dpra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clk : IN STD_LOGIC;
    we : IN STD_LOGIC;
    spo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    dpo : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

--  component generic_dual_port_ram is
--    generic(
--      data_width : integer := 32;
--      add_width  : integer := 8);
--    port (
--      clk            : in  std_logic;
--      ram_wr_en      : in  std_logic;   -- data in
--      ram_wr_add     : in  std_logic_vector(add_width-1 downto 0);
--      ram_rd_add     : in  std_logic_vector(add_width-1 downto 0);
--      ram_data_in    : in  std_logic_vector(data_width-1 downto 0);
--      ram_data_out_1 : out std_logic_vector(data_width-1 downto 0);
--      ram_data_out_2 : out std_logic_vector(data_width-1 downto 0)
--      );          
--  end component;

  component mux_2_1_bus_noclk is
    generic (bus_width : integer := 4);
    port (
      selector : in std_logic;
      bus_in_0 : in std_logic_vector(bus_width-1 downto 0);
      bus_in_1 : in std_logic_vector(bus_width-1 downto 0);

      bus_out : out std_logic_vector(bus_width-1 downto 0)
      );
  end component;


  signal time_add_timeslice       : std_logic_vector(3 downto 0);
  signal time_add_timeslice_plus1 : std_logic_vector(3 downto 0);
  signal out_add_timeslice        : std_logic_vector(3 downto 0);
  signal time_bus_int             : std_logic_vector(15 downto 0);
  signal time_bus_2_int           : std_logic_vector(15 downto 0);
  signal time_add_w_mux           : std_logic_vector(7 downto 0);
  signal time_add_plus1           : std_logic_vector(7 downto 0);
  signal time_add_read            : std_logic_vector(7 downto 0);
  signal out_add_read             : std_logic_vector(7 downto 0);

begin


  function_fsm_v3_0 : function_fsm_v3
    port map (
      reset               => reset,
      clk                 => clk,
      start_function      => start_func,
      func_time_in        => time_bus_int,
      func_time_in_plus1  => time_bus_2_int,
      func_time_add       => time_add_timeslice,
      func_time_add_plus1 => time_add_timeslice_plus1,
      func_out_add        => out_add_timeslice,
      function_end        => end_func
      );

  time_add_mux : mux_2_1_bus_noclk
    generic map (bus_width => 8)
    port map (
      selector => sequencer_busy,
      bus_in_0 => time_mem_w_add,
      bus_in_1 => time_add_plus1,

      bus_out => time_add_w_mux
      );

--  time_mem : generic_dual_port_ram
--    generic map(data_width => 16,
--                add_width  => 8)
--    port map (
--      clk            => clk,            -- clock
--      ram_wr_en      => time_mem_w_en,
--      ram_wr_add     => time_add_w_mux,
--      ram_rd_add     => time_add_read,
--      ram_data_in    => time_mem_in,
--      ram_data_out_1 => time_bus_int,
--      ram_data_out_2 => time_bus_2_int
--      );       

time_mem : dual_port_ram_8_16
  PORT MAP (
    a => time_add_w_mux,
    d => time_mem_in,
    dpra => time_add_read,
    clk => clk,
    we => time_mem_w_en,
    spo => time_bus_2_int,
    dpo => time_bus_int
  );

--  out_mem : generic_dual_port_ram
--    generic map(data_width => 32,
--                add_width  => 8)
--    port map (
--      clk            => clk,            -- clock
--      ram_wr_en      => out_mem_w_en,
--      ram_wr_add     => out_mem_w_add,
--      ram_rd_add     => out_add_read,
--      ram_data_in    => out_mem_in,
--      ram_data_out_1 => signal_out_func,
--      ram_data_out_2 => out_mem_out_2
--      );       

out_mem : dual_port_ram_8_32
  PORT MAP (
    a => out_mem_w_add,
    d => out_mem_in,
    dpra => out_add_read,
    clk => clk,
    we => out_mem_w_en,
    spo => out_mem_out_2,
    dpo => signal_out_func
  );


  time_mem_out_2 <= time_bus_2_int;
  time_add_plus1 <= time_func_add & time_add_timeslice_plus1;
  time_add_read  <= time_func_add & time_add_timeslice;
  out_add_read   <= out_func_add & out_add_timeslice;

end Behavioral;

