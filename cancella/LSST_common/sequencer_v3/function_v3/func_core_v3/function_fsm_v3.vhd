----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:17 04/10/2013 
-- Design Name: 
-- Module Name:    function_fsm_v3 - Behavioral 
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

entity function_fsm_v3 is

  port (
    reset               : in  std_logic;
    clk                 : in  std_logic;
    start_function      : in  std_logic;
    func_time_in        : in  std_logic_vector(15 downto 0);
    func_time_in_plus1  : in  std_logic_vector(15 downto 0);
    func_time_add       : out std_logic_vector(3 downto 0);
    func_time_add_plus1 : out std_logic_vector(3 downto 0);
    func_out_add        : out std_logic_vector(3 downto 0);
    function_end        : out std_logic
    );

end function_fsm_v3;

architecture Behavioral of function_fsm_v3 is

  type state_type is (wait_start, ts0, ts1, ts2, ts3, ts4,
                        ts5, ts6, ts7, ts8, ts9, ts10,
                        ts11, ts12, ts13, ts14, ts15
                        );
  signal pres_state, next_state : state_type;

  signal next_func_time_add       : std_logic_vector(3 downto 0);
  signal next_func_time_add_plus1 : std_logic_vector(3 downto 0);
  signal next_func_out_add        : std_logic_vector(3 downto 0);
  signal next_function_end        : std_logic;
  signal next_ts_cnt              : std_logic_vector(15 downto 0);
  signal ts_cnt                   : std_logic_vector(15 downto 0);

begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state          <= wait_start;
        func_time_add       <= (others => '0');
        func_time_add_plus1 <= (others => '0');
        func_out_add        <= (others => '0');
        function_end        <= '0';
        ts_cnt              <= x"0001";
        
      else
        pres_state          <= next_state;
        func_time_add       <= next_func_time_add;
        func_time_add_plus1 <= next_func_time_add_plus1;
        func_out_add        <= next_func_out_add;
        function_end        <= next_function_end;
        ts_cnt              <= next_ts_cnt;
      end if;
    end if;
  end process;


  process (pres_state, start_function, ts_cnt, func_time_in, func_time_in_plus1)
  begin
    -------------------- outputs defoult values --------------------
    next_func_time_add       <= (others => '0');
    next_func_time_add_plus1 <= (others => '0');
    next_func_out_add        <= (others => '0');
    next_function_end        <= '0';
    next_ts_cnt              <= x"0001";

    case pres_state is
      
      when wait_start =>
        if start_function = '0' then
          next_state               <= wait_start;
          next_ts_cnt              <= x"0001";
          next_func_time_add       <= x"0";
          next_func_time_add_plus1 <= x"1";
          next_func_out_add        <= x"0";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts0; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          end if;
        end if;
        
      when ts0 =>
        if ts_cnt < func_time_in then
          next_state               <= ts0;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"0";
          next_func_time_add_plus1 <= x"1";
          next_func_out_add        <= x"0";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts1; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"1";
            next_func_time_add_plus1 <= x"2";
            next_func_out_add        <= x"1";
          end if;
        end if;
        
      when ts1 =>
        if ts_cnt < func_time_in then
          next_state               <= ts1;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"1";
          next_func_time_add_plus1 <= x"2";
          next_func_out_add        <= x"1";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts2; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"2";
            next_func_time_add_plus1 <= x"3";
            next_func_out_add        <= x"2";
          end if;
        end if;
        
      when ts2 =>
        if ts_cnt < func_time_in then
          next_state               <= ts2;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"2";
          next_func_time_add_plus1 <= x"3";
          next_func_out_add        <= x"2";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts3; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"3";
            next_func_time_add_plus1 <= x"4";
            next_func_out_add        <= x"3";
          end if;
        end if;
        
      when ts3 =>
        if ts_cnt < func_time_in then
          next_state               <= ts3;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"3";
          next_func_time_add_plus1 <= x"4";
          next_func_out_add        <= x"3";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts4; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"4";
            next_func_time_add_plus1 <= x"5";
            next_func_out_add        <= x"4";
          end if;
        end if;
        
      when ts4 =>
        if ts_cnt < func_time_in then
          next_state               <= ts4;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"4";
          next_func_time_add_plus1 <= x"5";
          next_func_out_add        <= x"4";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts5; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"5";
            next_func_time_add_plus1 <= x"6";
            next_func_out_add        <= x"5";
          end if;
        end if;
        
      when ts5 =>
        if ts_cnt < func_time_in then
          next_state               <= ts5;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"5";
          next_func_time_add_plus1 <= x"6";
          next_func_out_add        <= x"5";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts6; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"6";
            next_func_time_add_plus1 <= x"7";
            next_func_out_add        <= x"6";
          end if;
        end if;
        
      when ts6 =>
        if ts_cnt < func_time_in then
          next_state               <= ts6;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"6";
          next_func_time_add_plus1 <= x"7";
          next_func_out_add        <= x"6";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts7; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"7";
            next_func_time_add_plus1 <= x"8";
            next_func_out_add        <= x"7";
          end if;
        end if;
        
      when ts7 =>
        if ts_cnt < func_time_in then
          next_state               <= ts7;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"7";
          next_func_time_add_plus1 <= x"8";
          next_func_out_add        <= x"7";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts8; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"8";
            next_func_time_add_plus1 <= x"9";
            next_func_out_add        <= x"8";
          end if;
        end if;
        
      when ts8 =>
        if ts_cnt < func_time_in then
          next_state               <= ts8;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"8";
          next_func_time_add_plus1 <= x"9";
          next_func_out_add        <= x"8";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts9; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"9";
            next_func_time_add_plus1 <= x"a";
            next_func_out_add        <= x"9";
          end if;
        end if;
        
      when ts9 =>
        if ts_cnt < func_time_in then
          next_state               <= ts9;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"9";
          next_func_time_add_plus1 <= x"a";
          next_func_out_add        <= x"9";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts10; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"a";
            next_func_time_add_plus1 <= x"b";
            next_func_out_add        <= x"a";
          end if;
        end if;
        
      when ts10 =>
        if ts_cnt < func_time_in then
          next_state               <= ts10;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"a";
          next_func_time_add_plus1 <= x"b";
          next_func_out_add        <= x"a";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts11; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"b";
            next_func_time_add_plus1 <= x"c";
            next_func_out_add        <= x"b";
          end if;
        end if;
        
      when ts11 =>
        if ts_cnt < func_time_in then
          next_state               <= ts11;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"b";
          next_func_time_add_plus1 <= x"c";
          next_func_out_add        <= x"b";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts12; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"c";
            next_func_time_add_plus1 <= x"d";
            next_func_out_add        <= x"c";
          end if;
        end if;
        
      when ts12 =>
        if ts_cnt < func_time_in then
          next_state               <= ts12;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"c";
          next_func_time_add_plus1 <= x"d";
          next_func_out_add        <= x"c";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts13; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"d";
            next_func_time_add_plus1 <= x"e";
            next_func_out_add        <= x"d";
          end if;
        end if;
        
      when ts13 =>
        if ts_cnt < func_time_in then
          next_state               <= ts13;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"d";
          next_func_time_add_plus1 <= x"e";
          next_func_out_add        <= x"d";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts14; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"e";
            next_func_time_add_plus1 <= x"f";
            next_func_out_add        <= x"e";
          end if;
        end if;
        
      when ts14 =>
        if ts_cnt < func_time_in then
          next_state               <= ts14;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"e";
          next_func_time_add_plus1 <= x"f";
          next_func_out_add        <= x"e";
        else
          if func_time_in_plus1 = x"0000" then
            next_state               <= wait_start;
            next_function_end        <= '1';
            next_ts_cnt              <= x"0001";
            next_func_time_add       <= x"0";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"0";
          else
            next_state <= ts15; 
                                               next_ts_cnt <= x"0001";
            next_func_time_add       <= x"f";
            next_func_time_add_plus1 <= x"1";
            next_func_out_add        <= x"f";
          end if;
        end if;
        
      when ts15 =>
        if ts_cnt < func_time_in then
          next_state               <= ts15;
          next_ts_cnt              <= ts_cnt + 1;
          next_func_time_add       <= x"f";
          next_func_time_add_plus1 <= x"1";
          next_func_out_add        <= x"f";
        else
          next_state               <= wait_start;
          next_function_end        <= '1';
          next_ts_cnt              <= x"0001";
          next_func_time_add       <= x"0";
          next_func_time_add_plus1 <= x"1";
          next_func_out_add        <= x"0";
        end if;
    end case;
  end process;

end Behavioral;

