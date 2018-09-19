-------------------------------------------------------------------------------
-- Copyright (c) 2009 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor:                Xilinx, Inc.
-- \   \   \/    Version:               1.00
--  \   \        Filename:              SpiFlashProgrammer.vhd
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
--                cEraseSwitchWord  - For remote update, set to '1' to erase/restore the critical switch word.
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
-------------------------------------------------------------------------------
library ieee;
Library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use UNISIM.vcomponents.all;

entity SpiFlashProgrammer is
  port
  (
    -- Clock and control signals
    inClk               : in  std_logic;
    inReset_EnableB     : in  std_logic;
    inCheckIdOnly       : in  std_logic;
    inVerifyOnly        : in  std_logic;

    -- Data
    inData32            : in  std_logic_vector(31 downto 0);
    inDataWriteEnable   : in  std_logic;

    -- Status signals
    outReady_BusyB      : out std_logic;
    outDone             : out std_logic;
    outError            : out std_logic;
    outErrorIdcode      : out std_logic;
    outErrorErase       : out std_logic;
    outErrorProgram     : out std_logic;
    outErrorTimeOut     : out std_logic;
    outErrorCrc         : out std_logic;
    outStarted          : out std_logic;
    outInitializeOK     : out std_logic;
    outCheckIdOK        : out std_logic;
    outEraseSwitchWordOK: out std_logic;
    outEraseOK          : out std_logic;
    outProgramOK        : out std_logic;
    outVerifyOK         : out std_logic;
    outProgramSwitchWordOK: out std_logic;

    -- Signals for SpiSerDes - Connect to instance of SpiSerDes
    outSSDReset_EnableB : out std_logic;
    outSSDStartTransfer : out std_logic;
    inSSDTransferDone   : in  std_logic;
    outSSDData8Send     : out std_logic_vector(7 downto 0);
    inSSDData8Receive   : in  std_logic_vector(7 downto 0)
  );
end SpiFlashProgrammer;

