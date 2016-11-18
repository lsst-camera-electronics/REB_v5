----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:13:57 03/25/2013 
-- Design Name: 
-- Module Name:    i2c_top - Behavioral 
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

entity i2c_top is

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

end i2c_top;

architecture Behavioral of i2c_top is

component i2c_handler_fsm is
port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		start_i2c			: in  std_logic;
		read_nwrite			: in  std_logic;
		double_read			: in  std_logic;
		i2c_busy				: in  std_logic;
		i2c_ena				: out std_logic;
		i2c_rw				: out std_logic;
		latch_word_1		: out std_logic;
		latch_word_2		: out std_logic;
		data_in_sel			: out std_logic;
		end_procedure		: out std_logic
		);
end component;

component i2c_master IS
  GENERIC(
    input_clk : INTEGER := 100_000_000; --input clock speed from user logic in Hz
    bus_clk   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz
  PORT(
    clk       : IN     STD_LOGIC;                    --system clock
    reset     : IN     STD_LOGIC;                    --active low reset
    ena       : IN     STD_LOGIC;                    --latch in command
    addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
    rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
    data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
    busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
    data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
    ack_error : out STD_LOGIC;                    --flag if improper acknowledge from slave
    sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
    scl       : INOUT  STD_LOGIC);                   --serial clock output of i2c bus
END component;

component mux_bus_2_8_bit_clk is
port (
    reset    	: in  std_logic;           -- syncronus reset
    clk      	: in  std_logic;           -- clock
    selector   : in  std_logic;
	 bus_in_0 	: in  std_logic_vector(7 downto 0);
	 bus_in_1 	: in  std_logic_vector(7 downto 0);
	 
	 bus_out 	: out std_logic_vector(7 downto 0)
	 );
end component;

signal i2c_busy		: std_logic;
signal i2c_ena			: std_logic;
signal i2c_rw			: std_logic;
signal data_in_sel	: std_logic;
signal data_to_12c	: std_logic_vector (7 downto 0);


begin

i2c_handler_fsm_0 : i2c_handler_fsm 
port map (
		clk 					=> clk,
		reset					=> reset,
		start_i2c			=> start_i2c,
		read_nwrite			=> read_nwrite,
		double_read			=> double_read,
		i2c_busy				=> i2c_busy,
		i2c_ena				=> i2c_ena,
		i2c_rw				=> i2c_rw,
		latch_word_1		=> latch_word_1,
		latch_word_2		=> latch_word_2,
		data_in_sel			=> data_in_sel,
		end_procedure		=> end_procedure
		);

i2c_master_0 : i2c_master 
  generic map(
    input_clk => 100_000_000, --input clock speed from user logic in Hz
    bus_clk   =>     400_000)   --speed the i2c bus (scl) will run at in Hz
  port map(
    clk       		=> clk,                    --system clock
    reset   		=> reset,                   --active low reset
    ena       		=> i2c_ena,                    --latch in command
    addr      		=> device_addr,								 --address of target slave
    rw        		=> i2c_rw,                    --'0' is write, '1' is read
    data_wr   		=> data_to_12c, 					--data to write to slave
    busy      		=> i2c_busy,                   --indicates transaction in progress
    data_rd   		=> data_rd, 					--data read from slave
    ack_error 		=> ack_error,                    --flag if improper acknowledge from slave
    sda       		=> sda,                   --serial data output of i2c bus
    scl       		=> scl);                   --serial clock output of i2c bus

data_in_mux : mux_bus_2_8_bit_clk 
port map (
    reset    	=> reset,
    clk      	=> clk,
    selector   => data_in_sel,
	 bus_in_0 	=> reg_add,
	 bus_in_1 	=> data_wr,
	 bus_out 	=> data_to_12c
	 );

end Behavioral;

