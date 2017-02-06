----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:07 04/24/2013 
-- Design Name: 
-- Module Name:    readadcs_v3 - Behavioral 
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

use work.ADC_data_handler_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity readadcs_v3 is

generic (
			conv_time			: integer	:= 50;
			sclk_half_period	: integer	:= 1;
			test_time			: integer	:= 500;
			col_incr_val		: integer	:= 10;
			pix_incr_val		: integer	:= 8
			);

port(
    clk				: in  std_logic;
	 reset			: in  std_logic;
	 start_conv		: in  std_logic;
	 
	 testmode_enb	: in  std_logic;
	 testmode_rst	: in  std_logic;
	 testmode_col	: in  std_logic;
	  
	 adc_data		: in  std_logic_vector(15 downto 0);
	 adc_cnv			: out std_logic;
	 adc_sck			: out std_logic;
	 data_ready		: out std_logic;

    adc_ch   		: out  array1618

    );

end readadcs_v3;

architecture Behavioral of readadcs_v3 is

type state_type is (wait_start, conv, sclk_low, sclk_high, wait_end_startconv, 
						  pattern_reset, col_increment, pix_increment); 


signal pres_state, next_state : state_type;
signal next_adc_cnv				: std_logic;
signal next_adc_sck				: std_logic;
signal next_data_ready			: std_logic;

signal shift_en					: std_logic;
signal next_shift_en				: std_logic;


signal next_conv_cnt			: integer range 0 to conv_time;
signal next_sclk_cnt			: integer range 0 to sclk_half_period;
signal next_bit_cnt			: integer range 0 to 18;	
signal next_test_time_cnt	: integer range 0 to test_time;	

signal next_test_clom_cnt	: std_logic_vector(17 downto 0);	
signal next_test_pix_cnt	: std_logic_vector(17 downto 0);	

signal conv_cnt				: integer range 0 to conv_time;
signal sclk_cnt				: integer range 0 to sclk_half_period;
signal bit_cnt					: integer range 0 to 18;	
signal test_time_cnt			: integer range 0 to test_time;	
signal test_clom_cnt			: std_logic_vector(17 downto 0);	
signal test_pix_cnt			: std_logic_vector(17 downto 0);	




subtype word_18 is std_logic_vector (17 downto 0);
type array1618 is array (15 downto 0) of word_18;

--signal next_data_buf		: array1618;
signal data_buf				: array1618;

signal tst_ch0					: std_logic_vector(17 downto 0);
signal tst_ch1					: std_logic_vector(17 downto 0);
signal tst_ch2					: std_logic_vector(17 downto 0);
signal tst_ch3					: std_logic_vector(17 downto 0);
signal tst_ch4					: std_logic_vector(17 downto 0);
signal tst_ch5					: std_logic_vector(17 downto 0);
signal tst_ch6					: std_logic_vector(17 downto 0);
signal tst_ch7					: std_logic_vector(17 downto 0);

signal next_tst_ch0					: std_logic_vector(17 downto 0);
signal next_tst_ch1					: std_logic_vector(17 downto 0);
signal next_tst_ch2					: std_logic_vector(17 downto 0);
signal next_tst_ch3					: std_logic_vector(17 downto 0);
signal next_tst_ch4					: std_logic_vector(17 downto 0);
signal next_tst_ch5					: std_logic_vector(17 downto 0);
signal next_tst_ch6					: std_logic_vector(17 downto 0);
signal next_tst_ch7					: std_logic_vector(17 downto 0);

begin

