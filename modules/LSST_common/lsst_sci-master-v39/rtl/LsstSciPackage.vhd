library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.StdRtlPkg.all;

package LsstSciPackage is

   -- Firmware revision number
   -- Version E is what went to the BNL test
   -- Version 12 adds an LSST header to the PGP frame
   -- Version 13 changes the frame size to accomodate a 64 MB image
   -- Version 14 changes the frame size to accomodate a 64 MB image w/ overscan
   -- Version 15 changes to 16 bit data with the lowest two bits truncated
   -- Version 16 adds reset output and chipscope control inputs
   -- Version XX changes the frame size to accomodate 112 MB of image data and
   --            changes the size of the version number to 12 bits
   -- Version 18 Reordering for reset implementation
   -- Version 19 trying to fix 16b truncation (and implement new flags)
   -- Version 1A Version for release
   -- Version 1B Fixed 32bit transfer bugs in DataEncoder and updated to
   --            latest version of PGP (includes VC timeout)
   -- Version 1C Added Data Format to Status Block
   -- Version 1D Recompiled Cores for Kintex7 part
   -- Version 1E Moved to Vivado build system/Changed to LSST from RCM
   -- Version 1F Turned off cell interleaving in K7 PGP core
   -- Version 20 Fixed 16-bit data fifo depth
   -- Version 21 Updated User Reset to use StdLib and moved LsstSci to modules
   --            and removed chipscope cores and interface ports
   -- Version 22 Added new 18-bit packed data format 
   -- Version 23 Switching to PGP2B support (Axi)
   -- Version 24 Switching to PGP2B support (Axi) Interleaved VC on
   -- Version 26 Changed backpressure behavior to EOFE
   -- Version 27 18-bit packed version
   -- Version 28 Fixed Status Block dual port memory bug
   -- Version 29 Added Synchronous Command/Notification Interface
   -- Version 2A Refactored internal interfaces
   -- Version 2B Fixed bug in Data Encoder introduced in 2A
   -- Version 2C Fixed bug in Data Encoder which required RCE reboots after resets
   -- Version 2D Reset on Link Down and change notice to 16 bits
   -- Version 2E Use recovered clock for synch command decoding
   -- Version 2F Tag-up version to show Ben
   -- Version 30 12-channel fixed latency version
   -- Version 31 Fix to LsstPgpFrontEnd (which will eventually move into pgp2b_core)
   -- Version 32 Added POR to MGTs to reduce garbage on power up
   -- Version 33 Fixed LsstSciStatus to work with different Tx and Rx clocks
   --            SCI now generates notices on Link Up and FE reset
   --            FE is no longer reset when PGP link is lost
   -- Version 34 Added 4th virtual channel data encoder (nominally for guiding)
   --            Changed Image Data interface to use record structure
   -- Version 35 Changed VC allocation, now muxing LAMs on VC0 with Registers.
   --            The other 3 VCs will be available for data encoders.
   -- Version 36 Expanded LAM interface to 84 bits.
   -- Version 37 Shrunk LAM interface back to 64 bits and remapped
   --            the Status Block.
   -- Version 38 Changed the GTX Tx parameters to work with COB11
   -- Version 39 Added PGP link A-B switching
   constant LSST_SCI_VERSION : std_logic_vector(7 downto 0) := x"39";

   -- Image Data Format Version
   constant LSST_DATA_UNSPECIFIED     : std_logic_vector(3 downto 0) := x"0";
   constant LSST_DATA_32B_ZERO_EXTEND : std_logic_vector(3 downto 0) := x"1";
   constant LSST_DATA_16B_TRUNC_LOW_2 : std_logic_vector(3 downto 0) := x"2";
   constant LSST_DATA_18B_PACKED      : std_logic_vector(3 downto 0) := x"3";


   ----------------------------------------------------------------------------
   -- Data Interface Types
   ----------------------------------------------------------------------------
   type LsstSciImageDataType is record
      wrEn : sl;
      sot  : sl;
      eot  : sl;
      data : slv(17 downto 0);
   end record LsstSciImageDataType;

   type LsstSciImageDataArray is array (natural range <>) of LsstSciImageDataType;

   constant LSST_SCI_IMAGE_DATA_IN_INIT_C : LsstSciImageDataType := (
      '0',
      '0',
      '0',
      (others => '0'));

   ----------------------------------------------------------------------------
   -- Internal Data Status Interface Types
   ----------------------------------------------------------------------------
   type LsstSciImageStatusType is record
      sent   : sl;
      trunc  : sl;
      disc   : sl;
      format : slv(3 downto 0);
   end record LsstSciImageStatusType;

   type LsstSciImageStatusArray is array (natural range <>) of LsstSciImageStatusType;

   constant LSST_SCI_IMAGE_STATUS_INIT_C : LsstSciImageStatusType := (
      '0',
      '0',
      '0',
      (others => '0'));

end LsstSciPackage;
