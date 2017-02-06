-------------------------------------------------------------------------------
-- Title      : Upstream Data Buffer
-- Project    : General Purpose Core
-------------------------------------------------------------------------------
-- File       : VcDsBuff64.vhd
-- Author     : Ryan Herbst, rherbst@slac.stanford.edu
-- Created    : 2013-07-22
-- Last update: 2014-01-07
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

entity VcDsBuff64 is
   generic (
      TPD_G              : time                       := 1 ns;
      RST_ASYNC_G        : boolean                    := false;
      RX_LANES_G         : integer range 1 to 4       := 1;
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
      FIFO_FULL_THRES_G  : integer range 1 to (2**24) := 128;  -- Almost full at 1/4 capacity
      FIFO_EMPTY_THRES_G : integer range 1 to (2**24) := 1);
   port (
      -- RX VC Signals (vcRxClk domain)
      vcRxOut             : in  VcRxOutType;
      vcRxCommonOut       : in  VcRxCommonOutType;
      vcTxIn_locBuffAFull : out sl;
      vcTxIn_locBuffFull  : out sl;
      -- DS signals  (locClk domain)
      dsBuff64In          : in  VcDsBuff64InType;
      dsBuff64Out         : out VcDsBuff64OutType;
      -- Local clock and resets
      locClk              : in  sl;
      locRst              : in  sl := '0';
      -- VC Rx Clock And Resets
      vcRxClk             : in  sl;
      vcRxRst             : in  sl := '0');      
end VcDsBuff64;

architecture rtl of VcDsBuff64 is

   constant WR_DATA_WIDTH_C : integer := 18*RX_LANES_G;

   -- Local Signals
   signal fifoDin      : slv(WR_DATA_WIDTH_C-1 downto 0);
   signal fifoDout     : slv(71 downto 0);
   signal fifoRd       : sl;
   signal fifoValid    : sl;
   signal fifoEmpty    : sl;
   signal fifoOverflow : sl;

begin

   -- Assign data based on lane generics
   status : process (vcRxCommonOut) is
   begin
      fifoDin <= (others => '0');       -- Default everything to zero
      for i in (RX_LANES_G-1) downto 0 loop
         fifoDin(i*18+15 downto i*18) <= vcRxCommonOut.data(i);
      end loop;
      if (vcRxCommonOut.sof = '1') then
         fifoDin(WR_DATA_WIDTH_C-1 downto WR_DATA_WIDTH_C-2) <= "01";
      end if;
      if (vcRxCommonOut.eofe = '1') then
         fifoDin(17 downto 16) <= "11";
      elsif (vcRxCommonOut.eof = '1') then
         fifoDin(17 downto 16) <= "10";
      end if;

   end process status;


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
         WR_DATA_WIDTH_G => WR_DATA_WIDTH_C,
         RD_DATA_WIDTH_G => 72,
         LITTLE_ENDIAN_G => LITTLE_ENDIAN_G,
         ADDR_WIDTH_G    => FIFO_ADDR_WIDTH_G,
         INIT_G          => FIFO_INIT_G,
         FULL_THRES_G    => FIFO_FULL_THRES_G,
         EMPTY_THRES_G   => FIFO_EMPTY_THRES_G)
      port map (
         rst          => vcRxRst,
         wr_clk       => vcRxClk,
         wr_en        => vcRxOut.valid,
         din          => fifoDin,
         wr_ack       => open,
         overflow     => fifoOverflow,
         prog_full    => vcTxIn_locBuffAFull,
         almost_full  => open,
         full         => vcTxIn_locBuffFull,
         rd_clk       => locClk,
         rd_en        => fifoRd,
         dout         => fifoDout,
         valid        => fifoValid,
         underflow    => open,
         prog_empty   => open,
         almost_empty => open,
         empty        => fifoEmpty);

   -- Automatically read when data is valid and VC is ready to receive it
   fifoRd <= fifoValid and dsBuff64In.ready;

   dsBuff64Out.valid <= fifoValid;

   -- SOF flag on upper word
   dsBuff64Out.sof <= '1' when fifoDout(71 downto 70) = "01" else '0';

   -- EOF flags always on lower word
   dsBuff64Out.eof  <= '1' when fifoDout(17 downto 16) = "10" or fifoDout(17 downto 16) = "11" else '0';
   dsBuff64Out.eofe <= '1' when fifoDout(17 downto 16) = "11"
                       else '0';

   dsBuff64Out.data(63 downto 48) <= fifoDout(69 downto 54);
   dsBuff64Out.data(47 downto 32) <= fifoDout(51 downto 36);
   dsBuff64Out.data(31 downto 16) <= fifoDout(33 downto 18);
   dsBuff64Out.data(15 downto 0)  <= fifoDout(15 downto 0);
   
end rtl;
