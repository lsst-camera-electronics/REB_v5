----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:09:09 08/02/2016 
-- Design Name: 
-- Module Name:    ads8634_controller_fsm - Behavioral 
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ads8634_controller_fsm is

  port (
    clk                  : in  std_logic;
    reset                : in  std_logic;
    start_multiread      : in  std_logic;
    start_singleread     : in  std_logic;
    start_read_adc_reg   : in  std_logic;
    spi_busy             : in  std_logic;
    mux_address_in       : in  std_logic_vector(5 downto 0);
    data_to_adc          : in  std_logic_vector(15 downto 0);
    start_spi            : out std_logic;
    link_busy            : out std_logic;
    pwd_line             : out std_logic;
    mux_sam_en_out       : out std_logic;
    mux_bias_en_out      : out std_logic;
    mux_sam_address_out  : out std_logic_vector(2 downto 0);
    mux_bias_address_out : out std_logic_vector(2 downto 0);
    data_to_spi          : out std_logic_vector(15 downto 0);
    out_reg_en_bus       : out std_logic_vector(6 downto 0)
    );

end ads8634_controller_fsm;

architecture Behavioral of ads8634_controller_fsm is

  type state_type is (wait_start,
                      power_up_multiread, power_up_singleread, power_up_read_reg,
                      send_reset, s_spi_send_reset,
                      send_dummy, s_spi_send_dummy,
                      wait_pup_multiread, wait_pup_singleread,
                      wait_pup_read_reg,
                      write1, s_spi_read_multiread_1,
                      write2_read1, s_spi_read_multiread_2,
                      write3_read2, s_spi_read_multiread_3,
                      write4_read3, s_spi_read_multiread_4,
                      write5_read4, s_spi_read_multiread_5,
                      write6_read5, s_spi_read_multiread_6,
							 write_dummy_read6,
							 wait_mux_mutiread_2,
							 wait_mux_mutiread_3, wait_mux_mutiread_4,
							 wait_mux_mutiread_5, wait_mux_mutiread_6,
                      s_spi_read_multiread_dummy,
                      read_singleread, s_spi_read_singleread,
                      read_singleread_1, s_spi_read_singleread_1,
							 s_spi_read_reg, read_reg, send_dummy_read_reg,
							 s_spi_send_dummy_read_reg
                      );


  signal pres_state, next_state    : state_type;
  signal next_start_spi            : std_logic;
  signal next_link_busy            : std_logic;
  signal next_pwd_line             : std_logic;
  signal next_mux_sam_en_out       : std_logic;
  signal next_mux_bias_en_out      : std_logic;
  signal next_mux_sam_address_out  : std_logic_vector(2 downto 0);
  signal next_mux_bias_address_out : std_logic_vector(2 downto 0);
  signal next_data_to_spi          : std_logic_vector(15 downto 0);
  signal next_out_reg_en_bus       : std_logic_vector(6 downto 0);

  signal next_pup_cnt : integer range 0 to 1000;
  signal pup_cnt      : integer range 0 to 1000;

