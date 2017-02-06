----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:56 11/18/2016 
-- Design Name: 
-- Module Name:    si5342_jitter_cleaner_fsm - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity si5342_jitter_cleaner_fsm is
  port (
    clk          : in  std_logic;
    reset        : in  std_logic;
    start_config : in  std_logic;
    jc_config    : in  std_logic_vector(1 downto 0);
    link_busy    : in  std_logic;
    start_write  : out std_logic;
    config_busy  : out std_logic;
    page         : out std_logic_vector(7 downto 0);
    address      : out std_logic_vector(7 downto 0);
    data_out     : out std_logic_vector(7 downto 0)
    );
end si5342_jitter_cleaner_fsm;

architecture Behavioral of si5342_jitter_cleaner_fsm is

  type state_type is (wait_start, send_set_io, send_pwdn);

  signal pres_state, next_state : state_type;
  signal next_start_write       : std_logic;
  signal next_config_busy       : std_logic;
  signal next_page              : std_logic_vector(7 downto 0);
  signal next_address           : std_logic_vector(7 downto 0);
  signal next_data_out          : std_logic_vector(7 downto 0);

-- data control strings (format is: page_address_data)
  constant set_io_33_cmd : std_logic_vector(23 downto 0) := x"09_43_01";
  constant set_pwdn_cmd  : std_logic_vector(23 downto 0) := x"00_1E_01";
  constant set_pwup_cmd  : std_logic_vector(23 downto 0) := x"00_1E_00";

  
begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state  <= wait_start;
        start_write <= '0';
        config_busy <= '0';
        page        <= (others => '0');
        address     <= (others => '0');
        data_out    <= (others => '0');
      else
        pres_state  <= next_state;
        start_write <= next_start_write;
        config_busy <= next_config_busy;
        page        <= next_page;
        address     <= next_address;
        data_out    <= next_data_out;
      end if;
    end if;
  end process;

  process (pres_state, start_config, jc_config, link_busy)
  begin

    -------------------- outputs default values  --------------------
    
    next_start_write <= '0';
    next_config_busy <= '1';
    next_page        <= (others => '0');
    next_address     <= (others => '0');
    next_data_out    <= (others => '0');

    case pres_state is

      when wait_start =>
        if start_config = '1' and jc_config = "00" then
          next_state       <= send_set_io;
          next_start_write <= '1';
          next_page        <= set_io_33_cmd(23 downto 16);
          next_data_out    <= set_io_33_cmd(7 downto 0);
        else
          next_state       <= wait_start;
          next_config_busy <= '0';
        end if;

      when send_set_io =>
        if link_busy = '0' then
          next_state       <= send_pwdn;
          next_start_write <= '1';
          next_page        <= set_pwdn_cmd(23 downto 16);
          next_address     <= set_pwdn_cmd(15 downto 8);
          next_data_out    <= set_pwdn_cmd(7 downto 0);
        else
          next_state    <= send_set_io;
          next_page     <= set_io_33_cmd(23 downto 16);
          next_address  <= set_io_33_cmd(15 downto 8);
          next_data_out <= set_io_33_cmd(7 downto 0);
        end if;

      when send_pwdn =>
        if link_busy = '0' then
          next_state <= wait_start;
        else
          next_state    <= send_pwdn;
          next_page     <= set_pwdn_cmd(23 downto 16);
          next_address  <= set_pwdn_cmd(15 downto 8);
          next_data_out <= set_pwdn_cmd(7 downto 0);
        end if;

    end case;
  end process;

end Behavioral;

