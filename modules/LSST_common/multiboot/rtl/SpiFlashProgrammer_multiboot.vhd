-------------------------------------------------------------------------------
-- Copyright (c) 2009 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor:                Xilinx, Inc.
-- \   \   \/    Version:               1.00
--  \   \        Filename:              SpiFlashProgrammer_multiboot.vhd
--  /   /        Date Last Modified:    October 25 2009
-- /___/   /\    Date Created:          October 25 2009
-- \   \  /  \
--  \___\/\___\
--
--Device:       7 Series FPGAs
--Purpose:      This module programs a SPI flash.
--Description:  This module programs a SPI flash using the SpiSerDes.
--Usage:
--              Design definition:
--                Create an instance of this module and an instance of the SpiSerDes
--                module.  Connect the following ports of this module to the
--                corresponding ports of the SpiSerDes module:
--                  outSSDReset_EnableB
--                  outSSDStartTransfer
--                  inSSDTransferDone
--                  outSSDData8Send
--                  inSSDData8Receive
--                Note: Ports of the SpiSerDes module connect to the pins that
--                      connect to the the SPI flash.
--              Customize this module for your application.  Set the following
--              constants per your application, your SPI flash type, and the
--              area that you are programming via this module:
--                NOTE: Set the timeout count = max time * inClk frequency / 22 inClk_cycles_per_poll_iteration
--                cCmdSETimeOut     - Set the max sector timeout count (NOT used for some applications)
--                cCmdSSETimeOut    - Set the max subsector erase timeout count (NOT used for some applications)
--                cCmdPPTimeOut     - Set the max page program timeout count
--                cAddrWidth        - Set to 24 or 32 for the number of bits in your SPI flash addresses
--                cAddrSwitchWord   - For quick boot applications only, set the address of the critical switch word
--                cAddrUpdateStart  - Set the starting address of the image to be programmed
--                cAddrUpdateEnd    - Set the end address + 1 of the image to be programmed
--                cMicronNP5Q       - When using a Micron NP5Q phase change memory, set to '1'.
--                cAtmelDataFlash   - When using an Atmel DataFlash or Spartan-3AN, set to '1'.
--                cMicronN25Q       - When using a Micron N25Q, optionally set to '1'. Otherwise, set to '0'.
--              System Design:
--                To use the module to program an update image, the system needs to:
--                  1. Set inReset_EnableB='0' to start the programming process. (For example, via a writable register.)
--                     For Step 1, this module does the following:
--                    1.A. Check ID
--                    1.B. [For remote update] Erase critical switch word
--                    1.C. [For most flash] Erase the update image area. (Can take 10's to 100's of seconds. See flash data sheet.)
--                  2. Send the update image data in order to be programmed.  (For example, DMA all data through a FIFO.)
--                     For Step 2, this module does the following:
--                    2.A. Set outReady_BusyB='1'.
--                    2.B. On rising edge of inClk when inDataWriteEnable='1', capture inData32 and forward to SPI flash.
--                  3. After sending last data word, wait for outDone='1' or outError='1'. (For example, via a readable register.)
--                    3.A. After programming the last data word (which takes up to Page Program time), this
--                         module takes N inClk cycles to read and compute the CRC32 of the updated image
--                         where N = update_image_bytes * 11 inClk_cycles_per_byte.
--                    3.B. Plus, up to Page Program Time can be taken to re-program/restore the critical switch word.
--              Special applications:
--                DEBUG:  Set the inCheckIdOnly='1' to use the Check ID function to check basic connectivity.
--                VERIFY-ONLY:  Set inVerifyOnly='1' to use this module to read and check the CRC for a valid image.
--                              If the image is valid, then can choose to multiboot to the image for example.
--References:
--  FPGA Configuration User Guide for switch word description.
--  SPI flash data sheet for SPI flash specifications.
--  XAPP209 for CRC32 calculation method.
--Revision History:
--    Revision (YYYY/MM/DD) - [User] Description
--    Rev 1.00 (2009/10/25) - [RMK] Created.
--                              (2018/06/26) [stefano] Modified by me to work with different images in the multiboot context
-------------------------------------------------------------------------------
library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use UNISIM.vcomponents.all;

entity SpiFlashProgrammer_multiboot is
  port
    (
      -- Clock and control signals
      inClk           : in std_logic;
      inReset_EnableB : in std_logic;
      inCheckIdOnly   : in std_logic;
      inVerifyOnly    : in std_logic;

      -- DAQ signals
      inStartProg : in std_logic;
      inDaqDone   : in std_logic;

      -- Image selector
      inImageSel        : in std_logic_vector(1 downto 0);
      -- Data
      inData32          : in std_logic_vector(31 downto 0);
      inDataWriteEnable : in std_logic;  -- input fifo not empty

      -- Status signals
      outReady_BusyB     : out std_logic;  -- fifo write enable 
      outDone            : out std_logic;
      outError           : out std_logic;
      outErrorIdcode     : out std_logic;
      outErrorErase      : out std_logic;
      outErrorProgram    : out std_logic;
      outErrorTimeOut    : out std_logic;
      outErrorAddSel     : out std_logic;
      outErrorBitstmSize : out std_logic;
      outStarted         : out std_logic;
      outInitializeOK    : out std_logic;
      outCheckIdOK       : out std_logic;
      outEraseOK         : out std_logic;
      outProgramOK       : out std_logic;
      outVerifyOK        : out std_logic;

      -- Signals for SpiSerDes - Connect to instance of SpiSerDes
      outSSDReset_EnableB : out std_logic;
      outSSDStartTransfer : out std_logic;
      inSSDTransferDone   : in  std_logic;
      outSSDData8Send     : out std_logic_vector(7 downto 0);
      inSSDData8Receive   : in  std_logic_vector(7 downto 0)
      );
