------------------------------------------------------------------------

------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

--  Uncomment the following lines to use the declarations that are
--  provided for instantiating Xilinx primitive components.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulse_stretcher is
  generic
    (
      STRETCH_SIZE : positive := 4
      );
  port
    (
      clk         : in  std_logic;
      reset       : in  std_logic;      -- Synchronous reset, active high
      sig_in      : in  std_logic;
      stretch_out : out std_logic
      );
end pulse_stretcher;

architecture Behavioral of pulse_stretcher is

-- Internal signals
  signal stretch_out_i : std_logic := '0';
  signal stretch_cnt   : integer range 0 to STRETCH_SIZE-1;

begin

-- Stretch input signal of STRETCH_SIZE clock cycles
  STRETCH_PROC : process (clk, reset, sig_in)
  begin
    if clk'event and clk = '1' then
      if (reset = '1') then
        stretch_cnt   <= 0;             -- Clear stretch counter
        stretch_out_i <= '0';           -- Clear stretched signal
      else
        -- If signal is not active and counter not started, clear everything
        if (sig_in = '0') then
          if (stretch_cnt = 0) then
            stretch_cnt   <= 0;         -- Clear stretch counter
            stretch_out_i <= '0';       -- Clear stretched signal
          else  -- when signal is active and counter did start, stretch signal for STRETCH_SIZE counts
            stretch_cnt   <= stretch_cnt - 1;  -- Decrement stretch counter
            stretch_out_i <= '1';       -- Set stretched signal
          end if;
          -- when signal is active, output is active and counter is initialized
        else
          stretch_cnt <= STRETCH_SIZE-1;       -- Init stretch counter
        stretch_out_i <= '1';           -- Set stretched signal
      end if;
    end if;  -- Synch Reset
  end if;  -- Clock
end process STRETCH_PROC;
stretch_out <= stretch_out_i;
end Behavioral;
