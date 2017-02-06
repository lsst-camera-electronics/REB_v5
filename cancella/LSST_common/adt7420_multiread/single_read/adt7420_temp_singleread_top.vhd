----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:02:08 04/19/2013 
-- Design Name: 
-- Module Name:    adt7420_temp_singleread_top - Behavioral 
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

entity adt7420_temp_singleread_top is

port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		start_procedure	: in  std_logic;
		
		busy					: out std_logic;
		
		error_T1	: out std_logic;
		T1_out		: out std_logic_vector(15 downto 0);
		
		sda       			: INOUT  STD_LOGIC;                    --serial data output of i2c bus
		scl       			: INOUT  STD_LOGIC		               --serial clock output of i2c bus
		
		);

end adt7420_temp_singleread_top;

architecture Behavioral of adt7420_temp_singleread_top is

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

signal latch_word_1	: std_logic;
signal latch_word_2	: std_logic;
signal end_i2c			: std_logic;
signal i2c_read_byte	: std_logic_vector(7 downto 0);
signal ack_error		: std_logic;
signal T1_lsw			: std_logic_vector(7 downto 0);
signal T1_MSW			: std_logic_vector(7 downto 0);

begin


i2c_top_0 : i2c_top 
port map (
		clk 					=> clk,
		reset					=> reset,
		start_i2c			=> start_procedure,
		read_nwrite			=> '1',
		double_read			=> '1',
		latch_word_1		=> latch_word_1,
		latch_word_2		=> latch_word_2,
		end_procedure		=> end_i2c,
		
		device_addr			=> "1001000",
		reg_add				=> x"00",
		data_wr   			=> x"00",
		data_rd   			=> i2c_read_byte,
		ack_error 			=> ack_error,
		sda       			=> sda,
		scl       			=> scl
		);
	out_lsw_reg : generic_reg_ce_init 
			generic map(width => 7)
			port map (
				reset    => reset,           						
				clk      => clk,          						
				ce       => latch_word_2,  			 						
				init	 	=> '0',											
				data_in  => i2c_read_byte,  			
				data_out => T1_lsw				
				);	
	
	out_MSW_reg : generic_reg_ce_init 
			generic map(width => 7)
			port map (
				reset    => reset,           						
				clk      => clk,          						
				ce       => latch_word_1,  			 						
				init	 	=> '0',											
				data_in  => i2c_read_byte,  			
				data_out => T1_MSW
				);				
	
error_ff : ff_ce 
port map (
    reset    => reset,        
    clk      => clk,              
	 data_in  => '1', 	 
	 ce       => ack_error, 
    data_out => error_T1);

T1_out		<= T1_MSW & T1_lsw;

end Behavioral;