-- ADC data control strings
  constant reset_cmd : std_logic_vector(15 downto 0) := x"0201";
  constant dummy_cmd : std_logic_vector(15 downto 0) := x"FE00";  -- set reg page 0
  constant dummy_read_cmd : std_logic_vector(15 downto 0) := x"FE00";  -- set reg page 0


  constant read_multi_1 : std_logic_vector(15 downto 0) := x"080C";  -- reads channel 2  T_top_ch1 (ADC ch0 range 0-5V)
  constant read_multi_2 : std_logic_vector(15 downto 0) := x"080C";  -- reads channel 3  T_bot_ch1 (ADC ch0 range 0-5V)
  constant read_multi_3 : std_logic_vector(15 downto 0) := x"080C";  -- reads channel 6  T_top_ch2 (ADC ch0 range 0-5V)
  constant read_multi_4 : std_logic_vector(15 downto 0) := x"080C";  -- reads channel 7  T_bot_ch2 (ADC ch0 range 0-5V)
  constant read_multi_5 : std_logic_vector(15 downto 0) := x"082C";  -- reads channel 10 T_top_ch3 (ADC ch1 range 0-5V)
  constant read_multi_6 : std_logic_vector(15 downto 0) := x"082C";  -- reads channel 11 T_bot_ch3 (ADC ch1 range 0-5V)

  constant mux_multi_1 : std_logic_vector(2 downto 0) := "010";  -- set mux to read ASPIC T_top_ch1 (Mux ch2)
  constant mux_multi_2 : std_logic_vector(2 downto 0) := "011";  -- set mux to read ASPIC T_bot_ch1 (Mux ch3)
  constant mux_multi_3 : std_logic_vector(2 downto 0) := "110";  -- set mux to read ASPIC T_top_ch2 (Mux ch6)
  constant mux_multi_4 : std_logic_vector(2 downto 0) := "111";  -- set mux to read ASPIC T_bot_ch2 (Mux ch7)
  constant mux_multi_5 : std_logic_vector(2 downto 0) := "010";  -- set mux to read ASPIC T_top_ch3 (Mux ch2) 
  constant mux_multi_6 : std_logic_vector(2 downto 0) := "011";  -- set mux to read ASPIC T_bot_ch3 (Mux ch3)
  
  constant mux_set_time : integer := 500;

begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state           <= wait_start;
        start_spi            <= '0';
        link_busy            <= '0';
        pwd_line             <= '0';
        mux_sam_en_out       <= '0';
        mux_bias_en_out      <= '0';
        mux_sam_address_out  <= (others => '0');
        mux_bias_address_out <= (others => '0');
        data_to_spi          <= (others => '0');
        out_reg_en_bus       <= (others => '0');
        pup_cnt              <= 0;
      else
        pres_state           <= next_state;
        start_spi            <= next_start_spi;
        link_busy            <= next_link_busy;
        data_to_spi          <= next_data_to_spi;
        pwd_line             <= next_pwd_line;
        mux_sam_en_out       <= next_mux_sam_en_out;
        mux_bias_en_out      <= next_mux_bias_en_out;
        mux_sam_address_out  <= next_mux_sam_address_out;
        mux_bias_address_out <= next_mux_bias_address_out;
        out_reg_en_bus       <= next_out_reg_en_bus;
        pup_cnt              <= next_pup_cnt;
      end if;
    end if;
  end process;


  process (pres_state, start_multiread, start_singleread, start_read_adc_reg, spi_busy, pup_cnt)
  begin

    -------------------- outputs default values  --------------------
    
    next_start_spi            <= '0';
    next_link_busy            <= '1';
    next_pwd_line             <= '1';
    next_mux_sam_en_out       <= '1';
    next_mux_bias_en_out      <= '1';
    next_mux_sam_address_out  <= (others => '0');
    next_mux_bias_address_out <= (others => '0');
    next_data_to_spi          <= (others => '0');
    next_out_reg_en_bus       <= (others => '0');
    next_pup_cnt              <= pup_cnt;

    case pres_state is

      when wait_start =>
        if start_multiread = '1' and start_singleread = '0' and start_read_adc_reg = '0' then
          next_state       <= power_up_multiread;
          next_data_to_spi <= reset_cmd;
        elsif start_multiread = '0' and start_singleread = '1' and start_read_adc_reg = '0' then
          next_state                <= power_up_singleread;
          next_data_to_spi          <= dummy_cmd;
          next_mux_sam_address_out  <= mux_address_in (5 downto 3);
          next_mux_bias_address_out <= mux_address_in (2 downto 0);
        elsif start_multiread = '0' and start_singleread = '0' and start_read_adc_reg = '1' then
          next_state       <= power_up_read_reg;
          next_data_to_spi <= dummy_cmd;
        else
          next_state     <= wait_start;
          next_link_busy <= '0';
          next_pwd_line  <= '0';
        end if;

