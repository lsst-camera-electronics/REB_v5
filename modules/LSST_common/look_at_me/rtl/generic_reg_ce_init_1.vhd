----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:53:53 09/13/2013 
-- Design Name: 
-- Module Name:    generic_reg_ce_init_1 - Behavioral 
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

entity generic_reg_ce_init_1 is

  generic (width : integer := 15);
  port (
    reset    : in  std_logic;           -- syncronus reset
    clk      : in  std_logic;           -- clock
    ce       : in  std_logic;           -- clock enable
    init     : in  std_logic;  -- signal to reset the reg (active high)
    data_in  : in  std_logic_vector(width downto 0);   -- data in
    data_out : out std_logic_vector(width downto 0));  -- data out

end generic_reg_ce_init_1;

architecture Behavioral of generic_reg_ce_init_1 is

  signal data_out_i : std_logic_vector(width downto 0);

begin

  process (clk)
  begin  -- process
    if clk'event and clk = '1' then      -- rising clock edge
      if reset = '1' or init = '1' then  -- synchronous reset 
        data_out_i <= (others => '1');
      else
        if ce = '1' then
          data_out_i <= data_in;
        else
          data_out_i <= data_out_i;
        end if;
      end if;
    end if;
  end process;

  data_out <= data_out_i;

end Behavioral;