architecture behavioral of SpiFlashProgrammer is
  --##########################################################################
  -- BEGIN BASIC PARAMETER SETTINGS:
  -- THE FOLLOWING MUST MATCH THE OUTPUT FROM MakeSpiFlashProgrammerMcsFiles.pl
  -- SPI DEVICE TYPE: Only one of the following must be set to '1'. Other is '0'.
  constant  cMicronN25Q       : std_logic := '1'; -- Micron N25Q serial NOR flash
  constant  cMicronNP5Q       : std_logic := '0'; -- Micron NP5Q phase change memory
  constant  cAtmelDataFlash   : std_logic := '0'; -- Atmel DataFlash or Spartan-3AN with power-of-2 page size. (NOT TESTED)
  constant  cWinbondW25Q      : std_logic := '0'; -- Winbond W25Q (NOT TESTED)
  constant  cSpansionS25FS    : std_logic := '0'; -- Spansion S25FS (NOT TESTED)
  -- SPI COMMAND ADDRESS WIDTH (IN BITS): Ensure setting is correct for the target flash
  constant  cAddrWidth        : integer   := 32;  -- 24 or 32 (address width in bits)
  -- SPI SECTOR SIZE (IN BYTES)
  constant  cSizeSector       : std_logic_vector(31 downto 0) := X"00010000"; -- 65536 bytes
  -- SPI PAGE SIZE (IN BYTES): Ensure setting is correct for the chosen device type.
  constant  cSizePage         : std_logic_vector(31 downto 0) := X"00000100"; -- 256 (std)
  constant  cSizePageNP5Q     : std_logic_vector(31 downto 0) := X"00000040"; -- 64
  -- UPDATE IMAGE START (BYTE) ADDRESS
  constant  cAddrUpdateStart  : std_logic_vector(31 downto 0) := X"00200000";
  -- UPDATE IMAGE END+1 (BYTE) ADDRESS
  constant  cAddrUpdateEnd    : std_logic_vector(31 downto 0) := X"00400000";
  -- SWITCH WORD (BYTE) ADDRESS: Ensure setting is correct for the chosen device type
  constant  cAddrSwitchWordN25Q : std_logic_vector(31 downto 0) := X"00000FFC"; -- Typically=(Subsector or page) size - 4.
  constant  cAddrSwitchWordNP5Q : std_logic_vector(31 downto 0) := X"0000003C"; -- Typically=(Subsector or page) size - 4.
  constant  cAddrSwitchWordAtmel: std_logic_vector(31 downto 0) := X"000000FC"; -- Typically=(Subsector or page) size - 4.
  -- SWITCH WORD
  constant  cSwitchWord         : std_logic_vector(31 downto 0) := X"AA995566";
  ----------------------------------------------------------------------------
  -- DATA WORD WIDTH (IN BYTES) FOR INPUT APPLIED TO THE MODULE'S 32-BIT inData32 BUS
  constant  cDataWordWidth    : integer := 4;  -- 4 = 32-bit word --> inData32[31:0]
  --                                           -- 2 = 16-bit word --> inData32[15:0]
  --                                           -- 1 = 8-bit word --> inData32[7:0]
  -- END BASIC PARAMETER SETTINGS
  --##########################################################################

  -- SPI flash information
  -- Customize these constants per the target SPI flash device
  -- Device ID from RDID.  Set cIdcode24 to the valid IDCODE for the target SPI flash
  constant  cIdcode24N25Q     : std_logic_vector(23 downto 0) := X"20BA18";
  constant  cIdcode24NP5Q     : std_logic_vector(23 downto 0) := X"20DA18";
  constant  cIdcode24Atmel    : std_logic_vector(23 downto 0) := X"1F2000";
  constant  cIdcode24W25Q     : std_logic_vector(23 downto 0) := X"EF4018";
  constant  cIdcode24S25FS    : std_logic_vector(23 downto 0) := X"012018";
  -- Device command opcodes
  constant  cCmdREAD24        : std_logic_vector(7 downto 0)  := X"03";
  constant  cCmdREAD32        : std_logic_vector(7 downto 0)  := X"13";
  constant  cCmdRDID          : std_logic_vector(7 downto 0)  := X"9F";
  constant  cCmdWE            : std_logic_vector(7 downto 0)  := X"06";
  constant  cCmdSE24          : std_logic_vector(7 downto 0)  := X"D8";
  constant  cCmdSE32          : std_logic_vector(7 downto 0)  := X"DC";
  constant  cCmdSSE24         : std_logic_vector(7 downto 0)  := X"20";
  constant  cCmdSSE32         : std_logic_vector(7 downto 0)  := X"21";
  constant  cCmdPP24          : std_logic_vector(7 downto 0)  := X"02";
  constant  cCmdPP32          : std_logic_vector(7 downto 0)  := X"12";
  constant  cCmdPP24NP5Q      : std_logic_vector(7 downto 0)  := X"22"; -- Micron NP5Q page program, bit-alterable write
  constant  cCmdPP24Atmel     : std_logic_vector(7 downto 0)  := X"82"; -- Atmel page program with built-in erase
  constant  cCmdRFSR          : std_logic_vector(7 downto 0)  := X"70"; -- N25Q-only flag status register
  constant  cCmdRDSR          : std_logic_vector(7 downto 0)  := X"05"; -- Legacy read status register: Micron=X"05"
  constant  cCmdRDSRAtmel     : std_logic_vector(7 downto 0)  := X"D7";
  -- Device timeouts. timeout = max_time (s) X inClk (Hz) / 22 or X"00000000" = ultimate MAX count
  -- where 22 is polling loop cycle count.
  constant  cClkFrequencyHz   : integer                       := 20000000;    -- Not used; Keep for reference
  constant  cClkCyclesPerTOLoop:integer                       := 22;          -- Not used; Keep for reference
  constant  cCmdSETimeOut     : std_logic_vector(31 downto 0) := X"00299D69"; -- max tSE * cClkFrequencyHz / 22
  constant  cCmdSSETimeOut    : std_logic_vector(31 downto 0) := X"000B18E9"; -- max tSSE* cClkFrequencyHz / 22
  constant  cCmdPPTimeOut     : std_logic_vector(31 downto 0) := X"000011C2"; -- max tPP * cClkFrequencyHz / 22

  -- Perform erase (destroy) and program (restore) of switch word
  constant  cEraseSwitchWord  : std_logic                     := '1';

  -- Constants for output error flags
  constant  cErrorNone      : std_logic_vector(5 downto 0)  := B"000000";
  constant  cError          : std_logic_vector(5 downto 0)  := B"000001";
  constant  cErrorIdcode    : std_logic_vector(5 downto 0)  := cError or B"000010";
  constant  cErrorErase     : std_logic_vector(5 downto 0)  := cError or B"000100";
  constant  cErrorProgram   : std_logic_vector(5 downto 0)  := cError or B"001000";
  constant  cErrorTimeOut   : std_logic_vector(5 downto 0)  := cError or B"010000";
  constant  cErrorEraseTO   : std_logic_vector(5 downto 0)  := cError or cErrorErase or cErrorTimeOut;
  constant  cErrorProgramTO : std_logic_vector(5 downto 0)  := cError or cErrorProgram or cErrorTimeOut;
  constant  cErrorCrc       : std_logic_vector(5 downto 0)  := cError or B"100000";

  -- CRC32 constant
  constant  cCrc32Residue   : std_logic_vector(31 downto 0) := X"C704DD7B";

  -- Registers
  signal  regCheckIdOnly      : std_logic                     := '0';
  signal  regVerifyOnly       : std_logic                     := '0';
  signal  regReady_BusyB      : std_logic                     := '1';         -- Ready/BusyB state of this module for accepting next data word input
  signal  regDone             : std_logic                     := '0';         -- Done state of this module
  signal  regError            : std_logic_vector(5 downto 0)  := cErrorNone;  -- Output error flags
  signal  regStarted          : std_logic                     := '0';
  signal  regInitializeOK     : std_logic                     := '0';
  signal  regCheckIdOK        : std_logic                     := '0';
  signal  regEraseSwitchWordOK: std_logic                     := '0';
  signal  regEraseOK          : std_logic                     := '0';
  signal  regProgramOK        : std_logic                     := '0';
  signal  regVerifyOK         : std_logic                     := '0';
  signal  regProgramSwitchWordOK: std_logic                   := '0';

  -- Signals for driving to SpiSerDes module
  signal  regSSDReset_EnableB : std_logic := '1';
  signal  regSSDResetAfterSendWord  : std_logic := '1';
  signal  regSSDStartTransfer : std_logic := '1';
  signal  regSSDData8Send     : std_logic_vector(7 downto 0)  := X"00";

  -- Registers
  signal  regCounter3         : std_logic_vector(2 downto 0)  := "000";
  signal  regData40           : std_logic_vector(39 downto 0) := X"0000000000";
  signal  regCounter32        : std_logic_vector(31 downto 0) := X"00000000";
  signal  regCounter10        : std_logic_vector(9 downto 0)  := "0000000000";
  signal  regTimer            : std_logic_vector(31 downto 0) := X"00000000";

  -- Internal signals
  signal  intSSDTransferDone  : std_logic;

  -- Signals for CRC
  signal  regCrc32            : std_logic_vector(31 downto 0) := X"FFFFFFFF";
  signal  intCrc32Next        : std_logic_vector(31 downto 0);

  -- Attributes
  attribute clock_signal            : string;
  attribute clock_signal of inClk   : signal is "yes";

  -- State definitions
  type sProgrammer is
  (
    sProgrammerInitialize,
    sProgrammerCheckId, sProgrammerCheckId1,
    sProgrammerEraseSwitchWord,
    sProgrammerEraseUpdateArea, sProgrammerEraseUpdateArea1,
    sProgrammerEraseUpdateArea2, sProgrammerEraseUpdateArea3,
    sProgrammerProgramUpdateArea, sProgrammerProgramUpdateArea1,
    sProgrammerProgramUpdateArea2, sProgrammerProgramUpdateArea3,
    sProgrammerProgramUpdateArea4,
    sProgrammerVerifyUpdateArea, sProgrammerVerifyUpdateArea1,
    sProgrammerVerifyUpdateArea2, sProgrammerVerifyUpdateArea3,
    sProgrammerVerifyUpdateArea4, sProgrammerVerifyUpdateArea5,
    sProgrammerProgramSwitchWord, sProgrammerProgramSwitchWord1,
    sProgrammerSendWEAndWord, sProgrammerSendWE, sProgrammerSendWE1,
    sProgrammerSendWord, sProgrammerSendWord1, sProgrammerSendWord2,
    sProgrammerPollStatus, sProgrammerPollStatus1,
    sProgrammerError, sProgrammerErrorIdcode, sProgrammerErrorErase, sProgrammerErrorEraseTO,
    sProgrammerErrorProgram, sProgrammerErrorProgramTO, sProgrammerErrorCrc,
    sProgrammerEnd
  );
  signal  stateProgrammer     : sProgrammer;
  signal  stateAfterSendWord  : sProgrammer;
  signal  stateAfterPollStatus: sProgrammer;
  signal  stateErrorTimeOut   : sProgrammer;

