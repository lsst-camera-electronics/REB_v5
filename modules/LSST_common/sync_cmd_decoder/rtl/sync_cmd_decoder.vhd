----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:53:17 01/06/2017 
-- Design Name: 
-- Module Name:    sync_cmd_decoder - Behavioral 
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

entity sync_cmd_decoder is

  port (
    clk           : in  std_logic;
    reset         : in  std_logic;
    sync_cmd_en   : in  std_logic;
    sync_cmd      : in  std_logic_vector(7 downto 0);
    sync_cmd_start: out std_logic;
    sync_cmd_stop : out std_logic;
    sync_cmd_step : out std_logic;
    sync_cmd_addr : out std_logic_vector(4 downto 0)
    );

end sync_cmd_decoder;

architecture Behavioral of sync_cmd_decoder is

  constant C_STEP  : std_logic_vector(7 downto 0) := x"1F";
  constant C_STOP  : std_logic_vector(7 downto 0) := x"1E";

  signal sync_cmd_start_int : std_logic;
  signal sync_cmd_stop_int  : std_logic;
  signal sync_cmd_step_int  : std_logic;
  signal sync_cmd_addr_int  : std_logic_vector(4 downto 0);

begin

  process(clk)
  begin
    if (clk'event and clk = '1') then
      if (reset = '1') then
         sync_cmd_start_int <= '0';
         sync_cmd_stop_int  <= '0';
         sync_cmd_step_int  <= '0';
         sync_cmd_addr_int  <= (others => '0');
      else
         sync_cmd_start_int <= '0';
         sync_cmd_stop_int  <= '0';
         sync_cmd_step_int  <= '0';
         sync_cmd_addr_int  <= (others => '0');
         if sync_cmd_en = '1' then
            case sync_cmd is
               when C_STEP =>
                  sync_cmd_step_int <= '1';
               when C_STOP =>
                  sync_cmd_stop_int <= '1';
               when others        =>
                  sync_cmd_start_int <= '1';
                  sync_cmd_addr_int  <= sync_cmd(4 downto 0);
            end case;
         else
            sync_cmd_start_int <= '0';
            sync_cmd_step_int <= sync_cmd_step_int;
            sync_cmd_stop_int <= sync_cmd_stop_int;
            sync_cmd_addr_int <= sync_cmd_addr_int;
         end if;
      end if;
    end if;
  end process;

  sync_cmd_start <= sync_cmd_start_int;
  sync_cmd_step  <= sync_cmd_step_int;
  sync_cmd_stop  <= sync_cmd_stop_int;
  sync_cmd_addr  <= sync_cmd_addr_int;

end Behavioral;
