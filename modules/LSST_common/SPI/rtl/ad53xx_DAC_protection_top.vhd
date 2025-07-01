----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    13:03:27 10/14/2017
-- Design Name:
-- Module Name:    ad53xx_DAC_protection_top - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ad53xx_DAC_protection_top is
	generic (
	GD_th : integer range 0 to 2**12-1 := 1138;  -- equivalent to x"472"
    OD_th : integer range 0 to 2**12-1 := 2275;  -- equivalent to x"8E3"
    RD_th : integer range 0 to 2**12-1 := 1632); -- equivalent to x"660"
  port (
    clk             : in  std_logic;
    reset           : in  std_logic;
    start_write     : in  std_logic;
    start_ldac      : in  std_logic;
    bbs_switch_on   : in  std_logic;
    d_to_slave      : in  std_logic_vector(15 downto 0);
    command_error   : out std_logic_vector(2 downto 0);
    values_under_th : out std_logic_vector(2 downto 0);
    mosi            : out std_logic;
    ss              : out std_logic;
    sclk            : out std_logic;
    ldac            : out std_logic;
    gd_thresh       : out std_logic_vector(11 downto 0);
    od_thresh       : out std_logic_vector(11 downto 0);
    rd_thresh       : out std_logic_vector(11 downto 0)
    );

end ad53xx_DAC_protection_top;

architecture Behavioral of ad53xx_DAC_protection_top is
  component SPI_write is
    generic (clk_divide  : integer := 4;
             num_bit_max : integer := 16);
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      start_write : in  std_logic;
      d_to_slave  : in  std_logic_vector(num_bit_max - 1 downto 0);
      mosi        : out std_logic;
      ss          : out std_logic;
      sclk        : out std_logic
      );
  end component;

  component ff_ce is
    port (
      reset    : in  std_logic;         -- syncronus reset
      clk      : in  std_logic;         -- clock
      data_in  : in  std_logic;         -- data in
      ce       : in  std_logic;         -- clock enable
      data_out : out std_logic);        -- data out
  end component;

  signal start_write_delay_1 : std_logic;
  signal d_to_slave_delay_1  : std_logic_vector(15 downto 0);
  signal ldac_delay_1        : std_logic;
  signal ldac_delay_2        : std_logic;

  signal command_error_i    : std_logic_vector(2 downto 0) := (others => '0');
  signal values_under_th_i  : std_logic_vector(2 downto 0) := (others => '1');
  signal first_reset_done_i : std_logic := '0';

  constant GD_add : std_logic_vector(3 downto 0) := x"0";
  constant OD_add : std_logic_vector(3 downto 0) := x"1";
  constant RD_add : std_logic_vector(3 downto 0) := x"4";

  signal GD_th_int : std_logic_vector(11 downto 0);
  signal OD_th_int : std_logic_vector(11 downto 0);
  signal RD_th_int : std_logic_vector(11 downto 0);

begin

  -- Convert integer generics to std_logic_vector
  GD_th_int <= std_logic_vector(to_unsigned(GD_th, 12));
  OD_th_int <= std_logic_vector(to_unsigned(OD_th, 12));
  RD_th_int <= std_logic_vector(to_unsigned(RD_th, 12));

  SPI_write_0 : SPI_write
    generic map (clk_divide  => 2,
                 num_bit_max => 16)
    port map (
      clk         => clk,
      reset       => reset,
      start_write => start_write_delay_1,
      d_to_slave  => d_to_slave_delay_1,
      mosi        => mosi,
      ss          => ss,
      sclk        => sclk
      );

