-------------------------------------------------------------------------------
-- Title      : VC Adapter Block
-- Project    : General Purpose Core
-------------------------------------------------------------------------------
-- File       : VcAdapter.vhd
-- Author     : Ryan Herbst, rherbst@slac.stanford.edu
-- Created    : 2014-03-28
-- Last update: 2014-03-28
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:
-- Block adapting a transmit VC interface to receive VC transmit interface.
-- Can be used to generate a VC loopback or to connect to standard VC blocks
-- together. Provides arbitration between multiple VC interfaces.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 by Ryan Herbst. All rights reserved.
-------------------------------------------------------------------------------
-- Modification history:
-- 03/28/2014: created.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.ArbiterPkg.all;
use work.VcPkg.all;

entity VcAdapter is
   generic (
      TPD_G       : time := 1 ns
   ); port (

      -- VC clock and reset
      vcClk         : in sl;
      vcClkRst      : in sl;

      -- TX VC Signals
      vcTxQuadIn    : in  VcTxQuadInType;
      vcTxQuadOut   : out VcTxQuadOutType;

      -- RX VC Signals, output
      vcRxCommonOut : out VcRxCommonOutType;
      vcRxQuadOut   : out VcRxQuadOutType
   );
end VcAdapter;

architecture structure of VcAdapter is

   type StateType is ( S_IDLE, S_MOVE );

   type RegType is record
      state            : StateType;
      acks             : slv(3 downto 0);
      ackNum           : slv(1 downto 0);
      valid            : sl;
      vcTxQuadOut      : VcTxQuadOutType;
      vcRxCommonOut    : VcRxCommonOutType;
      vcRxQuadOut      : VcRxQuadOutType;
   end record RegType;

   constant REG_INIT_C : RegType := (
      state            => S_IDLE,
      acks             => (others=>'0'),
      ackNum           => (others=>'0'),
      valid            => '0',
      vcTxQuadOut      => VC_TX_QUAD_OUT_INIT_C,
      vcRxCommonOut    => VC_RX_COMMON_OUT_INIT_C,
      vcRxQuadOut      => VC_RX_QUAD_OUT_INIT_C
   );

   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

begin

   comb : process (vcClkRst, r, vcTxQuadIn ) is
      variable v            : RegType;
      variable requests     : slv(3 downto 0);
   begin
      v := r;

      -- Pass Flow Control
      for i in 0 to 3 loop
         v.vcRxQuadOut(i).remBuffAFull := vcTxQuadIn(i).locBuffAFull;
         v.vcRxQuadOut(i).remBuffFull  := vcTxQuadIn(i).locBuffFull;
      end loop;

      -- Common Output
      v.vcRxCommonOut.sof  := vcTxQuadIn(conv_integer(r.ackNum)).sof;
      v.vcRxCommonOut.eof  := vcTxQuadIn(conv_integer(r.ackNum)).eof;
      v.vcRxCommonOut.eofe := vcTxQuadIn(conv_integer(r.ackNum)).eofe;
      v.vcRxCommonOut.data := vcTxQuadIn(conv_integer(r.ackNum)).data;

      -- Init Ready, pass valid
      for i in 0 to 3 loop
         v.vcTxQuadOut(i).ready := '0';
         v.vcRxQuadOut(i).valid := vcTxQuadIn(i).valid and r.vcTxQuadOut(i).ready;
      end loop;

      -- Format requests
      for i in 0 to 3 loop
         requests(i) := vcTxQuadIn(i).valid;
      end loop;

      -- State machine
      case r.state is

         -- IDLE
         when S_IDLE =>

            -- Aribrate between requesters
            if r.valid = '0' then
               arbitrate(requests, r.ackNum, v.ackNum, v.valid, v.acks);
            end if;

            -- Valid request
            if r.valid = '1' then
               v.state := S_MOVE;
            end if;

         -- Move a frame until EOF or gap in frame
         when S_MOVE =>
            v.valid := '0';
            v.vcTxQuadOut(conv_integer(r.ackNum)).ready := '1';

            if vcTxQuadIn(conv_integer(r.ackNum)).eof = '1' or vcTxQuadIn(conv_integer(r.ackNum)).valid = '0' then
               v.vcTxQuadOut(conv_integer(r.ackNum)).ready := '0';
               v.state := S_IDLE;
            end if;
      end case;

      if (vcClkRst = '1') then
         v := REG_INIT_C;
      end if;

      rin <= v;

      vcTxQuadOut   <= r.vcTxQuadOut;
      vcRxCommonOut <= r.vcRxCommonOut;
      vcRxQuadOut   <= r.vcRxQuadOut;

   end process comb;

   seq : process (vcClk) is
   begin
      if (rising_edge(vcClk)) then
         r <= rin after TPD_G;
      end if;
   end process seq;

end structure;