process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
			pres_state   		<= wait_start;
			adc_cnv				<= '0';
			adc_sck				<= '0';	
			data_ready			<= '0';
			shift_en				<= '0';
			
			conv_cnt				<= 0;
			sclk_cnt				<= 0;
			bit_cnt				<= 0;
			test_time_cnt		<= 0;
			test_clom_cnt		<= (others => '0');
			test_pix_cnt		<= (others => '0');
			
			tst_ch0				<= (others => '0');
			tst_ch1				<= (others => '0');
			tst_ch2				<= (others => '0');
			tst_ch3				<= (others => '0');
			tst_ch4				<= (others => '0');
			tst_ch5				<= (others => '0');
			tst_ch6				<= (others => '0');
			tst_ch7				<= (others => '0');
			
		else
         pres_state   		<= next_state;
			adc_cnv				<= next_adc_cnv;
			adc_sck				<= next_adc_sck;	
			data_ready			<= next_data_ready;
			shift_en				<= next_shift_en;
			
			conv_cnt				<= next_conv_cnt;
			sclk_cnt				<= next_sclk_cnt;
			bit_cnt				<= next_bit_cnt;
			test_time_cnt		<= next_test_time_cnt;
			test_clom_cnt		<= next_test_clom_cnt;
			test_pix_cnt		<= next_test_pix_cnt;
			
			tst_ch0				<= next_tst_ch0;
			tst_ch1				<= next_tst_ch1;
			tst_ch2				<= next_tst_ch2;
			tst_ch3				<= next_tst_ch3;
			tst_ch4				<= next_tst_ch4;
			tst_ch5				<= next_tst_ch5;
			tst_ch6				<= next_tst_ch6;
			tst_ch7				<= next_tst_ch7;
			
		end if;
    end if;
end process;
  
  
   process (pres_state, start_conv, testmode_enb, testmode_rst, testmode_col, conv_cnt, sclk_cnt, bit_cnt, test_time_cnt,
				test_clom_cnt, test_pix_cnt, tst_ch0, tst_ch1, tst_ch2, tst_ch3, tst_ch4, tst_ch5, tst_ch6, tst_ch7, 
				test_clom_cnt, test_pix_cnt	
				)
  begin

    -------------------- outputs default values  --------------------
	 
			next_adc_cnv				<= '0';
			next_adc_sck				<= '0';	
			next_data_ready			<= '0';
			next_shift_en				<= '0';
			
			next_conv_cnt				<= conv_cnt;
			next_sclk_cnt				<= sclk_cnt;
			next_bit_cnt				<= bit_cnt;
			next_test_time_cnt		<= test_time_cnt;
			next_test_clom_cnt		<= test_clom_cnt;
			next_test_pix_cnt			<= test_pix_cnt;
			next_tst_ch0				<= tst_ch0;
			next_tst_ch1				<= tst_ch1;
			next_tst_ch2				<= tst_ch2;
			next_tst_ch3				<= tst_ch3;
			next_tst_ch4				<= tst_ch4;
			next_tst_ch5				<= tst_ch5;
			next_tst_ch6				<= tst_ch6;
			next_tst_ch7				<= tst_ch7;
			
	case pres_state is

      when wait_start =>
        if start_conv ='1' and testmode_enb ='0' and testmode_rst = '0' and testmode_col = '0' then
				next_state		<= conv;
				next_adc_cnv	<= '1';
				next_conv_cnt	<= conv_cnt + 1;
		elsif start_conv ='0' and testmode_enb ='1' and testmode_rst = '1' and testmode_col = '0' then
				next_state					<= pattern_reset;
				next_test_clom_cnt		<= (others => '0');
				next_test_pix_cnt			<= (others => '0');
		elsif start_conv ='0' and testmode_enb ='1' and testmode_rst = '0' and testmode_col = '1' then
				next_state					<= col_increment;
				next_test_clom_cnt		<= test_clom_cnt + col_incr_val;
		elsif start_conv ='1' and testmode_enb ='1' and testmode_rst = '0' and testmode_col = '0' then
				next_state					<= pix_increment;
				next_tst_ch0				<= test_pix_cnt;
