----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:10:27 06/05/2014 
-- Design Name: 
-- Module Name:    aspic_3_spi_link_top_mux - Behavioral 
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

entity aspic_3_spi_link_top_mux is

port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start_link_trans		: in  std_logic;
		start_reset				: in  std_logic;
		miso_ccd1				: in  std_logic;
		miso_ccd2				: in  std_logic;
		miso_ccd3				: in  std_logic;
		word2send				: in  std_logic_vector(31 downto 0);
		aspic_mosi				: out std_logic;
		ss_t_ccd1				: out std_logic;
		ss_t_ccd2				: out std_logic;
		ss_t_ccd3				: out std_logic;
		ss_b_ccd1				: out std_logic;
		ss_b_ccd2				: out std_logic;
		ss_b_ccd3				: out std_logic;
		aspic_sclk				: out std_logic;
		aspic_n_reset			: out std_logic;
		busy						: out std_logic;
		d_slave_ready_ccd1	: out std_logic;
		d_slave_ready_ccd2	: out std_logic;
		d_slave_ready_ccd3	: out std_logic;
		d_from_slave_ccd1		: out std_logic_vector(15 downto 0);
		d_from_slave_ccd2		: out std_logic_vector(15 downto 0);
		d_from_slave_ccd3		: out std_logic_vector(15 downto 0)
		);


end aspic_3_spi_link_top_mux;

architecture Behavioral of aspic_3_spi_link_top_mux is

component aspic_3_spi_link_programmer is
	generic (clk_divide	: integer);
	port (
		clk						: in  std_logic;
		reset						: in  std_logic;
		start						: in  std_logic;
		start_reset				: in  std_logic;
		read_write				: in  std_logic;
		miso						: in  std_logic;
		reg_add					: in  std_logic_vector(6 downto 0);
		d_to_slave				: in  std_logic_vector(15 downto 0);
		mosi						: out std_logic;
		ss							: out std_logic;
		sclk						: out std_logic;
		n_reset					: out std_logic;
		busy						: out std_logic;
		d_from_slave_ready	: out std_logic;
		d_from_slave			: out std_logic_vector(15 downto 0)
		);
end component;

component generic_reg_ce_init
generic (width : integer);
port (
    reset    	: in  std_logic;           							-- syncronus reset
    clk      	: in  std_logic;           							-- clock
    ce       	: in  std_logic;  			 							-- clock enable
	 init	    	: in  std_logic;											-- signal to reset the reg (active high)
	 data_in  	: in  std_logic_vector(width downto 0);  			-- data in
	 data_out 	: out std_logic_vector(width downto 0));				-- data out
end component;

component ff_ce is
port (
		reset    : in  std_logic;           
		clk      : in  std_logic;           
		data_in  : in  std_logic;
	 	ce       : in  std_logic;  
	 	data_out : out std_logic
		); 
end component;

component ff_ce_pres is
port (
		preset   : in  std_logic;           
		clk      : in  std_logic;           
		data_in  : in  std_logic;
	 	ce       : in  std_logic;  
	 	data_out : out std_logic
		); 
end component;

--signal start_link_trans_reg	: std_logic;
--signal start_reset_reg			: std_logic;
signal en_w2send					: std_logic;
signal word2send_reg				: std_logic_vector(31 downto 0);
signal start_trans_ccd1			: std_logic;
signal start_trans_ccd2			: std_logic;
signal start_trans_ccd3			: std_logic;
signal start_trans_ccd1_reg	: std_logic;
signal start_trans_ccd2_reg	: std_logic;
signal start_trans_ccd3_reg	: std_logic;
signal start_reset_ccd1			: std_logic;
signal start_reset_ccd2			: std_logic;
signal start_reset_ccd3			: std_logic;
signal start_reset_ccd1_reg	: std_logic;
signal start_reset_ccd2_reg	: std_logic;
signal start_reset_ccd3_reg	: std_logic;
signal read_write_reg			: std_logic;
signal reg_add_reg				: std_logic_vector(6 downto 0);
signal d_to_slave_reg			: std_logic_vector(15 downto 0);
signal ss_ccd1						: std_logic;
signal ss_ccd2						: std_logic;
signal ss_ccd3						: std_logic;
signal ss_t_ccd1_int				: std_logic;
signal ss_b_ccd1_int				: std_logic;
signal ss_t_ccd2_int				: std_logic;
signal ss_b_ccd2_int				: std_logic;
signal ss_t_ccd3_int				: std_logic;
signal ss_b_ccd3_int				: std_logic;
signal busy_ccd1					: std_logic;
signal busy_ccd2					: std_logic;
signal busy_ccd3					: std_logic;

