-------------------------------------------------------------------------------
-- Copyright (c) 2013 Xilinx, Inc.
-- This design is confidential and proprietary of Xilinx, All Rights Reserved.
-------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor:                Xilinx, Inc.
-- \   \   \/    Version:               1.00
--  \   \        Filename:              N25Qxxx.vhd
--  /   /        Date Last Modified:    January 4 2013
-- /___/   /\    Date Created:          January 4 2013
-- \   \  /  \
--  \___\/\___\
--
--Devices:      7 series FPGAs
--Purpose:      This is a pseudo sim model for SPI flash.
--Description:  Provides minimal functionality for testing SPI modules.
--              Recommend that you get the SPI flash vendor's actual sim model.
--Usage:        Connect an instance to the SPI bus signals of the SpiSerDes.
--Reference:
--Revision History:
--    Revision (YYYY/MM/DD) - [User] Description
--    Rev 1.00 (2013/01/04) - [RMK] Created.
-------------------------------------------------------------------------------
library ieee;
Library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use UNISIM.vcomponents.all;

entity N25Qxxx is
  port
  (
    S         : in std_logic;
    C         : in std_logic;
    HOLD_DQ3  : inout std_logic;
    DQ0       : inout std_logic;
    DQ1       : inout std_logic;
    Vcc       : in std_logic_vector(31 downto 0);
    Vpp_W_DQ2 : inout std_logic
  );
end N25Qxxx;

architecture behavioral of N25Qxxx is
  constant  cIdcode       : std_logic_vector(23 downto 0) := X"20BA18";
  constant  cAddr24Count  : std_logic_vector(5 downto 0)  := "011000";
  constant  cAddr32Count  : std_logic_vector(5 downto 0)  := "100000";
  constant  cCmdRDID      : std_logic_vector(7 downto 0)  := X"9F";
  constant  cCmdREAD24    : std_logic_vector(7 downto 0)  := X"03";
  constant  cCmdREAD32    : std_logic_vector(7 downto 0)  := X"13";
  constant  cCmdRDSR      : std_logic_vector(7 downto 0)  := X"05";
  constant  cCmdRFSR      : std_logic_vector(7 downto 0)  := X"70";
  constant  cLSRReady     : std_logic_vector(7 downto 0)  := "00100010";  -- Legacy status register
  constant  cLSRNotReady  : std_logic_vector(7 downto 0)  := "00100011";  -- Legacy status register
  constant  cFSRReady     : std_logic_vector(7 downto 0)  := "10000000";  -- Flag status register
  constant  cFSRNotReady  : std_logic_vector(7 downto 0)  := "00000000";  -- Flag status register
  constant  cSizeSector   : integer                       := 65536;
  constant  cSizeSubsector: integer                       := 4096;
  constant  cSizePage     : integer                       := 256;
  constant  cReadData64   : std_logic_vector(63 downto 0) := X"AA9955667EC84D92";

  --type    tflashArray is array (0 to 1073741824) of std_logic_vector(7 downto 0);
  --signal  flashArray  : ram_type;

  signal  regCmd          : std_logic_vector(7 downto 0)  := X"00";
  signal  regCmdCounter   : std_logic_vector(3 downto 0)  := "1000";
  signal  regAddress24    : std_logic_vector(23 downto 0) := X"000000";
  signal  regAddress32    : std_logic_vector(31 downto 0) := X"00000000";
  signal  regAddr24Counter: std_logic_vector(5 downto 0)  := cAddr24Count;
  signal  regAddr32Counter: std_logic_vector(5 downto 0)  := cAddr32Count;
  signal  regShiftData    : std_logic_vector(63 downto 0) := X"0000000000000000";
  signal  regShiftCount   : std_logic_vector(6 downto 0)  := "0000000";
  signal  regData8        : std_logic_vector(7 downto 0)  := X"00";
  signal  regReady        : std_logic                     := '0';
  signal  regMisoEnable   : std_logic                     := '0';
  signal  regMiso         : std_logic                     := '0';

  signal  intCmdAlmostLatched : std_logic := '0';
  signal  intCmdLatched   : std_logic := '0';
  signal  intCmdAlmostRDID    : std_logic := '0';
  signal  intCmdRDID      : std_logic := '0';
  signal  intCmdREAD24    : std_logic := '0';
  signal  intCmdREAD32    : std_logic := '0';
  signal  intCmdREAD24Out : std_logic := '0';
  signal  intCmdAlmostREAD24Out : std_logic := '0';
  signal  intCmdREAD32Out : std_logic := '0';
  signal  intCmdAlmostREAD32Out : std_logic := '0';
  signal  intCmdAlmostRDSR    : std_logic := '0';
  signal  intCmdRDSR      : std_logic := '0';
  signal  intCmdAlmostRFSR    : std_logic := '0';
  signal  intCmdRFSR      : std_logic := '0';
  signal  intAddr24Latched: std_logic := '0';
  signal  intAddr32Latched: std_logic := '0';
  signal  intMisoEnable   : std_logic := '0';

  signal  intDQ0Out       : std_logic := 'Z';
  signal  intDQ1Out       : std_logic := 'Z';
  signal  intDQ2Out       : std_logic := 'Z';
  signal  intDQ3Out       : std_logic := 'Z';

  function to_std_logic(inBoolean: boolean) return std_logic is
  begin
    if inBoolean then
      return('1');
    else
      return('0');
    end if;
  end function To_Std_Logic;

