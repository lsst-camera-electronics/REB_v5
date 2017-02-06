----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:44:24 04/17/2013 
-- Design Name: 
-- Module Name:    SPI_write - Behavioral 
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

entity SPI_write is

generic (clk_divide	: integer := 4;
			num_bit_max	: integer := 16);
port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start_write				: in  std_logic;
		d_to_slave				: in  std_logic_vector(num_bit_max - 1 downto 0);
		mosi						: out std_logic;
		ss							: out std_logic;
		sclk						: out std_logic
		);

end SPI_write;

architecture Behavioral of SPI_write is

type state_type is (wait_start, w_clk_0, w_clk_1, end_ss_write, end_clk_0, end_clk_1); 


signal pres_state, next_state : state_type;
signal next_load_data				: std_logic;
signal next_en_shift_out			: std_logic;
signal next_ss							: std_logic;
signal next_sclk						: std_logic;
signal next_clk_cnt			: integer range 0 to clk_divide;
signal next_bit_cnt			: integer range 0 to num_bit_max;	
signal clk_cnt					: integer range 0 to clk_divide;
signal bit_cnt					: integer range 0 to num_bit_max;	

-- shift par in ser out
signal shift_reg_par_in_ser_out_i : std_logic_vector(num_bit_max - 1 downto 0);	
signal load_data : std_logic;
signal en_shift_out	: std_logic;

begin

process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state   		<= wait_start;
		  load_data				<= '0';
		  en_shift_out			<= '0';
		  ss						<= '1';
		  sclk					<= '0';
        clk_cnt 				<= 0;
        bit_cnt     			<= 0;
      else
        pres_state   		<= next_state;
		  load_data				<= next_load_data;
		  en_shift_out			<= next_en_shift_out;
		  ss						<= next_ss;
		  sclk					<= next_sclk;
        clk_cnt 				<= next_clk_cnt;
        bit_cnt     			<= next_bit_cnt;

      end if;
    end if;
  end process;
  
  
   process (pres_state, start_write, clk_cnt, bit_cnt)
  begin

    -------------------- outputs default values  --------------------

		next_load_data				<= '0';
		next_en_shift_out			<= '0'; 
		next_ss						<= '1';
		next_sclk					<= '0';
		next_clk_cnt				<= clk_cnt;
		next_bit_cnt				<= bit_cnt;	
				
    case pres_state is


      when wait_start =>
        if start_write ='1' then
			next_state        	<= w_clk_0;
			next_load_data			<= '1';
			next_ss					<= '0';
        else 
			next_state        	<= wait_start;
		  end if;

-------------------------------------------------------- WRITE PROCEDURE  --------------------------------------------------------
		  
		  when w_clk_0 =>
        if clk_cnt = clk_divide then
			next_state        	<= w_clk_1;
			next_clk_cnt			<= 0;
			next_bit_cnt			<= bit_cnt + 1;
			next_ss					<= '0';
			next_sclk				<= '1';
        else
			next_state        	<= w_clk_0;
			next_clk_cnt			<= clk_cnt + 1;
			next_ss					<= '0';
		  end if;
		  
		  when w_clk_1 =>
        if clk_cnt = clk_divide then
				if bit_cnt = num_bit_max then
				 next_state      	<= end_ss_write;
				 next_clk_cnt		<= 0;
				 next_bit_cnt		<= 0;
				 next_ss				<= '0';
				else
				 next_state       	<= w_clk_0;
				 next_clk_cnt			<= 0;
				 next_en_shift_out	<= '1';
				 next_ss					<= '0';
				end if;
			else 
				next_state        	<= w_clk_1;
				next_sclk				<= '1';
				next_clk_cnt			<= clk_cnt + 1;
				next_ss					<= '0';
			end if;


---------------------------------------------------------- close rite  --------------------------------------------------------

when end_ss_write => 
			if clk_cnt = clk_divide then
				next_state        	<= end_clk_0;
				next_clk_cnt					<= 0;
   			 next_bit_cnt					<= 0;
        else
				next_state        	<= end_ss_write;
				next_clk_cnt			<= clk_cnt + 1;
				next_ss					<= '0';
		  end if;

 when end_clk_0 =>
        if clk_cnt = clk_divide then
			next_state        	<= end_clk_1;
			next_clk_cnt			<= 0;
			next_sclk				<= '1';
        else
			next_state        	<= end_clk_0;
			next_clk_cnt			<= clk_cnt + 1;
		  end if;
		  
		  when end_clk_1 =>
        if clk_cnt = clk_divide then
				next_state       	<= wait_start;
				next_clk_cnt		<= 0;
			else 
				next_state        	<= end_clk_1;
				next_sclk				<= '1';
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
					shift_reg_par_in_ser_out_i <= d_to_slave;
				elsif en_shift_out = '1' then
					shift_reg_par_in_ser_out_i 	<= shl(shift_reg_par_in_ser_out_i, "1");
					shift_reg_par_in_ser_out_i(0)	<= '0';
				end if;
			end if;
		end if;
end process;

mosi <= shift_reg_par_in_ser_out_i(num_bit_max - 1);

end Behavioral;

