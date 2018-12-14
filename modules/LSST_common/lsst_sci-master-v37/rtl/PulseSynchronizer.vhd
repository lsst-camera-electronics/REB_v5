-------------------------------------------------------------------------------
-- This block will take a single pulse from a faster clock domain and
-- output a pulse in a slower clock domain.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity PulseSynchronizer is
port (
   inClk    : in std_logic;                -- input clock
   inPulse  : in std_logic;              -- input pulse (inClk domain)
   outClk   : in std_logic;              -- output clock
   outPulse : out std_logic);            -- output pulse (outClk domain)
end PulseSynchronizer;

architecture PulseSynchronizer of PulseSynchronizer is

   signal toggle, ff0, ff1, ff2, d1 : std_logic;

   attribute ASYNC_REG      : string;
   attribute ASYNC_REG of Sync_FF0, Sync_FF1, Sync_FF2 : label is "TRUE";   

begin

  d1 <= not toggle when inPulse = '1' else toggle;
  Toggle_FF : FD port map ( D => d1, C => inClk, Q => toggle);

  Sync_FF0 : FD port map ( D => toggle, C => outClk, Q => ff0);
  Sync_FF1 : FD port map ( D => ff0   , C => outClk, Q => ff1);
  Sync_FF2 : FD port map ( D => ff1   , C => outClk, Q => ff2);

  outPulse <= ff1 xor ff2;

end PulseSynchronizer;
