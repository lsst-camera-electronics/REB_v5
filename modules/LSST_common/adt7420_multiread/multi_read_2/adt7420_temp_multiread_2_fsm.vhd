----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:46:33 04/19/2013 
-- Design Name: 
-- Module Name:    adt7420_temp_multiread_2_fsm - Behavioral 
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

entity adt7420_temp_multiread_2_fsm is

port (
		clk 					: in  std_logic;
		reset					: in  std_logic;
		start_procedure	: in  std_logic;
		end_i2c				: in  std_logic;
		
		busy					: out std_logic;
		start_i2c			: out std_logic;
		device_addr			: out STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
		latch_en_bus		: out std_logic_vector(1 downto 0)
		);


end adt7420_temp_multiread_2_fsm;

architecture Behavioral of adt7420_temp_multiread_2_fsm is
type   state_type is (wait_start, 
							 read_temp_1, read_temp_2
							 );

	signal pres_state, next_state : state_type;
	signal next_busy					: std_logic;
	signal next_start_i2c			: std_logic;
	signal next_device_addr			: STD_LOGIC_VECTOR(6 DOWNTO 0); 
	signal next_latch_en_bus		: std_logic_vector(1 downto 0);
	
	


begin

	process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state 			<= wait_start;
			busy					<= '0';
			start_i2c			<= '0';
			device_addr			<= (others => '0');
			latch_en_bus		<= (others => '0');
		else
			pres_state 			<= next_state;
			busy					<= next_busy;
			start_i2c			<= next_start_i2c;
			device_addr			<= next_device_addr;
			latch_en_bus		<= next_latch_en_bus;
		end if;
    end if;
  end process;

process (start_procedure, end_i2c, pres_state)
 
  begin

    -------------------- outputs defoult values --------------------
			next_busy				<= '1';
			next_start_i2c			<= '0';
			next_device_addr		<= (others => '0');
			next_latch_en_bus		<= (others => '0');
	
	case pres_state is
    
		when wait_start =>
			if start_procedure = '0' then
				next_state 	<= wait_start;
				next_busy	<= '0';
			else
				next_state				<= read_temp_1;
				next_start_i2c			<= '1';
				next_device_addr		<= "1001000";
				next_latch_en_bus		<= "01";
			end if;
		
		when read_temp_1 =>
			if end_i2c = '0' then 
				next_state				<= read_temp_1;
				next_device_addr		<= "1001000";
				next_latch_en_bus		<= "01";
			else
				next_state				<= read_temp_2;
				next_start_i2c			<= '1';
				next_device_addr		<= "1001001";
				next_latch_en_bus		<= "10";
			end if;
			
		when read_temp_2 =>
			if end_i2c = '0' then 
				next_state				<= read_temp_2;
				next_device_addr		<= "1001001";
				next_latch_en_bus		<= "10";
			else
				next_state				<= wait_start;
				next_busy				<= '1';
			end if;
		
		end case;
	end process;

end Behavioral;

