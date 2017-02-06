----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:52:09 07/03/2015 
-- Design Name: 
-- Module Name:    ad7490_controller_fsm - Behavioral 
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

entity ad7490_controller_fsm is

	port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start_multiread		: in  std_logic;
		start_singleread		: in  std_logic;
		spi_busy					: in  std_logic;
		adc_input_address		: in  std_logic_vector(3 downto 0);
		start_spi				: out std_logic;
		link_busy				: out std_logic;
		data_to_spi				: out std_logic_vector(15 downto 0);
		out_reg_en_bus			: out std_logic_vector(6 downto 0)
		);

end ad7490_controller_fsm;

architecture Behavioral of ad7490_controller_fsm is

type state_type is (startup_1, start_spi_startup_1, startup_2, start_spi_startup_2, 
						  wait_startup, 
						  wait_start,
						  power_up_multiread, s_spi_power_up_multiread, 
						  power_up_singleread, s_spi_power_up_singleread,
						  wait_pup_multiread, wait_pup_singleread,
						  read_multiread_1, s_spi_read_multiread_1,
						  read_multiread_2, s_spi_read_multiread_2,
						  read_multiread_3, s_spi_read_multiread_3,
						  read_multiread_4, s_spi_read_multiread_4,
						  read_multiread_5, s_spi_read_multiread_5,
						  read_multiread_6, s_spi_read_multiread_6,
						  read_singleread, s_spi_read_singleread
						  );
						

signal pres_state, next_state : state_type;
signal next_start_spi				: std_logic;
signal next_link_busy				: std_logic;
signal next_data_to_spi				: std_logic_vector(15 downto 0);
signal next_out_reg_en_bus			: std_logic_vector(6 downto 0);

signal next_pup_cnt			: integer range 0 to 1000;	
signal pup_cnt					: integer range 0 to 1000;	

-- ADC data control strings
constant shutdown				: std_logic_vector(15 downto 0) := x"820"&x"0";

constant read_multi_1		: std_logic_vector(15 downto 0) := x"8B7"&x"0"; -- reads channel 2  T_top_ch1
constant read_multi_2		: std_logic_vector(15 downto 0) := x"8F7"&x"0"; -- reads channel 3  T_bot_ch1
constant read_multi_3		: std_logic_vector(15 downto 0) := x"9B7"&x"0"; -- reads channel 6  T_top_ch2
constant read_multi_4		: std_logic_vector(15 downto 0) := x"9F7"&x"0"; -- reads channel 7  T_bot_ch2
constant read_multi_5		: std_logic_vector(15 downto 0) := x"AB7"&x"0"; -- reads channel 10 T_top_ch3
constant read_multi_6		: std_logic_vector(15 downto 0) := x"AF7"&x"0"; -- reads channel 11 T_bot_ch3


begin

process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state   			<= startup_1;
			start_spi				<= '0';
			link_busy				<= '0';
			data_to_spi				<= (others => '0');
			out_reg_en_bus			<= (others => '0');
			pup_cnt					<= 0;
		else
			pres_state				<= next_state;
			start_spi				<= next_start_spi;
			link_busy				<= next_link_busy;
			data_to_spi				<= next_data_to_spi;
			out_reg_en_bus			<= next_out_reg_en_bus;
			pup_cnt					<= next_pup_cnt;
		end if;
	end if;
end process;


process (pres_state, start_multiread, adc_input_address,  start_singleread, spi_busy, pup_cnt)
begin
			
    -------------------- outputs default values  --------------------
			
			next_start_spi			<= '0';
			next_link_busy			<= '1';
			next_data_to_spi		<= (others => '0');
			next_out_reg_en_bus	<= (others => '0');
			next_pup_cnt			<= pup_cnt;
	
	case pres_state is

		when startup_1 =>
			next_state			<= start_spi_startup_1;
			next_start_spi		<= '1';
			next_data_to_spi	<= (others => '1');

		when start_spi_startup_1 =>
			next_state			<= startup_2;
			next_data_to_spi	<= (others => '1');
			
		when startup_2 =>
			if spi_busy	= '1' then 
				next_state			<= startup_2;
				next_start_spi		<= '0';
				next_data_to_spi	<= (others => '1');
			else
				next_state			<= start_spi_startup_2;
				next_start_spi		<= '1';
				next_data_to_spi	<= shutdown;
			end if;
		
		when start_spi_startup_2 =>
			next_state			<= wait_startup;
			next_data_to_spi	<= shutdown;

		
		when wait_startup =>
			if spi_busy	= '1' then 
				next_state			<= wait_startup;
				next_start_spi		<= '0';
				next_data_to_spi	<= shutdown;
			else
				next_state			<= wait_start;
			end if;

		when wait_start =>
			if start_multiread = '1' and start_singleread = '0' then 
				next_state			<= s_spi_power_up_multiread;
				next_start_spi		<= '1';
				next_data_to_spi	<= read_multi_1;
			elsif start_multiread = '0' and start_singleread = '1' then
				next_state			<= s_spi_power_up_singleread;
				next_start_spi		<= '1';
				next_data_to_spi	<= "10" & adc_input_address & "110111"&"0000"; -- reads "adc_input_address" at range Vref 
