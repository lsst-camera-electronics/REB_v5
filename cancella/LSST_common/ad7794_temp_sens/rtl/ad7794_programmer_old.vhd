----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:22:14 04/26/2013 
-- Design Name: 
-- Module Name:    ad7794_programmer - Behavioral 
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

entity ad7794_programmer is

generic (clk_divide	: integer := 4);

port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start						: in  std_logic;
		start_reset				: in  std_logic;
		read_write				: in  std_logic;
		dout_rdy					: in  std_logic;
		reg_add					: in  std_logic_vector(2 downto 0);
		d_to_slave				: in  std_logic_vector(15 downto 0);
		din						: out std_logic;
		cs							: out std_logic;
		sclk						: out std_logic;
		busy						: out std_logic;
		d_from_slave_ready	: out std_logic;
		d_from_slave			: out std_logic_vector(23 downto 0)
		);

end ad7794_programmer;

architecture Behavioral of ad7794_programmer is

type state_type is (wait_start, 
							load_comm_reg, load_payload_w,
							w_comm_reg_w_clk1, w_comm_reg_w_clk0, 
							w_reg_8bit_clk1, w_reg_8bit_clk0,
							w_reg_16bit_clk1, w_reg_16bit_clk0, 
							wait_data_ready, r_reg_clk1,
							r_reg_clk0, wait_for_last_shift,
							load_reset_state, reset_clk0, reset_clk1
							); 


signal pres_state, next_state : state_type;
signal next_load_data				: std_logic;
signal next_load_payload			: std_logic;
signal next_load_reset				: std_logic;
signal next_en_shift_out			: std_logic;
signal next_en_shift_in				: std_logic;
signal next_cs							: std_logic;
signal next_sclk						: std_logic;
signal next_busy						: std_logic;
signal next_d_from_slave_ready	: std_logic;




signal next_clk_cnt			: integer range 0 to clk_divide;
signal next_bit_cnt			: integer range 0 to 32;	
signal clk_cnt					: integer range 0 to clk_divide;
signal bit_cnt					: integer range 0 to 32;	


-- shift par in ser out
signal shift_reg_par_in_ser_out_i : std_logic_vector(31 downto 0);	
signal load_data 		: std_logic;
signal load_payload	: std_logic;
signal load_reset 	: std_logic;
signal en_shift_out	: std_logic;

-- shift ser in par out
signal shift_reg_ser_in_par_out_i 	: std_logic_vector(23 downto 0);
signal en_shift_in						: std_logic;



begin

