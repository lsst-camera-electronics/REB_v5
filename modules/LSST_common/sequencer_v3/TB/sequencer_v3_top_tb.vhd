-------------------------------------------------------------------------------
-- Title      : Testbench for design "sequencer_v3_top"
-- Project    : pippo
-------------------------------------------------------------------------------
-- File       : sequencer_v3_top_tb.vhd
-- Author     :   <srusso@lpnws5166.in2p3.fr>
-- Company    : 
-- Created    : 2014-08-06
-- Last update: 2014-08-07
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2014 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2014-08-06  1.0      srusso  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.sequencer_v3_package.all;

-------------------------------------------------------------------------------

entity sequencer_v3_top_tb is

end sequencer_v3_top_tb;

-------------------------------------------------------------------------------

architecture testbench of sequencer_v3_top_tb is

  component sequencer_v3_top
    port (
      reset                    : in  std_logic;
      clk                      : in  std_logic;
      start_sequence           : in  std_logic;
      program_mem_we           : in  std_logic;
      seq_mem_w_add            : in  std_logic_vector(9 downto 0);
      seq_mem_data_in          : in  std_logic_vector(31 downto 0);
      prog_mem_redbk           : out std_logic_vector(31 downto 0);
      program_mem_init_en      : in  std_logic;
      program_mem_init_add_rbk : out std_logic_vector(9 downto 0);
      ind_func_mem_we          : in  std_logic;
      ind_func_mem_redbk       : out std_logic_vector(3 downto 0);
      ind_rep_mem_we           : in  std_logic;
      ind_rep_mem_redbk        : out std_logic_vector(23 downto 0);
      ind_sub_add_mem_we    	 : in  std_logic;
		ind_sub_add_mem_redbk 	 : out std_logic_vector(9 downto 0);
		ind_sub_rep_mem_we    	 : in  std_logic;
		ind_sub_rep_mem_redbk 	 : out std_logic_vector(15 downto 0);
		time_mem_w_en            : in  std_logic;
      time_mem_readbk          : out std_logic_vector(15 downto 0);
      out_mem_w_en             : in  std_logic;
      out_mem_readbk           : out std_logic_vector(31 downto 0);
      stop_sequence            : in  std_logic;
      step_sequence            : in  std_logic;
      op_code_error_reset		 : in  std_logic;
      op_code_error		   	 : out std_logic;
		op_code_error_add			 : out std_logic_vector(9 downto 0);
		sequencer_busy           : out std_logic;
      sequencer_out            : out std_logic_vector(31 downto 0);
      end_sequence             : out std_logic);
  end component;

  signal reset               : std_logic                     := '1';
  signal clk                 : std_logic                     := '0';
  signal start_sequence      : std_logic                     := '0';
  signal program_mem_we      : std_logic                     := '0';
  signal seq_mem_w_add       : std_logic_vector(9 downto 0)  := (others => '0');
  signal seq_mem_data_in     : std_logic_vector(31 downto 0) := (others => '0');
  signal program_mem_init_en : std_logic                     := '0';
  signal ind_func_mem_we     : std_logic                     := '0';
  signal ind_rep_mem_we      : std_logic                     := '0';
  signal ind_sub_add_mem_we  : std_logic							 := '0';
  signal ind_sub_rep_mem_we  : std_logic							 := '0';
  signal time_mem_w_en       : std_logic                     := '0';


  signal out_mem_w_en : std_logic := '0';

  signal op_code_error_reset	: std_logic := '0';

  signal stop_sequence : std_logic := '0';
  signal step_sequence : std_logic := '0';

  --Outputs
  signal prog_mem_redbk           : std_logic_vector(31 downto 0);
  signal program_mem_init_add_rbk : std_logic_vector(9 downto 0);
  signal ind_func_mem_redbk       : std_logic_vector(3 downto 0);
  signal ind_rep_mem_redbk        : std_logic_vector(23 downto 0);
  signal ind_sub_add_mem_redbk 	 : std_logic_vector(9 downto 0);
  signal ind_sub_rep_mem_redbk 	 : std_logic_vector(15 downto 0);
  signal time_mem_readbk          : std_logic_vector(15 downto 0);
  signal out_mem_readbk           : std_logic_vector(31 downto 0);
  signal sequencer_out            : std_logic_vector(31 downto 0);
  signal end_sequence             : std_logic;
  signal sequencer_busy           : std_logic;
  signal op_code_error		   	 : std_logic;
  signal op_code_error_add			 : std_logic_vector(9 downto 0);

  constant clk_period : time := 10 ns;


