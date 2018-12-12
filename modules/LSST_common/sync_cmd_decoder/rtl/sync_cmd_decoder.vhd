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
    clk          : in  std_logic;
    reset        : in  std_logic;
    sync_cmd_en  : in  std_logic;
    sync_cmd     : in  std_logic_vector(7 downto 0);
    sync_cmd_out : out std_logic_vector(7 downto 0)
    );

end sync_cmd_decoder;

architecture Behavioral of sync_cmd_decoder is

  constant sync_cmd_step    : std_logic_vector(7 downto 0) := x"1F";
  signal   sync_cmd_out_int : std_logic_vector(7 downto 0);

begin

  process(clk)
  begin
    if (clk'event and clk = '1') then
      if (reset = '1') then
        sync_cmd_out_int <= x"00";
      else
        if sync_cmd_en = '1' then
          case sync_cmd is
            when sync_cmd_step => sync_cmd_out_int <= x"02";
            when others        => sync_cmd_out_int <= sync_cmd(5 downto 0) & "01";
          end case;
        else
          sync_cmd_out_int <= sync_cmd_out_int(7 downto 1) & '0';
        end if;
      end if;
    end if;
  end process;

  sync_cmd_out <= sync_cmd_out_int;

end Behavioral;