process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state   			<= wait_start;
			load_data				<= '0';
			load_payload			<= '0';
			load_reset				<= '0';
			en_shift_out			<= '0';
			en_shift_in				<= '0';
			cs							<= '1';
			sclk						<= '1';
			busy						<= '0';
			d_from_slave_ready	<= '0';
			clk_cnt 					<= 0;
			bit_cnt     			<= 0;
		else
			pres_state   			<= next_state;
			load_data				<= next_load_data;
			load_payload			<= next_load_payload;
			load_reset				<= next_load_reset;
			en_shift_out			<= next_en_shift_out;
			en_shift_in				<= next_en_shift_in;
			cs							<= next_cs;
			sclk						<= next_sclk;
			busy						<= next_busy;
			d_from_slave_ready	<= next_d_from_slave_ready;
			clk_cnt 					<= next_clk_cnt;
			bit_cnt     			<= next_bit_cnt;
		 end if;
    end if;
  end process;
  
  process (pres_state, start, start_reset, read_write, reg_add, dout_rdy, clk_cnt, bit_cnt)
  begin

    -------------------- outputs default values  --------------------
	 
			next_load_data					<= '0';
			next_load_payload				<= '0';
			next_load_reset				<= '0';
			next_en_shift_out				<= '0';
			next_en_shift_in				<= '0';
			next_cs							<= '0';
			next_sclk						<= '1';
			next_busy						<= '1';
			next_d_from_slave_ready		<= '0';
			next_clk_cnt 					<= clk_cnt;
			next_bit_cnt     				<= bit_cnt;
			
	case pres_state is


		when wait_start =>
			if start ='1' and start_reset = '0' then
				next_state				<= load_comm_reg;
				next_load_data			<= '1';
		elsif start ='0' and start_reset = '1' then
				next_state				<= load_reset_state;
				next_load_reset		<= '1';
			else
				next_state				<= wait_start;
				next_cs					<= '1';
				next_busy				<= '0';
			end if;
		
		when load_comm_reg => 
			if clk_cnt = clk_divide then
				next_state		<= w_comm_reg_w_clk0;
				next_sclk		<= '1';
				next_clk_cnt	<= 0;
			else
				next_state		<= load_comm_reg;
				next_sclk		<= '1';
				next_clk_cnt	<= clk_cnt + 1;
			end if;
		
		when w_comm_reg_w_clk1 => 
			if clk_cnt = clk_divide then
				if bit_cnt = 8  then
					if read_write ='0' then
						next_state				<= load_payload_w;
						next_load_payload		<= '1';
					else
						next_state				<= wait_data_ready;
						next_clk_cnt			<= 0;
						next_bit_cnt			<= 0;
					end if;
				else
					next_state				<= w_comm_reg_w_clk0;
					next_sclk				<= '0';
					next_en_shift_out		<= '1';
					next_clk_cnt			<= 0;
				end if;
			else
				next_state				<= w_comm_reg_w_clk1;
				next_sclk				<= '1';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
						
		when w_comm_reg_w_clk0 => 
			if clk_cnt = clk_divide then
				next_state				<= w_comm_reg_w_clk1;
				next_clk_cnt			<= 0;
				next_bit_cnt			<= bit_cnt + 1;
				next_sclk				<= '1';
			else
				next_state        	<= w_comm_reg_w_clk0;
				next_sclk				<= '0';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
		
		when load_payload_w => 
			if clk_cnt = clk_divide then
				next_clk_cnt			<= 0;
				next_bit_cnt			<= 0;
				next_sclk				<= '1';
				if reg_add = "101" then
					next_state      	<= w_reg_8bit_clk0;
				else
					next_state      	<= w_reg_16bit_clk0;
				end if;
			else
				next_state			<= load_payload_w;
				next_sclk		<= '1';
				next_clk_cnt	<= clk_cnt + 1;
			end if;
		
		when w_reg_8bit_clk1 => 
			if clk_cnt = clk_divide then
				if bit_cnt = 8  then
					next_state 			<= wait_start;
					next_sclk			<= '1';
					next_clk_cnt		<= 0;
					next_bit_cnt		<= 0;
				else
					next_state			<= w_reg_8bit_clk0;
					next_sclk			<= '0';
					next_en_shift_out	<= '1';
					next_clk_cnt		<= 0;
				end if;
			else
				next_state				<= w_reg_8bit_clk1;
				next_sclk				<= '1';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
			
		when w_reg_8bit_clk0	=> 
			if clk_cnt = clk_divide then
				next_state				<= w_reg_8bit_clk1;
				next_clk_cnt			<= 0;
				next_bit_cnt			<= bit_cnt + 1;
				next_sclk				<= '1';
			else
				next_state        	<= w_reg_8bit_clk0;
				next_sclk				<= '0';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
				
		when w_reg_16bit_clk1 => 
			if clk_cnt = clk_divide then
				if bit_cnt = 16  then
					next_state 			<= wait_start;
					next_sclk			<= '1';
					next_clk_cnt		<= 0;
					next_bit_cnt		<= 0;
				else
					next_state			<= w_reg_16bit_clk0;
					next_sclk			<= '0';
					next_en_shift_out	<= '1';
					next_clk_cnt		<= 0;
				end if;
			else
				next_state				<= w_reg_16bit_clk1;
				next_sclk				<= '1';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
			
		when w_reg_16bit_clk0	=> 
			if clk_cnt = clk_divide then
				next_state				<= w_reg_16bit_clk1;
				next_clk_cnt			<= 0;
				next_bit_cnt			<= bit_cnt + 1;
				next_sclk				<= '1';
			else
				next_state        	<= w_reg_16bit_clk0;
				next_sclk				<= '0';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
			
		when wait_data_ready => 
			if dout_rdy = '0' then
				next_state		<= r_reg_clk0;
			else
				next_state		<= wait_data_ready;
			end if;
				
		when r_reg_clk1 => 
			if clk_cnt = clk_divide then
