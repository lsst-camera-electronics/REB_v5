-------------------------------------------------------------------------------
-- Title      : RCM SDS
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : rcm_sds.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-04-24
-------------------------------------------------------------------------------
-- Description: This is the top level file for the SDS portion of the
--              LSST RCM. 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.VCOMPONENTS.all;

use work.RcmSimPackage.all;

entity RcmExampleRegs is
   port (
      -- Clock and Reset Signals
      BeeClk      :  in std_logic;
      BeeRst      :  in std_logic;

      -- Status Block Interface Signals
      StatusClk   : out std_logic;
      StatusAddr  : out std_logic_vector(23 downto 0);
      StatusReg   :  in std_logic_vector(31 downto 0);
      StatusRst   : out std_logic;
      
      -- Register Interface Signals
      RegAck      : out std_logic;
      RegFail     : out std_logic;
      RegDataRd   : out std_logic_vector(31 downto 0);
      RegReq      :  in std_logic;
      RegOp       :  in std_logic;
      RegAddr     :  in std_logic_vector(23 downto 0);
      RegDataWr   :  in std_logic_vector(31 downto 0);

      -- Other fun things to hook up to registers
      Vin_ok        : in std_logic;
      Vout_ok       : in std_logic;
      V3_3v_ok      : in std_logic;
      V2_5v_ok      : in std_logic;
      V1_8v_ok      : in std_logic;
      V1_5v_ok      : in std_logic;
      V1_0v_ok      : in std_logic;
      Mgt_avcc_ok   : in std_logic;
      Mgt_avtt_ok   : in std_logic;
      Mgt_accpll_ok : in std_logic;
      Switch_addr   : in std_logic_vector(7 downto 0);
      Resistor_addr : in std_logic_vector(7 downto 0)
   );
end RcmExampleRegs;

architecture RcmExampleRegs of RcmExampleRegs is
   signal intBeeClk : std_logic;
   signal intBeeRst : std_logic;

   signal intStatusClk  : std_logic;
   signal intStatusRst  : std_logic;
   signal intStatusAddr : std_logic_vector(23 downto 0);
   signal intStatusReg  : std_logic_vector(31 downto 0);
   
   signal intRegAck    : std_logic;
   signal intRegFail   : std_logic;
   signal intRegDataRd : std_logic_vector(31 downto 0);
   signal intRegReq    : std_logic;
   signal intRegOp     : std_logic;
   signal intRegAddr   : std_logic_vector(23 downto 0);
   signal intRegDataWr : std_logic_vector(31 downto 0);
   
   signal intVin_ok        : std_logic;
   signal intVout_ok       : std_logic;
   signal intV3_3v_ok      : std_logic;
   signal intV2_5v_ok      : std_logic;
   signal intV1_8v_ok      : std_logic;
   signal intV1_5v_ok      : std_logic;
   signal intV1_0v_ok      : std_logic;
   signal intMgt_avcc_ok   : std_logic;
   signal intMgt_avtt_ok   : std_logic;
   signal intMgt_accpll_ok : std_logic;

   signal intSwitch_addr   : std_logic_vector(7 downto 0);
   signal intResistor_addr : std_logic_vector(7 downto 0);

   signal timestampCount : unsigned(63 downto 0);
   
begin

   intBeeClk    <= BeeClk;
   intBeeRst    <= BeeRst;

   StatusClk    <= intStatusClk;
   StatusAddr   <= intStatusAddr;
   StatusRst    <= intStatusRst;
   intStatusReg <= StatusReg;
   
   RegAck       <= intRegAck;
   RegFail      <= intRegFail;
   RegDataRd    <= intRegDataRd;

   intRegOp     <= RegOp;
   intRegAddr   <= RegAddr;
   intRegDataWr <= RegDataWr;

   intVin_ok        <= Vin_ok;
   intVout_ok       <= Vout_ok;
   intV3_3v_ok      <= V3_3v_ok;
   intV2_5v_ok      <= V2_5v_ok;
   intV1_8v_ok      <= V1_8v_ok;
   intV1_5v_ok      <= V1_5v_ok;
   intV1_0v_ok      <= V1_0v_ok;
   intMgt_avcc_ok   <= Mgt_avcc_ok;
   intMgt_avtt_ok   <= Mgt_avtt_ok;
   intMgt_accpll_ok <= Mgt_accpll_ok;

   intSwitch_addr   <= Switch_addr;
   intResistor_addr <= Resistor_addr;
   
   intStatusClk   <= intBeeClk;
   -- Remap the Status Block memory to 0x800000
   intStatusAddr  <= '0' & intRegAddr(22 downto 0);

   intRegReq <= RegReq when (   intRegAddr(23 downto 20) = x"0"
                             or intRegAddr(23 downto 20) = x"8")
                else '0';
   

   process (intBeeClk, intBeeRst)
   begin
      if intBeeRst = '1' then
         intRegDataRd  <= (others => '0');
         intRegAck     <= '0';
         intRegFail    <= '0';
         intStatusRst  <= '1';
         timestampCount <= (others => '0');
         
      elsif rising_edge(intBeeClk) then
        timestampCount <= timestampCount + 1;
        
        -- One clock delay on register ack
         intRegAck <= intRegReq;
         
         if intRegReq = '1' then 
            -- Write Operation
            if intRegOp = '1' then
               if intRegAddr = x"000010" then
                  intRegFail <=  '0';
                  intStatusRst <= '1';
               else
                  intRegFail <= '1';
                  intStatusRst <= '0';
               end if;
            -- Read Operation
            else
               if intRegAddr > x"7fffff" and intStatusAddr < x"3ff" then
                  intRegFail <=  '0';
                  intRegDataRd <= intStatusReg;
                  intStatusRst <= '0';
               elsif intRegAddr = x"000000" then
                  intRegFail <= '0';
                  intStatusRst <= '0';
                  intRegDataRd <= RCM_SIM_VERSION;
               elsif intRegAddr = x"000001" then
                  intRegFail <= '0';
                  intStatusRst <= '0';
                  intRegDataRd <= x"0000_0" & "00" & intVin_ok & intVout_ok
                                  & intV3_3v_ok & intV2_5v_ok & intV1_8v_ok
                                  & intV1_5v_ok & intV1_0v_ok & intMgt_avcc_ok
                                  & intMgt_avtt_ok & intMgt_accpll_ok;
               elsif intRegAddr = x"000002" then
                  intRegFail <= '0';
                  intRegDataRd(7 downto 0) <= intSwitch_addr;
                  intStatusRst <= '0';
               elsif intRegAddr = x"000003" then
                  intRegFail <= '0';
                  intRegDataRd(7 downto 0) <= intResistor_addr;
                  intStatusRst <= '0';
               elsif intRegAddr = x"00000e" then
                  intRegFail <= '0';
                  intStatusRst <= '0';
                  intRegDataRd(31 downto 0) <= std_logic_vector(timestampCount(31 downto 0));
               elsif intRegAddr = x"00000f" then
                  intRegFail <= '0';
                  intStatusRst <= '0';
                  intRegDataRd(31 downto 0) <= std_logic_vector(timestampCount(63 downto 32));
               elsif intRegAddr < x"000049" then
                  intRegFail <= '0';
                  intRegDataRd(31 downto 0) <= x"00"&intRegAddr;
                  intStatusRst <= '0';
               else
                  intRegFail <= '1';
                  intRegDataRd <= (others => '0');
                  intStatusRst <= '0';
               end if;
            end if;
         else
            intRegFail <= '0';
            intRegDataRd <= (others => '0');
         end if;
      end if;
   end process;

  
end RcmExampleRegs;
