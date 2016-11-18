----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:59:46 02/18/2015 
-- Design Name: 
-- Module Name:    led_blink - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity led_blink is

port (
--	sysclk_p	: in  std_logic;
--	sysclk_n	: in  std_logic;
	clk_in 	: in  std_logic;
	led_out  : out std_logic);

end led_blink;

architecture Behavioral of led_blink is


--signal clk_in 	: std_logic;
signal count_0 : std_logic_vector(19 downto 0) := x"00000"; -- the length of this counter is the lenght of a cycle
signal count_1 : std_logic_vector(19 downto 0) := x"00000";
signal cnt		: std_logic_vector(19 downto 0) := x"00000";
signal updown  : std_logic := '0';
 
signal led_output : std_logic;

begin

PWM_MODULE_0: process(clk_in) begin

	if rising_edge(clk_in)then 
		count_0 <= count_0 + 1;
		if count_0 < count_1 then
			led_output <= '1'; 
		else
			led_output <= '0'; 
		end if;
	end if;
end process PWM_MODULE_0;

COUNTER_0: process(clk_in) 
begin

	if rising_edge(clk_in) then 
		if cnt = x"0fffe" then
			if updown = '0' then
				count_1 <= count_1 + 30; -- this number defines how fast the led goes on
				cnt <= cnt + 1;
			else 
				count_1 <= count_1 - 30; -- this number defines how fast the led goes off
				cnt <= cnt + 1;
			end if;
		elsif cnt = x"0ffff" then
			cnt <= x"00000"; 
		else
			cnt <= cnt + 1; 
	end if;
		if updown = '0' then 
			if count_1 > x"3FFFF" then -- this number defines how bright the led is 
				updown <= '1';
			end if;
		else 
			if count_1 < x"0005" then -- this number defines how dark the led is 
				updown <= '0';
			end if;
		end if;
end if;
end process COUNTER_0;

led_out <= led_output; 
--
--clk_buffer : IBUFDS
--port map (
--		I	=> sysclk_p,
--		IB	=> sysclk_n,
--		O	=> clk_in);

end Behavioral;

