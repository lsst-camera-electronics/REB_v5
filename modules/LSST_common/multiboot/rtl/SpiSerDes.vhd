-------------------------------------------------------------------------------
-- Copyright (c) 2010 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor:                Xilinx, Inc.
-- \   \   \/    Version:               1.00
--  \   \        Filename:              SpiSerDes.vhd
--  /   /        Date Last Modified:    October 25 2009
-- /___/   /\    Date Created:          October 25 2009
-- \   \  /  \
--  \___\/\___\
--
--Devices:      Spartan-6, Virtex-5, Virtex-6, 7 series FPGAs
--Purpose:      This module serializes and deserializes a byte's worth of
--              data to/from a SPI device for a master SPI controller.
--Description:  This modules takes the following inputs:
--                inClk           - Module clock and forwarded to SPI bus clk.
--                                  The frequency of this clock must be less than
--                                  or equal to the Fmax of the peripheral(s) on
--                                  the SPI bus.
--                inReset_EnableB - Active-high synchronous reset.
--                                  When High, resets this module and 
--                                  also drives the SPI device chip-select High.
--                                  When Low, enables this module and 
--                                  also drives SPI device chip-select Low.
--                inData8Send     - The data byte to send to SPI device.
--                                  The input data byte is registered on the
--                                  first rising edge of inClk after 
--                                  inStartTransfer transitions to High (and 
--                                  when outTransferDone is High).
--                inStartTransfer - Start SPI serialization when this is High
--                                  and when outTransferDone=High.
--              This module has the following outputs:
--                outTransferDone - Signals when serialization is DONE.
--                                  Signal is driven Low on the first rising 
--                                  edge of inClk after inStartTransfer 
--                                  transitions to High.
--                                  Signal is returned to High after the module 
--                                  has completed the serialization of a byte 
--                                  of data.
--                outData8Receive - When outTransferDone=High, this output has 
--                                  the data byte received from the inSpiMiso 
--                                  pin during the serial transfer process.
--              This module is the master controller for SPI bus signals:
--                outSpiCsB   - Connect to SPI device active-low chip select
--                outSpiClk   - Connect to SPI bus clk
--                outSpiMosi  - Connect to SPI bus master-out, slave-input
--                inSpiMiso   - Connect to SPI bus master-in, slave-output
--              If another device can be a master of the SPI bus, then use 
--              outSpiCsB as the active-Low output enable control signal for 
--              all SPI bus outputs. When using outSpiCsB as an output enable,
--              all controlled outputs must have a pull-up, especially the SPI 
--              chip-select signal.
--Usage:        Module setup:
--              - Connect for SPI ports to SPI bus.  See above.
--              - Supply inClk.  Fmax determined by target (slave) SPI device.
--              Module use sequence:
--              1. Reset module:
--                1.A. Drive inReset_EnableB=High to reset module
--              2. Enable SPI device (SPI CSB=Low)
--                2.A. Drive inReset_enableB=Low to select target SPI device.
--              3. Serialize byte output via MOSI and byte input via MISO:
--                3.A. For each byte:
--                  3.A.1: Start serialization:
--                      inData8Send     <= byte to send
--                      inStartTransfer <= High
--                  3.A.2: Wait for serialization DONE
--                      Wait for outTransferDone=High
--                      Get parallel MISO data from outData8Receive
--              4. Disable SPI device (SPI CSB=High)
--                4.A. Drive inReset_EnableB=High
--              NOTES:
--              - All signals active/transition on rising-edge inClk except
--                outSpiMosi transitions on falling-edge of outSpiClk.
--              - If inStartTransfer=High when outTransferDone=High, then
--                next byte serialization starts on following rising inClk.
--                To prevent next byte serialization, set inStartTransfer=Low
--                before outTransferDone goes High.
--              - outSpiClk runs at same frequency and phase as inClk.
--                outSpiClk is gated.
--Signal Timing:
--                        _   _   _   _   _   _         _   _   _
--               inClk  _/ \_/ \_/ \_/ \_/ \_/ \.....\_/ \_/ \_/ \_
--                      ___                                   _____
--     inReset_EnableB     \_________________________________/
--                      _____                                   ___
--           outSpiCsB       \_________________________________/
--                              ___________________________________
--     inStartTransfer  _______/   \\\\\\\\\\\\\\\\\\\\\\\\*\\\\\\\
--                      _________                       ___________
--     outTransferDone           \______________.....__/
--                      _______ ___
--    inData8Send[7:0]  _______XD8SXXX...
--                                  ___ ___ ___       ___ _________
--           inSpiMosi             XD7_XD6_XD5_X.....XD0_X_________
--                      ___________   _   _   _    _    ___________
--           outSpiClk             \_/ \_/ \_/ \.....\_/
--                                                      ___________
--outData8Receive[7:0]           XD8SX               XXXD8R*D8SX___
--  *Note: if inStartTransfer=High, then inData8Send loaded into outData8Receive
--Reference:
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