begin  -- testbench

  -- component instantiation
  DUT : sequencer_v3_top
    port map (
      reset                    => reset,
      clk                      => clk,
      start_sequence           => start_sequence,
      program_mem_we           => program_mem_we,
      seq_mem_w_add            => seq_mem_w_add,
      seq_mem_data_in          => seq_mem_data_in,
      prog_mem_redbk           => prog_mem_redbk,
      program_mem_init_en      => program_mem_init_en,
      program_mem_init_add_rbk => program_mem_init_add_rbk,
      ind_func_mem_we          => ind_func_mem_we,
      ind_func_mem_redbk       => ind_func_mem_redbk,
      ind_rep_mem_we           => ind_rep_mem_we,
      ind_rep_mem_redbk        => ind_rep_mem_redbk,
      ind_sub_add_mem_we    	 => ind_sub_add_mem_we,
		ind_sub_add_mem_redbk 	 => ind_sub_add_mem_redbk,
		ind_sub_rep_mem_we    	 => ind_sub_rep_mem_we,
		ind_sub_rep_mem_redbk 	 => ind_sub_rep_mem_redbk,
		time_mem_w_en            => time_mem_w_en,
      time_mem_readbk          => time_mem_readbk,
      out_mem_w_en             => out_mem_w_en,
      out_mem_readbk           => out_mem_readbk,
      stop_sequence            => stop_sequence,
      step_sequence            => step_sequence,
      op_code_error_reset		 => op_code_error_reset,
      op_code_error		   	 => op_code_error,
		op_code_error_add			 => op_code_error_add,
		sequencer_busy           => sequencer_busy,
      sequencer_out            => sequencer_out,
      end_sequence             => end_sequence);

  -- clock generation
  Clk <= not Clk after clk_period/2;

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here

    reset <= '1';
    -- hold reset state for 100 ns.
    wait for 100 ns;

    wait for clk_period*10;

    -- insert stimulus here 


    reset <= '0';

    wait for 200 ns;

    -- set up sequencer
    --default state
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"ffff_ffff";
    seq_mem_w_add   <= "00" & x"00";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";


    -- function 1
    -- time slice 0
    wait for clk_period*2;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"1000_0032";
    seq_mem_w_add   <= "00" & x"10";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0020";
    seq_mem_w_add   <= "00" & x"10";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';

    -- time slice 1
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"1100_0010";
    seq_mem_w_add   <= "00" & x"11";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"000a";
    seq_mem_w_add   <= "00" & x"11";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';

    -- time slice 2
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"1200_0032";
    seq_mem_w_add   <= "00" & x"12";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0020";
    seq_mem_w_add   <= "00" & x"12";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';

    -- time slice 3
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"1300_0010";
    seq_mem_w_add   <= "00" & x"13";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"000a";
    seq_mem_w_add   <= "00" & x"13";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- function 2
    -- time slice 0
    wait for clk_period*2;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0011";
    seq_mem_w_add   <= "00" & x"20";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0032";
    seq_mem_w_add   <= "00" & x"20";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- time slice 1
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0020";
    seq_mem_w_add   <= "00" & x"21";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0032";
    seq_mem_w_add   <= "00" & x"21";
    wait for clk_period*2;

    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- time slice 2
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0032";
    seq_mem_w_add   <= "00" & x"22";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0032";
    seq_mem_w_add   <= "00" & x"22";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- time slice 3
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0100";
    seq_mem_w_add   <= "00" & x"23";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"1388";
    seq_mem_w_add   <= "00" & x"23";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- time slice 4
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0200";
    seq_mem_w_add   <= "00" & x"24";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"1388";
    seq_mem_w_add   <= "00" & x"24";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- time slice 5
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0400";
    seq_mem_w_add   <= "00" & x"25";
    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"1388";
    seq_mem_w_add   <= "00" & x"25";

    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- time slice 6
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0800";
    seq_mem_w_add   <= "00" & x"26";

    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"1388";
    seq_mem_w_add   <= "00" & x"26";

    wait for clk_period*2;


    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';



    -- function 3
    -- time slice 0             
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"3000_0032";
    seq_mem_w_add   <= "00" & x"30";

    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0020";
    seq_mem_w_add   <= "00" & x"30";

    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


    -- time slice 1             
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"3100_0001";
    seq_mem_w_add   <= "00" & x"31";

    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0001";
    seq_mem_w_add   <= "00" & x"31";
    wait for clk_period*2;

    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';

    -- time slice 2             
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"3200_0002";
    seq_mem_w_add   <= "00" & x"32";

    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0002";
    seq_mem_w_add   <= "00" & x"32";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';

    -- time slice 3             
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"3300_0010";
    seq_mem_w_add   <= "00" & x"33";

    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"000a";
    seq_mem_w_add   <= "00" & x"33";
    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';


   -- function 4
    -- time slice 0             
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"40";

    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0002";
    seq_mem_w_add   <= "00" & x"40";

    wait for clk_period*2;
    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';

    -- time slice 1             
    wait for clk_period*5;
    out_mem_w_en    <= '1';
    seq_mem_data_in <= x"FFFF_FFFF";
    seq_mem_w_add   <= "00" & x"41";

    wait for clk_period*2;
    out_mem_w_en    <= '0';
    time_mem_w_en   <= '1';
    seq_mem_data_in <= x"0000" & x"0001";
    seq_mem_w_add   <= "00" & x"41";
    wait for clk_period*2;

    seq_mem_data_in <= x"0000_0000";
    seq_mem_w_add   <= "00" & x"00";
    time_mem_w_en   <= '0';