end SpiFlashProgrammer_multiboot;

architecture behavioral of SpiFlashProgrammer_multiboot is
  --##########################################################################
  -- BEGIN BASIC PARAMETER SETTINGS:
  -- SPI DEVICE TYPE: Only one of the following must be set to '1'. Other is '0'.
  constant cMicronN25Q      : std_logic                     := '1';  -- Micron N25Q serial NOR flash
  constant cMicronNP5Q      : std_logic                     := '0';  -- Micron NP5Q phase change memory
  constant cAtmelDataFlash  : std_logic                     := '0';  -- Atmel DataFlash or Spartan-3AN with power-of-2 page size. (NOT TESTED)
  constant cWinbondW25Q     : std_logic                     := '0';  -- Winbond W25Q (NOT TESTED)
  constant cSpansionS25FS   : std_logic                     := '0';  -- Spansion S25FS (NOT TESTED)
  -- SPI COMMAND ADDRESS WIDTH (IN BITS): Ensure setting is correct for the target flash
  constant cAddrWidth       : integer                       := 32;  -- 24 or 32 (address width in bits)
  -- SPI SECTOR SIZE (IN BYTES)
  constant cSizeSector      : std_logic_vector(31 downto 0) := X"00010000";  -- 65536 bytes
  -- SPI PAGE SIZE (IN BYTES): Ensure setting is correct for the chosen device type.
  constant cSizePage        : std_logic_vector(31 downto 0) := X"00000100";  -- 256 (std)
  constant cSizePageNP5Q    : std_logic_vector(31 downto 0) := X"00000040";  -- 64
  -- UPDATE IMAGE START (BYTE) ADDRESS
  constant cAddrImage1Start : std_logic_vector(31 downto 0) := X"00800000";  -- 1st update image start at 128 sector
  constant cAddrImage2Start : std_logic_vector(31 downto 0) := X"01000000";  -- 2nd update image start at 256 sector
  constant cAddrImage3Start : std_logic_vector(31 downto 0) := X"01800000";  -- 3ed update image start at 384 sector
  -- UPDATE IMAGE END+1 (BYTE) ADDRESS
--  constant cAddrImage1End   : std_logic_vector(31 downto 0) := X"00810000";  -- just for test REMOVE 
-- Addresses without watchdog barriers 
  --constant cAddrImage1End   : std_logic_vector(31 downto 0) := X"01000000";
  --constant cAddrImage2End   : std_logic_vector(31 downto 0) := X"01800000";
  --constant cAddrImage3End   : std_logic_vector(31 downto 0) := X"02000000";


