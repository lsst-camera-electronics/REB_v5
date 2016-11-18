----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:47:43 04/17/2013 
-- Design Name: 
-- Module Name:    dual_ad53xx_DAC_top - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dual_ad53xx_DAC_top is

port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start_write				: in  std_logic;
		start_ldac				: in  std_logic;
		d_to_slave				: in  std_logic_vector(16 downto 0);
		mosi						: out std_logic;
		ss_dac_0					: out std_logic;
		ss_dac_1					: out std_logic;
		sclk						: out std_logic;
		ldac						: out	std_logic
		);

end dual_ad53xx_DAC_top;

architecture Behavioral of dual_ad53xx_DAC_top is

component SPI_write is
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
end component;

component ff_ce is
port (
    reset    : in  std_logic;           -- syncronus reset
    clk      : in  std_logic;           -- clock
    data_in  : in  std_logic;  			 -- data in
	 ce       : in  std_logic;  			 -- clock enable
    data_out : out std_logic);          -- data out
end component;

component demux_1_2_clk_def_1 is
port (
    reset     	: in  std_logic;           -- syncronus reset
    clk       	: in  std_logic;           -- clock
	 data_in  	: in  std_logic;	 										-- data in
	 selector 	: in  std_logic;
	 data_out 	: out std_logic_vector(1 downto 0));          -- data out
end component;

signal dac_selector			: std_logic;

signal start_write_delay_1	: std_logic;
signal start_write_delay_2	: std_logic;

signal ss						: std_logic;

signal ldac_delay_1			: std_logic;
signal ldac_delay_2			: std_logic;

begin

SPI_write_0 : SPI_write 
generic map (clk_divide	 => 2,
				 num_bit_max => 16)
port map (
		clk						=> clk,
		reset						=> reset,
		start_write				=> start_write_delay_2,
		d_to_slave				=> d_to_slave(15 downto 0),
		mosi						=> mosi,
		ss							=> ss,
		sclk						=> sclk
		);


dac_selector_ff : ff_ce 
port map (
    reset    => reset,
    clk      => clk,
    data_in  => d_to_slave(16),
	 ce       => start_write,
    data_out => dac_selector); 


start_delay_ff_1 : ff_ce 
port map (
    reset    => reset,
    clk      => clk,
    data_in  => start_write,
	 ce       => '1',
    data_out => start_write_delay_1); 
	 
start_delay_ff_2 : ff_ce 
port map (
    reset    => reset,
    clk      => clk,
    data_in  => start_write_delay_1,
	 ce       => '1',
    data_out => start_write_delay_2); 

ss_demux : demux_1_2_clk_def_1
port map (
    reset     		=> reset,
    clk      		=> clk,
	 data_in  		=> ss,
	 selector		=> dac_selector,
	 data_out(0)	=> ss_dac_0,
	 data_out(1)	=> ss_dac_1);

ldac_delay_ff_1 : ff_ce 
port map (
    reset    => reset,
    clk      => clk,
    data_in  => start_ldac,
	 ce       => '1',
    data_out => ldac_delay_1); 
	 
ldac_delay_ff_2 : ff_ce 
port map (
    reset    => reset,
    clk      => clk,
    data_in  => ldac_delay_1,
	 ce       => '1',
    data_out => ldac_delay_2); 

ldac	<= not(ldac_delay_1 or ldac_delay_2);	

end Behavioral;