-- write program mem

--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"11000002";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"01";
--    seq_mem_data_in <= x"f0000000";
--
--
--    -- sequencer trigger
--    wait for clk_period*20;
--    start_sequence <= '1';
--
--    wait for clk_period*2;
--    start_sequence <= '0';
--
--    wait for 10 us;
--
--    -- test prog mem init
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"01";
--    seq_mem_data_in <= x"00000000";
--
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"05";
--    seq_mem_data_in <= x"11000002";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"06";
--    seq_mem_data_in <= x"f0000000";
--
--    wait for clk_period;
--    program_mem_we  <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--
--    -- set start add at 5
--
--    program_mem_init_en <= '1';
--    seq_mem_data_in     <= x"0000000" & x"5";
--    wait for clk_period;
--    program_mem_init_en <= '0';
--    seq_mem_data_in     <= x"0000000" & x"0";
--
--    -- sequencer trigger
--    wait for clk_period*20;
--    start_sequence <= '1';
--
--    wait for clk_period*2;
--    start_sequence <= '0';
--
--    -- test indirect function call
--
--    wait for 10 us;
--
--    ind_func_mem_we <= '1';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000001";
--    wait for 100 ns;
--    ind_func_mem_we <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"05";
--    seq_mem_data_in <= x"40000002";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"06";
--    seq_mem_data_in <= x"f0000000";
--
--    wait for clk_period;
--    program_mem_we  <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--
--    -- sequencer trigger
--    wait for clk_period*20;
--    start_sequence <= '1';
--
--    wait for clk_period*2;
--    start_sequence <= '0';
--
---- test double start 
--
--wait for 10 us;
--
---- sequencer trigger
--    wait for clk_period*20;
--    start_sequence <= '1';
--
--    wait for clk_period*2;
--    start_sequence <= '0';
--	 
---- test indirect repetition
--
-- wait for 10 us;
--
--    ind_rep_mem_we <= '1';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000003";
--    wait for 100 ns;
--    ind_rep_mem_we <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"05";
--    seq_mem_data_in <= x"53000000";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"06";
--    seq_mem_data_in <= x"f0000000";
--
--    wait for clk_period;
--    program_mem_we  <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--
--    -- sequencer trigger
--    wait for clk_period*20;
--    start_sequence <= '1';
--
--    wait for clk_period*2;
--    start_sequence <= '0';
--
---- test program mem start @ 0 & all indirect
--
--	 wait for 10 us;
--	 program_mem_init_en <= '1';
--    seq_mem_data_in     <= x"0000000" & x"0";
--    wait for clk_period;
--    program_mem_init_en <= '0';
--    seq_mem_data_in     <= x"0000000" & x"0";
--	 
--	 wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"65000003";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"01";
--    seq_mem_data_in <= x"f0000000";
--
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"05";
--    seq_mem_data_in <= x"00000000";
--
--    wait for 100 ns;
--    program_mem_we  <= '1';
--    seq_mem_w_add   <= "00" & x"06";
--    seq_mem_data_in <= x"00000000";
--
--    wait for clk_period;
--    program_mem_we  <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--	 
--	 wait for 100 ns;
--	 ind_func_mem_we <= '1';
--    seq_mem_w_add   <= "00" & x"05";
--    seq_mem_data_in <= x"00000001";
--    wait for 100 ns;
--    ind_func_mem_we <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--	 
--	 wait for 100 ns;
--	 ind_rep_mem_we <= '1';
--    seq_mem_w_add   <= "00" & x"03";
--    seq_mem_data_in <= x"00000005";
--    wait for 100 ns;
--    ind_rep_mem_we <= '0';
--    seq_mem_w_add   <= "00" & x"00";
--    seq_mem_data_in <= x"00000000";
--	 
--	 -- sequencer trigger
--    wait for clk_period*20;
--    start_sequence <= '1';
--
--    wait for clk_period*2;
--    start_sequence <= '0';