-- Addresses with 1 sectors wide watchdog barriers at the end of each image slot
  constant cAddrImage1End : std_logic_vector(31 downto 0) := X"00FF0000";
  constant cAddrImage2End : std_logic_vector(31 downto 0) := X"017F0000";
  constant cAddrImage3End : std_logic_vector(31 downto 0) := X"01FF0000";

  ----------------------------------------------------------------------------
  -- DATA WORD WIDTH (IN BYTES) FOR INPUT APPLIED TO THE MODULE'S 32-BIT inData32 BUS
  constant cDataWordWidth : integer := 4;  -- 4 = 32-bit word --> inData32[31:0]
  --                                           -- 2 = 16-bit word --> inData32[15:0]
  --                                           -- 1 = 8-bit word --> inData32[7:0]
  -- END BASIC PARAMETER SETTINGS
  --##########################################################################

  -- SPI flash information
  -- Customize these constants per the target SPI flash device
  -- Device ID from RDID.  Set cIdcode24 to the valid IDCODE for the target SPI flash
  constant cIdcode24N25Q   : std_logic_vector(23 downto 0) := X"20BA18";
  constant cIdcode24NP5Q   : std_logic_vector(23 downto 0) := X"20DA18";
  constant cIdcodeN25Q256A : std_logic_vector(23 downto 0) := X"20BA19";
  constant cIdcode24Atmel  : std_logic_vector(23 downto 0) := X"1F2000";
  constant cIdcode24W25Q   : std_logic_vector(23 downto 0) := X"EF4018";
  constant cIdcode24S25FS  : std_logic_vector(23 downto 0) := X"012018";
  -- Device command opcodes
  constant cCmdREAD24      : std_logic_vector(7 downto 0)  := X"03";
  constant cCmdREAD32      : std_logic_vector(7 downto 0)  := X"13";
  constant cCmdRDID        : std_logic_vector(7 downto 0)  := X"9F";
  constant cCmdWE          : std_logic_vector(7 downto 0)  := X"06";
  constant cCmdSE24        : std_logic_vector(7 downto 0)  := X"D8";
  constant cCmdSE32        : std_logic_vector(7 downto 0)  := X"DC";
  constant cCmdSSE24       : std_logic_vector(7 downto 0)  := X"20";
  constant cCmdSSE32       : std_logic_vector(7 downto 0)  := X"21";
  constant cCmdPP24        : std_logic_vector(7 downto 0)  := X"02";
  constant cCmdPP32        : std_logic_vector(7 downto 0)  := X"12";
  constant cCmdPP24NP5Q    : std_logic_vector(7 downto 0)  := X"22";  -- Micron NP5Q page program, bit-alterable write
  constant cCmdPP24Atmel   : std_logic_vector(7 downto 0)  := X"82";  -- Atmel page program with built-in erase
  constant cCmdRFSR        : std_logic_vector(7 downto 0)  := X"70";  -- N25Q-only flag status register
  constant cCmdRDSR        : std_logic_vector(7 downto 0)  := X"05";  -- Legacy read status register: Micron=X"05"
  constant cCmdRDSRAtmel   : std_logic_vector(7 downto 0)  := X"D7";
  constant cCmdEn32        : std_logic_vector(7 downto 0)  := X"B7";
  constant cCmdExtAdd      : std_logic_vector(7 downto 0)  := X"C5";

  -- Device timeouts. timeout = max_time (s) X inClk (Hz) / 22 or X"00000000" = ultimate MAX count
  -- where 22 is polling loop cycle count.
  constant cClkFrequencyHz     : integer                       := 20000000;  -- Not used; Keep for reference
  constant cClkCyclesPerTOLoop : integer                       := 22;  -- Not used; Keep for reference
  constant cCmdSETimeOut       : std_logic_vector(31 downto 0) := X"00299D69";  -- max tSE * cClkFrequencyHz / 22
  constant cCmdSSETimeOut      : std_logic_vector(31 downto 0) := X"000B18E9";  -- max tSSE* cClkFrequencyHz / 22
  constant cCmdPPTimeOut       : std_logic_vector(31 downto 0) := X"000011C2";  -- max tPP * cClkFrequencyHz / 22

  -- Constants for output error flags
  constant cErrorNone      : std_logic_vector(6 downto 0) := B"0000000";
  constant cError          : std_logic_vector(6 downto 0) := B"0000001";
  constant cErrorIdcode    : std_logic_vector(6 downto 0) := cError or B"0000010";
  constant cErrorErase     : std_logic_vector(6 downto 0) := cError or B"0000100";
  constant cErrorProgram   : std_logic_vector(6 downto 0) := cError or B"0001000";
  constant cErrorTimeOut   : std_logic_vector(6 downto 0) := cError or B"0010000";
  constant cErrorEraseTO   : std_logic_vector(6 downto 0) := cError or cErrorErase or cErrorTimeOut;
  constant cErrorProgramTO : std_logic_vector(6 downto 0) := cError or cErrorProgram or cErrorTimeOut;
  constant cErrorAddSel    : std_logic_vector(6 downto 0) := cError or B"0100000";
  constant cErrorProgDAQ   : std_logic_vector(6 downto 0) := cError or B"1000000";

  -- Registers
  signal regCheckIdOnly  : std_logic                    := '0';
  signal regVerifyOnly   : std_logic                    := '0';
  signal regReady_BusyB  : std_logic                    := '1';  -- Ready/BusyB state of this module for accepting next data word input
  signal regDone         : std_logic                    := '0';  -- Done state of this module
  signal regError        : std_logic_vector(6 downto 0) := cErrorNone;  -- Output error flags
  signal regStarted      : std_logic                    := '0';
  signal regInitializeOK : std_logic                    := '0';
  signal regCheckIdOK    : std_logic                    := '0';
  signal regEraseOK      : std_logic                    := '0';
  signal regProgramOK    : std_logic                    := '0';
  signal regVerifyOK     : std_logic                    := '0';

  -- Signals for driving to SpiSerDes module
  signal regSSDReset_EnableB      : std_logic                    := '1';
  signal regSSDResetAfterSendWord : std_logic                    := '1';
  signal regSSDStartTransfer      : std_logic                    := '0';
  signal regSSDData8Send          : std_logic_vector(7 downto 0) := X"00";

  -- Registers
  signal regCounter3  : std_logic_vector(2 downto 0)  := "000";
  signal regData40    : std_logic_vector(39 downto 0) := X"0000000000";
  signal regCounter32 : std_logic_vector(31 downto 0) := X"00000000";
  signal regCounter10 : std_logic_vector(9 downto 0)  := "0000000000";
  signal regTimer     : std_logic_vector(31 downto 0) := X"00000000";