-------------------------------------------------------------------------------
-- protection logic
-------------------------------------------------------------------------------
  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        start_write_delay_1 <= '0';
        d_to_slave_delay_1  <= (others => '0');
        command_error_i     <= (others => '0');
        if first_reset_done_i = '0' then
            -- First reset (power-up) initialization
            first_reset_done_i <= '1';   -- Mark that first reset has occurred
	        values_under_th_i  <= (others => '1');
        end if;
      else
        if start_write = '1' and d_to_slave(15 downto 12) = GD_add then
          if d_to_slave(11 downto 0) < GD_th_int then
            if bbs_switch_on = '1' then
              start_write_delay_1 <= '0';
              d_to_slave_delay_1  <= (others => '0');
              command_error_i(0)  <= '1';
              command_error_i(1)  <= command_error_i(1);
              command_error_i(2)  <= command_error_i(2);
              values_under_th_i   <= values_under_th_i;
            else
              start_write_delay_1  <= start_write;
              d_to_slave_delay_1   <= d_to_slave;
              command_error_i(0)   <= '0';
              command_error_i(1)   <= command_error_i(1);
              command_error_i(2)   <= command_error_i(2);
              values_under_th_i(0) <= '1';
              values_under_th_i(1) <= values_under_th_i(1);
              values_under_th_i(2) <= values_under_th_i(2);
            end if;
          else
            start_write_delay_1  <= start_write;
            d_to_slave_delay_1   <= d_to_slave;
            command_error_i(0)   <= '0';
            command_error_i(1)   <= command_error_i(1);
            command_error_i(2)   <= command_error_i(2);
            values_under_th_i(0) <= '0';
            values_under_th_i(1) <= values_under_th_i(1);
            values_under_th_i(2) <= values_under_th_i(2);
          end if;

        elsif start_write = '1' and d_to_slave(15 downto 12) = OD_add then
          if d_to_slave(11 downto 0) < OD_th_int then
            if bbs_switch_on = '1' then
              start_write_delay_1 <= '0';
              d_to_slave_delay_1  <= (others => '0');
              command_error_i(0)  <= command_error_i(0);
              command_error_i(1)  <= '1';
              command_error_i(2)  <= command_error_i(2);
              values_under_th_i   <= values_under_th_i;
            else
              start_write_delay_1  <= start_write;
              d_to_slave_delay_1   <= d_to_slave;
              command_error_i(0)   <= command_error_i(0);
              command_error_i(1)   <= '0';
              command_error_i(2)   <= command_error_i(2);
              values_under_th_i(0) <= values_under_th_i(0);
              values_under_th_i(1) <= '1';
              values_under_th_i(2) <= values_under_th_i(2);
            end if;
          else
            start_write_delay_1  <= start_write;
            d_to_slave_delay_1   <= d_to_slave;
            command_error_i(0)   <= command_error_i(0);
            command_error_i(1)   <= '0';
            command_error_i(2)   <= command_error_i(2);
            values_under_th_i(0) <= values_under_th_i(0);
            values_under_th_i(1) <= '0';
            values_under_th_i(2) <= values_under_th_i(2);
          end if;
        elsif start_write = '1' and d_to_slave(15 downto 12) = RD_add then
          if d_to_slave(11 downto 0) < RD_th_int then
            if bbs_switch_on = '1' then
              start_write_delay_1 <= '0';
              d_to_slave_delay_1  <= (others => '0');
              command_error_i(0)  <= command_error_i(0);
              command_error_i(1)  <= command_error_i(1);
              command_error_i(2)  <= '1';
              values_under_th_i   <= values_under_th_i;
            else
              start_write_delay_1  <= start_write;
              d_to_slave_delay_1   <= d_to_slave;
              command_error_i(0)   <= command_error_i(0);
              command_error_i(1)   <= command_error_i(1);
              command_error_i(2)   <= '0';
              values_under_th_i(0) <= values_under_th_i(0);
              values_under_th_i(1) <= values_under_th_i(1);
              values_under_th_i(2) <= '1';
            end if;
          else
            start_write_delay_1  <= start_write;
            d_to_slave_delay_1   <= d_to_slave;
            command_error_i(0)   <= command_error_i(0);
            command_error_i(1)   <= command_error_i(1);
            command_error_i(2)   <= '0';
            values_under_th_i(0) <= values_under_th_i(0);
            values_under_th_i(1) <= values_under_th_i(1);
            values_under_th_i(2) <= '0';
          end if;
        else
          start_write_delay_1 <= start_write;
          d_to_slave_delay_1  <= d_to_slave;
          command_error_i     <= command_error_i;
          values_under_th_i   <= values_under_th_i;
        end if;
      end if;
    end if;
  end process;


  command_error   <= command_error_i;
  values_under_th <= values_under_th_i;


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

  ldac <= not(ldac_delay_1 or ldac_delay_2);

  -- readback outputs
  gd_thresh <= GD_th_int;
  od_thresh <= OD_th_int;
  rd_thresh <= RD_th_int;

end Behavioral;