wait for 10 us;
-- test op code error


-- test indirect simple subroutine
 wait for 100 ns;
              program_mem_we <= '1';
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= func_call_opcode & x"1000002";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"01"; 
              seq_mem_data_in <= end_sequence_opcode & x"0000000";


 -- sequencer trigger
    wait for clk_period*20;
    start_sequence <= '1';

    wait for clk_period*2;
    start_sequence <= '0';

wait for 100 us;


-- test indirect simple subroutine
 wait for 100 ns;
              program_mem_we <= '1';
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= func_call_opcode & x"1000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"01"; -- jump to add A indirect
              seq_mem_data_in <= ind_all_jump_opcode & x"0010001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"02";
              seq_mem_data_in <= end_sequence_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0A";
              seq_mem_data_in <= func_call_opcode & x"3000003";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0B";
              seq_mem_data_in <= x"a" & x"0000000";
--              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0D";
              seq_mem_data_in <= ind_all_call_opcode & x"2000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0E";
              seq_mem_data_in <= func_call_opcode & x"1000002";

              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0F";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
				  wait for clk_period;
				  program_mem_we <= '0';
				  seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= x"00000000";

wait for 100 ns;
	 ind_sub_add_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"0000000A";
    wait for 100 ns;
    ind_sub_add_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
              
wait for 100 ns;
	 ind_sub_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"00000005";
    wait for 100 ns;
    ind_sub_add_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";


 -- sequencer trigger
    wait for clk_period*20;
    start_sequence <= '1';

    wait for clk_period*2;
    start_sequence <= '0';
              
wait for 30 us;

op_code_error_reset <= '1';
wait for 100 ns;
op_code_error_reset <= '0';

-- test indirect simple subroutine
 wait for 100 ns;
              program_mem_we <= '1';
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= func_call_opcode & x"1000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"01"; -- jump to add A indirect
              seq_mem_data_in <= ind_all_jump_opcode & x"0010000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"02";
              seq_mem_data_in <= end_sequence_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0A";
              seq_mem_data_in <= func_call_opcode & x"3000003";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0B";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0D";
              seq_mem_data_in <= ind_all_call_opcode & x"2000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0E";
              seq_mem_data_in <= func_call_opcode & x"1000002";

              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0F";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
				  wait for clk_period;
				  program_mem_we <= '0';
				  seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= x"00000000";