-- Registers to store the selected image address 
  signal regAddrUpdateStart : std_logic_vector(31 downto 0) := X"00000000";
  signal regAddrUpdateEnd   : std_logic_vector(31 downto 0) := X"00000000";


  -- Signals for CRC


  -- State definitions
  type sProgrammer is
    (
      sProgrammerWaitStart, sProgrammerInitialize,
      sProgrammerCheckId, sProgrammerCheckId1,
      sProgrammerEraseUpdateArea, sProgrammerEraseUpdateArea1,
      sProgrammerEraseUpdateArea2, sProgrammerEraseUpdateArea3,
      sProgrammerProgramUpdateArea, sProgrammerProgramUpdateArea1,
      sProgrammerProgramUpdateArea2, sProgrammerProgramUpdateArea3,
      sProgrammerProgramUpdateArea4,
      sProgrammerVerifyUpdateArea, sProgrammerVerifyUpdateArea1,
      sProgrammerVerifyUpdateArea2, sProgrammerVerifyUpdateArea3,
      sProgrammerVerifyUpdateArea4, sProgrammerVerifyUpdateArea5,
      sProgrammerSendWEAndWord, sProgrammerSendWE, sProgrammerSendWE1,
      sProgrammerSendWord, sProgrammerSendWord1, sProgrammerSendWord2,
      sProgrammerPollStatus, sProgrammerPollStatus1,
      sProgrammerError, sProgrammerErrorIdcode, sProgrammerErrorErase, sProgrammerErrorEraseTO,
      sProgrammerErrorProgram, sProgrammerErrorProgramTO, sProgrammerErrorAddSel,
      sProgrammerCheckDaqDone, sProgrammerEnd
      );
  signal stateProgrammer      : sProgrammer;
  signal stateAfterSendWord   : sProgrammer;
  signal stateAfterPollStatus : sProgrammer;
  signal stateErrorTimeOut    : sProgrammer;


  signal state_cnt : std_logic_vector(7 downto 0);

  -- Attributes
  --attribute clock_signal          : string;
  --attribute clock_signal of inClk : signal is "yes";

  --attribute mark_debug              : string;
  --attribute mark_debug of regData40 : signal is "true";
  --attribute mark_debug of state_cnt : signal is "true";
  --attribute mark_debug of inDaqDone : signal is "true";


begin
  -- Main state machine
  processProgram : process (inClk)
  begin
    if (rising_edge(inClk)) then
      if (inReset_EnableB = '1') then
        -- RESET
        regCheckIdOnly      <= '0';
        regVerifyOnly       <= '0';
        -- Reset module output signals
        regReady_BusyB      <= '1';
        regDone             <= '1';
        regError            <= cErrorNone;
        regStarted          <= '0';
        regInitializeOK     <= '0';
        regCheckIdOK        <= '0';
        regEraseOK          <= '0';
        regProgramOK        <= '0';
        regVerifyOK         <= '0';
        -- Reset SpiSerDes control signals
        regSSDReset_EnableB <= '1';
        regSSDStartTransfer <= '0';
        regSSDData8Send     <= X"00";
        -- Setup for next state
        regData40           <= X"0000000000";