--				next_data_to_spi	<= "10" & adc_input_address & "110100"&"0000"; -- reads "adc_input_address" at double precision and 2's complement
			else	
				next_state			<= wait_start;
				next_link_busy			<= '0';
			end if;

		when s_spi_power_up_multiread =>
			next_state			<= power_up_multiread;
			next_data_to_spi	<= read_multi_1;
			
		when s_spi_power_up_singleread =>
			next_state			<= power_up_singleread;
			next_data_to_spi	<= "10" & adc_input_address & "110111"&"0000"; -- reads "adc_input_address" at at range Vref
--			next_data_to_spi	<= "10" & adc_input_address & "110100"&"0000"; -- reads "adc_input_address" at double precision and 2's complement

		when power_up_multiread =>
			if spi_busy	= '1' then 
				next_state			<= power_up_multiread;
				next_start_spi		<= '0';
				next_data_to_spi	<= read_multi_1;
			else
				next_state			<= wait_pup_multiread;
			end if;

		when wait_pup_multiread =>
			if pup_cnt	= 999 then 
				next_state			<= s_spi_read_multiread_1;
				next_start_spi		<= '1';
				next_data_to_spi	<= read_multi_2;
				next_pup_cnt		<= 0;
			else
				next_state			<= wait_pup_multiread;
				next_pup_cnt		<= pup_cnt + 1;
			end if;

		when s_spi_read_multiread_1 => 
			next_state			<= read_multiread_1;
			next_data_to_spi	<= read_multi_2;

		when read_multiread_1 =>
			if spi_busy	= '1' then 
				next_state					<= read_multiread_1;
				next_start_spi				<= '0';
				next_data_to_spi			<= read_multi_2;
			else
				next_state					<= s_spi_read_multiread_2;
				next_start_spi				<= '1';
				next_data_to_spi			<= read_multi_3;
				next_out_reg_en_bus		<= "0000001";
			end if;

		when s_spi_read_multiread_2 => 
			next_state			<= read_multiread_2;
			next_data_to_spi	<= read_multi_3;

		when read_multiread_2 =>
			if spi_busy	= '1' then 
				next_state					<= read_multiread_2;
				next_start_spi				<= '0';
				next_data_to_spi			<= read_multi_3;
			else
				next_state					<= s_spi_read_multiread_3;
				next_start_spi				<= '1';
				next_data_to_spi			<= read_multi_4;
				next_out_reg_en_bus		<= "0000010";
			end if;

		when s_spi_read_multiread_3 => 
			next_state			<= read_multiread_3;
			next_data_to_spi	<= read_multi_4;

		when read_multiread_3 =>
			if spi_busy	= '1' then 
				next_state					<= read_multiread_3;
				next_start_spi				<= '0';
				next_data_to_spi			<= read_multi_4;
			else
				next_state					<= s_spi_read_multiread_4;
				next_start_spi				<= '1';
				next_data_to_spi			<= read_multi_5;
				next_out_reg_en_bus		<= "0000100";
			end if;

		when s_spi_read_multiread_4 => 
			next_state			<= read_multiread_4;
			next_data_to_spi	<= read_multi_5;

		when read_multiread_4 =>
			if spi_busy	= '1' then 
				next_state					<= read_multiread_4;
				next_start_spi				<= '0';
				next_data_to_spi			<= read_multi_5;
			else
				next_state					<= s_spi_read_multiread_5;
				next_start_spi				<= '1';
				next_data_to_spi			<= read_multi_6;
				next_out_reg_en_bus		<= "0001000";
			end if;

		when s_spi_read_multiread_5 => 
			next_state			<= read_multiread_5;
			next_data_to_spi	<= read_multi_6;

		when read_multiread_5 =>
			if spi_busy	= '1' then 
				next_state			<= read_multiread_5;
				next_start_spi		<= '0';
				next_data_to_spi	<= read_multi_6;
			else
				next_state			<= s_spi_read_multiread_6;
				next_start_spi		<= '1';
				next_data_to_spi	<= shutdown;
				next_out_reg_en_bus		<= "0010000";
			end if;
		
		when s_spi_read_multiread_6 => 
			next_state			<= read_multiread_6;
			next_data_to_spi	<= shutdown;
		
		when read_multiread_6 =>
			if spi_busy	= '1' then 
				next_state			<= read_multiread_6;
				next_start_spi		<= '0';
				next_data_to_spi	<= shutdown;
			else
				next_state			<= wait_start;
				next_out_reg_en_bus		<= "0100000";
			end if;
			
			
		when power_up_singleread =>
			if spi_busy	= '1' then 
				next_state			<= power_up_singleread;
				next_start_spi		<= '0';
				next_data_to_spi	<= "10" & adc_input_address & "110100" &"0000"; -- reads "adc_input_address" at double precision and 2's complement
			else
				next_state			<= wait_pup_singleread;
			end if;

		when wait_pup_singleread =>
			if pup_cnt	= 999 then 
				next_state			<= s_spi_read_singleread;
				next_start_spi		<= '1';
				next_data_to_spi	<= shutdown;
				next_pup_cnt		<= 0;
			else
				next_state			<= wait_pup_singleread;
				next_pup_cnt		<= pup_cnt + 1;
			end if;
		
		when s_spi_read_singleread => 
			next_state			<= read_singleread;
			next_data_to_spi	<= shutdown;
		
		when read_singleread =>
			if spi_busy	= '1' then 
				next_state			<= read_singleread;
				next_start_spi		<= '0';
				next_data_to_spi	<= shutdown;
			else
				next_state			<= wait_start;
				next_out_reg_en_bus		<= "1000000";
			end if;
			
		end case;
	end process;

end Behavioral;

