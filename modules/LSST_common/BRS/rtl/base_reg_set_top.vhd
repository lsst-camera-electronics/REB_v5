----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:50:59 06/06/2012 
-- Design Name: 
-- Module Name:    base_reg_set_top - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity base_reg_set_top is

port (
		clk					: in  std_logic;
		reset					: in  std_logic;
		en_time_base_cnt	: in  std_logic;
		load_time_base_lsw: in  std_logic;
		load_time_base_MSW: in  std_logic;
		StatusReset			: in  std_logic;
		trigger_TB			: in  std_logic;
		trigger_seq			: in  std_logic;
		trigger_V_I_read	: in  std_logic;
		trigger_temp_pcb  : in  std_logic;
		cnt_preset			: in  std_logic_vector(63 downto 0);
		cnt_busy				: out std_logic;
		cnt_actual_value	: out std_logic_vector(63 downto 0);
		trig_tm_value_SB	: out std_logic_vector(63 downto 0);
		trig_tm_value_TB	: out std_logic_vector(63 downto 0);
		trig_tm_value_seq	: out std_logic_vector(63 downto 0);
		trig_tm_value_V_I	: out std_logic_vector(63 downto 0);
		trig_tm_value_pcb	: out std_logic_vector(63 downto 0)
		);

end base_reg_set_top;

architecture Behavioral of base_reg_set_top is


component generic_counter_rst_load_ce is
generic (length_cnt : integer);
port (
	reset    	: in  std_logic;           				-- syncronus reset
   clk      	: in  std_logic;           				-- clock
   preset		: in  std_logic_vector (length_cnt downto 0);  -- maximum value the counter has to count
	enable    	: in  std_logic;  			 				-- enable
	load_lsw		: in  std_logic;
	load_MSW		: in  std_logic;
	q_out			: out std_logic_vector(length_cnt downto 0));
end component;

component generic_reg_ce_init is
generic (width : integer);
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

signal en_time_base_latched : std_logic;
signal cnt_actual_value_int : std_logic_vector (63 downto 0);

begin

cnt_en_ff : ff_ce 
port map (
    reset    => reset,         -- syncronus reset
    clk      => clk,           -- clock
    data_in  => trigger_TB, 	 -- data in
	 ce       => en_time_base_cnt, -- clock enable
    data_out => en_time_base_latched);  -- data out


time_base_cnt :  generic_counter_rst_load_ce 
generic map ( length_cnt => 63)
port map (
	reset    	=> reset,           				-- syncronus reset
   clk      	=> clk,           				-- clock
   preset		=> cnt_preset,  -- maximum value the counter has to count
	enable    	=> en_time_base_latched, 			 				-- enable
	load_lsw		=> load_time_base_lsw,
	load_MSW		=> load_time_base_MSW,
	q_out			=> cnt_actual_value_int);


trigger_time_SB : generic_reg_ce_init 
generic map ( width => 63 )
port map (
    reset    => reset,           							-- syncronus reset
    clk      => clk,           								-- clock
    ce       => StatusReset,  			 							-- clock enable
	 init	    => '0',											-- signal to reset the reg (active high)
	 data_in  => cnt_actual_value_int,  			-- data in
	 data_out => trig_tm_value_SB);				-- data out

trigger_time_TB : generic_reg_ce_init 
generic map ( width => 63 )
port map (
    reset    => reset,           							-- syncronus reset
    clk      => clk,           								-- clock
    ce       => trigger_TB,  			 							-- clock enable
	 init	    => '0',											-- signal to reset the reg (active high)
	 data_in  => cnt_actual_value_int,  			-- data in
	 data_out => trig_tm_value_TB);				-- data out

trigger_time_seq : generic_reg_ce_init 
generic map ( width => 63 )
port map (
    reset    => reset,           							-- syncronus reset
    clk      => clk,           								-- clock
    ce       => trigger_seq,  			 							-- clock enable
	 init	    => '0',											-- signal to reset the reg (active high)
	 data_in  => cnt_actual_value_int,  			-- data in
	 data_out => trig_tm_value_seq);				-- data out
	 
trigger_time_V_I : generic_reg_ce_init 
generic map ( width => 63 )
port map (
    reset    => reset,           							
    clk      => clk,           								
    ce       => trigger_V_I_read,  			 							
	 init	    => '0',											
	 data_in  => cnt_actual_value_int,  			
	 data_out => trig_tm_value_V_I);		

trigger_time_temp_pcb : generic_reg_ce_init 
generic map ( width => 63 )
port map (
    reset    => reset,           							
    clk      => clk,           								
    ce       => trigger_temp_pcb,  			 							
	 init	    => '0',											
	 data_in  => cnt_actual_value_int,  			
	 data_out => trig_tm_value_pcb);			 

cnt_actual_value 	<= cnt_actual_value_int;
cnt_busy 			<= en_time_base_latched;

end Behavioral;