--        stateProgrammer     <= sProgrammerInitialize;
        stateProgrammer     <= sProgrammerWaitStart;

        state_cnt <= x"00";
      else
        case (stateProgrammer) is
          --------------------------------------------------------------------
          -- PROGRAMMER START/INITIALIZE
          when sProgrammerWaitStart =>
            state_cnt <= x"00";
            if inStartProg = '1' then
              stateProgrammer <= sProgrammerInitialize;
              regDone         <= '0';
            else
              regCheckIdOnly      <= '0';
              regVerifyOnly       <= '0';
                                        -- Reset module output signals
              regReady_BusyB      <= '1';
              regDone             <= '1';
              regError            <= cErrorNone;
              regStarted          <= '0';
              regInitializeOK     <= '0';
              regCheckIdOK        <= '0';
              regEraseOK          <= '0';
              regProgramOK        <= '0';
              regVerifyOK         <= '0';
                                        -- Reset SpiSerDes control signals
              --   regSSDReset_EnableB <= '1';
              regSSDStartTransfer <= '0';
              regSSDData8Send     <= X"00";
                                        -- Setup for next state
              regData40           <= X"0000000000";
              stateProgrammer     <= sProgrammerWaitStart;
            end if;

            --------------------------------------------------------------------
            -- PROGRAMMER START/INITIALIZE
            -- Initialize the SPI bus: Output one word of all zeros to the SPI bus
            -- because STARTUP.USRCCLKO MUX needs a few clock cycles to switch.
          when sProgrammerInitialize =>
            state_cnt <= x"01";
            if inImageSel = "01" then
              regAddrUpdateStart <= cAddrImage1Start;
              regAddrUpdateEnd   <= cAddrImage1End;
              stateProgrammer    <= sProgrammerSendWord;
              stateAfterSendWord <= sProgrammerCheckId;
            elsif inImageSel = "10" then
              regAddrUpdateStart <= cAddrImage2Start;
              regAddrUpdateEnd   <= cAddrImage2End;
              stateProgrammer    <= sProgrammerSendWord;
              stateAfterSendWord <= sProgrammerCheckId;
            elsif inImageSel = "11" then
              regAddrUpdateStart <= cAddrImage3Start;
              regAddrUpdateEnd   <= cAddrImage3End;
              stateProgrammer    <= sProgrammerSendWord;
              stateAfterSendWord <= sProgrammerCheckId;
            else
              regAddrUpdateStart <= cAddrImage3Start;
              regAddrUpdateEnd   <= cAddrImage3End;
              stateProgrammer    <= sProgrammerErrorAddSel;
            end if;
            regStarted               <= '1';
            regReady_BusyB           <= '0';
            regCheckIdOnly           <= inCheckIdOnly;
            regVerifyOnly            <= inVerifyOnly;
            regData40                <= X"0000000000";
            regCounter3              <= "100";
            regSSDResetAfterSendWord <= '1';

            --------------------------------------------------------------------
            -- CHECK DEVICE ID - sanity check SPI flash connectivity
            -- Send RDID command and read 24-bits of the device ID.
            -- By default, check only manufacturer code (ID[23:16]) and
            -- device type (ID[23:8]; Ignore device size (ID[7:0]).
            -- Note: Special case for Atmel DataFlash, device size in ID[12:8].
          when sProgrammerCheckId =>
            state_cnt                <= x"02";
            regInitializeOK          <= '1';
            regData40                <= cCmdRDID & X"00000000";
            regCounter3              <= "100";
            stateProgrammer          <= sProgrammerSendWord;
            stateAfterSendWord       <= sProgrammerCheckId1;
            regSSDResetAfterSendWord <= '1';

          when sProgrammerCheckId1 =>
            state_cnt <= x"03";
            if ((cMicronNP5Q = '1') and (regData40(23 downto 8) /= cIdcode24NP5Q(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cAtmelDataFlash = '1') and (regData40(23 downto 13) /= cIdcode24Atmel(23 downto 13))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cMicronN25Q = '1') and (regData40(23 downto 8) /= cIdcodeN25Q256A(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cWinbondW25Q = '1') and (regData40(23 downto 8) /= cIdcode24W25Q(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cSpansionS25FS = '1') and (regData40(23 downto 8) /= cIdcode24S25FS(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            else
              regCheckIdOK <= '1';
              if (regCheckIdOnly = '1') then
                stateProgrammer <= sProgrammerEnd;  -- Done, if Check ID ONLY
              elsif (regVerifyOnly = '1') then
                stateProgrammer <= sProgrammerVerifyUpdateArea;  -- Skip to Verify ONLY
              else
                if (cAddrWidth = 32) and (cMicronN25Q = '1') then  -- enable4-byte address
                  regData40                <= cCmdEn32 & X"00000000";
                  regCounter3              <= "001";
                  stateProgrammer          <= sProgrammerSendWEAndWord;
                  stateAfterSendWord       <= sProgrammerEraseUpdateArea;
                  regSSDResetAfterSendWord <= '1';
                elsif (cAddrWidth = 24) and (cMicronN25Q = '1') and (inImageSel(1) = '1') then
                  regData40                <= cCmdExtAdd & X"01000000";
                  regCounter3              <= "010";
                  stateProgrammer          <= sProgrammerSendWEAndWord;
                  stateAfterSendWord       <= sProgrammerEraseUpdateArea;
                  regSSDResetAfterSendWord <= '1';
                elsif (cAddrWidth = 24) and (cMicronN25Q = '1') and (inImageSel(1) = '0') then
                  regData40                <= cCmdExtAdd & X"00000000";
                  regCounter3              <= "010";
                  stateProgrammer          <= sProgrammerSendWEAndWord;
                  stateAfterSendWord       <= sProgrammerEraseUpdateArea;
                  regSSDResetAfterSendWord <= '1';
                else
                  stateProgrammer <= sProgrammerEraseUpdateArea;  -- Default for update: erase only update area
                end if;
              end if;
            end if;

            --------------------------------------------------------------------
            -- ERASE UPDATE IMAGE SECTORS
            -- Erase the update image area, sector-by-sector.
            -- NOTE:  NO need to pre-erase these special case device types:
            --   Micron NP5Q:  Skip erase and instead use Page Program with bit-alterable write
            --   Atmel DataFlash:  Skip separate erase, and instead use Page Program with built-in erase
            -- For each sector, poll the SPI flash status for completion of the command.
          when sProgrammerEraseUpdateArea =>
            state_cnt <= x"04";
            if ((cMicronNP5Q = '1') or (cAtmelDataFlash = '1')) then
              stateProgrammer <= sProgrammerProgramUpdateArea;
            else
              -- Send SE
              regCounter32    <= regAddrUpdateStart;
              stateProgrammer <= sProgrammerEraseUpdateArea1;
            end if;

          when sProgrammerEraseUpdateArea1 =>
            state_cnt <= x"05";
            if (cAddrWidth = 32) then
              if (cMicronN25Q = '1') then  -- this memory uses the same commandfor 24 and 32 bit addressing
                regData40   <= cCmdSE24 & regCounter32;
                regCounter3 <= "101";
              else
                regData40   <= cCmdSE32 & regCounter32;
                regCounter3 <= "101";
              end if;
            else
              regData40   <= cCmdSE24 & regCounter32(23 downto 0) & X"00";
              regCounter3 <= "100";
            end if;
            stateProgrammer          <= sProgrammerSendWEAndWord;
            stateAfterSendWord       <= sProgrammerPollStatus;
            regSSDResetAfterSendWord <= '1';
            stateAfterPollStatus     <= sProgrammerEraseUpdateArea2;
            regTimer                 <= cCmdSETimeOut;
            stateErrorTimeOut        <= sProgrammerErrorEraseTO;

          when sProgrammerEraseUpdateArea2 =>
            state_cnt       <= x"06";
            regCounter32    <= regCounter32 + cSizeSector;
            stateProgrammer <= sProgrammerEraseUpdateArea3;

          when sProgrammerEraseUpdateArea3 =>
            state_cnt <= x"07";
            if (regCounter32 = regAddrUpdateEnd) then
              stateProgrammer <= sProgrammerProgramUpdateArea;
            else
              stateProgrammer <= sProgrammerEraseUpdateArea1;
            end if;


            --------------------------------------------------------------------
            -- PROGRAM UPDATE IMAGE AREA
            -- Program the update image area from regAddrUpdateStart through regAddrUpdateEnd.
            -- Send Page Program command, receive data words of cDataWordWidth width
            -- from the inData32 bus, and forward data word to the SPI flash.
            -- At each page boundary, end the Page Program command and allow the SPI flash
            -- time to progam the data into the page.
            -- For each page, poll the SPI flash status for completion of each command.
          when sProgrammerProgramUpdateArea =>
            state_cnt       <= x"08";
            regEraseOK      <= '1';
            regCounter32    <= regAddrUpdateStart;
            stateProgrammer <= sProgrammerProgramUpdateArea1;

          when sProgrammerProgramUpdateArea1 =>
            state_cnt <= x"09";
            -- Send PP
            if (cAddrWidth = 32) then
              if (cMicronN25Q = '1') then  -- this memory uses the same commandfor 24 and 32 bit addressing
                regData40   <= cCmdPP24 & regCounter32;
                regCounter3 <= "101";
              else
                regData40   <= cCmdPP32 & regCounter32;
                regCounter3 <= "101";
              end if;
            elsif (cMicronNP5Q = '1') then
              regData40   <= cCmdPP24NP5Q & regCounter32(23 downto 0) & X"00";
              regCounter3 <= "100";
            elsif (cAtmelDataFlash = '1') then
              regData40   <= cCmdPP24Atmel & regCounter32(23 downto 0) & X"00";
              regCounter3 <= "100";
            else
              regData40   <= cCmdPP24 & regCounter32(23 downto 0) & X"00";
              regCounter3 <= "100";
            end if;
            stateProgrammer          <= sProgrammerSendWEAndWord;
            stateAfterSendWord       <= sProgrammerProgramUpdateArea2;
            regSSDResetAfterSendWord <= '0';
            if (cMicronNP5Q = '1') then
              regCounter10 <= cSizePageNP5Q(9 downto 0);
              regCounter32 <= regCounter32 + cSizePageNP5Q;
            else
              regCounter10 <= cSizePage(9 downto 0);
              regCounter32 <= regCounter32 + cSizePage;
            end if;

          when sProgrammerProgramUpdateArea2 =>
            state_cnt       <= x"0A";
            regReady_BusyB  <= '1';
            stateProgrammer <= sProgrammerProgramUpdateArea3;

          when sProgrammerProgramUpdateArea3 =>
            state_cnt <= x"0B";
            if inDaqDone = '1' and inDataWriteEnable = '0' then  --check if there is not enough data from DAQ
              --   stateProgrammer <= sProgrammerEnd;
              stateProgrammer <= sProgrammerVerifyUpdateArea;    --debug
              regProgramOK    <= '1';
            else
              if (inDataWriteEnable = '1') then
                regReady_BusyB <= '0';
                if (cDataWordWidth = 1) then
                  regData40   <= inData32(7 downto 0) & X"00000000";
                  regCounter3 <= "001";
                elsif (cDataWordWidth = 2) then
                  regData40   <= inData32(15 downto 0) & X"000000";
                  regCounter3 <= "010";
                else
                  regData40   <= inData32 & X"00";
                  regCounter3 <= "100";
                end if;
                regCounter10       <= regCounter10 - cDataWordWidth;
                stateProgrammer    <= sProgrammerSendWord;
                stateAfterSendWord <= sProgrammerProgramUpdateArea4;
              end if;
            end if;

            -- orig
            --when sProgrammerProgramUpdateArea4 =>
            --  state_cnt <= x"0C";
            --  if (regCounter10 = 0)  then
            --    regSSDReset_EnableB <= '1';
            --    regTimer            <= cCmdPPTimeOut;
            --    stateErrorTimeOut   <= sProgrammerErrorProgramTO;
            --    stateProgrammer     <= sProgrammerPollStatus;
            --    if (regCounter32 = regAddrUpdateEnd) then
            --      regProgramOK         <= '1';
            --      stateAfterPollStatus <= sProgrammerVerifyUpdateArea;
            --    else
            --      stateAfterPollStatus <= sProgrammerProgramUpdateArea1;
            --    end if;
            --  else
            --    stateProgrammer <= sProgrammerProgramUpdateArea2;
            --  end if;

          when sProgrammerProgramUpdateArea4 =>
            state_cnt <= x"0C";
            if inDaqDone = '1' and inDataWriteEnable = '0' then  --check if there is not enough data from DAQ
              regSSDReset_EnableB  <= '1';
              stateProgrammer      <= sProgrammerPollStatus;
              --stateAfterPollStatus <= sProgrammerEnd;
              stateAfterPollStatus <= sProgrammerVerifyUpdateArea;  --debug
              regProgramOK         <= '1';
            else
              if (regCounter10 = 0) then
                regSSDReset_EnableB <= '1';
                regTimer            <= cCmdPPTimeOut;
                stateErrorTimeOut   <= sProgrammerErrorProgramTO;
                stateProgrammer     <= sProgrammerPollStatus;
                if (regCounter32 = regAddrUpdateEnd) then
                  --          regProgramOK         <= '1';
--                stateAfterPollStatus    <= sProgrammerEnd;
                  stateAfterPollStatus <= sProgrammerCheckDaqDone;
                else
                  stateAfterPollStatus <= sProgrammerProgramUpdateArea1;
                end if;
              else
                stateProgrammer <= sProgrammerProgramUpdateArea2;
              end if;
            end if;

            --------------------------------------------------------------------
            -- VERIFY UPDATE IMAGE AREA
            -- Read the entire update image from regAddrUpdateStart to regAddrUpdateEnd.
            -- This procedure is done only to debug the code and validate the writing.
          when sProgrammerVerifyUpdateArea =>
            state_cnt       <= x"0D";
            regCounter32    <= regAddrUpdateStart;
            stateProgrammer <= sProgrammerVerifyUpdateArea1;

          when sProgrammerVerifyUpdateArea1 =>
            state_cnt <= x"0E";
            if (cAddrWidth = 32) then
              regData40   <= cCmdREAD32 & regCounter32;
              regCounter3 <= "101";
            else
              regData40   <= cCmdREAD24 & regCounter32(23 downto 0) & X"00";
              regCounter3 <= "100";
            end if;
            stateProgrammer          <= sProgrammerSendWord;
            stateAfterSendWord       <= sProgrammerVerifyUpdateArea2;
            regSSDResetAfterSendWord <= '0';

          when sProgrammerVerifyUpdateArea2 =>
            state_cnt           <= x"0F";
            regSSDReset_EnableB <= '0';
            regSSDData8Send     <= X"00";
            regSSDStartTransfer <= '1';
            stateProgrammer     <= sProgrammerVerifyUpdateArea3;

          when sProgrammerVerifyUpdateArea3 =>
            state_cnt       <= x"10";
            regCounter32    <= regCounter32 + 1;
            stateProgrammer <= sProgrammerVerifyUpdateArea4;

          when sProgrammerVerifyUpdateArea4 =>
            state_cnt           <= x"11";
            regSSDStartTransfer <= '0';
            if (inSSDTransferDone = '1') then
              if (regCounter32 = regAddrUpdateEnd) then
                stateProgrammer <= sProgrammerVerifyUpdateArea5;
              else
                stateProgrammer <= sProgrammerVerifyUpdateArea2;
              end if;
            end if;

          when sProgrammerVerifyUpdateArea5 =>
            state_cnt           <= x"12";
            regSSDReset_EnableB <= '1';
            regVerifyOK         <= '1';
            stateProgrammer     <= sProgrammerEnd;

            --------------------------------------------------------------------
            -- SEND WRITE ENABLE and COMMAND (subroutine)
            -- Before jumping to this state, see SEND WORD for requirements
          when sProgrammerSendWEAndWord =>
            state_cnt <= x"13";
            if (cAtmelDataFlash = '1') then
              stateProgrammer <= sProgrammerSendWord;  -- Atmel does not have a WE
            else
              regSSDReset_EnableB <= '0';
              regSSDData8Send     <= cCmdWE;
              regSSDStartTransfer <= '1';
              stateProgrammer     <= sProgrammerSendWE;
            end if;

          when sProgrammerSendWE =>
            state_cnt       <= x"14";
            stateProgrammer <= sProgrammerSendWE1;

          when sProgrammerSendWE1 =>
            state_cnt           <= x"15";
            regSSDStartTransfer <= '0';
            if (inSSDTransferDone = '1') then
              regSSDReset_EnableB <= '1';
              stateProgrammer     <= sProgrammerSendWord;
            end if;

            --------------------------------------------------------------------
            -- SEND WORD (subroutine)
            -- Before jumping to this state, set:
            --   regData40[39:0] (left-aligned) = the data word to send to the SPI flash
            --   regCounter3 = the number of bytes in the word to send to the SPI flash
            --   stateAfterSendWord = the state to which to return after sending the word
          when sProgrammerSendWord =>
            state_cnt           <= x"16";
            regSSDReset_EnableB <= '0';
            regSSDData8Send     <= regData40(39 downto 32);
            regSSDStartTransfer <= '1';
            stateProgrammer     <= sProgrammerSendWord1;

          when sProgrammerSendWord1 =>
            state_cnt       <= x"17";
            regCounter3     <= regCounter3 - 1;
            regSSDData8Send <= regData40(31 downto 24);
            stateProgrammer <= sProgrammerSendWord2;

          when sProgrammerSendWord2 =>
            state_cnt <= x"18";
            if (regCounter3 = "000") then
              regSSDStartTransfer <= '0';
            end if;
            if (inSSDTransferDone = '1') then
              regData40 <= regData40(31 downto 0) & inSSDData8Receive;
              if (regCounter3 = "000") then
                regSSDReset_EnableB <= regSSDResetAfterSendWord;
                stateProgrammer     <= stateAfterSendWord;
              else
                stateProgrammer <= sProgrammerSendWord1;
              end if;
            end if;

            --------------------------------------------------------------------
            -- POLL STATUS
            -- Before jumping to this state:
            --  Set regTimer  = the max number of polling loops to do before triggering a timeout error
            --  Set stateErrorTimeOut = The timeout error state to which to jump when a timeout error is triggered
            --  Set stateAfterPollStatus  = The state to which to return when the polling reaches a READY status.
          when sProgrammerPollStatus =>
            state_cnt <= x"19";
            regTimer  <= regTimer - 1;
            if (cAtmelDataFlash = '1') then
              regData40 <= cCmdRDSRAtmel & X"00000000";
              --elsif (cMicronN25Q = '1') then
              --  regData40                 <= cCmdRFSR & X"00000000";
            else
              regData40 <= cCmdRDSR & X"00000000";
            end if;
            regCounter3              <= "010";
            regSSDResetAfterSendWord <= '1';
            stateAfterSendWord       <= sProgrammerPollStatus1;
            stateProgrammer          <= sProgrammerSendWord;

          when sProgrammerPollStatus1 =>
            state_cnt <= x"1A";
            if (regTimer = 0) then
              stateProgrammer <= stateErrorTimeOut;
            elsif (cAtmelDataFlash = '1') then
              if (regData40(7) = '1') then
                stateProgrammer <= stateAfterPollStatus;   -- Operation done
              else
                stateProgrammer <= sProgrammerPollStatus;  -- Busy
              end if;
              --elsif (cMicronN25Q = '1') then
              --  -- N25Q-only read flag status register (RFSR)
              --  if (regData40(1) = '1') then
              --    stateProgrammer <= sProgrammerError;  -- Protection
              --  elsif (regData40(3) = '1') then
              --    stateProgrammer <= sProgrammerError;  -- VPP
              --  elsif (regData40(4) = '1') then
              --   stateProgrammer <= sProgrammerErrorProgram;
              --  elsif (regData40(5) = '1') then
              --    stateProgrammer <= sProgrammerErrorErase;
              --  elsif (regData40(7) = '1') then
              --    stateProgrammer <= stateAfterPollStatus;  -- Operation done
              --  else
              --    stateProgrammer <= sProgrammerPollStatus; -- Busy
              --  end if;
            else                        -- Check legacy status register flag
              if (regData40(0) = '0') then
                stateProgrammer <= stateAfterPollStatus;   -- Operation done
              else
                stateProgrammer <= sProgrammerPollStatus;  -- Busy
              end if;
            end if;

            --------------------------------------------------------------------
            -- ERROR STATES
          when sProgrammerErrorIdcode =>
            state_cnt       <= x"1B";
            regError        <= cErrorIdcode;
--            stateProgrammer <= sProgrammerEnd;
            stateProgrammer <= sProgrammerCheckDaqDone;
          when sProgrammerErrorErase =>
            state_cnt       <= x"1C";
            regError        <= cErrorErase;
--            stateProgrammer <= sProgrammerEnd;
            stateProgrammer <= sProgrammerCheckDaqDone;
          when sProgrammerErrorEraseTO =>
            state_cnt       <= x"1D";
            regError        <= cErrorEraseTO;
--            stateProgrammer <= sProgrammerEnd;
            stateProgrammer <= sProgrammerCheckDaqDone;
          when sProgrammerErrorProgram =>
            state_cnt       <= x"1E";
            regError        <= cErrorProgram;
--            stateProgrammer <= sProgrammerEnd;
            stateProgrammer <= sProgrammerCheckDaqDone;
          when sProgrammerErrorProgramTO =>
            state_cnt       <= x"1F";
            regError        <= cErrorProgramTO;
--            stateProgrammer <= sProgrammerEnd;
            stateProgrammer <= sProgrammerCheckDaqDone;
          when sProgrammerErrorAddSel =>
            state_cnt       <= x"20";
            regError        <= cErrorAddSel;
--            stateProgrammer <= sProgrammerEnd;
            stateProgrammer <= sProgrammerCheckDaqDone;

            --------------------------------------------------------------------
            -- Wait and Check DAQ done
          when sProgrammerCheckDaqDone =>
            state_cnt <= x"21";
            if inDataWriteEnable = '0' then  -- fifo empty
              if inDaqDone = '1' then
                stateProgrammer <= sProgrammerEnd;
                regProgramOK    <= '1';
              else
                stateProgrammer <= sProgrammerCheckDaqDone;
                regError        <= cErrorProgDAQ;
              end if;
            else                             -- more data into fifo
              stateProgrammer <= sProgrammerCheckDaqDone;
              regReady_BusyB  <= '1';
              regError        <= cErrorProgDAQ;
            end if;

            --------------------------------------------------------------------
            -- END/DONE STATE
          when sProgrammerEnd =>
            state_cnt           <= x"22";
            stateProgrammer     <= sProgrammerWaitStart;
            regReady_BusyB      <= '1';
            regDone             <= '1';
            regSSDReset_EnableB <= '1';

          when others =>
        end case;
      end if;
    end if;
  end process processProgram;


  -- Assign outputs
  outReady_BusyB     <= regReady_BusyB;
  outDone            <= regDone;
  outError           <= regError(0);
  outErrorIdcode     <= regError(1);
  outErrorErase      <= regError(2);
  outErrorProgram    <= regError(3);
  outErrorTimeOut    <= regError(4);
  outErrorAddSel     <= regError(5);
  outErrorBitstmSize <= regError(6);
  outStarted         <= regStarted;
  outInitializeOK    <= regInitializeOK;
  outCheckIdOK       <= regCheckIdOK;
  outEraseOK         <= regEraseOK;
  outProgramOK       <= regProgramOK;
  outVerifyOK        <= regVerifyOK;

  outSSDReset_EnableB <= regSSDReset_EnableB;
  outSSDStartTransfer <= regSSDStartTransfer;
  outSSDData8Send     <= regSSDData8Send;

end behavioral;

