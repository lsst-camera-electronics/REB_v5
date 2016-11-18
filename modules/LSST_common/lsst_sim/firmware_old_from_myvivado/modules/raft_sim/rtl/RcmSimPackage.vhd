-------------------------------------------------------------------------------
-- Title      : RCM SIM
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : RcmSimPackage.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2014/04/02
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package RcmSimPackage is

   -- Firmware revision number
   -- Version 5 updates rcm_sci to allow 64MB images
   -- Version 5 uses zero_extend_32 data encoder
   -- Version 6 uses trunc_low_2 data encoder
   -- Version 7 is nominally the same as six, but for debugging.
   -- Version 8 16b truncation scheme (jgt test version)
   -- Version 9 16b truncation scheme new frame size (jhp test version)
   -- Version A 32b truncation scheme (jgt test version)
   -- Version B 16b truncation scheme with new flags (jgt test version)
   -- Version C RcmSci version 1A for release
   -- Version D RcmSci version 1B (32 bit zx)
   -- Version E same as D but w/ 16 bit trunc
   -- Version F RcmSci version 1C (32 bit zx)
   -- Version 10 same as D but w/ 16 bit trunc
   constant RCM_SIM_VERSION : std_logic_vector(31 downto 0) := x"00000010";

end RcmSimPackage;