wait for 100 ns;
	 ind_sub_add_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"0000000A";
    wait for 100 ns;
    ind_sub_add_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
              
wait for 100 ns;
	 ind_sub_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"00000005";
    wait for 100 ns;
    ind_sub_add_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";

	 -- sequencer trigger
    wait for clk_period*20;
    start_sequence <= '1';

    wait for clk_period*2;
    start_sequence <= '0';



-- test simple subroutine
 wait for 10 us;
              program_mem_we <= '1';
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= func_call_opcode & x"1000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"01"; -- jump to add A
              seq_mem_data_in <= jump_to_add_opcode & x"00A0002";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"02";
              seq_mem_data_in <= end_sequence_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0A";
              seq_mem_data_in <= func_call_opcode & x"3000003";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0B";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0D";
              seq_mem_data_in <= ind_all_call_opcode & x"2000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0E";
              seq_mem_data_in <= func_call_opcode & x"1000002";

              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0F";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
				  wait for clk_period;
				  program_mem_we <= '0';
				  seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= x"00000000";
              

	 -- sequencer trigger
    wait for clk_period*20;
    start_sequence <= '1';

    wait for clk_period*2;
    start_sequence <= '0';



-- test subroutine 

wait for 10 us;

wait for 100 ns;
	 ind_func_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"05";
    seq_mem_data_in <= x"00000001";
    wait for 100 ns;
    ind_func_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 wait for 100 ns;
	 ind_func_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"02";
    seq_mem_data_in <= x"00000003";
    wait for 100 ns;
    ind_func_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 	 wait for 100 ns;
	 ind_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"03";
    seq_mem_data_in <= x"00000005";
    wait for 100 ns;
    ind_rep_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 	 wait for 100 ns;
	 ind_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"00000002";
    wait for 100 ns;
    ind_rep_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";

 wait for 100 ns;
              program_mem_we <= '1';
              seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= func_call_opcode & x"3000002";
              
              wait for clk_period;
         
              seq_mem_w_add       <= "00" & x"01";
              seq_mem_data_in <= ind_all_call_opcode & x"5000003";

              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"02";
              seq_mem_data_in <= func_call_opcode & x"3000003";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"03";
              seq_mem_data_in <= func_call_opcode & x"1000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"04"; -- jump to add A
              seq_mem_data_in <= jump_to_add_opcode & x"00A0002";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"05";
              seq_mem_data_in <= end_sequence_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0A"; -- jump to add D
              seq_mem_data_in <= jump_to_add_opcode & x"00D0002";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0B";
              seq_mem_data_in <= func_call_opcode & x"1000003";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0C";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0D";
              seq_mem_data_in <= ind_all_call_opcode & x"2000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0E";
              seq_mem_data_in <= func_call_opcode & x"1000002";

              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0F";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
				  wait for clk_period;
				  program_mem_we <= '0';
				  seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= x"00000000";
              

	 wait for 100 ns;
	 ind_func_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"02";
    seq_mem_data_in <= x"00000003";
    wait for 100 ns;
	 seq_mem_w_add   <= "00" & x"05";
    seq_mem_data_in <= x"00000001";
    wait for 100 ns;
    ind_func_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 wait for 100 ns;
	 ind_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"00000002";
    wait for 100 ns;
	 seq_mem_w_add   <= "00" & x"03";
    seq_mem_data_in <= x"00000005";
    wait for 100 ns;
    ind_rep_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";



	 -- sequencer trigger
    wait for clk_period*20;
    start_sequence <= '1';

    wait for clk_period*2;
    start_sequence <= '0';


-- test all features 

wait for 25 us;

