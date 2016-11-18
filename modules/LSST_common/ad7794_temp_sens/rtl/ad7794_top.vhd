----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:29 05/02/2013 
-- Design Name: 
-- Module Name:    ad7794_top - Behavioral 
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

entity ad7794_top is

port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start						: in  std_logic;
		start_reset				: in  std_logic;
		read_write				: in  std_logic;
		ad7794_dout_rdy		: in  std_logic;
		reg_add					: in  std_logic_vector(2 downto 0);
		d_to_slave				: in  std_logic_vector(15 downto 0);
		ad7794_din				: out std_logic;
		ad7794_cs				: out std_logic;
		ad7794_sclk				: out std_logic;
		busy						: out std_logic;
		d_from_slave			: out std_logic_vector(23 downto 0)
		);

end ad7794_top;

architecture Behavioral of ad7794_top is


component ad7794_programmer is
generic (clk_divide	: integer := 4);
port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start						: in  std_logic;
		start_reset				: in  std_logic;
		read_write				: in  std_logic;
		dout_rdy					: in  std_logic;
		reg_add					: in  std_logic_vector(2 downto 0);
		d_to_slave				: in  std_logic_vector(15 downto 0);
		din						: out std_logic;
		cs							: out std_logic;
		sclk						: out std_logic;
		busy						: out std_logic;
		d_from_slave_ready	: out std_logic;
		d_from_slave			: out std_logic_vector(23 downto 0)
		);
end component;

component generic_reg_ce_init
generic (width : integer);
port (
    reset    	: in  std_logic;           							-- syncronus reset
    clk      	: in  std_logic;           							-- clock
    ce       	: in  std_logic;  			 							-- clock enable
	 init	    : in  std_logic;											-- signal to reset the reg (active high)
	 data_in  	: in  std_logic_vector(width downto 0);  			-- data in
	 data_out 	: out std_logic_vector(width downto 0));				-- data out
end component;

signal d_from_slave_ready		: std_logic;
signal d_to_slave_in_int		: std_logic_vector(19 downto 0);
signal d_to_slave_out_int		: std_logic_vector(19 downto 0);
signal d_from_slave_int			: std_logic_vector(23 downto 0);

begin


ad7794_programmer_0 : ad7794_programmer
generic map (clk_divide	=> 4)
port map (
		clk			=> clk,
		reset			=> reset,
		start			=> start,
		start_reset	=> start_reset,
		read_write	=> d_to_slave_out_int(19), 
		dout_rdy		=> ad7794_dout_rdy,
		reg_add		=> d_to_slave_out_int(18 downto 16),
		d_to_slave	=> d_to_slave_out_int(15 downto 0),
		din						=> ad7794_din,
		cs							=> ad7794_cs,
		sclk						=> ad7794_sclk,
		busy						=> busy,
		d_from_slave_ready	=> d_from_slave_ready,
		d_from_slave			=> d_from_slave_int
		);

data_in_reg :  generic_reg_ce_init 
			generic map(width => 19)
			port map (
				reset    => reset,
				clk      => clk,
				ce       => start,
				init	 => '0',											
				data_in  => d_to_slave_in_int,
				data_out => d_to_slave_out_int
				);


data_out_reg :  generic_reg_ce_init 
			generic map(width => 23)
			port map (
				reset    => reset,
				clk      => clk,
				ce       => d_from_slave_ready,
				init	 => '0',											
				data_in  => d_from_slave_int,
				data_out => d_from_slave
				);


d_to_slave_in_int		<= read_write & reg_add & d_to_slave;

end Behavioral;

