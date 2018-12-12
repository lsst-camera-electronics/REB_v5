----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:00 11/30/2018 
-- Design Name: 
-- Module Name:    programmable_delay - Behavioral 
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

entity programmable_delay is

  port (
    clk        : in  std_logic;
    reset      : in  std_logic;
    signal_in  : in  std_logic;
    delay_in   : in  std_logic_vector(7 downto 0);
    signal_out : out std_logic
    );

end programmable_delay;

architecture Behavioral of programmable_delay is

  signal srl_q    : std_logic_vector(8 downto 0);
  signal srl_q_ch : std_logic_vector(8 downto 0);
  signal mux_fl   : std_logic_vector(3 downto 0);
  signal mux_sl   : std_logic_vector(1 downto 0);

begin

  srl_32_generate :
  for I in 0 to 7 generate
    SRLC32E_inst : SRLC32E
      generic map (
        INIT => X"00000000")
      port map (
        Q   => srl_q(I+1),              -- SRL data output
        Q31 => srl_q_ch(I+1),           -- SRL cascade output pin
        A   => delay_in(4 downto 0),    -- 5-bit shift depth select input
        CE  => '1',                     -- Clock enable input
        CLK => clk,                     -- Clock input
        D   => srl_q_ch(I)              -- SRL data input
        );
  end generate;


  -- MUXF7: CLB MUX to tie two LUT6's together with general output
  --        Virtex-5 
  -- Xilinx HDL Language Template, version 14.4

  MUXF7_inst_0 : MUXF7
    port map (
      O  => mux_fl(0),                  -- Output of MUX to general routing
      I0 => srl_q(1),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(2),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in(5)                 -- Input select to MUX
      );

  MUXF7_inst_1 : MUXF7
    port map (
      O  => mux_fl(1),                  -- Output of MUX to general routing
      I0 => srl_q(3),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(4),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in(5)                 -- Input select to MUX
      );

  MUXF7_inst_2 : MUXF7
    port map (
      O  => mux_fl(2),                  -- Output of MUX to general routing
      I0 => srl_q(5),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(6),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in(5)                 -- Input select to MUX
      );

  MUXF7_inst_3 : MUXF7
    port map (
      O  => mux_fl(3),                  -- Output of MUX to general routing
      I0 => srl_q(7),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      I1 => srl_q(8),    -- Input (tie to MUXF6 LO out or LUT6 O6 pin)
      S  => delay_in(5)                 -- Input select to MUX
      );

  -- MUXF8: CLB MUX to tie two MUXF7's together with general output
  --        Virtex-5
  -- Xilinx HDL Language Template, version 14.4

  MUXF8_inst_0 : MUXF8
    port map (
      O  => mux_sl(0),                  -- Output of MUX to general routing
      I0 => mux_fl(0),                  -- Input (tie to MUXF7 LO out)
      I1 => mux_fl(1),                  -- Input (tie to MUXF7 LO out)
      S  => delay_in(6)                 -- Input select to MUX
      );

  MUXF8_inst_1 : MUXF8
    port map (
      O  => mux_sl(1),                  -- Output of MUX to general routing
      I0 => mux_fl(2),                  -- Input (tie to MUXF7 LO out)
      I1 => mux_fl(3),                  -- Input (tie to MUXF7 LO out)
      S  => delay_in(6)                 -- Input select to MUX
      );

  srl_q_ch(0) <= signal_in;

  signal_out <= mux_sl(0) when delay_in(7) = '0' else mux_sl(1);

end Behavioral;