wait for 100 ns;
	 ind_func_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"05";
    seq_mem_data_in <= x"00000001";
    wait for 100 ns;
    ind_func_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 wait for 100 ns;
	 ind_func_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"02";
    seq_mem_data_in <= x"00000003";
    wait for 100 ns;
    ind_func_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 	 wait for 100 ns;
	 ind_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"03";
    seq_mem_data_in <= x"00000005";
    wait for 100 ns;
    ind_rep_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 	 wait for 100 ns;
	 ind_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"00000002";
    wait for 100 ns;
    ind_rep_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 wait for 100 ns;
	 ind_sub_add_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"0000000D";
    wait for 100 ns;
    ind_sub_add_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
              
wait for 100 ns;
	 ind_sub_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"00000003";
    wait for 100 ns;
    ind_sub_add_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";

 wait for 100 ns;
              program_mem_we <= '1';
              seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= func_call_opcode & x"3000002";
              
              wait for clk_period;
         
              seq_mem_w_add       <= "00" & x"01";
              seq_mem_data_in <= ind_all_call_opcode & x"5000003";

              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"02";
              seq_mem_data_in <= func_call_opcode & x"3000003";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"03";
              seq_mem_data_in <= func_call_opcode & x"1000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"04"; -- jump to add A
              seq_mem_data_in <= jump_to_add_opcode & x"00A0002";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"05";
              seq_mem_data_in <= end_sequence_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0A"; -- jump to add D
              seq_mem_data_in <= ind_all_jump_opcode & x"0010001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0B";
              seq_mem_data_in <= func_call_opcode & x"1000003";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0C";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0D";
              seq_mem_data_in <= ind_all_call_opcode & x"2000001";
              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0E";
              seq_mem_data_in <= func_call_opcode & x"1000002";

              
              wait for clk_period;
              seq_mem_w_add       <= "00" & x"0F";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
              seq_mem_data_in <= sub_trailer_opcode & x"0000000";
				  wait for clk_period;
				  program_mem_we <= '0';
				  seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= x"00000000";
              

	 wait for 100 ns;
	 ind_func_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"02";
    seq_mem_data_in <= x"00000003";
    wait for 100 ns;
	 seq_mem_w_add   <= "00" & x"05";
    seq_mem_data_in <= x"00000001";
    wait for 100 ns;
    ind_func_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";
	 
	 wait for 100 ns;
	 ind_rep_mem_we <= '1';
    seq_mem_w_add   <= "00" & x"01";
    seq_mem_data_in <= x"00000002";
    wait for 100 ns;
	 seq_mem_w_add   <= "00" & x"03";
    seq_mem_data_in <= x"00000005";
    wait for 100 ns;
    ind_rep_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";



	 -- sequencer trigger
    wait for clk_period*20;
    start_sequence <= '1';

    wait for clk_period*2;
    start_sequence <= '0';


-- test infinite loop

wait for 30 us;

wait for 100 ns;
              program_mem_we <= '1';
              seq_mem_w_add       <= "00" & x"00";
              seq_mem_data_in <= func_call_opcode & x"4000002";

wait for 100 ns;
              program_mem_we <= '1';
              seq_mem_w_add       <= "00" & x"01";
              seq_mem_data_in <= func_call_opcode & x"4800000";

wait for 100 ns;
              program_mem_we <= '1';
              seq_mem_w_add       <= "00" & x"02";
              seq_mem_data_in <= func_call_opcode & x"1000002";
		  
wait for clk_period;
              seq_mem_w_add       <= "00" & x"03";
              seq_mem_data_in <= end_sequence_opcode & x"0000000";

   wait for 100 ns;
     program_mem_we <= '0';
    seq_mem_w_add   <= "00" & x"00";
    seq_mem_data_in <= x"00000000";



	 -- sequencer trigger
    wait for clk_period*20;
    start_sequence <= '1';

    wait for clk_period*2;
    start_sequence <= '0';

	 wait for 245 ns;
	 stop_sequence	<= '1';
	 wait for clk_period*2;
    stop_sequence <= '0';




    wait;
    
  end process WaveGen_Proc;

  

end testbench;

-------------------------------------------------------------------------------

--configuration sequencer_v3_top_tb_testbench_cfg of sequencer_v3_top_tb is
--  for testbench
--  end for;
--end sequencer_v3_top_tb_testbench_cfg;

-------------------------------------------------------------------------------