--				next_en_shift_in		<= '1';
				if reg_add = "000" or reg_add = "100" or reg_add = "101" then 
					if bit_cnt = 8 then
						next_state						<= wait_for_last_shift;
					else 
						next_state       		<= r_reg_clk0;
						next_clk_cnt			<= 0;
--						next_en_shift_in		<= '1';
						next_sclk				<= '0';
					end if;
				elsif reg_add = "001" or reg_add = "010" then
					if bit_cnt = 16 then
						next_state						<= wait_for_last_shift;
					else 
						next_state       		<= r_reg_clk0;
						next_clk_cnt			<= 0;
--						next_en_shift_in		<= '1';
						next_sclk				<= '0';
					end if;
				else
					if bit_cnt = 24 then
						next_state						<= wait_for_last_shift;
					else 
						next_state       		<= r_reg_clk0;
						next_clk_cnt			<= 0;
--						next_en_shift_in		<= '1';
						next_sclk				<= '0';
					end if;
				end if;
			else
				next_state				<= r_reg_clk1;
				next_clk_cnt			<= clk_cnt + 1;
			end if;
			
		when r_reg_clk0 =>
			if clk_cnt = clk_divide then
			next_state        	<= r_reg_clk1;
			next_en_shift_in		<= '1';
			next_clk_cnt			<= 0;
			next_bit_cnt			<= bit_cnt + 1;
			next_sclk				<= '1';
        else
			next_state        	<= r_reg_clk0;
			next_clk_cnt			<= clk_cnt + 1;
			next_sclk				<= '0';
		  end if;
		
		when wait_for_last_shift => 
			next_state						<= wait_start;
			next_d_from_slave_ready		<= '1';
			next_clk_cnt					<= 0;
			next_bit_cnt					<= 0;
			
		when load_reset_state => 
			if clk_cnt = clk_divide then
				next_state		<= reset_clk0;
				next_sclk		<= '1';
				next_clk_cnt	<= 0;
			else
				next_state		<= load_reset_state;
				next_sclk		<= '1';
				next_clk_cnt	<= clk_cnt + 1;
			end if;
			
		when reset_clk1 => 
			if clk_cnt = clk_divide then
				if bit_cnt = 32  then
					next_state 			<= wait_start;
					next_sclk			<= '1';
					next_clk_cnt		<= 0;
					next_bit_cnt		<= 0;
				else
					next_state			<= reset_clk0;
					next_sclk			<= '0';
					next_en_shift_out	<= '1';
					next_clk_cnt		<= 0;
				end if;
			else
				next_state				<= reset_clk1;
				next_sclk				<= '1';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
						
		when reset_clk0 => 
			if clk_cnt = clk_divide then
				next_state				<= reset_clk1;
				next_clk_cnt			<= 0;
				next_bit_cnt			<= bit_cnt + 1;
				next_sclk				<= '1';
			else
				next_state        	<= reset_clk0;
				next_sclk				<= '0';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
		
		end case;
			 
end process;
			





-- shift par in ser out

process (clk)
begin
		if clk'event and clk = '1' then
			if reset = '1' then
				shift_reg_par_in_ser_out_i <=  (others => '0');
			else
				if load_data = '1' then
					shift_reg_par_in_ser_out_i <= '0' & read_write & reg_add & "000" & x"000000";
				elsif load_payload = '1' then
					shift_reg_par_in_ser_out_i <= d_to_slave & x"0000";
				elsif load_reset = '1' then
					shift_reg_par_in_ser_out_i <= x"FFFFFFFF";
				elsif en_shift_out = '1' then
					shift_reg_par_in_ser_out_i 	<= shl(shift_reg_par_in_ser_out_i, "1");
					shift_reg_par_in_ser_out_i(0)	<= '0';
				end if;
			end if;
		end if;
end process;

din <= shift_reg_par_in_ser_out_i(31);		
				
-- shift ser in par out

process (clk)
begin
		if clk'event and clk = '1' then
			if reset = '1' then
				shift_reg_ser_in_par_out_i 	<= (others => '0');
			else 
				if en_shift_in = '1' then
					shift_reg_ser_in_par_out_i 	<= shl(shift_reg_ser_in_par_out_i, "1");
					shift_reg_ser_in_par_out_i(0)	<= dout_rdy;
				end if;
			end if;
		end if;
end process;

d_from_slave <= shift_reg_ser_in_par_out_i;	


end Behavioral;

