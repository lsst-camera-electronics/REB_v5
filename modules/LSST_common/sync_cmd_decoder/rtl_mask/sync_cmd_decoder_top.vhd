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
    sync_cmd_mask_en   : in  std_logic;
    delay_in           : in  std_logic_vector(7 downto 0);
    delay_read         : out std_logic_vector(7 downto 0);
    sync_cmd_mask      : in  std_logic_vector(31 downto 0);
    sync_cmd_mask_read : out std_logic_vector(31 downto 0);
    sync_cmd           : in  std_logic_vector(7 downto 0);
    sync_cmd_out       : out std_logic_vector(7 downto 0)
    );

end sync_cmd_decoder_top;

architecture Behavioral of sync_cmd_decoder_top is

  component sync_cmd_decoder is
    port (
      clk           : in  std_logic;
      reset         : in  std_logic;
      sync_cmd_en   : in  std_logic;
      sync_cmd      : in  std_logic_vector(7 downto 0);
      sync_cmd_mask : in  std_logic_vector(31 downto 0);
      sync_cmd_out  : out std_logic_vector(7 downto 0)
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

  signal sync_cmd_mask_out : std_logic_vector(31 downto 0);

  signal sync_cmd_en_stretch : std_logic;
  signal sync_cmd_en_sync1   : std_logic;
  signal sync_cmd_en_sync2   : std_logic;
  signal sync_cmd_en_sync    : std_logic;
  signal sync_cmd_latch      : std_logic_vector(7 downto 0);
  signal sync_cmd_out_int    : std_logic_vector(7 downto 0);
  signal delay_in_reg        : std_logic_vector(7 downto 0);

  signal srl_q    : std_logic_vector(8 downto 0);
  signal srl_q_ch : std_logic_vector(8 downto 0);
  signal mux_fl   : std_logic_vector(3 downto 0);
  signal mux_sl   : std_logic_vector(1 downto 0);
  

begin


  sync_cmd_mask_reg : generic_reg_ce_init
    generic map
    (width => 31)
    port map (
      reset    => reset,
      clk      => clk,
      ce       => sync_cmd_mask_en,
      init     => '0',
      data_in  => sync_cmd_mask,
      data_out => sync_cmd_mask_out);


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
      clk           => clk,
      reset         => reset,
      sync_cmd_en   => sync_cmd_en_sync,
      sync_cmd      => sync_cmd_latch,
      sync_cmd_mask => sync_cmd_mask_out,
      sync_cmd_out  => sync_cmd_out_int
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

  delay_read         <= delay_in_reg;
  sync_cmd_mask_read <= sync_cmd_mask_out;


  srl_32_generate :
  for I in 0 to 7 generate
    SRLC32E_inst : SRLC32E
      generic map (
        INIT => X"00000000")
      port map (
        Q   => srl_q(I+1),                -- SRL data output
        Q31 => srl_q_ch(I+1),             -- SRL cascade output pin
        A   => delay_in_reg(4 downto 0),  -- 5-bit shift depth select input
        CE  => '1',                       -- Clock enable input
        CLK => clk,                       -- Clock input
        D   => srl_q_ch(I)                -- SRL data input
        );
  end generate;


  -- MUXF7: CLB MUX to tie two LUT6's together with general output
  --        Virtex-5 
  -- Xilinx HDL Language Template, version 14.4

  MUXF7_inst_0 : MUXF7
    port map (
      O  => mux_fl(0),                  -- Output of MUX to general routing
      I0 => srl_q(1),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(2),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in_reg(5)             -- Input select to MUX
      );

  MUXF7_inst_1 : MUXF7
    port map (
      O  => mux_fl(1),                  -- Output of MUX to general routing
      I0 => srl_q(3),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(4),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in_reg(5)             -- Input select to MUX
      );

  MUXF7_inst_2 : MUXF7
    port map (
      O  => mux_fl(2),                  -- Output of MUX to general routing
      I0 => srl_q(5),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(6),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in_reg(5)             -- Input select to MUX
      );

  MUXF7_inst_3 : MUXF7
    port map (
      O  => mux_fl(3),                  -- Output of MUX to general routing
      I0 => srl_q(7),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(8),        -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in_reg(5)             -- Input select to MUX
      );

  -- MUXF8: CLB MUX to tie two MUXF7's together with general output
  --        Virtex-5
  -- Xilinx HDL Language Template, version 14.4

  MUXF8_inst_0 : MUXF8
    port map (
      O  => mux_sl(0),                  -- Output of MUX to general routing
      I0 => mux_fl(0),                  -- Input (tie to MUXF7 LO out)
      I1 => mux_fl(1),                  -- Input (tie to MUXF7 LO out)
      S  => delay_in_reg(6)             -- Input select to MUX
      );

  MUXF8_inst_1 : MUXF8
    port map (
      O  => mux_sl(1),                  -- Output of MUX to general routing
      I0 => mux_fl(2),                  -- Input (tie to MUXF7 LO out)
      I1 => mux_fl(3),                  -- Input (tie to MUXF7 LO out)
      S  => delay_in_reg(6)             -- Input select to MUX
      );

-- sync_cmd_out(0) delay is controlled by the structure above 
  sync_cmd_out(0) <= mux_sl(0) when delay_in_reg(7) = '0' else mux_sl(1);

-- sync_cmd_out(7 downto 0) are not delayied  
  sync_cmd_out(7 downto 1) <= sync_cmd_out_int(7 downto 1);

  srl_q_ch(0) <= sync_cmd_out_int(0);

  


  
end Behavioral;

