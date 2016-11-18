-------------------------------------------------------------------------------
-- Title      : Upstream Data Buffer
-- Project    : General Purpose Core
-------------------------------------------------------------------------------
-- File       : VcUsBuff80.vhd
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

entity VcUsBuff80 is
   generic (
      TPD_G              : time                       := 1 ns;
      RST_ASYNC_G        : boolean                    := false;
      TX_LANES_G         : integer range 1 to 4       := 1;
      GEN_SYNC_FIFO_G    : boolean                    := false;
      BRAM_EN_G          : boolean                    := true;
      FIFO_ADDR_WIDTH_G  : integer range 4 to 48      := 9;
      USE_DSP48_G        : string                     := "no";
      ALTERA_SYN_G       : boolean                    := false;
      ALTERA_RAM_G       : string                     := "M9K";
      USE_BUILT_IN_G     : boolean                    := false;  --if set to true, this module is only Xilinx compatible only!!!
      LITTLE_ENDIAN_G    : boolean                    := false;
      XIL_DEVICE_G       : string                     := "7SERIES";  --Xilinx only generic parameter    
      FIFO_SYNC_STAGES_G : integer range 3 to (2**24) := 3;
      FIFO_INIT_G        : slv                        := "0";
      FIFO_FULL_THRES_G  : integer range 1 to (2**24) := 256;    -- Almost full at 1/2 capacity
      FIFO_EMPTY_THRES_G : integer range 1 to (2**24) := 1);
   port (
      -- TX VC Signals (vcTxClk domain)
      vcTxIn      : out VcTxInType;
      vcTxOut     : in  VcTxOutType;
      vcRxOut     : in  VcRxOutType;
      -- UP signals  (locClk domain)
      usBuff80In  : in  VcUsBuff80InType;
      usBuff80Out : out VcUsBuff80OutType;
      -- Local clock and resets
      locClk      : in  sl;
      locRst      : in  sl := '0';
      -- VC Tx Clock And Resets
      vcTxClk     : in  sl;
      vcTxRst     : in  sl := '0');      
end VcUsBuff80;

architecture rtl of VcUsBuff80 is

   constant RD_DATA_WIDTH_C : integer := 18*TX_LANES_G;

   -- Local Signals
   signal fifoDin   : slv(89 downto 0);
   signal fifoDout  : slv(RD_DATA_WIDTH_C-1 downto 0);
   signal fifoRd    : sl;
   signal fifoValid : sl;
   signal fifoEmpty : sl;

begin

   fifoDin(87 downto 72) <= usBuff80In.data(79 downto 64);
   fifoDin(69 downto 54) <= usBuff80In.data(63 downto 48);
   fifoDin(51 downto 36) <= usBuff80In.data(47 downto 32);
   fifoDin(33 downto 18) <= usBuff80In.data(31 downto 16);
   fifoDin(15 downto 0)  <= usBuff80In.data(15 downto 0);

   fifoDin(89 downto 88) <= "01" when usBuff80In.sof = '1' else "00";
   fifoDin(71 downto 70) <= "00";
   fifoDin(53 downto 52) <= "00";
   fifoDin(35 downto 34) <= "00";
   fifoDin(17 downto 16) <= "11" when usBuff80In.eofe = '1' else
                            "10" when usBuff80In.eof = '1' else
                            "00";

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
         WR_DATA_WIDTH_G => 90,
         RD_DATA_WIDTH_G => RD_DATA_WIDTH_C,
         LITTLE_ENDIAN_G => LITTLE_ENDIAN_G,
         ADDR_WIDTH_G    => FIFO_ADDR_WIDTH_G,
         INIT_G          => FIFO_INIT_G,
         FULL_THRES_G    => FIFO_FULL_THRES_G,
         EMPTY_THRES_G   => FIFO_EMPTY_THRES_G)
      port map (
         rst          => locRst,
         wr_clk       => locClk,
         wr_en        => usBuff80In.valid,
         din          => fifoDin,
         wr_ack       => open,
         overflow     => open,
         prog_full    => usBuff80Out.almostFull,
         almost_full  => open,
         full         => usBuff80Out.full,
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

   process (vcTxClk) is
   begin
      if (rising_edge(vcTxClk)) then
         if (vcTxRst = '1') then
            vcTxIn <= VC_TX_IN_INIT_C after TPD_G;
         else
            
            vcTxIn.valid <= fifoValid and not vcRxOut.remBuffFull and not vcRxOut.remBuffAFull after TPD_G;

            -- SOF flag on upper word
            if (fifoDout(RD_DATA_WIDTH_C-1 downto RD_DATA_WIDTH_C-2) = "01") then
               vcTxIn.sof <= '1' after TPD_G;
            else
               vcTxIn.sof <= '0' after TPD_G;
            end if;

            -- EOF flags always on lower word
            if (fifoDout(17 downto 16) = "10" or fifoDout(17 downto 16) = "11") then
               vcTxIn.eof <= '1' after TPD_G;
            else
               vcTxIn.eof <= '0' after TPD_G;
            end if;

            if (fifoDout(17 downto 16) = "11") then
               vcTxIn.eofe <= '1' after TPD_G;
            else
               vcTxIn.eofe <= '0' after TPD_G;
            end if;

            -- Assign data based on lane generics
            for i in (TX_LANES_G-1) downto 0 loop
               vcTxIn.data(i) <= fifoDout(i*18+15 downto i*18) after TPD_G;
            end loop;

            if (TX_LANES_G /= 4) then
               for i in 3 downto TX_LANES_G loop
                  vcTxIn.data(i) <= (others => '0') after TPD_G;
               end loop;
            end if;

         end if;
      end if;
   end process;

   -- These signals should be driven by a module that connects to the RX side of the VC.
   -- If none is connected then they will optimize to zeros.
   vcTxIn.locBuffAFull <= 'Z';
   vcTxIn.locBuffFull  <= 'Z';

end rtl;