signal mosi_ccd1				: std_logic;
signal mosi_ccd2				: std_logic;
signal mosi_ccd3				: std_logic;
signal sclk_ccd1				: std_logic;
signal sclk_ccd2				: std_logic;
signal sclk_ccd3				: std_logic;
signal n_reset_ccd1			: std_logic;
signal n_reset_ccd2			: std_logic;
signal n_reset_ccd3			: std_logic;

signal start_link_trans_stretch_1	: std_logic;
signal start_link_trans_stretch_2	: std_logic;
signal start_link_trans_stretch_3	: std_logic;
signal start_link_trans_stretch		: std_logic;

signal start_reset_stretch_1	: std_logic;
signal start_reset_stretch_2	: std_logic;
signal start_reset_stretch_3	: std_logic;
signal start_reset_stretch		: std_logic;


begin

aspic_3_spi_ccd1: aspic_3_spi_link_programmer 
	generic map (clk_divide	=> 4)
	port map (
		clk						=> clk,
		reset						=> reset,
		start						=> start_trans_ccd1_reg,
		start_reset				=> start_reset_ccd1_reg,
		read_write				=> read_write_reg,
		miso						=> miso_ccd1,
		reg_add					=> reg_add_reg,
		d_to_slave				=> d_to_slave_reg,
		mosi						=> mosi_ccd1,
		ss							=> ss_ccd1,
		sclk						=> sclk_ccd1,
		n_reset					=> n_reset_ccd1,
		busy						=> busy_ccd1,
		d_from_slave_ready	=> d_slave_ready_ccd1,
		d_from_slave			=> d_from_slave_ccd1
		);

aspic_3_spi_ccd2: aspic_3_spi_link_programmer 
	generic map (clk_divide	=> 4)
	port map (
		clk						=> clk,
		reset						=> reset,
		start						=> start_trans_ccd2_reg,
		start_reset				=> start_reset_ccd2_reg,
		read_write				=> read_write_reg,
		miso						=> miso_ccd2,
		reg_add					=> reg_add_reg,
		d_to_slave				=> d_to_slave_reg,
		mosi						=> mosi_ccd2,
		ss							=> ss_ccd2,
		sclk						=> sclk_ccd2,
		n_reset					=> n_reset_ccd2,
		busy						=> busy_ccd2,
		d_from_slave_ready	=> d_slave_ready_ccd2,
		d_from_slave			=> d_from_slave_ccd2
		);

aspic_3_spi_ccd3: aspic_3_spi_link_programmer 
	generic map (clk_divide	=> 4)
	port map (
		clk						=> clk,
		reset						=> reset,
		start						=> start_trans_ccd3_reg,
		start_reset				=> start_reset_ccd3_reg,
		read_write				=> read_write_reg,
		miso						=> miso_ccd3,
		reg_add					=> reg_add_reg,
		d_to_slave				=> d_to_slave_reg,
		mosi						=> mosi_ccd3,
		ss							=> ss_ccd3,
		sclk						=> sclk_ccd3,
		n_reset					=> n_reset_ccd3,
		busy						=> busy_ccd3,
		d_from_slave_ready	=> d_slave_ready_ccd3,
		d_from_slave			=> d_from_slave_ccd3
		);



aspic_w2send_reg : generic_reg_ce_init
    generic map (
      width    => 31)
    port map(
      reset    => reset,
      clk      => clk,
      ce       => en_w2send,
      init     => '0',
      data_in  => word2send,
      data_out => word2send_reg);

start_link_trans_ccd1_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_trans_ccd1,
	 	ce       => '1',  
	 	data_out => start_trans_ccd1_reg
	 	); 

start_link_trans_ccd2_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_trans_ccd2,
	 	ce       => '1',  
	 	data_out => start_trans_ccd2_reg
	 	); 

start_link_trans_ccd3_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_trans_ccd3,
	 	ce       => '1',  
	 	data_out => start_trans_ccd3_reg
	 	); 
		
start_reset_ccd1_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_reset_ccd1,
	 	ce       => '1',  
	 	data_out => start_reset_ccd1_reg
	 	); 

start_reset_ccd2_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_reset_ccd2,
	 	ce       => '1',  
	 	data_out => start_reset_ccd2_reg
	 	); 
		
start_reset_ccd3_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_reset_ccd3,
	 	ce       => '1',  
	 	data_out => start_reset_ccd3_reg
	 	); 		

ss_t_ccd1_ff : ff_ce_pres 
	port map (
		preset    => reset,           
		clk      => clk,           
		data_in  => ss_t_ccd1_int,
	 	ce       => '1',  
	 	data_out => ss_t_ccd1
	 	); 	

