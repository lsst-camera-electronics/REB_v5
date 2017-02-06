----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:56 11/18/2016 
-- Design Name: 
-- Module Name:    si5342_reg_write_fsm - Behavioral 
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

entity si5342_reg_write_fsm is

  port (
    clk         : in  std_logic;
    reset       : in  std_logic;
    start_write : in  std_logic;
    spi_busy    : in  std_logic;
    page        : in  std_logic_vector(7 downto 0);
    address     : in  std_logic_vector(7 downto 0);
    data_in     : in  std_logic_vector(7 downto 0);
    start_spi   : out std_logic;
    link_busy   : out std_logic;
    data_to_spi : out std_logic_vector(15 downto 0)
    );

end si5342_reg_write_fsm;

architecture Behavioral of si5342_reg_write_fsm is

  type state_type is (wait_start, set_page_s, write_page_s, set_add_s, write_data_s);


  signal pres_state, next_state : state_type;
  signal next_start_spi         : std_logic;
  signal next_link_busy         : std_logic;
  signal next_data_to_spi       : std_logic_vector(15 downto 0);


-- data control strings
  constant set_add    : std_logic_vector(7 downto 0) := x"00";
  constant write_data : std_logic_vector(7 downto 0) := x"40";
  constant page_add   : std_logic_vector(7 downto 0) := x"01";
  


begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state  <= wait_start;
        start_spi   <= '0';
        link_busy   <= '0';
        data_to_spi <= (others => '0');
      else
        pres_state  <= next_state;
        start_spi   <= next_start_spi;
        link_busy   <= next_link_busy;
        data_to_spi <= next_data_to_spi;
        
      end if;
    end if;
  end process;


  process (pres_state, start_write, page, address, data_in, spi_busy)
  begin

    -------------------- outputs default values  --------------------
    
    next_start_spi   <= '0';
    next_link_busy   <= '1';
    next_data_to_spi <= (others => '0');

    case pres_state is

      when wait_start =>
        if start_write = '1' then
          next_state       <= set_page_s;
          next_start_spi   <= '1';
          next_data_to_spi <= set_add & page_add;
        else
          next_state     <= wait_start;
          next_link_busy <= '1';
        end if;

      when set_page_s =>
        if spi_busy = '0' then
          next_state       <= write_page_s;
          next_start_spi   <= '1';
          next_data_to_spi <= write_data & page;
        else
          next_state       <= set_page_s;
          next_data_to_spi <= set_add & page_add;
        end if;

      when write_page_s =>
        if spi_busy = '0' then
          next_state       <= set_add_s;
          next_start_spi   <= '1';
          next_data_to_spi <= set_add & address;
        else
          next_state       <= write_page_s;
          next_data_to_spi <= write_data & page;
        end if;

      when set_add_s =>
        if spi_busy = '0' then
          next_state       <= write_data_s;
          next_start_spi   <= '1';
          next_data_to_spi <= write_data & data_in;
        else
          next_state       <= set_add_s;
          next_data_to_spi <= set_add & address;
        end if;

      when write_data_s =>
        if spi_busy = '0' then
          next_state <= wait_start;
			 next_link_busy <= '0';
        else
          next_state       <= write_data_s;
          next_data_to_spi <= write_data & data_in;
        end if;
        
    end case;
  end process;
  
end Behavioral;

