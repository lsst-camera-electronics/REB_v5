----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:52:42 11/18/2016 
-- Design Name: 
-- Module Name:    si5342_jitter_cleaner_top - Behavioral 
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

entity si5342_jitter_cleaner_top is

  port (
    clk          : in  std_logic;
    reset        : in  std_logic;
    start_config : in  std_logic;
	 jc_config    : in  std_logic_vector(1 downto 0);
    config_busy  : out std_logic;
    miso         : in  std_logic;
    mosi         : out std_logic;
    chip_select  : out std_logic;
    sclk         : out std_logic;
    out_en       : out std_logic
    );

end si5342_jitter_cleaner_top;

architecture Behavioral of si5342_jitter_cleaner_top is


  component si5342_jitter_cleaner_fsm_rom
--  component si5342_jitter_cleaner_fsm
    port (
      clk          : in  std_logic;
      reset        : in  std_logic;
      start_config : in  std_logic;
      link_busy    : in  std_logic;
		jc_config    : in  std_logic_vector(1 downto 0);
      start_write  : out std_logic;
      config_busy  : out std_logic;
      page         : out std_logic_vector(7 downto 0);
      address      : out std_logic_vector(7 downto 0);
      data_out     : out std_logic_vector(7 downto 0));
  end component;

  component si5342_reg_write_fsm
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
      data_to_spi : out std_logic_vector(15 downto 0));
  end component;

  component SPI_write_BusyatStart
    generic (
      clk_divide  : integer;
      num_bit_max : integer);
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      start_write : in  std_logic;
      d_to_slave  : in  std_logic_vector(num_bit_max - 1 downto 0);
      mosi        : out std_logic;
      ss          : out std_logic;
      busy        : out std_logic;
      sclk        : out std_logic);
  end component;

  signal link_busy   : std_logic;
  signal start_write : std_logic;
  signal start_spi   : std_logic;
  signal spi_busy    : std_logic;
  signal page        : std_logic_vector(7 downto 0);
  signal address     : std_logic_vector(7 downto 0);
  signal data        : std_logic_vector(7 downto 0);
  signal data_to_spi : std_logic_vector(15 downto 0);

begin

  si5342_jitter_cleaner_fsm_rom_1 : si5342_jitter_cleaner_fsm_rom
--  si5342_jitter_cleaner_fsm_1 : si5342_jitter_cleaner_fsm
    port map (
      clk          => clk,
      reset        => reset,
      start_config => start_config,
      link_busy    => link_busy,
		jc_config    => jc_config,
      start_write  => start_write,
      config_busy  => config_busy,
      page         => page,
      address      => address,
      data_out     => data);

  si5342_reg_write_fsm_1 : si5342_reg_write_fsm
    port map (
      clk         => clk,
      reset       => reset,
      start_write => start_write,
      spi_busy    => spi_busy,
      page        => page,
      address     => address,
      data_in     => data,
      start_spi   => start_spi,
      link_busy   => link_busy,
      data_to_spi => data_to_spi);

  SPI_write_BusyatStart_1 : SPI_write_BusyatStart
    generic map (
      clk_divide  => 10,
      num_bit_max => 16)
    port map (
      clk         => clk,
      reset       => reset,
      start_write => start_spi,
      d_to_slave  => data_to_spi,
      busy        => spi_busy,
      mosi        => mosi,
      ss          => chip_select,
      sclk        => sclk);


end Behavioral;