ss_t_ccd2_ff : ff_ce_pres 
	port map (
		preset    => reset,           
		clk      => clk,           
		data_in  => ss_t_ccd2_int,
	 	ce       => '1',  
	 	data_out => ss_t_ccd2
	 	); 

ss_t_ccd3_ff : ff_ce_pres 
	port map (
		preset    => reset,           
		clk      => clk,           
		data_in  => ss_t_ccd3_int,
	 	ce       => '1',  
	 	data_out => ss_t_ccd3
	 	); 

ss_b_ccd1_ff : ff_ce_pres 
	port map (
		preset    => reset,           
		clk      => clk,           
		data_in  => ss_b_ccd1_int,
	 	ce       => '1',  
	 	data_out => ss_b_ccd1
	 	); 	

ss_b_ccd2_ff : ff_ce_pres 
	port map (
		preset    => reset,           
		clk      => clk,           
		data_in  => ss_b_ccd2_int,
	 	ce       => '1',  
	 	data_out => ss_b_ccd2
	 	); 

ss_b_ccd3_ff : ff_ce_pres 
	port map (
		preset    => reset,           
		clk      => clk,           
		data_in  => ss_b_ccd3_int,
	 	ce       => '1',  
	 	data_out => ss_b_ccd3
	 	); 

start_stretcher_1_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_link_trans,
	 	ce       => '1',  
	 	data_out => start_link_trans_stretch_1
	 	); 		

start_stretcher_2_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_link_trans_stretch_1,
	 	ce       => '1',  
	 	data_out => start_link_trans_stretch_2
	 	); 

start_stretcher_3_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_link_trans_stretch_2,
	 	ce       => '1',  
	 	data_out => start_link_trans_stretch_3
	 	); 

reset_stretcher_1_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_reset,
	 	ce       => '1',  
	 	data_out => start_reset_stretch_1
	 	); 		

reset_stretcher_2_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_reset_stretch_1,
	 	ce       => '1',  
	 	data_out => start_reset_stretch_2
	 	); 		

reset_stretcher_3_ff : ff_ce 
	port map (
		reset    => reset,           
		clk      => clk,           
		data_in  => start_reset_stretch_2,
	 	ce       => '1',  
	 	data_out => start_reset_stretch_3
	 	); 

start_link_trans_stretch	<= start_link_trans_stretch_1 or start_link_trans_stretch_2 or start_link_trans_stretch_3;
start_reset_stretch			<= start_reset_stretch_1 or start_reset_stretch_2 or start_reset_stretch_3;


en_w2send			<= start_link_trans_stretch or start_reset_stretch;

start_trans_ccd1	<= start_link_trans_stretch and word2send_reg(26);
start_trans_ccd2	<= start_link_trans_stretch and word2send_reg(27);
start_trans_ccd3	<= start_link_trans_stretch and word2send_reg(28);

start_reset_ccd1	<= start_reset_stretch and word2send_reg(26);
start_reset_ccd2	<= start_reset_stretch and word2send_reg(27);
start_reset_ccd3	<= start_reset_stretch and word2send_reg(28);


read_write_reg		<= word2send_reg(23);
reg_add_reg			<= word2send_reg(22 downto 16);
d_to_slave_reg		<= word2send_reg(15 downto 0);

ss_t_ccd1_int		<= (not word2send_reg(24)) or ss_ccd1;
ss_b_ccd1_int		<= not((word2send_reg(25) and ((not word2send_reg(24)) or (word2send_reg(24) and word2send_reg(23))))) or ss_ccd1;

ss_t_ccd2_int		<= (not word2send_reg(24)) or ss_ccd2;
ss_b_ccd2_int		<= not ((word2send_reg(25) and ((not word2send_reg(24)) or (word2send_reg(24) and word2send_reg(23))))) or ss_ccd2;

ss_t_ccd3_int		<= (not word2send_reg(24)) or ss_ccd3;
ss_b_ccd3_int		<= not ((word2send_reg(25) and ((not word2send_reg(24)) or (word2send_reg(24) and word2send_reg(23))))) or ss_ccd3;

busy					<= busy_ccd1 or busy_ccd2 or busy_ccd3;

aspic_mosi		<= mosi_ccd1 or mosi_ccd2 or mosi_ccd3;
aspic_sclk		<= sclk_ccd1 or sclk_ccd2 or sclk_ccd3;	
aspic_n_reset	<= n_reset_ccd1 and n_reset_ccd2 and n_reset_ccd3;	

end Behavioral;

