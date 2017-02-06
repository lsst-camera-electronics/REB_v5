----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:09 05/31/2013 
-- Design Name: 
-- Module Name:    aspic_3_spi_link_programmer - Behavioral 
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

entity aspic_3_spi_link_programmer is

generic (clk_divide	: integer := 4);

port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start						: in  std_logic;
		start_reset				: in  std_logic;
		read_write				: in  std_logic;
		miso						: in  std_logic;
		reg_add					: in  std_logic_vector(6 downto 0);
		d_to_slave				: in  std_logic_vector(15 downto 0);
		mosi						: out std_logic;
		ss							: out std_logic;
		sclk						: out std_logic;
		n_reset					: out std_logic;
		busy						: out std_logic;
		d_from_slave_ready	: out std_logic;
		d_from_slave			: out std_logic_vector(15 downto 0)
		);

end aspic_3_spi_link_programmer;

architecture Behavioral of aspic_3_spi_link_programmer is
type state_type is (wait_start, 
							load_comm_reg, load_payload_w,
							w_comm_reg_w_clk1, w_comm_reg_w_clk0, 
							w_reg_16bit_clk1, w_reg_16bit_clk0, 
							r_reg_clk1, r_dummy_clk1, r_dummy_clk0, 
							r_reg_clk0, wait_for_last_shift,
							reset_state
							); 


signal pres_state, next_state : state_type;
signal next_load_data				: std_logic;
signal next_load_payload			: std_logic;
signal next_en_shift_out			: std_logic;
signal next_en_shift_in				: std_logic;
--signal next_reset_shift				: std_logic;
signal next_ss							: std_logic;
signal next_sclk						: std_logic;
signal next_n_reset					: std_logic;
signal next_busy						: std_logic;
signal next_d_from_slave_ready	: std_logic;




signal next_clk_cnt			: integer range 0 to clk_divide;
signal next_bit_cnt			: integer range 0 to 16;	
signal next_reset_cnt		: integer range 0 to 8;	
signal clk_cnt					: integer range 0 to clk_divide;
signal bit_cnt					: integer range 0 to 16;	
signal reset_cnt				: integer range 0 to 8;	

-- shift par in ser out
signal shift_reg_par_in_ser_out_i : std_logic_vector(15 downto 0);	
signal load_payload	: std_logic;
signal load_data 		: std_logic;
signal en_shift_out	: std_logic;
--signal reset_shift	: std_logic;


-- shift ser in par out
signal shift_reg_ser_in_par_out_i 	: std_logic_vector(15 downto 0);
signal en_shift_in						: std_logic;



begin

process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state   			<= wait_start;
			load_data				<= '0';
			load_payload			<= '0';
			en_shift_out			<= '0';
			en_shift_in				<= '0';
--			reset_shift				<= '0';
			ss							<= '1';
			sclk						<= '0';
			n_reset					<= '1';
			busy						<= '0';
			d_from_slave_ready	<= '0';
			clk_cnt 					<= 0;
			bit_cnt     			<= 0;
		else
			pres_state   			<= next_state;
			load_data				<= next_load_data;
			load_payload			<= next_load_payload;
			en_shift_out			<= next_en_shift_out;
			en_shift_in				<= next_en_shift_in;
--			reset_shift				<= next_reset_shift;
			ss							<= next_ss;
			sclk						<= next_sclk;
			n_reset					<= next_n_reset;	
			busy						<= next_busy;
			d_from_slave_ready	<= next_d_from_slave_ready;
			clk_cnt 					<= next_clk_cnt;
			bit_cnt     			<= next_bit_cnt;
			reset_cnt				<= next_reset_cnt;
		 end if;
    end if;
  end process;
  
  process (pres_state, start, read_write, reg_add, miso, clk_cnt, bit_cnt, start_reset, reset_cnt)
  begin

    -------------------- outputs default values  --------------------
	 
			next_load_data					<= '0';
			next_load_payload				<= '0';
			next_en_shift_out				<= '0';
			next_en_shift_in				<= '0';
