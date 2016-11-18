-------------------------------------------------------------------------------
-- Title      : Upstream Data Buffer
-- Project    : General Purpose Core
-------------------------------------------------------------------------------
-- File       : VcUsBuff.vhd
-- Author     : Ryan Herbst, rherbst@slac.stanford.edu
-- Created    : 2013-07-22
-- Last update: 2014-04-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:
-- VHDL source file for buffer block for upstream data.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 by Ryan Herbst. All rights reserved.
--
-- Dependencies:  ^/StdLib/trunk/rtl/FifoMux.vhd
-------------------------------------------------------------------------------
-- Modification history:
-- 07/22/2013: created.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.VcPkg.all;

entity VcUsBuff is
   generic (
      TPD_G              : time                       := 1 ns;
      RST_ASYNC_G        : boolean                    := false;
      TX_LANES_G         : integer range 1 to 4       := 1;
      GEN_SYNC_FIFO_G    : boolean                    := false;
      BRAM_EN_G          : boolean                    := true;
      INPUT_DATA_WIDTH_G : integer range 1 to 512     := 64;
      FIFO_ADDR_WIDTH_G  : integer range 4 to 48      := 9;
      USE_DSP48_G        : string                     := "no";
      ALTERA_SYN_G       : boolean                    := false;
      ALTERA_RAM_G       : string                     := "M9K";
      USE_BUILT_IN_G     : boolean                    := false;  --if set to true, this module is only Xilinx compatible only!!!
      LITTLE_ENDIAN_G    : boolean                    := false;
      OUTPUT_REG_G       : boolean                    := false;
      XIL_DEVICE_G       : string                     := "7SERIES";  --Xilinx only generic parameter    
      FIFO_SYNC_STAGES_G : integer range 3 to (2**24) := 3;
      FIFO_INIT_G        : slv                        := "0";
      FIFO_FULL_THRES_G  : integer range 1 to (2**24) := 256;    -- Almost full at 1/2 capacity
      FIFO_EMPTY_THRES_G : integer range 1 to (2**24) := 1);
   port (
      -- TX VC Signals (vcTxClk domain)
      vcTxIn    : out VcTxInType;
      vcTxOut   : in  VcTxOutType;
      vcRxOut   : in  VcRxOutType;
      -- UP signals  (locClk domain)
      usBuffIn  : in  VcUsBuffInType;
      usBuffOut : out VcUsBuffOutType;
      -- Local clock and resets
      locClk    : in  sl;
      locRst    : in  sl := '0';
      -- VC Tx Clock And Resets
      vcTxClk   : in  sl;
      vcTxRst   : in  sl := '0');
end VcUsBuff;

architecture rtl of VcUsBuff is

   constant FIFO_WIDTH_C    : integer := INPUT_DATA_WIDTH_G/8*9;
   constant RD_DATA_WIDTH_C : integer := 18*TX_LANES_G;

   -- Local Signals
   signal fifoDin   : slv(FIFO_WIDTH_C-1 downto 0);
   signal fifoDout  : slv(RD_DATA_WIDTH_C-1 downto 0);
   signal fifoRd    : sl;
   signal fifoValid : sl;
   signal fifoEmpty : sl;

   impure function assignFifoDin(usBuffIn : VcUsBuffInType) return slv is
      variable fifoDin : slv(FIFO_WIDTH_C-1 downto 0);
   begin
      fifoDin := (others => '0');

      -- Data
      for i in INPUT_DATA_WIDTH_G/16-1 downto 0 loop
         fifoDin(i*18+15 downto i*18) := usBuffIn.data(i*16+15 downto i*16);
      end loop;

      -- Flags
      fifoDin(FIFO_WIDTH_C-2) := usBuffIn.sof;
      fifoDin(17)             := usBuffIn.eof;
      if (usBuffIn.eofe = '1') then
         fifoDin(17 downto 16) := "11";
      end if;

      return fifoDin;
   end function assignFifoDin;

   impure function assignTxIn return VcTxInType is
      variable vcTxIn : VcTxInType;
   begin
      vcTxIn := VC_TX_IN_INIT_C;

      vcTxIn.valid := fifoValid and not vcRxOut.remBuffFull and not vcRxOut.remBuffAFull;

      -- SOF flag on upper word
      vcTxIn.sof := toSl(fifoDout(RD_DATA_WIDTH_C-1 downto RD_DATA_WIDTH_C-2) = "01");

      -- EOF flags always on lower word
      vcTxIn.eof  := toSl(fifoDout(17 downto 16) = "10" or fifoDout(17 downto 16) = "11");
      vcTxIn.eofe := toSl(fifoDout(17 downto 16) = "11");

      -- Assign data based on lane generics
      for i in (TX_LANES_G-1) downto 0 loop
         vcTxIn.data(i) := fifoDout(i*18+15 downto i*18);
      end loop;

      return vcTxIn;
   end function;
   
