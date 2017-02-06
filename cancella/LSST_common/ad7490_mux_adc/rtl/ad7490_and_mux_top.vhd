----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:13:00 07/06/2015 
-- Design Name: 
-- Module Name:    ad7490_and_mux_top - Behavioral 
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

use work.ad7490_and_mux_top_package.all;

entity ad7490_and_mux_top is

		port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start_multiread		: in  std_logic;
		start_singleread		: in  std_logic;
		adc_and_mux_add		: in  std_logic_vector(7 downto 0);
		miso						: in  std_logic;
		mosi						: out std_logic;
		ss							: out std_logic;
		sclk						: out std_logic;
		link_busy				: out std_logic;
		mux_en					: out std_logic;
		mux_sel					: out std_logic_vector(2 downto 0);
		data_out					: out array724
		);

end ad7490_and_mux_top;

architecture Behavioral of ad7490_and_mux_top is

component ad7490_controller_fsm is
	port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start_multiread		: in  std_logic;
		start_singleread		: in  std_logic;
		spi_busy					: in  std_logic;
		adc_input_address		: in  std_logic_vector(3 downto 0);
		start_spi				: out std_logic;
		link_busy				: out std_logic;
		data_to_spi				: out std_logic_vector(15 downto 0);
		out_reg_en_bus			: out std_logic_vector(6 downto 0)
		);
end component;

component SPI_read_write is
generic (clk_divide	: integer := 4;
			num_bit_max	: integer := 16);
port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start_write				: in  std_logic;
		d_to_slave				: in  std_logic_vector(num_bit_max - 1 downto 0);
		miso						: in  std_logic;
		mosi						: out std_logic;
		ss							: out std_logic;
		sclk						: out std_logic;
		d_from_slave			: out std_logic_vector(num_bit_max - 1 downto 0)
		);
end component;

component generic_reg_ce_init is
generic (width : integer := 15);
port (
    reset    : in  std_logic;           							-- syncronus reset
    clk      : in  std_logic;           							-- clock
    ce       : in  std_logic;  			 							-- clock enable
	 init	    : in  std_logic;											-- signal to reset the reg (active high)
	 data_in  : in  std_logic_vector(width downto 0);  			-- data in
	 data_out : out std_logic_vector(width downto 0));				-- data out
end component;

signal spi_busy				: std_logic;
signal ss_int					: std_logic;
signal start_spi				: std_logic;
signal latch_reg_in			: std_logic;
signal data_to_spi			: std_logic_vector(15 downto 0);
signal out_reg_en_bus		: std_logic_vector(6 downto 0);
signal data_from_spi			: std_logic_vector(15 downto 0);
signal mux_and_add_out		: std_logic_vector(7 downto 0);

signal adc_add_int			: std_logic_vector(3 downto 0);
signal adc_out_int			: std_logic_vector(23 downto 0);

begin

	ad7490_controller_fsm_0 : ad7490_controller_fsm 
		port map (
			clk						=> clk,
			reset						=> reset,
			start_multiread		=> start_multiread,
			start_singleread		=> start_singleread,
			spi_busy					=> spi_busy,
			adc_input_address		=> adc_add_int,
			start_spi				=> start_spi,
			link_busy				=> link_busy,
			data_to_spi				=> data_to_spi,
			out_reg_en_bus			=> out_reg_en_bus
			);
			
	SPI_read_write_0 : SPI_read_write 
		generic map(
			clk_divide	=> 2,
			num_bit_max	=> 16)
		port map(
			clk						=> clk,
			reset						=> reset,
			start_write				=> start_spi,
			d_to_slave				=> data_to_spi,
			miso						=> miso,
			mosi						=> mosi,
			ss							=> ss_int,
			sclk						=> sclk,
			d_from_slave			=> data_from_spi
			);
			
	spi_out_reg_generate: 
			for i in 0 to 6 generate 
			out_lsw_reg : generic_reg_ce_init 
			generic map(width => 23)
			port map (
				reset    => reset,           						
				clk      => clk,          						
				ce       => out_reg_en_bus(i),  			 						
				init	 	=> '0',											
				data_in  => adc_out_int,  			
				data_out => data_out(I)				
				);
			end generate;

	mux_and_add_reg : generic_reg_ce_init 
			generic map(width => 7)
			port map (
				reset    => reset,           						
				clk      => clk,          						
				ce       => latch_reg_in,  			 						
				init	 	=> '0',											
				data_in  => adc_and_mux_add,  			
				data_out => mux_and_add_out				
				);


ss							<= ss_int;
spi_busy					<= not ss_int;
latch_reg_in			<= start_multiread or start_singleread;

adc_add_int				<= mux_and_add_out(3 downto 0);
mux_sel					<= mux_and_add_out(7 downto 5);
mux_en					<= mux_and_add_out(4);


adc_out_int				<= mux_and_add_out(7 downto 4) & "0000" & data_from_spi;

end Behavioral;