--			next_reset_shift				<= '0';
			next_ss							<= '0';
			next_sclk						<= '0';
			next_n_reset					<= '1';
			next_busy						<= '1';
			next_d_from_slave_ready		<= '0';
			next_clk_cnt 					<= clk_cnt;
			next_bit_cnt     				<= bit_cnt;
			next_reset_cnt					<= reset_cnt;
			
	case pres_state is


		when wait_start =>
			if start ='1' and start_reset = '0' then
				next_state				<= load_comm_reg;
				next_load_data			<= '1';
			elsif start ='0' and start_reset = '1' then
				next_state				<= reset_state;
				next_n_reset			<= '0';
			else
				next_state				<= wait_start;
				next_ss					<= '1';
				next_busy				<= '0';
			end if;
		
		when load_comm_reg => 
			if clk_cnt = clk_divide then
				next_state		<= w_comm_reg_w_clk1;
				next_sclk		<= '0';
				next_clk_cnt	<= 0;
			else
				next_state		<= load_comm_reg;
				next_sclk		<= '0';
				next_clk_cnt	<= clk_cnt + 1;
			end if;
		
		when w_comm_reg_w_clk1 => 
			if clk_cnt = clk_divide then
				if bit_cnt = 7  then
					if read_write ='1' then
						next_state				<= load_payload_w;
						next_clk_cnt			<= 0;
					else
						next_state				<= r_dummy_clk0;
						next_clk_cnt			<= 0;
						next_bit_cnt			<= 0;
					end if;
				else
					next_state				<= w_comm_reg_w_clk0;
					next_sclk				<= '1';
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
				next_en_shift_out		<= '1';
				next_sclk				<= '0';
				next_bit_cnt			<= bit_cnt + 1;
			else
				next_state        	<= w_comm_reg_w_clk0;
				next_sclk				<= '0';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
		
		when load_payload_w => 
			if clk_cnt = clk_divide then
				next_state      		<= w_reg_16bit_clk1;
				next_clk_cnt			<= 0;
				next_bit_cnt			<= 0;
				next_sclk				<= '0';
				next_load_payload		<= '1';
			else
				next_state				<= load_payload_w;
				next_sclk				<= '0';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
				
		when w_reg_16bit_clk1 => 
			if clk_cnt = clk_divide then
				next_state			<= w_reg_16bit_clk0;
				next_sclk			<= '1';
				next_clk_cnt		<= 0;
			else
				next_state				<= w_reg_16bit_clk1;
				next_sclk				<= '1';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
			
		when w_reg_16bit_clk0	=> 
			if clk_cnt = clk_divide then
				if bit_cnt = 15  then
					next_state 			<= wait_start;
					next_sclk			<= '0';
					next_clk_cnt		<= 0;
					next_bit_cnt		<= 0;
					next_en_shift_out	<= '1';
				else
					next_state				<= w_reg_16bit_clk1;
					next_clk_cnt			<= 0;
					next_bit_cnt			<= bit_cnt + 1;
					next_en_shift_out		<= '1';
					next_sclk				<= '0';
				end if;
			else
				next_state        	<= w_reg_16bit_clk0;
				next_sclk				<= '0';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
				
		when r_dummy_clk0 => 
			if clk_cnt = clk_divide then
				next_state        	<= r_dummy_clk1;
				next_clk_cnt			<= 0;
				next_sclk				<= '1';
        else
				next_state        	<= r_dummy_clk0;
				next_clk_cnt			<= clk_cnt + 1;
				next_sclk				<= '0';
		  end if;
		  
		when r_dummy_clk1 => 
			if clk_cnt = clk_divide then
				next_state        	<= r_reg_clk0;
				next_clk_cnt			<= 0;
				next_sclk				<= '0';
				next_en_shift_out		<= '1';
        else
				next_state        	<= r_dummy_clk1;
				next_clk_cnt			<= clk_cnt + 1;
				next_sclk				<= '1';
		  end if;
		
		when r_reg_clk1 => 
			if clk_cnt = clk_divide then
				next_state       		<= r_reg_clk0;
				next_clk_cnt			<= 0;
				next_sclk				<= '0';
			else
				next_state				<= r_reg_clk1;
				next_sclk				<= '1';
				next_clk_cnt			<= clk_cnt + 1;
			end if;
			
		when r_reg_clk0 =>
			if clk_cnt = clk_divide then
				if bit_cnt = 16 then
					next_state						<= wait_start;
					next_d_from_slave_ready		<= '1';
					next_clk_cnt					<= 0;
					next_bit_cnt					<= 0;
				else 
					next_state        	<= r_reg_clk1;
					next_clk_cnt			<= 0;
					next_bit_cnt			<= bit_cnt + 1;
					next_sclk				<= '1';
					next_en_shift_in		<= '1';
				end if;
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
		
		when reset_state => 
			if reset_cnt = 8 then
				next_state				<= wait_start;
				next_reset_cnt			<= 0;
			else 
				next_state				<= reset_state;
				next_n_reset			<= '0';
				next_reset_cnt			<= reset_cnt + 1;
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
					shift_reg_par_in_ser_out_i <= read_write & reg_add & x"00";
				elsif load_payload = '1' then
					shift_reg_par_in_ser_out_i <= d_to_slave;
				elsif en_shift_out = '1' then
					shift_reg_par_in_ser_out_i 	<= shl(shift_reg_par_in_ser_out_i, "1");
					shift_reg_par_in_ser_out_i(0)	<= '0';
				end if;
			end if;
		end if;
end process;

mosi <= shift_reg_par_in_ser_out_i(15);		
				
-- shift ser in par out

process (clk)
begin
		if clk'event and clk = '1' then
			if reset = '1' then
				shift_reg_ser_in_par_out_i 	<= (others => '0');
			else 
				if en_shift_in = '1' then
					shift_reg_ser_in_par_out_i 	<= shl(shift_reg_ser_in_par_out_i, "1");
					shift_reg_ser_in_par_out_i(0)	<= miso;
				end if;
			end if;
		end if;
end process;

d_from_slave <= shift_reg_ser_in_par_out_i;	



end Behavioral;

