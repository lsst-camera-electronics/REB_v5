----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:25 03/09/2017 
-- Design Name: 
-- Module Name:    sync_cmd_decoder_top - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

entity sync_cmd_decoder_top is

  port (
    pgp_clk            : in  std_logic;
    pgp_reset          : in  std_logic;
    clk                : in  std_logic;
    reset              : in  std_logic;
    sync_cmd_en        : in  std_logic;
    delay_en           : in  std_logic;
    delay_in           : in  std_logic_vector(7 downto 0);
    delay_read         : out std_logic_vector(7 downto 0);
    sync_cmd           : in  std_logic_vector(7 downto 0);
    sync_cmd_start_seq : out std_logic;  -- this signal is delayed buy at least
                                         -- 1 clk with respect to sync_cmd_main_add
    sync_cmd_step_seq  : out std_logic;  -- this signal is delayed buy at least
                                         -- 1 clk with respect to sync_cmd_main_add
    sync_cmd_main_add  : out std_logic_vector(4 downto 0)
    );

end sync_cmd_decoder_top;

architecture Behavioral of sync_cmd_decoder_top is

  component sync_cmd_decoder is
    port (
      clk          : in  std_logic;
      reset        : in  std_logic;
      sync_cmd_en  : in  std_logic;
      sync_cmd     : in  std_logic_vector(7 downto 0);
      sync_cmd_out : out std_logic_vector(7 downto 0)
      );
  end component;

  component generic_reg_ce_init is
    generic (width : integer := 15);
    port (
      reset    : in  std_logic;         -- syncronus reset
      clk      : in  std_logic;         -- clock
      ce       : in  std_logic;         -- clock enable
      init     : in  std_logic;  -- signal to reset the reg (active high)
      data_in  : in  std_logic_vector(width downto 0);   -- data in
      data_out : out std_logic_vector(width downto 0));  -- data out
  end component;

  component pulse_stretcher
    generic (
      STRETCH_SIZE : positive);
    port (
      clk         : in  std_logic;
      reset       : in  std_logic;
      sig_in      : in  std_logic;
      stretch_out : out std_logic);
  end component;

  component ff_ce is
    port (
      reset    : in  std_logic;         -- syncronus reset
      clk      : in  std_logic;         -- clock
      data_in  : in  std_logic;         -- data in
      ce       : in  std_logic;         -- clock enable
      data_out : out std_logic);        -- data out
  end component;

  component programmable_delay
    port (
      clk        : in  std_logic;
      reset      : in  std_logic;
      signal_in  : in  std_logic;
      delay_in   : in  std_logic_vector(7 downto 0);
      signal_out : out std_logic);
  end component;

  signal sync_cmd_en_stretch : std_logic;
  signal sync_cmd_en_sync1   : std_logic;
  signal sync_cmd_en_sync2   : std_logic;
  signal sync_cmd_en_sync    : std_logic;
  signal sync_cmd_latch      : std_logic_vector(7 downto 0);
  signal sync_cmd_out_int    : std_logic_vector(7 downto 0);
  signal delay_in_reg        : std_logic_vector(7 downto 0);

begin

  sync_cmd_reg : generic_reg_ce_init
    generic map
    (width => 7)
    port map (
      reset    => pgp_reset,
      clk      => pgp_clk,
      ce       => sync_cmd_en,
      init     => '0',
      data_in  => sync_cmd,
      data_out => sync_cmd_latch);

  -- pulse stretcher
  pulse_stretcher_A : pulse_stretcher
    generic map (
      STRETCH_SIZE => 2)
    port map (
      clk         => pgp_clk,
      reset       => pgp_reset,
      sig_in      => sync_cmd_en,
      stretch_out => sync_cmd_en_stretch);

  ff1_en : FD port map (D => sync_cmd_en_stretch, C => clk, Q => sync_cmd_en_sync1);
  ff2_en : FD port map (D => sync_cmd_en_sync1, C => clk, Q => sync_cmd_en_sync);

  sync_cmd_decoder_1 : sync_cmd_decoder
    port map (
      clk          => clk,
      reset        => reset,
      sync_cmd_en  => sync_cmd_en_sync,
      sync_cmd     => sync_cmd_latch,
      sync_cmd_out => sync_cmd_out_int
      );

  delay_register : generic_reg_ce_init
    generic map
    (width => 7)
    port map (
      reset    => reset,
      clk      => clk,
      ce       => delay_en,
      init     => '0',
      data_in  => delay_in,
      data_out => delay_in_reg);

  programmable_delay_start : programmable_delay
    port map (
      clk        => clk,
      reset      => reset,
      signal_in  => sync_cmd_out_int(0),
      delay_in   => delay_in_reg,
      signal_out => sync_cmd_start_seq
      );

  programmable_delay_step : programmable_delay
    port map (
      clk        => clk,
      reset      => reset,
      signal_in  => sync_cmd_out_int(1),
      delay_in   => delay_in_reg,
      signal_out => sync_cmd_step_seq
      );

  delay_read        <= delay_in_reg;
  sync_cmd_main_add <= sync_cmd_out_int(6 downto 2);

  


  
end Behavioral;

