-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : VcLoopBack.vhd
-- Author     : Larry Ruckman  <ruckman@slac.stanford.edu>
-- Company    : SLAC National Accelerator Laboratory
-- Created    : 2014-04-02
-- Last update: 2014-04-03
-- Platform   : Vivado 2013.3
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:   This is a Virtual Channel (VC) loopback module.
-------------------------------------------------------------------------------
-- Copyright (c) 2014 SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

use work.StdRtlPkg.all;
use work.VcPkg.all;

entity VcLoopBack is
   generic (
      TPD_G              : time                       := 1 ns;
      VC_WIDTH_G         : integer range 1 to 4       := 3;      -- 3 not allowed      
      RST_ASYNC_G        : boolean                    := false;
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
      FIFO_EMPTY_THRES_G : integer range 0 to (2**24) := 0);
   port (
      -- RX VC Signals (vcRxClk domain)
      vcRxOut       : in  VcRxOutType;
      vcRxCommonOut : in  VcRxCommonOutType;
      -- TX VC Signals (vcTxClk domain)
      vcTxIn        : out VcTxInType;
      vcTxOut       : in  VcTxOutType;
      -- Clocks and Resets
      vcRxClk       : in  sl;
      vcRxRst       : in  sl;
      vcTxClk       : in  sl;
      vcTxRst       : in  sl);
end VcLoopBack;

architecture mapping of VcLoopBack is

   signal dsBuff16In  : VcDsBuff16InType;
   signal dsBuff16Out : VcDsBuff16OutType;
   signal usBuff16In  : VcUsBuff16InType;
   signal usBuff16Out : VcUsBuff16OutType;

   signal dsBuff32In  : VcDsBuff32InType;
   signal dsBuff32Out : VcDsBuff32OutType;
   signal usBuff32In  : VcUsBuff32InType;
   signal usBuff32Out : VcUsBuff32OutType;

   signal dsBuff64In  : VcDsBuff64InType;
   signal dsBuff64Out : VcDsBuff64OutType;
   signal usBuff64In  : VcUsBuff64InType;
   signal usBuff64Out : VcUsBuff64OutType;
   