-- multiread ASPIC T
        
      when power_up_multiread =>  -- I'm performing a reset to activate                             -- the ADC power up
        next_state       <= send_reset;
        next_start_spi   <= '1';
        next_data_to_spi <= reset_cmd;
        
      when send_reset =>
        next_state       <= s_spi_send_reset;
        next_data_to_spi <= reset_cmd;
        
      when s_spi_send_reset =>
        if spi_busy = '1' then
          next_state       <= s_spi_send_reset;
          next_data_to_spi <= reset_cmd;
        else
          next_state               <= wait_pup_multiread;
          next_data_to_spi         <= read_multi_1;
          next_mux_sam_address_out <= mux_multi_1;
        end if;

      when wait_pup_multiread =>
        if pup_cnt = 250 then
          next_state               <= s_spi_read_multiread_1;
          next_data_to_spi         <= read_multi_1;
          next_mux_sam_address_out <= mux_multi_1;
			 next_start_spi           <= '1';
          next_pup_cnt             <= 0;
        else
          next_state   <= wait_pup_multiread;
			 next_data_to_spi         <= read_multi_1;
			 next_mux_sam_address_out <= mux_multi_1;
          next_pup_cnt <= pup_cnt + 1;
        end if;

      when s_spi_read_multiread_1 =>
        next_state               <= write1;
        next_data_to_spi         <= read_multi_1;
        next_mux_sam_address_out <= mux_multi_1;


      when write1 =>
        if spi_busy = '1' then
          next_state               <= write1;
          next_data_to_spi         <= read_multi_1;
          next_mux_sam_address_out <= mux_multi_1;
			 next_start_spi           <= '0';
        else
          next_state               <= wait_mux_mutiread_2;
          next_data_to_spi         <= read_multi_2;
          next_mux_sam_address_out <= mux_multi_2;
        end if;

		when wait_mux_mutiread_2 => 
			if pup_cnt = mux_set_time then
				next_state               <= s_spi_read_multiread_2;
				next_start_spi           <= '1';
				next_data_to_spi         <= read_multi_2;
				next_mux_sam_address_out <= mux_multi_2;
				next_pup_cnt <= 0;
			else
				next_state               <= wait_mux_mutiread_2;
				next_data_to_spi         <= read_multi_2;
				next_mux_sam_address_out <= mux_multi_2;
				next_pup_cnt <= pup_cnt + 1;
        end if;


      when s_spi_read_multiread_2 =>
        next_state               <= write2_read1;
        next_data_to_spi         <= read_multi_2;
        next_mux_sam_address_out <= mux_multi_2;

      when write2_read1 =>
        if spi_busy = '1' then
          next_state               <= write2_read1;
          next_data_to_spi         <= read_multi_2;
          next_mux_sam_address_out <= mux_multi_2;
        else
			 next_state               <= wait_mux_mutiread_3;
          next_data_to_spi         <= read_multi_3;
          next_mux_sam_address_out <= mux_multi_3;
			 next_out_reg_en_bus      <= "0000001";
		  end if;
		  
		  when wait_mux_mutiread_3 => 
			if pup_cnt = mux_set_time then
				next_state               <= s_spi_read_multiread_3;
				next_start_spi           <= '1';
				next_data_to_spi         <= read_multi_3;
				next_mux_sam_address_out <= mux_multi_3;
				next_pup_cnt <= 0;
			else
				next_state               <= wait_mux_mutiread_3;
				next_data_to_spi         <= read_multi_3;
				next_mux_sam_address_out <= mux_multi_3;
				next_pup_cnt <= pup_cnt + 1;
        end if;
		  
      when s_spi_read_multiread_3 =>
        next_state               <= write3_read2;
        next_data_to_spi         <= read_multi_3;
        next_mux_sam_address_out <= mux_multi_3;

      when write3_read2 =>
        if spi_busy = '1' then
          next_state               <= write3_read2;
          next_data_to_spi         <= read_multi_3;
          next_mux_sam_address_out <= mux_multi_3;
		else
			 next_state               <= wait_mux_mutiread_4;
          next_data_to_spi         <= read_multi_4;
          next_mux_sam_address_out <= mux_multi_4;
			 next_out_reg_en_bus      <= "0000010";
		  end if;
		  
		  when wait_mux_mutiread_4 => 
			if pup_cnt = mux_set_time then
				next_state               <= s_spi_read_multiread_4;
				next_start_spi           <= '1';
				next_data_to_spi         <= read_multi_4;
				next_mux_sam_address_out <= mux_multi_4;
				next_pup_cnt <= 0;
			else
				next_state               <= wait_mux_mutiread_4;
				next_data_to_spi         <= read_multi_4;
				next_mux_sam_address_out <= mux_multi_4;
				next_pup_cnt <= pup_cnt + 1;
        end if;

      when s_spi_read_multiread_4 =>
        next_state               <= write4_read3;
        next_data_to_spi         <= read_multi_4;
        next_mux_sam_address_out <= mux_multi_4;

      when write4_read3 =>
        if spi_busy = '1' then
          next_state               <= write4_read3;
          next_data_to_spi         <= read_multi_4;
          next_mux_sam_address_out <= mux_multi_4; 
			else
			 next_state               <= wait_mux_mutiread_5;
          next_data_to_spi         <= read_multi_5;
          next_mux_sam_address_out <= mux_multi_5;
			 next_out_reg_en_bus      <= "0000100";
		  end if;
		  
		  when wait_mux_mutiread_5 => 
			if pup_cnt = mux_set_time then
				next_state               <= s_spi_read_multiread_5;
				next_start_spi           <= '1';
				next_data_to_spi         <= read_multi_5;
				next_mux_sam_address_out <= mux_multi_5;
				next_pup_cnt <= 0;
			else
				next_state               <= wait_mux_mutiread_5;
				next_data_to_spi         <= read_multi_5;
				next_mux_sam_address_out <= mux_multi_5;
				next_pup_cnt <= pup_cnt + 1;
        end if;

      when s_spi_read_multiread_5 =>
        next_state               <= write5_read4;
        next_data_to_spi         <= read_multi_5;
        next_mux_sam_address_out <= mux_multi_5;
        
      when write5_read4 =>
        if spi_busy = '1' then
          next_state               <= write5_read4;
          next_data_to_spi         <= read_multi_5;
          next_mux_sam_address_out <= mux_multi_5;
       else
			 next_state               <= wait_mux_mutiread_6;
          next_data_to_spi         <= read_multi_6;
          next_mux_sam_address_out <= mux_multi_6;
			 next_out_reg_en_bus      <= "0001000";
		  end if;
		  
		  when wait_mux_mutiread_6 => 
			if pup_cnt = mux_set_time then
				next_state               <= s_spi_read_multiread_6;
				next_start_spi           <= '1';
				next_data_to_spi         <= read_multi_6;
				next_mux_sam_address_out <= mux_multi_6;
				next_pup_cnt <= 0;
			else
				next_state               <= wait_mux_mutiread_6;
				next_data_to_spi         <= read_multi_6;
				next_mux_sam_address_out <= mux_multi_6;
				next_pup_cnt <= pup_cnt + 1;
        end if;
		  
      when s_spi_read_multiread_6 =>
        next_state       <= write6_read5;
        next_data_to_spi <= read_multi_6;
		  next_mux_sam_address_out <= mux_multi_6;

      when write6_read5 =>
        if spi_busy = '1' then
          next_state       <= write6_read5;
          next_data_to_spi <= dummy_cmd;
			 next_mux_sam_address_out <= mux_multi_6;
        else
          next_state          <= s_spi_read_multiread_dummy;
          next_start_spi      <= '1';
          next_data_to_spi    <= dummy_cmd;
			 next_mux_sam_address_out <= mux_multi_6;
          next_out_reg_en_bus <= "0010000";
        end if;

      when s_spi_read_multiread_dummy =>
        next_state       <= write_dummy_read6;
        next_data_to_spi <= dummy_cmd;
        
      when write_dummy_read6 =>
        if spi_busy = '1' then
          next_state       <= write_dummy_read6;
          next_data_to_spi <= dummy_cmd;
        else
          next_state          <= wait_start;
          next_out_reg_en_bus <= "0100000";
          next_pwd_line       <= '0';
        end if;