--				next_tst_ch1				<= test_pix_cnt + 1;
--				next_tst_ch2				<= test_pix_cnt + 2;
--				next_tst_ch3				<= test_pix_cnt + 3;
--				next_tst_ch4				<= test_pix_cnt + 4;
--				next_tst_ch5				<= test_pix_cnt + 5;
--				next_tst_ch6				<= test_pix_cnt + 6;
--				next_tst_ch7				<= test_pix_cnt + 7;

				next_tst_ch1				<= test_pix_cnt + 4;
				next_tst_ch2				<= test_pix_cnt + 8;
				next_tst_ch3				<= test_pix_cnt + 12;
				next_tst_ch4				<= test_pix_cnt + 16;
				next_tst_ch5				<= test_pix_cnt + 20;
				next_tst_ch6				<= test_pix_cnt + 24;
				next_tst_ch7				<= test_pix_cnt + 28;
				
				next_test_pix_cnt			<= test_pix_cnt + pix_incr_val;
		else
				next_state					<= wait_start;
				next_conv_cnt				<= 0;
				next_sclk_cnt				<= 0;
				next_bit_cnt				<= 0;
				next_test_time_cnt		<= 0;
		end if;
		
		when conv => 
			if conv_cnt = conv_time then
				next_state		<= sclk_low;
				next_sclk_cnt	<= sclk_cnt + 1;
			else
				next_state		<= conv;
				next_adc_cnv	<= '1';
				next_conv_cnt	<= conv_cnt + 1;
			end if;
			
		when sclk_low => 
			if sclk_cnt = sclk_half_period then
				next_state		<= sclk_high;
				next_adc_sck	<= '1';
				next_shift_en	<= '1';
				next_sclk_cnt	<= 1;
				next_bit_cnt	<= bit_cnt + 1;
				
			else 
				next_state		<= sclk_low;
				next_sclk_cnt	<= sclk_cnt + 1;
			end if;
			
		when sclk_high =>
			if sclk_cnt = sclk_half_period then
				if bit_cnt = 18 then
					next_state					<= wait_end_startconv;
					next_data_ready			<= '1';
					next_conv_cnt				<= 0;
					next_sclk_cnt				<= 0;
					next_bit_cnt				<= 0;
					next_test_time_cnt		<= 0;
				else
					next_state		<= sclk_low;
					next_sclk_cnt	<= 1;
				end if;
			else
				next_state		<= sclk_high;
				next_adc_sck	<= '1';
				next_sclk_cnt	<= sclk_cnt + 1;
			end if;
		
		when wait_end_startconv => 
			if start_conv ='0' then
				next_state		<= wait_start;
			else
				next_state		<= wait_end_startconv;
			end if;
			
		when pattern_reset =>
				next_state		<= wait_start;
		
		when col_increment =>
				if testmode_col = '0' then
					next_state					<= wait_start;
					next_test_pix_cnt			<= test_clom_cnt;
				else
					next_state		<= col_increment;
				end if;
				
		when pix_increment => 
			if test_time_cnt = test_time then
				next_state				<= wait_end_startconv;
				next_data_ready		<= '1';
				next_test_time_cnt	<= 0;
			else
				next_state				<= pix_increment;
				next_test_time_cnt	<= test_time_cnt + 1;
			end if;
		
		end case;
			 
end process;

-- shift ser in par out array
process (clk)
begin
		if clk'event and clk = '1' then
			if reset = '1' then
				data_buf 	<= (others =>(others => '0'));
			else 
				if shift_en = '1' then
				for i in 0 to 15 loop
					data_buf(i) 	<= shl(data_buf(i), "1");
					data_buf(i)(0)	<= adc_data(i);
				end loop;
				end if;
			end if;
		end if;
end process;

  adc_ch(0) 	<= data_buf(0) 	when testmode_enb = '0' else tst_ch0;
  adc_ch(1) 	<= data_buf(1) 	when testmode_enb = '0' else tst_ch1;
  adc_ch(2) 	<= data_buf(2) 	when testmode_enb = '0' else tst_ch2;
  adc_ch(3) 	<= data_buf(3) 	when testmode_enb = '0' else tst_ch3;
  adc_ch(4) 	<= data_buf(4)		when testmode_enb = '0' else tst_ch4;
  adc_ch(5) 	<= data_buf(5) 	when testmode_enb = '0' else tst_ch5;
  adc_ch(6) 	<= data_buf(6) 	when testmode_enb = '0' else tst_ch6;
  adc_ch(7) 	<= data_buf(7) 	when testmode_enb = '0' else tst_ch7;  
  adc_ch(8) 	<= data_buf(8) 	when testmode_enb = '0' else tst_ch0;
  adc_ch(9) 	<= data_buf(9) 	when testmode_enb = '0' else tst_ch1;
  adc_ch(10) 	<= data_buf(10) 	when testmode_enb = '0' else tst_ch2;
  adc_ch(11) 	<= data_buf(11) 	when testmode_enb = '0' else tst_ch3;
  adc_ch(12) 	<= data_buf(12) 	when testmode_enb = '0' else tst_ch4;
  adc_ch(13) 	<= data_buf(13) 	when testmode_enb = '0' else tst_ch5;
  adc_ch(14) 	<= data_buf(14) 	when testmode_enb = '0' else tst_ch6;
  adc_ch(15) 	<= data_buf(15) 	when testmode_enb = '0' else tst_ch7; 
		

end Behavioral;