begin
  -- Main state machine
  processProgram : process (inClk)
  begin
    if (rising_edge(inClk)) then
      if (inReset_EnableB='1') then
        -- RESET
        regCheckIdOnly      <= '0';
        regVerifyOnly       <= '0';
        -- Reset module output signals
        regReady_BusyB      <= '1';
        regDone             <= '0';
        regError            <= cErrorNone;
        regStarted          <= '0';
        regInitializeOK     <= '0';
        regCheckIdOK        <= '0';
        regEraseSwitchWordOK<= '0';
        regEraseOK          <= '0';
        regProgramOK        <= '0';
        regVerifyOK         <= '0';
        regProgramSwitchWordOK<= '0';
        -- Reset SpiSerDes control signals
        regSSDReset_EnableB <= '1';
        regSSDStartTransfer <= '0';
        regSSDData8Send     <= X"00";
        -- Reset CRC32
        regCrc32            <= X"FFFFFFFF";
        -- Setup for next state
        regData40           <= X"0000000000";
        stateProgrammer     <= sProgrammerInitialize;
      else
        case (stateProgrammer) is
          --------------------------------------------------------------------
          -- PROGRAMMER START/INITIALIZE
          -- Initialize the SPI bus: Output one word of all zeros to the SPI bus
          -- because STARTUP.USRCCLKO MUX needs a few clock cycles to switch.
          when sProgrammerInitialize =>
            regStarted                  <= '1';
            regReady_BusyB              <= '0';
            regCheckIdOnly              <= inCheckIdOnly;
            regVerifyOnly               <= inVerifyOnly;
            regData40                   <= X"0000000000";
            regCounter3                 <= "100";
            stateProgrammer             <= sProgrammerSendWord;
            stateAfterSendWord          <= sProgrammerCheckId;
            regSSDResetAfterSendWord    <= '1';

          --------------------------------------------------------------------
          -- CHECK DEVICE ID - sanity check SPI flash connectivity
          -- Send RDID command and read 24-bits of the device ID.
          -- By default, check only manufacturer code (ID[23:16]) and
          -- device type (ID[23:8]; Ignore device size (ID[7:0]).
          -- Note: Special case for Atmel DataFlash, device size in ID[12:8].
          when sProgrammerCheckId =>
            regInitializeOK             <= '1';
            regData40                   <= cCmdRDID & X"00000000";
            regCounter3                 <= "100";
            stateProgrammer             <= sProgrammerSendWord;
            stateAfterSendWord          <= sProgrammerCheckId1;
            regSSDResetAfterSendWord    <= '1';

          when sProgrammerCheckId1 =>
            if ((cMicronNP5Q='1') and (regData40(23 downto 8) /= cIdcode24NP5Q(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cAtmelDataFlash='1') and (regData40(23 downto 13) /= cIdcode24Atmel(23 downto 13))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cMicronN25Q='1') and (regData40(23 downto 8) /= cIdcode24N25Q(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cWinbondW25Q='1') and (regData40(23 downto 8) /= cIdcode24W25Q(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            elsif ((cSpansionS25FS='1') and (regData40(23 downto 8) /= cIdcode24S25FS(23 downto 8))) then
              stateProgrammer <= sProgrammerErrorIdcode;
            else
              regCheckIdOK    <= '1';
              if (regCheckIdOnly = '1') then
                stateProgrammer <= sProgrammerEnd;                  -- Done, if Check ID ONLY
              elsif (regVerifyOnly = '1') then
                stateProgrammer <= sProgrammerVerifyUpdateArea;     -- Skip to Verify ONLY
              elsif (cEraseSwitchWord = '1') then
                stateProgrammer <= sProgrammerEraseSwitchWord;      -- Default for update: first erase SwitchWord, then update area
              else
                stateProgrammer <= sProgrammerEraseUpdateArea;      -- Erase only update area
              end if;
            end if;

          --------------------------------------------------------------------
          -- ERASE SWITCH WORD - erase the "critical switch word" that determines whether
          -- to boot from the "golden" image (when switch word is corrupted) or
          -- update" image (when switch word is intact).
          -- The critical switch word is corrupted via the following methods for each SPI flash type:
          --   Micron N25Q (and std flash):  Subsector erase (SSE) command. (24-bit or 32-bit addr versions)
          --   Micron NP5Q:  Page Program using bit-alterable write to directly overwrite one byte of switch word.
          --   Atmel DataFlash:  Page Program W/Built-in Erase to directly overwrite the page.
          -- Poll the SPI flash status for completion of the command.
          when sProgrammerEraseSwitchWord =>
            -- Send SSE (if device supports page erase, send PE)
            if (cMicronNP5Q = '1') then
              regData40                 <= cCmdPP24NP5Q & cAddrSwitchWordNP5Q(23 downto 0) & X"00";
              regCounter3               <= "101";
            elsif (cAtmelDataFlash = '1') then
              regData40                 <= cCmdPP24Atmel & cAddrSwitchWordAtmel(23 downto 0) & X"00";
              regCounter3               <= "101";
            elsif (cAddrWidth=32) then
              regData40                 <= cCmdSSE32 & cAddrSwitchWordN25Q;
              regCounter3               <= "101";
            else
              regData40                 <= cCmdSSE24 & cAddrSwitchWordN25Q(23 downto 0) & X"00";
              regCounter3               <= "100";
            end if;
            stateProgrammer             <= sProgrammerSendWEAndWord;
            stateAfterSendWord          <= sProgrammerPollStatus;
            regSSDResetAfterSendWord    <= '1';
            stateAfterPollStatus        <= sProgrammerEraseUpdateArea;
            regTimer                    <= cCmdSSETimeOut;
            stateErrorTimeOut           <= sProgrammerErrorEraseTO;

          --------------------------------------------------------------------
          -- ERASE UPDATE IMAGE SECTORS
          -- Erase the update image area, sector-by-sector.
          -- NOTE:  NO need to pre-erase these special case device types:
          --   Micron NP5Q:  Skip erase and instead use Page Program with bit-alterable write
          --   Atmel DataFlash:  Skip separate erase, and instead use Page Program with built-in erase
          -- For each sector, poll the SPI flash status for completion of the command.
          when sProgrammerEraseUpdateArea =>
            regEraseSwitchWordOK          <= cEraseSwitchWord;
            if ((cMicronNP5Q = '1') or (cAtmelDataFlash='1')) then
              stateProgrammer             <= sProgrammerProgramUpdateArea;
            else
              -- Send SE
              regCounter32                <= cAddrUpdateStart;
              stateProgrammer             <= sProgrammerEraseUpdateArea1;
            end if;

          when sProgrammerEraseUpdateArea1 =>
            if (cAddrWidth=32) then
              regData40                 <= cCmdSE32 & regCounter32;
              regCounter3               <= "101";
            else
              regData40                 <= cCmdSE24 & regCounter32(23 downto 0) & X"00";
              regCounter3               <= "100";
            end if;
            stateProgrammer             <= sProgrammerSendWEAndWord;
            stateAfterSendWord          <= sProgrammerPollStatus;
            regSSDResetAfterSendWord    <= '1';
            stateAfterPollStatus        <= sProgrammerEraseUpdateArea2;
            regTimer                    <= cCmdSETimeOut;
            stateErrorTimeOut           <= sProgrammerErrorEraseTO;

          when sProgrammerEraseUpdateArea2 =>
            regCounter32                <= regCounter32 + cSizeSector;
            stateProgrammer             <= sProgrammerEraseUpdateArea3;

          when sProgrammerEraseUpdateArea3 =>
            if (regCounter32 = cAddrUpdateEnd) then
              stateProgrammer           <= sProgrammerProgramUpdateArea;
            else
              stateProgrammer           <= sProgrammerEraseUpdateArea1;
            end if;

          --------------------------------------------------------------------
          -- PROGRAM UPDATE IMAGE AREA
          -- Program the update image area from cAddrUpdateStart through cAddrUpdateEnd.
          -- Send Page Program command, receive data words of cDataWordWidth width
          -- from the inData32 bus, and forward data word to the SPI flash.
          -- At each page boundary, end the Page Program command and allow the SPI flash
          -- time to progam the data into the page.
          -- For each page, poll the SPI flash status for completion of each command.
          when sProgrammerProgramUpdateArea =>
            regEraseOK                  <= '1';
            regCounter32                <= cAddrUpdateStart;
            stateProgrammer             <= sProgrammerProgramUpdateArea1;

          when sProgrammerProgramUpdateArea1 =>
            -- Send PP
            if (cAddrWidth=32) then
              regData40                 <= cCmdPP32 & regCounter32;
              regCounter3               <= "101";
            elsif (cMicronNP5Q = '1') then
              regData40                 <= cCmdPP24NP5Q & regCounter32(23 downto 0) & X"00";
              regCounter3               <= "100";
            elsif (cAtmelDataFlash = '1') then
              regData40                 <= cCmdPP24Atmel & regCounter32(23 downto 0) & X"00";
              regCounter3               <= "100";
            else
              regData40                 <= cCmdPP24 & regCounter32(23 downto 0) & X"00";
              regCounter3               <= "100";
            end if;
            stateProgrammer             <= sProgrammerSendWEAndWord;
            stateAfterSendWord          <= sProgrammerProgramUpdateArea2;
            regSSDResetAfterSendWord    <= '0';
            if (cMicronNP5Q='1') then
              regCounter10                <= cSizePageNP5Q(9 downto 0);
              regCounter32                <= regCounter32 + cSizePageNP5Q;
            else
              regCounter10                <= cSizePage(9 downto 0);
              regCounter32                <= regCounter32 + cSizePage;
            end if;

          when sProgrammerProgramUpdateArea2 =>
            regReady_BusyB              <= '1';
            stateProgrammer             <= sProgrammerProgramUpdateArea3;

          when sProgrammerProgramUpdateArea3 =>
            if (inDataWriteEnable = '1') then
              regReady_BusyB      <= '0';
              if (cDataWordWidth = 1) then
                regData40         <= inData32(7 downto 0) & X"00000000";
                regCounter3       <= "001";
              elsif (cDataWordWidth = 2) then
                regData40         <= inData32(15 downto 0) & X"000000";
                regCounter3       <= "010";
              else
                regData40         <= inData32 & X"00";
                regCounter3       <= "100";
              end if;
              regCounter10        <= regCounter10 - cDataWordWidth;
              stateProgrammer     <= sProgrammerSendWord;
              stateAfterSendWord  <= sProgrammerProgramUpdateArea4;
            end if;

          when sProgrammerProgramUpdateArea4 =>
            if (regCounter10 = 0) then
              regSSDReset_EnableB       <= '1';
              regTimer                  <= cCmdPPTimeOut;
              stateErrorTimeOut         <= sProgrammerErrorProgramTO;
              stateProgrammer           <= sProgrammerPollStatus;
              if (regCounter32 = cAddrUpdateEnd) then
                regProgramOK            <= '1';
                stateAfterPollStatus    <= sProgrammerVerifyUpdateArea;
              else
                stateAfterPollStatus    <= sProgrammerProgramUpdateArea1;
              end if;
            else
              stateProgrammer           <= sProgrammerProgramUpdateArea2;
            end if;

          --------------------------------------------------------------------
          -- VERIFY UPDATE IMAGE AREA
          -- Read the entire update image from cAddrUpdateStart to cAddrUpdateEnd
          -- and compute the CRC32 of the image. The complement of the CRC32 is
          -- embedded at the end of the image. Thus, the resulting computed CRC32
          -- is expected to be the constant CRC32 residue. (See XAPP209 for CRC32
          -- and residue explanation.)
          when sProgrammerVerifyUpdateArea =>
            regCounter32    <= cAddrUpdateStart;
            stateProgrammer <= sProgrammerVerifyUpdateArea1;

          when sProgrammerVerifyUpdateArea1 =>
            if (cAddrWidth=32) then
              regData40                 <= cCmdREAD32 & regCounter32;
              regCounter3               <= "101";
            else
              regData40                 <= cCmdREAD24 & regCounter32(23 downto 0) & X"00";
              regCounter3               <= "100";
            end if;
            stateProgrammer             <= sProgrammerSendWord;
            stateAfterSendWord          <= sProgrammerVerifyUpdateArea2;
            regSSDResetAfterSendWord    <= '0';

          when sProgrammerVerifyUpdateArea2 =>
            regSSDReset_EnableB <= '0';
            regSSDData8Send     <= X"00";
            regSSDStartTransfer <= '1';
            stateProgrammer     <= sProgrammerVerifyUpdateArea3;

          when sProgrammerVerifyUpdateArea3 =>
            regCounter32        <= regCounter32 + 1;
            stateProgrammer     <= sProgrammerVerifyUpdateArea4;

          when sProgrammerVerifyUpdateArea4 =>
            regSSDStartTransfer <= '0';
            if (inSSDTransferDone = '1') then
              regCrc32              <= intCrc32Next;
              if (regCounter32 = cAddrUpdateEnd) then
                stateProgrammer     <= sProgrammerVerifyUpdateArea5;
              else
                stateProgrammer     <= sProgrammerVerifyUpdateArea2;
              end if;
            end if;

          when sProgrammerVerifyUpdateArea5 =>
            regSSDReset_EnableB       <= '1';
            if (regCrc32 /= cCrc32Residue) then
              stateProgrammer <= sProgrammerErrorCrc;
            else
              regVerifyOK     <= '1';
              if ((regVerifyOnly = '1') or (cEraseSwitchWord = '0')) then
                stateProgrammer <= sProgrammerEnd;
              else
                stateProgrammer <= sProgrammerProgramSwitchWord;
              end if;
            end if;

          --------------------------------------------------------------------
          -- PROGRAM SWITCH WORD
          -- By default for remote update, restore the "critical switch word".
          -- Reprogram the critical switch word after verifying the update image
          -- such that the quick boot jump to the update image is enabled
          -- ONLY after the update image has been verified to have been programmed
          -- completely and correctly.
          when sProgrammerProgramSwitchWord =>
            if (cMicronNP5Q = '1') then
              regData40                 <= cCmdPP24NP5Q & cAddrSwitchWordNP5Q(23 downto 0) & X"00";
              regCounter3               <= "100";
            elsif (cAtmelDataFlash = '1') then
              regData40                 <= cCmdPP24Atmel & cAddrSwitchWordAtmel(23 downto 0) & X"00";
              regCounter3               <= "100";
            elsif (cAddrWidth=32) then
              regData40                 <= cCmdPP32 & cAddrSwitchWordN25Q;
              regCounter3               <= "101";
            else
              regData40                 <= cCmdPP24 & cAddrSwitchWordN25Q(23 downto 0) & X"00";
              regCounter3               <= "100";
            end if;
            stateProgrammer             <= sProgrammerSendWEAndWord;
            stateAfterSendWord          <= sProgrammerProgramSwitchWord1;
            regSSDResetAfterSendWord    <= '0';

          when sProgrammerProgramSwitchWord1 =>
            regData40                   <= cSwitchWord & X"00";
            regCounter3                 <= "100";
            stateProgrammer             <= sProgrammerSendWord;
            stateAfterSendWord          <= sProgrammerPollStatus;
            regSSDResetAfterSendWord    <= '1';
            stateAfterPollStatus        <= sProgrammerEnd;
            regTimer                    <= cCmdPPTimeOut;
            stateErrorTimeOut           <= sProgrammerErrorProgramTO;

          --------------------------------------------------------------------
          -- SEND WRITE ENABLE and COMMAND (subroutine)
          -- Before jumping to this state, see SEND WORD for requirements
          when sProgrammerSendWEAndWord =>
            if (cAtmelDataFlash='1') then
              stateProgrammer     <= sProgrammerSendWord; -- Atmel does not have a WE
            else
              regSSDReset_EnableB <= '0';
              regSSDData8Send     <= cCmdWE;
              regSSDStartTransfer <= '1';
              stateProgrammer     <= sProgrammerSendWE;
            end if;

          when sProgrammerSendWE =>
            stateProgrammer     <= sProgrammerSendWE1;

          when sProgrammerSendWE1 =>
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
            regSSDReset_EnableB <= '0';
            regSSDData8Send     <= regData40(39 downto 32);
            regSSDStartTransfer <= '1';
            stateProgrammer     <= sProgrammerSendWord1;

          when sProgrammerSendWord1 =>
            regCounter3         <= regCounter3 - 1;
            regSSDData8Send     <= regData40(31 downto 24);
            stateProgrammer     <= sProgrammerSendWord2;

          when sProgrammerSendWord2 =>
            if (regCounter3="000") then
              regSSDStartTransfer <= '0';
            end if;
            if (inSSDTransferDone = '1') then
              regData40 <= regData40(31 downto 0) & inSSDData8Receive;
              if (regCounter3 = "000") then
                regSSDReset_EnableB <= regSSDResetAfterSendWord;
                stateProgrammer     <= stateAfterSendWord;
              else
                stateProgrammer     <= sProgrammerSendWord1;
              end if;
            end if;

          --------------------------------------------------------------------
          -- POLL STATUS
          -- Before jumping to this state:
          --  Set regTimer  = the max number of polling loops to do before triggering a timeout error
          --  Set stateErrorTimeOut = The timeout error state to which to jump when a timeout error is triggered
          --  Set stateAfterPollStatus  = The state to which to return when the polling reaches a READY status.
          when sProgrammerPollStatus =>
            regTimer                  <= regTimer - 1;
            if (cAtmelDataFlash = '1') then
              regData40                 <= cCmdRDSRAtmel & X"00000000";
            --elsif (cMicronN25Q = '1') then
            --  regData40                 <= cCmdRFSR & X"00000000";
            else
              regData40                 <= cCmdRDSR & X"00000000";
            end if;
            regCounter3               <= "010";
            regSSDResetAfterSendWord  <= '1';
            stateAfterSendWord        <= sProgrammerPollStatus1;
            stateProgrammer           <= sProgrammerSendWord;

          when sProgrammerPollStatus1 =>
            if (regTimer = 0) then
              stateProgrammer <= stateErrorTimeOut;
            elsif (cAtmelDataFlash='1') then
              if (regData40(7) = '1') then
                stateProgrammer <= stateAfterPollStatus;  -- Operation done
              else
                stateProgrammer <= sProgrammerPollStatus; -- Busy
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
            else  -- Check legacy status register flag
              if (regData40(0) = '0') then
                stateProgrammer <= stateAfterPollStatus;  -- Operation done
              else
                stateProgrammer <= sProgrammerPollStatus; -- Busy
              end if;
            end if;

          --------------------------------------------------------------------
          -- ERROR STATES
          when sProgrammerErrorIdcode =>
            regError        <= cErrorIdcode;
            stateProgrammer <= sProgrammerEnd;
          when sProgrammerErrorErase =>
            regError        <= cErrorErase;
            stateProgrammer <= sProgrammerEnd;
          when sProgrammerErrorEraseTO =>
            regError        <= cErrorEraseTO;
            stateProgrammer <= sProgrammerEnd;
          when sProgrammerErrorProgram =>
            regError        <= cErrorProgram;
            stateProgrammer <= sProgrammerEnd;
          when sProgrammerErrorProgramTO =>
            regError        <= cErrorProgramTO;
            stateProgrammer <= sProgrammerEnd;
          when sProgrammerErrorCrc =>
            regError        <= cErrorCrc;
            stateProgrammer <= sProgrammerEnd;

          --------------------------------------------------------------------
          -- END/DONE STATE
          when sProgrammerEnd  =>
            regProgramSwitchWordOK<= (cEraseSwitchWord and regVerifyOK and (not regVerifyOnly));
            regReady_BusyB      <= '1';
            regDone             <= '1';
            regSSDReset_EnableB <= '1';

          when others =>
        end case;
      end if;
    end if;
  end process processProgram;

  -- CRC calculations
  intCrc32Next(0)   <= inSSDData8Receive(7) xor regCrc32(30) xor inSSDData8Receive(1) xor regCrc32(24);
  intCrc32Next(1)   <= inSSDData8Receive(7) xor regCrc32(25) xor inSSDData8Receive(1) xor regCrc32(31) xor inSSDData8Receive(6) xor regCrc32(30) xor inSSDData8Receive(0) xor regCrc32(24);
  intCrc32Next(2)   <= inSSDData8Receive(7) xor regCrc32(25) xor inSSDData8Receive(1) xor inSSDData8Receive(5) xor regCrc32(31) xor inSSDData8Receive(6) xor regCrc32(30) xor inSSDData8Receive(0) xor regCrc32(26) xor regCrc32(24);
  intCrc32Next(3)   <= regCrc32(25) xor inSSDData8Receive(5) xor regCrc32(31) xor regCrc32(27) xor inSSDData8Receive(6) xor inSSDData8Receive(0) xor regCrc32(26) xor inSSDData8Receive(4);
  intCrc32Next(4)   <= inSSDData8Receive(7) xor inSSDData8Receive(1) xor inSSDData8Receive(5) xor inSSDData8Receive(3) xor regCrc32(27) xor regCrc32(30) xor regCrc32(28) xor regCrc32(26) xor regCrc32(24) xor inSSDData8Receive(4);
  intCrc32Next(5)   <= inSSDData8Receive(7) xor regCrc32(25) xor inSSDData8Receive(1) xor regCrc32(31) xor inSSDData8Receive(3) xor regCrc32(27) xor inSSDData8Receive(2) xor inSSDData8Receive(6) xor regCrc32(29) xor regCrc32(30) xor regCrc32(28) xor inSSDData8Receive(0) xor regCrc32(24) xor inSSDData8Receive(4);
  intCrc32Next(6)   <= regCrc32(25) xor inSSDData8Receive(5) xor inSSDData8Receive(1) xor regCrc32(31) xor inSSDData8Receive(3) xor inSSDData8Receive(2) xor inSSDData8Receive(6) xor regCrc32(29) xor regCrc32(28) xor regCrc32(30) xor inSSDData8Receive(0) xor regCrc32(26);
  intCrc32Next(7)   <= inSSDData8Receive(7) xor inSSDData8Receive(5) xor regCrc32(31) xor regCrc32(27) xor inSSDData8Receive(2) xor regCrc32(29) xor regCrc32(26) xor inSSDData8Receive(0) xor regCrc32(24) xor inSSDData8Receive(4);
  intCrc32Next(8)   <= inSSDData8Receive(7) xor regCrc32(25) xor regCrc32(0) xor inSSDData8Receive(3) xor regCrc32(27) xor inSSDData8Receive(6) xor regCrc32(28) xor regCrc32(24) xor inSSDData8Receive(4);
  intCrc32Next(9)   <= regCrc32(25) xor inSSDData8Receive(5) xor inSSDData8Receive(3) xor inSSDData8Receive(2) xor inSSDData8Receive(6) xor regCrc32(29) xor regCrc32(1) xor regCrc32(28) xor regCrc32(26);
  intCrc32Next(10)  <= inSSDData8Receive(7) xor inSSDData8Receive(5) xor regCrc32(27) xor inSSDData8Receive(2) xor regCrc32(29) xor regCrc32(26) xor regCrc32(2) xor regCrc32(24) xor inSSDData8Receive(4);
  intCrc32Next(11)  <= inSSDData8Receive(7) xor regCrc32(25) xor inSSDData8Receive(3) xor regCrc32(27) xor inSSDData8Receive(6) xor regCrc32(28) xor regCrc32(3) xor regCrc32(24) xor inSSDData8Receive(4);
  intCrc32Next(12)  <= inSSDData8Receive(7) xor regCrc32(4) xor regCrc32(25) xor inSSDData8Receive(1) xor inSSDData8Receive(5) xor inSSDData8Receive(3) xor inSSDData8Receive(2) xor inSSDData8Receive(6) xor regCrc32(29) xor regCrc32(30) xor regCrc32(28) xor regCrc32(26) xor regCrc32(24);
  intCrc32Next(13)  <= regCrc32(5) xor regCrc32(25) xor inSSDData8Receive(5) xor inSSDData8Receive(1) xor regCrc32(31) xor regCrc32(27) xor inSSDData8Receive(2) xor inSSDData8Receive(6) xor regCrc32(29) xor regCrc32(30) xor inSSDData8Receive(0) xor regCrc32(26) xor inSSDData8Receive(4);
  intCrc32Next(14)  <= inSSDData8Receive(5) xor inSSDData8Receive(1) xor inSSDData8Receive(3) xor regCrc32(31) xor regCrc32(27) xor regCrc32(28) xor regCrc32(30) xor regCrc32(26) xor inSSDData8Receive(0) xor regCrc32(6) xor inSSDData8Receive(4);
  intCrc32Next(15)  <= regCrc32(7) xor inSSDData8Receive(3) xor regCrc32(31) xor regCrc32(27) xor inSSDData8Receive(2) xor regCrc32(29) xor regCrc32(28) xor inSSDData8Receive(0) xor inSSDData8Receive(4);
  intCrc32Next(16)  <= inSSDData8Receive(7) xor regCrc32(8) xor inSSDData8Receive(3) xor inSSDData8Receive(2) xor regCrc32(29) xor regCrc32(28) xor regCrc32(24);
  intCrc32Next(17)  <= regCrc32(25) xor regCrc32(9) xor inSSDData8Receive(1) xor inSSDData8Receive(2) xor inSSDData8Receive(6) xor regCrc32(29) xor regCrc32(30);
  intCrc32Next(18)  <= regCrc32(10) xor inSSDData8Receive(5) xor inSSDData8Receive(1) xor regCrc32(31) xor regCrc32(30) xor regCrc32(26) xor inSSDData8Receive(0);
  intCrc32Next(19)  <= regCrc32(11) xor regCrc32(31) xor regCrc32(27) xor inSSDData8Receive(0) xor inSSDData8Receive(4);
  intCrc32Next(20)  <= inSSDData8Receive(3) xor regCrc32(12) xor regCrc32(28);
  intCrc32Next(21)  <= regCrc32(13) xor inSSDData8Receive(2) xor regCrc32(29);
  intCrc32Next(22)  <= inSSDData8Receive(7) xor regCrc32(14) xor regCrc32(24);
  intCrc32Next(23)  <= inSSDData8Receive(7) xor regCrc32(25) xor inSSDData8Receive(1) xor regCrc32(15) xor inSSDData8Receive(6) xor regCrc32(30) xor regCrc32(24);
  intCrc32Next(24)  <= regCrc32(25) xor inSSDData8Receive(5) xor regCrc32(31) xor inSSDData8Receive(6) xor regCrc32(16) xor inSSDData8Receive(0) xor regCrc32(26);
  intCrc32Next(25)  <= regCrc32(17) xor inSSDData8Receive(5) xor regCrc32(27) xor regCrc32(26) xor inSSDData8Receive(4);
  intCrc32Next(26)  <= inSSDData8Receive(7) xor regCrc32(18) xor inSSDData8Receive(1) xor inSSDData8Receive(3) xor regCrc32(27) xor regCrc32(30) xor regCrc32(28) xor regCrc32(24) xor inSSDData8Receive(4);
  intCrc32Next(27)  <= regCrc32(19) xor regCrc32(25) xor regCrc32(31) xor inSSDData8Receive(3) xor inSSDData8Receive(2) xor inSSDData8Receive(6) xor regCrc32(29) xor regCrc32(28) xor inSSDData8Receive(0);
  intCrc32Next(28)  <= regCrc32(20) xor inSSDData8Receive(5) xor inSSDData8Receive(1) xor inSSDData8Receive(2) xor regCrc32(29) xor regCrc32(30) xor regCrc32(26);
  intCrc32Next(29)  <= regCrc32(21) xor inSSDData8Receive(1) xor regCrc32(31) xor regCrc32(27) xor regCrc32(30) xor inSSDData8Receive(0) xor inSSDData8Receive(4);
  intCrc32Next(30)  <= regCrc32(22) xor inSSDData8Receive(3) xor regCrc32(31) xor regCrc32(28) xor inSSDData8Receive(0);
  intCrc32Next(31)  <= inSSDData8Receive(2) xor regCrc32(23) xor regCrc32(29);

  -- Assign outputs
  outReady_BusyB      <= regReady_BusyB;
  outDone             <= regDone;
  outError            <= regError(0);
  outErrorIdcode      <= regError(1);
  outErrorErase       <= regError(2);
  outErrorProgram     <= regError(3);
  outErrorTimeOut     <= regError(4);
  outErrorCrc         <= regError(5);
  outStarted          <= regStarted;
  outInitializeOK     <= regInitializeOK;
  outCheckIdOK        <= regCheckIdOK;
  outEraseSwitchWordOK<= regEraseSwitchWordOK;
  outEraseOK          <= regEraseOK;
  outProgramOK        <= regProgramOK;
  outVerifyOK         <= regVerifyOK;
  outProgramSwitchWordOK<= regProgramSwitchWordOK;

  outSSDReset_EnableB <= regSSDReset_EnableB;
  outSSDStartTransfer <= regSSDStartTransfer;
  outSSDData8Send     <= regSSDData8Send;

end behavioral;