begin

   assert (VC_WIDTH_G /= 3) report
      "VC_WIDTH_G must not be = 3" severity failure;
   
   GEN_1xLANE_LOOPBACK : if (VC_WIDTH_G = 1) generate
      VcDsBuff16_Inst : entity work.VcDsBuff16
         generic map (
            TPD_G              => TPD_G,
            RST_ASYNC_G        => RST_ASYNC_G,
            RX_LANES_G         => 1,
            GEN_SYNC_FIFO_G    => true,  -- locClk and vcRxClk are the same
            BRAM_EN_G          => BRAM_EN_G,
            FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
            USE_DSP48_G        => USE_DSP48_G,
            ALTERA_SYN_G       => ALTERA_SYN_G,
            ALTERA_RAM_G       => ALTERA_RAM_G,
            USE_BUILT_IN_G     => USE_BUILT_IN_G,
            LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
            XIL_DEVICE_G       => XIL_DEVICE_G,
            FIFO_INIT_G        => FIFO_INIT_G,
            FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
            FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)   
         port map (
            -- RX VC Signals (vcRxClk domain)
            vcRxOut             => vcRxOut,
            vcRxCommonOut       => vcRxCommonOut,
            vcTxIn_locBuffAFull => vcTxIn.locBuffAFull,
            vcTxIn_locBuffFull  => vcTxIn.locBuffFull,
            -- DS signals  (locClk domain)
            dsBuff16In          => dsBuff16In,
            dsBuff16Out         => dsBuff16Out,
            -- Local clock and resets
            locClk              => vcRxClk,
            locRst              => vcRxRst,
            -- VC Rx Clock And Resets
            vcRxClk             => vcRxClk,
            vcRxRst             => vcRxRst);      

      usBuff16In.valid <= dsBuff16Out.valid;
      usBuff16In.sof   <= dsBuff16Out.sof;
      usBuff16In.eof   <= dsBuff16Out.eof;
      usBuff16In.eofe  <= dsBuff16Out.eofe;
      usBuff16In.data  <= dsBuff16Out.data;
      dsBuff16In.ready <= not(usBuff16Out.almostFull) and not (usBuff16Out.full);

      VcUsBuff16_Inst : entity work.VcUsBuff16
         generic map (
            TPD_G              => TPD_G,
            RST_ASYNC_G        => RST_ASYNC_G,
            TX_LANES_G         => 1,
            GEN_SYNC_FIFO_G    => GEN_SYNC_FIFO_G,
            BRAM_EN_G          => BRAM_EN_G,
            FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
            USE_DSP48_G        => USE_DSP48_G,
            ALTERA_SYN_G       => ALTERA_SYN_G,
            ALTERA_RAM_G       => ALTERA_RAM_G,
            USE_BUILT_IN_G     => USE_BUILT_IN_G,
            LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
            XIL_DEVICE_G       => XIL_DEVICE_G,
            FIFO_SYNC_STAGES_G => FIFO_SYNC_STAGES_G,
            FIFO_INIT_G        => FIFO_INIT_G,
            FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
            FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)
         port map (
            -- TX VC Signals (vcTxClk domain)
            vcTxIn.valid        => vcTxIn.valid,
            vcTxIn.sof          => vcTxIn.sof,
            vcTxIn.eof          => vcTxIn.eof,
            vcTxIn.eofe         => vcTxIn.eofe,
            vcTxIn.data         => vcTxIn.data,
            vcTxIn.locBuffAFull => open,
            vcTxIn.locBuffFull  => open,
            vcTxOut             => vcTxOut,
            vcRxOut             => vcRxOut,
            -- UP signals  (locClk domain)
            usBuff16In          => usBuff16In,
            usBuff16Out         => usBuff16Out,
            -- Local clock and resets
            locClk              => vcRxClk,
            locRst              => vcRxRst,
            -- VC Rx Clock And Resets
            vcTxClk             => vcTxClk,
            vcTxRst             => vcTxRst);
   end generate;

   GEN_2xLANE_LOOPBACK : if (VC_WIDTH_G = 2) generate
      VcDsBuff32_Inst : entity work.VcDsBuff32
         generic map (
            TPD_G              => TPD_G,
            RST_ASYNC_G        => RST_ASYNC_G,
            RX_LANES_G         => 2,
            GEN_SYNC_FIFO_G    => true,  -- locClk and vcRxClk are the same
            BRAM_EN_G          => BRAM_EN_G,
            FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
            USE_DSP48_G        => USE_DSP48_G,
            ALTERA_SYN_G       => ALTERA_SYN_G,
            ALTERA_RAM_G       => ALTERA_RAM_G,
            USE_BUILT_IN_G     => USE_BUILT_IN_G,
            LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
            XIL_DEVICE_G       => XIL_DEVICE_G,
            FIFO_INIT_G        => FIFO_INIT_G,
            FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
            FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)   
         port map (
            -- RX VC Signals (vcRxClk domain)
            vcRxOut             => vcRxOut,
            vcRxCommonOut       => vcRxCommonOut,
            vcTxIn_locBuffAFull => vcTxIn.locBuffAFull,
            vcTxIn_locBuffFull  => vcTxIn.locBuffFull,
            -- DS signals  (locClk domain)
            dsBuff32In          => dsBuff32In,
            dsBuff32Out         => dsBuff32Out,
            -- Local clock and resets
            locClk              => vcRxClk,
            locRst              => vcRxRst,
            -- VC Rx Clock And Resets
            vcRxClk             => vcRxClk,
            vcRxRst             => vcRxRst);      

      usBuff32In.valid <= dsBuff32Out.valid;
      usBuff32In.sof   <= dsBuff32Out.sof;
      usBuff32In.eof   <= dsBuff32Out.eof;
      usBuff32In.eofe  <= dsBuff32Out.eofe;
      usBuff32In.data  <= dsBuff32Out.data;
      dsBuff32In.ready <= not(usBuff32Out.almostFull) and not (usBuff32Out.full);

      VcUsBuff32_Inst : entity work.VcUsBuff32
         generic map (
            TPD_G              => TPD_G,
            RST_ASYNC_G        => RST_ASYNC_G,
            TX_LANES_G         => 2,
            GEN_SYNC_FIFO_G    => GEN_SYNC_FIFO_G,
            BRAM_EN_G          => BRAM_EN_G,
            FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
            USE_DSP48_G        => USE_DSP48_G,
            ALTERA_SYN_G       => ALTERA_SYN_G,
            ALTERA_RAM_G       => ALTERA_RAM_G,
            USE_BUILT_IN_G     => USE_BUILT_IN_G,
            LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
            XIL_DEVICE_G       => XIL_DEVICE_G,
            FIFO_SYNC_STAGES_G => FIFO_SYNC_STAGES_G,
            FIFO_INIT_G        => FIFO_INIT_G,
            FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
            FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)
         port map (
            -- TX VC Signals (vcTxClk domain)
            vcTxIn.valid        => vcTxIn.valid,
            vcTxIn.sof          => vcTxIn.sof,
            vcTxIn.eof          => vcTxIn.eof,
            vcTxIn.eofe         => vcTxIn.eofe,
            vcTxIn.data         => vcTxIn.data,
            vcTxIn.locBuffAFull => open,
            vcTxIn.locBuffFull  => open,
            vcTxOut             => vcTxOut,
            vcRxOut             => vcRxOut,
            -- UP signals  (locClk domain)
            usBuff32In          => usBuff32In,
            usBuff32Out         => usBuff32Out,
            -- Local clock and resets
            locClk              => vcRxClk,
            locRst              => vcRxRst,
            -- VC Rx Clock And Resets
            vcTxClk             => vcTxClk,
            vcTxRst             => vcTxRst);
   end generate;

   GEN_4xLANE_LOOPBACK : if (VC_WIDTH_G = 4) generate
      VcDsBuff64_Inst : entity work.VcDsBuff64
         generic map (
            TPD_G              => TPD_G,
            RST_ASYNC_G        => RST_ASYNC_G,
            RX_LANES_G         => 4,
            GEN_SYNC_FIFO_G    => true,  -- locClk and vcRxClk are the same
            BRAM_EN_G          => BRAM_EN_G,
            FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
            USE_DSP48_G        => USE_DSP48_G,
            ALTERA_SYN_G       => ALTERA_SYN_G,
            ALTERA_RAM_G       => ALTERA_RAM_G,
            USE_BUILT_IN_G     => USE_BUILT_IN_G,
            LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
            XIL_DEVICE_G       => XIL_DEVICE_G,
            FIFO_INIT_G        => FIFO_INIT_G,
            FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
            FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)   
         port map (
            -- RX VC Signals (vcRxClk domain)
            vcRxOut             => vcRxOut,
            vcRxCommonOut       => vcRxCommonOut,
            vcTxIn_locBuffAFull => vcTxIn.locBuffAFull,
            vcTxIn_locBuffFull  => vcTxIn.locBuffFull,
            -- DS signals  (locClk domain)
            dsBuff64In          => dsBuff64In,
            dsBuff64Out         => dsBuff64Out,
            -- Local clock and resets
            locClk              => vcRxClk,
            locRst              => vcRxRst,
            -- VC Rx Clock And Resets
            vcRxClk             => vcRxClk,
            vcRxRst             => vcRxRst);      

      usBuff64In.valid <= dsBuff64Out.valid;
      usBuff64In.sof   <= dsBuff64Out.sof;
      usBuff64In.eof   <= dsBuff64Out.eof;
      usBuff64In.eofe  <= dsBuff64Out.eofe;
      usBuff64In.data  <= dsBuff64Out.data;
      dsBuff64In.ready <= not(usBuff64Out.almostFull) and not (usBuff64Out.full);

      VcUsBuff64_Inst : entity work.VcUsBuff64
         generic map (
            TPD_G              => TPD_G,
            RST_ASYNC_G        => RST_ASYNC_G,
            TX_LANES_G         => 4,
            GEN_SYNC_FIFO_G    => GEN_SYNC_FIFO_G,
            BRAM_EN_G          => BRAM_EN_G,
            FIFO_ADDR_WIDTH_G  => FIFO_ADDR_WIDTH_G,
            USE_DSP48_G        => USE_DSP48_G,
            ALTERA_SYN_G       => ALTERA_SYN_G,
            ALTERA_RAM_G       => ALTERA_RAM_G,
            USE_BUILT_IN_G     => USE_BUILT_IN_G,
            LITTLE_ENDIAN_G    => LITTLE_ENDIAN_G,
            XIL_DEVICE_G       => XIL_DEVICE_G,
            FIFO_SYNC_STAGES_G => FIFO_SYNC_STAGES_G,
            FIFO_INIT_G        => FIFO_INIT_G,
            FIFO_FULL_THRES_G  => FIFO_FULL_THRES_G,
            FIFO_EMPTY_THRES_G => FIFO_EMPTY_THRES_G)
         port map (
            -- TX VC Signals (vcTxClk domain)
            vcTxIn.valid        => vcTxIn.valid,
            vcTxIn.sof          => vcTxIn.sof,
            vcTxIn.eof          => vcTxIn.eof,
            vcTxIn.eofe         => vcTxIn.eofe,
            vcTxIn.data         => vcTxIn.data,
            vcTxIn.locBuffAFull => open,
            vcTxIn.locBuffFull  => open,
            vcTxOut             => vcTxOut,
            vcRxOut             => vcRxOut,
            -- UP signals  (locClk domain)
            usBuff64In          => usBuff64In,
            usBuff64Out         => usBuff64Out,
            -- Local clock and resets
            locClk              => vcRxClk,
            locRst              => vcRxRst,
            -- VC Rx Clock And Resets
            vcTxClk             => vcTxClk,
            vcTxRst             => vcTxRst);
   end generate;
end mapping;
