----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:58 04/18/2013 
-- Design Name: 
-- Module Name:    ltc2945_multi_read_fsm - Behavioral 
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
use work.ltc2945_add_package.all;

entity ltc2945_multi_read_fsm is

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

end ltc2945_multi_read_fsm;

architecture Behavioral of ltc2945_multi_read_fsm is

	type   state_type is (wait_start, 
								 read_V_sens_1, read_I_sens_1,
								 read_V_sens_2, read_I_sens_2,
								 read_V_sens_3, read_I_sens_3,
								 read_V_sens_4, read_I_sens_4);
								 
	signal pres_state, next_state : state_type;
	signal next_busy					: std_logic;
	signal next_start_i2c			: std_logic;
	signal next_device_addr			: STD_LOGIC_VECTOR(6 DOWNTO 0); 
	signal next_reg_add				: std_logic_vector (7 downto 0);
	signal next_latch_en_bus		: std_logic_vector(7 downto 0);

begin

	process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state 			<= wait_start;
			busy					<= '0';
			start_i2c			<= '0';
			device_addr			<= (others => '0');
			reg_add				<= (others => '0');
			latch_en_bus		<= (others => '0');
		else
			pres_state 			<= next_state;
			busy					<= next_busy;
			start_i2c			<= next_start_i2c;
			device_addr			<= next_device_addr;
			reg_add				<= next_reg_add;
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
			next_reg_add			<= (others => '0');
			next_latch_en_bus		<= (others => '0');
	
	case pres_state is
    
		when wait_start =>
			if start_procedure = '0' then
				next_state 	<= wait_start;
				next_busy	<= '0';
			else
				next_state				<= read_V_sens_1;
				next_start_i2c			<= '1';
				next_device_addr		<= V6_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "00000001";
			end if;
		
		when read_V_sens_1 =>
			if end_i2c = '0' then 
				next_state				<= read_V_sens_1;
				next_device_addr		<= V6_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "00000001";
			else
				next_state				<= read_I_sens_1;
				next_start_i2c			<= '1';
				next_device_addr		<= V6_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "00000010";
			end if;
			
		when read_I_sens_1 =>
			if end_i2c = '0' then 
				next_state				<= read_I_sens_1;
				next_device_addr		<= V6_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "00000010";
			else
				next_state				<= read_V_sens_2;
				next_start_i2c			<= '1';
				next_device_addr		<= V9_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "00000100";
			end if;
			
		when read_V_sens_2 =>
			if end_i2c = '0' then 
				next_state				<= read_V_sens_2;
				next_device_addr		<= V9_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "00000100";
			else
				next_state				<= read_I_sens_2;
				next_start_i2c			<= '1';
				next_device_addr		<= V9_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "00001000";
			end if;
			
		when read_I_sens_2 =>
			if end_i2c = '0' then 
				next_state				<= read_I_sens_2;
				next_device_addr		<= V9_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "00001000";
			else
				next_state				<= read_V_sens_3;
				next_start_i2c			<= '1';
				next_device_addr		<= V24_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "00010000";
			end if;
			
		when read_V_sens_3 =>
			if end_i2c = '0' then 
				next_state				<= read_V_sens_3;
				next_device_addr		<= V24_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "00010000";
			else
				next_state				<= read_I_sens_3;
				next_start_i2c			<= '1';
				next_device_addr		<= V24_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "00100000";
			end if;
			
		when read_I_sens_3 =>
			if end_i2c = '0' then 
				next_state				<= read_I_sens_3;
				next_device_addr		<= V24_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "00100000";
			else
				next_state				<= read_V_sens_4;
				next_start_i2c			<= '1';
				next_device_addr		<= V40_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "01000000";
			end if;
			
		when read_V_sens_4 =>
			if end_i2c = '0' then 
				next_state				<= read_V_sens_4;
				next_device_addr		<= V40_dev_add;
				next_reg_add			<= V_reg_add;
				next_latch_en_bus		<= "01000000";
			else
				next_state				<= read_I_sens_4;
				next_start_i2c			<= '1';
				next_device_addr		<= V40_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "10000000";
			end if;
			
		when read_I_sens_4 =>
			if end_i2c = '0' then 
				next_state				<= read_I_sens_4;
				next_device_addr		<= V40_dev_add;
				next_reg_add			<= I_reg_add;
				next_latch_en_bus		<= "10000000";
			else
				next_state				<= wait_start;
			end if;
		
		end case;
	end process;	

end Behavioral;

