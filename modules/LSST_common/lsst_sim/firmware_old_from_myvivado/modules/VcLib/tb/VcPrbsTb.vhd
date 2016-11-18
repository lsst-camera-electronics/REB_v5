-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : VcPrbsTb.vhd
-- Author     : Larry Ruckman  <ruckman@slac.stanford.edu>
-- Company    : SLAC National Accelerator Laboratory
-- Created    : 2014-04-02
-- Last update: 2014-04-04
-- Platform   : Vivado 2013.3
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Simulation Testbed for testing the VcPrbsTx and VcPrbsRx modules
-------------------------------------------------------------------------------
-- Copyright (c) 2014 SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

use work.StdRtlPkg.all;
use work.VcPkg.all;

entity VcPrbsTb is end VcPrbsTb;

architecture testbed of VcPrbsTb is

   -- Constants
   constant CLK_PERIOD_C       : time             := 10 ns;
   constant TPD_C              : time             := CLK_PERIOD_C/4;
   constant TX_PACKET_LENGTH_C : integer          := 16;
   constant FIFO_FULL_THRES_C  : integer          := 4;
   constant BIT_ERROR_C        : slv(15 downto 0) := "1000" & "0100" & "0010" & "0001";  -- Generate errWordCnt and errbitCnt errors
   constant ADD_EOFE_C         : sl               := '1';  -- Generate errEofe error

   -- Signals
   signal clk,
      rst,
      toggle,
      txBusy,
      rxBusy,
      vcTxIn_locBuffAFullPrbsRx,
      vcTxIn_locBuffFullPrbsRx,
      updatedResults,
      errMissedPacket,
      errLength,
      errEofe : sl;
   signal errWordCnt,
      errbitCnt,
      packetLength,
      packetRate : slv(31 downto 0);
   signal vcTxInPrbsTx,
      results : VcTxInType := VC_TX_IN_INIT_C;
   signal vcTxOutPrbsTx : VcTxOutType := VC_TX_OUT_INIT_C;
   signal vcRxOutPrbsTx,
      vcRxOutPrbsRx : VcRxOutType := VC_RX_OUT_INIT_C;
   signal vcRxCommonOutPrbsRx : VcRxCommonOutType := VC_RX_COMMON_OUT_INIT_C;

begin

   -- Generate clocks and resets
   ClkRst_Inst : entity work.ClkRst
      generic map (
         CLK_PERIOD_G      => CLK_PERIOD_C,
         RST_START_DELAY_G => 0 ns,     -- Wait this long into simulation before asserting reset
         RST_HOLD_TIME_G   => 250 ns)   -- Hold reset for this long)
      port map (
         clkP => clk,
         clkN => open,
         rst  => rst,
         rstL => open); 

   -- VcPrbsTx (VHDL module to be tested)
   VcPrbsTx_Inst : entity work.VcPrbsTx
      generic map (
         TPD_G             => TPD_C,
         FIFO_FULL_THRES_G => FIFO_FULL_THRES_C)
      port map (
         -- Trigger Signal (locClk domain)
         trig         => '1',
         packetLength => toSlv(TX_PACKET_LENGTH_C, 32),
         busy         => txBusy,
         -- TX VC Signals (vcTxClk domain)
         vcTxIn       => vcTxInPrbsTx,
         vcTxOut      => vcTxOutPrbsTx,
         vcRxOut      => vcRxOutPrbsTx,
         -- Clocks and Resets
         locClk       => clk,
         locRst       => rst,
         vcTxClk      => clk,
         vcTxRst      => rst);

   -- Process for mapping the VC buses and injecting bit error
   process(clk)
      variable i : integer;
   begin
      if rising_edge(clk) then
         if rst = '1' then
            -- Reset TX inputs
            vcTxOutPrbsTx       <= VC_TX_OUT_INIT_C        after TPD_C;
            vcRxOutPrbsTx       <= VC_RX_OUT_INIT_C        after TPD_C;
            -- Reset RX inputs
            toggle              <= '0'                     after TPD_C;
            vcRxOutPrbsRx       <= VC_RX_OUT_INIT_C        after TPD_C;
            vcRxCommonOutPrbsRx <= VC_RX_COMMON_OUT_INIT_C after TPD_C;
         else
            -- Pass the signals to the TX module
            vcTxOutPrbsTx.ready         <= not(vcTxIn_locBuffAFullPrbsRx) and not(vcTxIn_locBuffFullPrbsRx) after TPD_C;
            vcRxOutPrbsTx.remBuffAFull  <= vcTxIn_locBuffAFullPrbsRx                                        after TPD_C;
            vcRxOutPrbsTx.remBuffFull   <= vcTxIn_locBuffFullPrbsRx                                         after TPD_C;
            -- Pass the signals to the RX module
            vcRxOutPrbsRx.valid         <= vcTxInPrbsTx.valid                                               after TPD_C;
            vcRxCommonOutPrbsRx.sof     <= vcTxInPrbsTx.sof                                                 after TPD_C;
            vcRxCommonOutPrbsRx.eof     <= vcTxInPrbsTx.eof                                                 after TPD_C;
            vcRxCommonOutPrbsRx.eofe    <= vcTxInPrbsTx.eof and (vcTxInPrbsTx.eofe or ADD_EOFE_C)           after TPD_C;
            vcRxCommonOutPrbsRx.data(3) <= vcTxInPrbsTx.data(3)                                             after TPD_C;
            vcRxCommonOutPrbsRx.data(2) <= vcTxInPrbsTx.data(2)                                             after TPD_C;
            vcRxCommonOutPrbsRx.data(1) <= vcTxInPrbsTx.data(1)                                             after TPD_C;

            if vcTxInPrbsTx.eof = '0' then
               -- add no bit errors to the random generator seed
               vcRxCommonOutPrbsRx.data(0) <= vcTxInPrbsTx.data(0) after TPD_C;
            else
               -- add bit errors to last word
               for i in 15 downto 0 loop
                  if BIT_ERROR_C(i) = '1' then
                     vcRxCommonOutPrbsRx.data(0)(i) <= not(vcTxInPrbsTx.data(0)(i)) after TPD_C;
                  else
                     vcRxCommonOutPrbsRx.data(0)(i) <= vcTxInPrbsTx.data(0)(i) after TPD_C;
                  end if;
               end loop;
            end if;
         end if;
      end if;
   end process;

   -- VcPrbsRx (VHDL module to be tested)
   VcPrbsRx_Inst : entity work.VcPrbsRx
      generic map (
         TPD_G             => TPD_C,
         FIFO_FULL_THRES_G => FIFO_FULL_THRES_C)
      port map (
         -- Input RX VC Signals (vcRxClk domain)
         vcRxOut             => vcRxOutPrbsRx,
         vcRxCommonOut       => vcRxCommonOutPrbsRx,
         vcTxIn_locBuffAFull => vcTxIn_locBuffAFullPrbsRx,
         vcTxIn_locBuffFull  => vcTxIn_locBuffFullPrbsRx,
         -- TX VC Signals (vcTxClk domain)
         vcTxIn              => results,
         -- Error Detection Signals (vcRxClk domain)
         updatedResults      => updatedResults,
         busy                => rxBusy,
         errMissedPacket     => errMissedPacket,
         errLength           => errLength,
         errEofe             => errEofe,
         errWordCnt          => errWordCnt,
         errbitCnt           => errbitCnt,
         packetRate          => packetRate,
         packetLength        => packetLength,
         -- Clocks and Resets
         vcRxClk             => clk,
         vcRxRst             => rst,
         vcTxClk             => clk,
         vcTxRst             => rst);          
end testbed;
