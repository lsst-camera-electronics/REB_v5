----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:14:51 04/18/2013 
-- Design Name: 
-- Module Name:    ltc2945_multi_read_top - Behavioral 
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

entity ltc2945_multi_read_top is

port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		start_procedure	: in  std_logic;
		
		busy					: out std_logic;
		
		error_v6_voltage	: out std_logic;
		v6_voltage_out		: out std_logic_vector(15 downto 0);
		
		error_v6_current	: out std_logic;
		v6_current_out		: out std_logic_vector(15 downto 0);
		
		error_v9_voltage	: out std_logic;
		v9_voltage_out		: out std_logic_vector(15 downto 0);
		
		error_v9_current	: out std_logic;
		v9_current_out		: out std_logic_vector(15 downto 0);
		
		error_v24_voltage	: out std_logic;
		v24_voltage_out	: out std_logic_vector(15 downto 0);
		
		error_v24_current	: out std_logic;
		v24_current_out	: out std_logic_vector(15 downto 0);
		
		error_v40_voltage	: out std_logic;
		v40_voltage_out	: out std_logic_vector(15 downto 0);
		
		error_v40_current	: out std_logic;
		v40_current_out	: out std_logic_vector(15 downto 0);
		
		sda       			: INOUT  STD_LOGIC;                    --serial data output of i2c bus
		scl       			: INOUT  STD_LOGIC		               --serial clock output of i2c bus
		
		);

end ltc2945_multi_read_top;

architecture Behavioral of ltc2945_multi_read_top is

component ltc2945_multi_read_fsm is
port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		start_procedure	: in  std_logic;
		end_i2c				: in  std_logic;
		
		busy					: out std_logic;
		start_i2c			: out std_logic;
		device_addr			: out STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
		reg_add				: out std_logic_vector (7 downto 0);
		latch_en_bus		: out std_logic_vector(7 downto 0)
		);
end component;

component i2c_top is
port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		start_i2c			: in  std_logic;
		read_nwrite			: in  std_logic;
		double_read			: in  std_logic;
		latch_word_1		: out std_logic;
		latch_word_2		: out std_logic;
		end_procedure		: out std_logic;
		
		device_addr			: IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
		reg_add				: in		std_logic_vector (7 downto 0);
		data_wr   			: IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
		data_rd   			: OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
		ack_error 			: out STD_LOGIC;                    	--flag if improper acknowledge from slave
		sda       			: INOUT  STD_LOGIC;                    --serial data output of i2c bus
		scl       			: INOUT  STD_LOGIC		               --serial clock output of i2c bus
		);
end component;

component generic_reg_ce_init is
generic ( width : integer := 7 );
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

signal end_i2c		: std_logic;
signal start_i2c			: std_logic;
signal device_addr		: STD_LOGIC_VECTOR(6 DOWNTO 0);
signal reg_add				: std_logic_vector(7 downto 0);
signal latch_en_bus		: std_logic_vector(7 downto 0);
signal latch_word_1		: std_logic;
signal latch_word_2		: std_logic;
signal i2c_read_byte		: std_logic_vector(7 downto 0);
signal ack_error 			: STD_LOGIC; 
signal en_lsw				: std_logic_vector(7 downto 0);
signal en_MSW				: std_logic_vector(7 downto 0);
signal error_bus			: std_logic_vector(7 downto 0);
signal error_bus_ce		: std_logic_vector(7 downto 0);


subtype word_8 is std_logic_vector (7 downto 0);
type array77 is array (7 downto 0) of word_8;

signal out_lsw_array		: array77;
signal out_MSW_array		: array77;


begin

ltc2945_multi_read_fsm_0 : ltc2945_multi_read_fsm
port map (
		clk 					=> clk,
		reset					=> reset,
		start_procedure	=> start_procedure,
		end_i2c				=> end_i2c,
		
		busy					=> busy,
		start_i2c			=> start_i2c,
		device_addr			=> device_addr,
		reg_add				=> reg_add,
		latch_en_bus		=> latch_en_bus
		);

i2c_top_0 : i2c_top 
port map (
		clk 					=> clk,
		reset					=> reset,
		start_i2c			=> start_i2c,
		read_nwrite			=> '1',
		double_read			=> '1',
		latch_word_1		=> latch_word_1,
		latch_word_2		=> latch_word_2,
		end_procedure		=> end_i2c,
		
		device_addr			=> device_addr,
		reg_add				=> reg_add,
		data_wr   			=> x"00",
		data_rd   			=> i2c_read_byte,
		ack_error 			=> ack_error,
		sda       			=> sda,
		scl       			=> scl
		);


en_bus_lsw_generate:
		for i in 0 to 7 generate
			en_lsw(i) <= latch_en_bus(i) and latch_word_2;
		end generate;

en_bus_MSW_generate:
		for i in 0 to 7 generate
			en_MSW(i) <= latch_en_bus(i) and latch_word_1;
		end generate;

error_bus_generate:
		for i in 0 to 7 generate
			error_bus_ce(i) <= latch_en_bus(i) and ack_error;
		end generate;

lsw_reg_generate: 
			for i in 0 to 7 generate 
			out_lsw_reg : generic_reg_ce_init 
			generic map(width => 7)
			port map (
				reset    => reset,           						
				clk      => clk,          						
				ce       => en_lsw(i),  			 						
				init	 	=> '0',											
				data_in  => i2c_read_byte,  			
				data_out => out_lsw_array(I)				
				);
			end generate;
			
MSW_reg_generate: 
			for i in 0 to 7 generate 
			out_MSW_reg : generic_reg_ce_init 
			generic map(width => 7)
			port map (
				reset    => reset,           						
				clk      => clk,          						
				ce       => en_MSW(i),  			 						
				init	 	=> '0',											
				data_in  => i2c_read_byte,  			
				data_out => out_MSW_array(I)				
				);
			end generate;

error_ff_generate: 
	for i in 0 to 7 generate 
error_ff : ff_ce 
port map (
    reset    => reset,        
    clk      => clk,              
	 data_in  => '1', 	 
	 ce       => error_bus_ce(i), 
    data_out => error_bus(i)); 
	 end generate;
	 
	 

v6_voltage_out		<= out_MSW_array(0) & out_lsw_array(0);
v6_current_out 	<= out_MSW_array(1) & out_lsw_array(1);

v9_voltage_out		<= out_MSW_array(2) & out_lsw_array(2);
v9_current_out 	<= out_MSW_array(3) & out_lsw_array(3);

v24_voltage_out	<= out_MSW_array(4) & out_lsw_array(4);
v24_current_out 	<= out_MSW_array(5) & out_lsw_array(5);

v40_voltage_out	<= out_MSW_array(6) & out_lsw_array(6);
v40_current_out 	<= out_MSW_array(7) & out_lsw_array(7);

error_v6_voltage	<= error_bus(0);
error_v6_current	<= error_bus(1);

error_v9_voltage	<= error_bus(2);
error_v9_current	<= error_bus(3);

error_v24_voltage	<= error_bus(4);
error_v24_current	<= error_bus(5);

error_v40_voltage	<= error_bus(6);
error_v40_current	<= error_bus(7);

end Behavioral;