entity SpiSerDes is
  port 
  (
    -- SerDes clock and control signals
    inClk           : in  std_logic;  -- System clock. Fmax <= SPI peripheral Fmax.
    inReset_EnableB : in  std_logic;  -- Active-high, synchronous reset.
    inStartTransfer : in  std_logic;  -- Active-high, initiate transfer of data
    outTransferDone : out std_logic;  -- DONE='1' when transfer is done

    -- Parallel data ports
    inData8Send     : in  std_logic_vector(7 downto 0); -- Sent to SPI device
    outData8Receive : out std_logic_vector(7 downto 0); -- Received from SPI device

    -- SPI ports and tristate control - Connect these to the SPI bus
    outSpiCsB       : out std_logic;  -- SPI chip-select to SPI device 
                                      -- or all SPI outputs control enable
    outSpiClk       : out std_logic;  -- SPI clock to SPI device
    outSpiMosi      : out std_logic;  -- SPI master-out, slave-in to SPI device
    inSpiMiso       : in  std_logic   -- SPI master-in, slave-out from SPI device
  );
end SpiSerDes;

architecture behavioral of SpiSerDes is

  -- Constants
  constant  cShiftCountInit : std_logic_vector(8 downto 0)  := B"000000001";

  -- Registers
  signal    regShiftCount   : std_logic_vector(8 downto 0)  := cShiftCountInit;
  signal    regShiftData    : std_logic_vector(7 downto 0)  := B"00000000";
  signal    regSpiCsB       : std_logic                     := '1';
  signal    regSpiMosi      : std_logic                     := '1';
  signal    regTransferDoneDelayed  : std_logic             := '1';

  -- Signals
  signal    intTransferDone : std_logic;

  -- Attributes
  attribute clock_signal    : string;
  attribute clock_signal    of inClk : signal is "yes";

begin
  -- Internal signals
  intTransferDone <= regShiftCount(0);

  -- TransferDone delayed by half clock cycle
  processTransferDone : process (inClk)
  begin
    if (falling_edge(inClk)) then
      regTransferDoneDelayed  <= intTransferDone;
    end if;
  end process processTransferDone;

  -- SPI chip-select (active-Low) is always inverse of inReset_EnableB.
  processSpiCsB : process (inClk)
  begin
    if (rising_edge(inClk)) then
      regSpiCsB <= inReset_EnableB;
    end if;
  end process processSpiCsB;

  -- Track transfer of serial data with barrel shifter.
  processShiftCount : process (inClk)
  begin
    if (rising_edge(inClk)) then
      if (inReset_EnableB='1') then
        regShiftCount <= cShiftCountInit;
      elsif ((intTransferDone='0') or (inStartTransfer='1')) then
        -- Barrel shift (rotate right)
        regShiftCount <= regShiftCount(0) & regShiftCount(8 downto 1);
      end if;
    end if;
  end process processShiftCount;

  -- Simultaneous serialize outgoing data & deserialize incoming data. MSB first
  processShiftData : process (inClk)
  begin
    if (rising_edge(inClk)) then
      if (intTransferDone='0') then
        -- SHIFT-left while not outTransferDone
        regShiftData  <= regShiftData(6 downto 0) & inSpiMiso;
      elsif (inStartTransfer='1') then
        -- Load data to start a new transfer sequence from a done state
        regShiftData  <= inData8Send;
      end if;
    end if;
  end process processShiftData;

  -- SPI MOSI register outputs on falling edge of inClk.  MSB first.
  processSpiMosi : process (inClk)
  begin
    if (falling_edge(inClk)) then
      if (inReset_EnableB='1') then
        regSpiMosi  <= '1';
      elsif (intTransferDone='0') then
        regSpiMosi  <= regShiftData(7);
      end if;
    end if;
  end process processSpiMosi;

  -- Assign outputs
  outSpiClk       <= (inClk or intTransferDone or regTransferDoneDelayed);
  outSpiCsB       <= regSpiCsB;
  outSpiMosi      <= regSpiMosi;
  outTransferDone <= intTransferDone;
  outData8Receive <= regShiftData;
end behavioral;