begin

  processLatchCommand  : process (C,S)
  begin
    if (S='1') then
      regCmd        <= X"00";
      regCmdCounter <= "1000";
    elsif (rising_edge(C)) then
      if (regCmdCounter /= "0000") then
        regCmd        <= regCmd(6 downto 0) & DQ0;
        regCmdCounter <= regCmdCounter - 1;
      end if;
    end if;
  end process processLatchCommand;

  processLatchAddress24  : process (C,S)
  begin
    if (S='1') then
      regAddress24      <= X"000000";
      regAddr24Counter  <= cAddr24Count;
    elsif (rising_edge(C)) then
      if ((intCmdlatched='1') and (intAddr24Latched = '0')) then
        regAddress24      <= regAddress24(22 downto 0) & DQ0;
        regAddr24Counter  <= regAddr24Counter - 1;
      end if;
    end if;
  end process processLatchAddress24;

  processLatchAddress32  : process (C,S)
  begin
    if (S='1') then
      regAddress32      <= X"00000000";
      regAddr32Counter  <= cAddr32Count;
    elsif (rising_edge(C)) then
      if ((intCmdlatched='1') and (intAddr32Latched = '0')) then
        regAddress32      <= regAddress32(30 downto 0) & DQ0;
        regAddr32Counter  <= regAddr32Counter - 1;
      end if;
    end if;
  end process processLatchAddress32;

  processMisoData : process (C,S)
  begin
    if (S='1') then
      regShiftCount <= "0000000";
      regData8      <= X"00";
    elsif (rising_edge(C)) then
      if (intCmdAlmostLatched = '1') then
        if (intCmdAlmostRDID='1') then
          regShiftData(63 downto 40)  <= cIdcode;
          regShiftCount <= "0110000";
        elsif (intCmdAlmostRDSR='1') then
          if (regReady='1') then
            regShiftData(63 downto 56)<= cLSRReady;
          else
            regShiftData(63 downto 56)<= cLSRNotReady;
          end if;
          regReady                    <= not regReady;
          regShiftCount               <= "0001000";
        elsif (intCmdAlmostRFSR='1') then
          if (regReady='1') then
            regShiftData(63 downto 56)<= cFSRReady;
          else
            regShiftData(63 downto 56)<= cFSRNotReady;
          end if;
          regReady                    <= not regReady;
          regShiftCount               <= "0001000";
        end if;
      elsif (intCmdAlmostREAD24Out = '1') then
        regShiftData                <= cReadData64;
        regShiftCount               <= "1000000";
      elsif (intCmdAlmostREAD32Out = '1') then
        regShiftData                <= cReadData64;
        regShiftCount               <= "1000000";
      else
        regShiftData  <= regShiftData(62 downto 0) & "0";
        regShiftCount <= regShiftCount - 1;
      end if;
    end if;
  end process processMisoData;

  processMISO : process (C,S)
  begin
    if (S='1') then
      regMisoEnable <= '0';
    elsif (falling_edge(C)) then
      regMiso       <= regShiftData(63);
      regMisoEnable <= intMisoEnable;
    end if;
  end process processMISO;

  intCmdAlmostLatched <= to_std_logic(regCmdCounter = 1);
  intCmdLatched       <= to_std_logic(regCmdCounter = 0);
  intAddr24Latched    <= to_std_logic(regAddr24Counter = 0);
  intAddr32Latched    <= to_std_logic(regAddr32Counter = 0);
  intCmdAlmostRDID    <= to_std_logic((regCmd(6 downto 0) & DQ0) = cCmdRDID);
  intCmdRDID          <= to_std_logic((intCmdLatched = '1') and (regCmd = cCmdRDID));
  intCmdAlmostRDSR    <= to_std_logic((regCmd(6 downto 0) & DQ0) = cCmdRDSR);
  intCmdRDSR          <= to_std_logic((intCmdLatched = '1') and (regCmd = cCmdRDSR));
  intCmdAlmostRFSR    <= to_std_logic((regCmd(6 downto 0) & DQ0) = cCmdRFSR);
  intCmdRFSR          <= to_std_logic((intCmdLatched = '1') and (regCmd = cCmdRFSR));
  intCmdREAD24        <= to_std_logic((intCmdLatched = '1') and (regCmd = cCmdREAD24));
  intCmdREAD32        <= to_std_logic((intCmdLatched = '1') and (regCmd = cCmdREAD32));
  intCmdREAD24Out     <= to_std_logic((intCmdREAD24 = '1') and (intAddr24Latched = '1'));
  intCmdAlmostREAD24Out<=to_std_logic((intCmdREAD24 = '1') and (regAddr24Counter = 1));
  intCmdREAD32Out     <= to_std_logic((intCmdREAD32 = '1') and (intAddr32Latched = '1'));
  intCmdAlmostREAD32Out<=to_std_logic((intCmdREAD32 = '1') and (regAddr32Counter = 1));
  intMisoEnable       <= to_std_logic((intCmdREAD24Out = '1') or (intCmdRead32Out = '1')
                         or (intCmdRDID='1') or (intCmdRDSR='1') or (intCmdRFSR='1'));
  DQ1                 <= regMiso when ((regMisoEnable='1') and (S = '0')) else 'Z';
  DQ0                 <= intDQ0Out;
  HOLD_DQ3            <= intDQ3Out;
  Vpp_W_DQ2           <= intDQ2Out;
end behavioral;