-- single read


      when power_up_singleread =>       -- I'm performing a dummy
                                        -- cmd to activate the ADC power up
        next_state                <= send_dummy;
        next_start_spi            <= '1';
        next_data_to_spi          <= dummy_cmd;
        next_mux_sam_address_out  <= mux_address_in (5 downto 3);
        next_mux_bias_address_out <= mux_address_in (2 downto 0);


      when send_dummy =>
        next_state                <= s_spi_send_dummy;
        next_data_to_spi          <= dummy_cmd;
        next_mux_sam_address_out  <= mux_address_in (5 downto 3);
        next_mux_bias_address_out <= mux_address_in (2 downto 0);
        
      when s_spi_send_dummy =>
        if spi_busy = '1' then
          next_state                <= s_spi_send_dummy;
          next_data_to_spi          <= dummy_cmd;
          next_mux_sam_address_out  <= mux_address_in (5 downto 3);
          next_mux_bias_address_out <= mux_address_in (2 downto 0);
        else
          next_state                <= wait_pup_singleread;
          next_mux_sam_address_out  <= mux_address_in (5 downto 3);
          next_mux_bias_address_out <= mux_address_in (2 downto 0);
        end if;

      when wait_pup_singleread =>
        if pup_cnt = 250 then
          next_state                <= s_spi_read_singleread;
          next_start_spi            <= '1';
          next_data_to_spi          <= data_to_adc;
          next_mux_sam_address_out  <= mux_address_in (5 downto 3);
          next_mux_bias_address_out <= mux_address_in (2 downto 0);
          next_pup_cnt              <= 0;
        else
          next_state                <= wait_pup_singleread;
          next_data_to_spi          <= data_to_adc;
          next_mux_sam_address_out  <= mux_address_in (5 downto 3);
          next_mux_bias_address_out <= mux_address_in (2 downto 0);
          next_pup_cnt              <= pup_cnt + 1;
        end if;

      when s_spi_read_singleread =>
        next_state                <= read_singleread;
        next_data_to_spi          <= data_to_adc;
        next_mux_sam_address_out  <= mux_address_in (5 downto 3);
        next_mux_bias_address_out <= mux_address_in (2 downto 0);
        
      when read_singleread =>
        if spi_busy = '1' then
          next_state       <= read_singleread;
          next_start_spi   <= '0';
          next_data_to_spi <= dummy_cmd;
        else
          next_state       <= s_spi_read_singleread_1;
          next_start_spi   <= '1';
          next_data_to_spi <= dummy_cmd;
          next_pup_cnt     <= 0;
        end if;

      when s_spi_read_singleread_1 =>
        next_state       <= read_singleread_1;
        next_data_to_spi <= dummy_cmd;

      when read_singleread_1 =>
        if spi_busy = '1' then
          next_state       <= read_singleread_1;
          next_start_spi   <= '0';
          next_data_to_spi <= dummy_cmd;
        else
          next_state          <= wait_start;
          next_out_reg_en_bus <= "1000000";
          next_pwd_line       <= '0';
        end if;