begin

   assert (INPUT_DATA_WIDTH_G mod 16 = 0) report "INPUT_DATA_WIDTH_G must be a multiple of 16" severity error;

   fifoDin <= assignFifoDin(usBuffIn);

   FifoMux_1 : entity work.FifoMux
      generic map (
         TPD_G           => TPD_G,
         RST_ASYNC_G     => RST_ASYNC_G,
         GEN_SYNC_FIFO_G => GEN_SYNC_FIFO_G,
         BRAM_EN_G       => BRAM_EN_G,
         FWFT_EN_G       => true,
         USE_DSP48_G     => USE_DSP48_G,
         ALTERA_SYN_G    => ALTERA_SYN_G,
         ALTERA_RAM_G    => ALTERA_RAM_G,
         USE_BUILT_IN_G  => USE_BUILT_IN_G,
         XIL_DEVICE_G    => XIL_DEVICE_G,
         WR_DATA_WIDTH_G => FIFO_WIDTH_C,
         RD_DATA_WIDTH_G => RD_DATA_WIDTH_C,
         LITTLE_ENDIAN_G => LITTLE_ENDIAN_G,
         ADDR_WIDTH_G    => FIFO_ADDR_WIDTH_G,
         INIT_G          => FIFO_INIT_G,
         FULL_THRES_G    => FIFO_FULL_THRES_G,
         EMPTY_THRES_G   => FIFO_EMPTY_THRES_G)
      port map (
         rst          => locRst,
         wr_clk       => locClk,
         wr_en        => usBuffIn.valid,
         din          => fifoDin,
         wr_ack       => open,
         overflow     => open,
         prog_full    => usBuffOut.almostFull,
         almost_full  => open,
         full         => usBuffOut.full,
         rd_clk       => vcTxClk,
         rd_en        => fifoRd,
         dout         => fifoDout,
         valid        => fifoValid,
         underflow    => open,
         prog_empty   => open,
         almost_empty => open,
         empty        => fifoEmpty);

   -- Automatically read when data is valid and VC is ready to receive it and remote buffer is not full
   fifoRd <= fifoValid and vcTxOut.ready and not vcRxOut.remBuffFull and not vcRxOut.remBuffAFull;

   -- If none is connected then they will optimize to zeros.
   vcTxIn.locBuffAFull <= 'Z';
   vcTxIn.locBuffFull  <= 'Z';

   REG_OUTPUT : if (OUTPUT_REG_G) generate
      seq : process (vcTxClk) is
      begin
         if (rising_edge(vcTxClk)) then
            if (vcTxRst = '1') then
               vcTxIn <= VC_TX_IN_INIT_C after TPD_G;
            else
               vcTxIn <= assignTxIn after TPD_G;
            end if;
         end if;
      end process seq;
   end generate REG_OUTPUT;

   NO_REG_OUTPUT : if (not OUTPUT_REG_G) generate
      vcTxIn <= assignTxIn;
   end generate NO_REG_OUTPUT;
   
end rtl;