-- read ADC reg


      when power_up_read_reg =>         -- I'm performing a dummy
                                        -- cmd to activate the ADC power up
        next_state       <= send_dummy;
        next_start_spi   <= '1';
        next_data_to_spi <= dummy_cmd;

      when send_dummy_read_reg =>
        next_state       <= s_spi_send_dummy;
        next_data_to_spi <= dummy_read_cmd;
        
      when s_spi_send_dummy_read_reg =>
        if spi_busy = '1' then
          next_state       <= s_spi_send_dummy;
          next_data_to_spi <= dummy_read_cmd;
        else
          next_state <= wait_pup_read_reg;
        end if;

      when wait_pup_read_reg =>
        if pup_cnt = 10 then
          next_state       <= s_spi_read_reg;
          next_start_spi   <= '1';
          next_data_to_spi <= data_to_adc;
          next_pup_cnt     <= 0;
        else
          next_state       <= wait_pup_read_reg;
          next_data_to_spi <= data_to_adc;
          next_pup_cnt     <= pup_cnt + 1;
        end if;

      when s_spi_read_reg =>
        next_state       <= read_reg;
        next_data_to_spi <= data_to_adc;

      when read_reg =>
        if spi_busy = '1' then
          next_state       <= read_reg;
          next_start_spi   <= '0';
          next_data_to_spi <= data_to_adc;
        else
          next_state          <= wait_start;
          next_out_reg_en_bus <= "1000000";
          next_pwd_line       <= '0';
        end if;





        
        
    end case;
  end process;

end Behavioral;

