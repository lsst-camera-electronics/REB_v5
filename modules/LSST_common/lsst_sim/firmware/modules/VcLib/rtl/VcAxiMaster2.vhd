-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : VcAxiMaster2.vhd
-- Author     : Benjamin Reese  <bareese@slac.stanford.edu>
-- Company    : SLAC National Accelerator Laboratory
-- Created    : 2013-09-18
-- Last update: 2014-03-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A Virtual Channel to AXI Master2 bridge.
--              Burst transactions not supported.
-------------------------------------------------------------------------------
-- Copyright (c) 2013 SLAC National Accelerator Laboratory
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.AxiLitePkg.all;
use work.VcPkg.all;

entity VcAxiMaster2 is
   
   generic (
      TPD_G : time := 1 ns;

      RST_ASYNC_G : boolean              := false;
      RX_LANE_G   : integer range 0 to 3 := 0;
      TX_LANE_G   : integer range 0 to 3 := 0;
      ETH_MODE_G  : boolean              := false;

      -- FIFO parameters
      SYNC_RX_FIFO_G : boolean                    := false;
      SYNC_TX_FIFO_G : boolean                    := false;
      BRAM_EN_G      : boolean                    := true;
      USE_DSP48_G    : string                     := "no";
      ALTERA_RAM_G   : string                     := "M-RAM";
      USE_BUILT_IN_G : boolean                    := false;  --if set to true, this module is only xilinx compatible only!!!
      XIL_DEVICE_G   : string                     := "7SERIES";  --xilinx only generic parameter
      SYNC_STAGES_G  : integer range 3 to (2**24) := 3);

   port (
      -- VC Clock and reset
      vcTxClk : in sl;
      vcTxRst : in sl;

      vcRxClk : in sl;
      vcRxRst : in sl;

      -- VC Interface
      vcTxIn  : out VcTxInType;
      vcTxOut : in  VcTxOutType;

      vcRxOut       : in VcRxOutType;
      vcRxCommonOut : in VcRxCommonOutType;

      -- Axi Clock and reset
      axiClk    : in sl;
      axiClkRst : in sl;

      -- Axi Interface
      axiReadMaster : out AxiLiteReadMasterType;
      axiReadSlave  : in  AxiLiteReadSlaveType;

      axiWriteMaster : out AxiLiteWriteMasterType;
      axiWriteSlave  : in  AxiLiteWriteSlaveType);

end entity VcAxiMaster2;

architecture rtl of VcAxiMaster2 is

   constant AXI_ID_C : slv(3 downto 0) := "0000";

   type FifoFrameWordType is record
      data  : slv(15 downto 0);
      flags : slv(1 downto 0);
   end record FifoFrameWordType;

   type FifoFrameType is array (0 to 7) of FifoFrameWordType;

   signal rxFifoReset    : sl;
   signal rxFifoDin      : slv(17 downto 0);
   signal rxFifoFrameTmp : FifoFrameType;
   signal rxFifoFrame    : FifoFrameType;
   signal rxFifoValid    : sl;

   signal txFifoFrame : FifoFrameType;
   signal txFifoFull  : sl;
   signal txFifoAFull : sl;
   signal txFifoValid : sl;
   signal txFifoDout  : slv(17 downto 0);
   signal txFifoRdEn  : sl;

   type StateType is (WAIT_RX_FRAME_S, WAIT_READ_RESP_S, WAIT_WRITE_RESP_S);

   type RegType is record
      state       : StateType;
      rxFifoRdEn  : sl;
      txFifoWrEn  : sl;
      rxFifoReset : sl;

      txFifoFrame : FifoFrameType;

      axiWriteMaster : AxiLiteWriteMasterType;
      axiReadMaster  : AxiLiteReadMasterType;
   end record RegType;

   constant REG_INIT_C : RegType := (
      state       => WAIT_RX_FRAME_S,
      rxFifoRdEn  => '0',
      txFifoWrEn  => '0',
      rxFifoReset => '0',

      txFifoFrame => (
         others   => (
            data  => (others => '0'),
            flags => (others => '0'))),

      axiWriteMaster => (
         awaddr      => (others => '0'),
         awprot      => (others => '0'),
         awvalid     => '0',
         wdata       => (others => '0'),
         wstrb       => "1111",         -- All 4 bytes active
         wvalid      => '0',
         bready      => '1'),

      axiReadMaster => (
         araddr     => (others => '0'),
         arprot     => (others => '0'),
         arvalid    => '0',
         rready     => '1')
      );

   signal r   : RegType := REG_INIT_C;
   signal rin : RegType;

begin


   -- Data going into Rx FIFO
   rxFifoDin(17 downto 16) <= "11" when vcRxCommonOut.eofe = '1' else
                              "10" when vcRxCommonOut.eof = '1' else
                              "01" when vcRxCommonOut.sof = '1' else
                              "00";
   rxFifoDin(15 downto 0) <= vcRxCommonOut.data(RX_LANE_G);

   RX_FIFO_1 : entity work.FifoMux
      generic map (
         TPD_G           => TPD_G,
         RST_ASYNC_G     => false,
         GEN_SYNC_FIFO_G => SYNC_RX_FIFO_G,
         BRAM_EN_G       => true,
         FWFT_EN_G       => true,
         USE_DSP48_G     => USE_DSP48_G,
         ALTERA_RAM_G    => ALTERA_RAM_G,
         USE_BUILT_IN_G  => USE_BUILT_IN_G,
         XIL_DEVICE_G    => XIL_DEVICE_G,
         SYNC_STAGES_G   => SYNC_STAGES_G,
         WR_DATA_WIDTH_G => 18,
         RD_DATA_WIDTH_G => 144,
         LITTLE_ENDIAN_G => true,
         ADDR_WIDTH_G    => 5,
         INIT_G          => "0",
         FULL_THRES_G    => 16)         -- Half full
      port map (
         rst                  => rxFifoReset,
         wr_clk               => vcRxClk,
         wr_en                => vcRxOut.valid,
         din                  => rxFifoDin,
         prog_full            => vcTxIn.locBuffAFull,
         full                 => vcTxIn.locBuffFull,
         rd_clk               => axiClk,
         rd_en                => r.rxFifoRdEn,
         dout(15 downto 0)    => rxFifoFrameTmp(0).data,
         dout(17 downto 16)   => rxFifoFrameTmp(0).flags,
         dout(33 downto 18)   => rxFifoFrameTmp(1).data,
         dout(35 downto 34)   => rxFifoFrameTmp(1).flags,
         dout(51 downto 36)   => rxFifoFrameTmp(2).data,
         dout(53 downto 52)   => rxFifoFrameTmp(2).flags,
         dout(69 downto 54)   => rxFifoFrameTmp(3).data,
         dout(71 downto 70)   => rxFifoFrameTmp(3).flags,
         dout(87 downto 72)   => rxFifoFrameTmp(4).data,
         dout(89 downto 88)   => rxFifoFrameTmp(4).flags,
         dout(105 downto 90)  => rxFifoFrameTmp(5).data,
         dout(107 downto 106) => rxFifoFrameTmp(5).flags,
         dout(123 downto 108) => rxFifoFrameTmp(6).data,
         dout(125 downto 124) => rxFifoFrameTmp(6).flags,
         dout(141 downto 126) => rxFifoFrameTmp(7).data,
         dout(143 downto 142) => rxFifoFrameTmp(7).flags,
         valid                => rxFifoValid);

   eth_mode_swap : process (rxFifoFrameTmp) is
   begin
      if (ETH_MODE_G) then
         for i in 0 to 7 loop
            if (i mod 2 = 0) then
               rxFifoFrame(i) <= rxFifoFrameTmp(i+1);
            else
               rxFifoFrame(i) <= rxFifoFrameTmp(i-1);
            end if;
         end loop;
      else
         rxFifoFrame <= rxFifoFrameTmp;
      end if;
   end process eth_mode_swap;

   comb : process (axiClkRst, axiReadSlave, axiWriteSlave, r, rxFifoFrame, rxFifoValid,
                   vcRxCommonOut, vcRxOut, vcRxRst) is
      variable v             : RegType;
      variable validFrameVar : boolean;
   begin
      v := r;

      -- Assign rx output to tx input
      -- Will override parts that need changing below
      v.txFifoFrame := rxFifoFrame;

      -- Don't read or write fifos unless directed to below
      v.rxFifoRdEn := '0';
      v.txFifoWrEn := '0';

      -- Check that frame is valid
      if (rxFifoFrame(0).flags = "01" and    -- SOF
          rxFifoFrame(1).flags = "00" and
          rxFifoFrame(2).flags = "00" and
          rxFifoFrame(3).flags = "00" and
          rxFifoFrame(4).flags = "00" and
          rxFifoFrame(5).flags = "00" and
          rxFifoFrame(6).flags = "00" and
          rxFifoFrame(7).flags = "10") then  -- EOF
         validFrameVar := true;
      else
         validFrameVar := false;
      end if;


      case (r.state) is
         when WAIT_RX_FRAME_S =>
            v.rxFifoReset := '0';
            if (rxFifoValid = '1' and r.rxFifoRdEn = '0') then
               if (validFrameVar) then
                  -- Probably don't need to demux the address busses,
                  -- Just asssign to both read and write busses and only assert the proper valid

                  -- Read Transaction
                  if (rxFifoFrame(3).data(15 downto 14) = "00") then
                     v.axiReadMaster.araddr(15 downto 0)  := rxFifoFrame(2).data;
                     v.axiReadMaster.araddr(23 downto 16) := rxFifoFrame(3).data(7 downto 0);
                     v.axiReadMaster.arvalid              := '1';
                     v.state                              := WAIT_READ_RESP_S;

                  -- Write Transactions
                  elsif (rxFifoFrame(3).data(15 downto 14) = "01") then
                     v.axiWriteMaster.awaddr(15 downto 0)  := rxFifoFrame(2).data;
                     v.axiWriteMaster.awaddr(23 downto 16) := rxFifoFrame(3).data(7 downto 0);
                     v.axiWriteMaster.awvalid              := '1';
                     v.axiWriteMaster.wdata(15 downto 0)   := rxFifoFrame(4).data;
                     v.axiWriteMaster.wdata(31 downto 16)  := rxFifoFrame(5).data;
                     v.axiWriteMaster.wvalid               := '1';
                     v.state                               := WAIT_WRITE_RESP_S;
                  end if;
               else
                  -- Invalid frame, reset rx fifo
                  v.rxFifoReset := '1';
               end if;
            end if;

         when WAIT_READ_RESP_S =>
            -- Deassert arvalid upon arready
            if (axiReadSlave.arready = '1') then
               v.axiReadMaster.arvalid := '0';
            end if;

            -- Wait for read data, rready is preasserted
            if (axiReadSlave.rvalid = '1') then
               v.rxFifoRdEn          := '1';
               v.txFifoWrEn          := '1';
               v.txFifoFrame(4).data := axiReadSlave.rdata(15 downto 0);
               v.txFifoFrame(5).data := axiReadSlave.rdata(31 downto 16);
               v.state               := WAIT_RX_FRAME_S;
               if (axiReadSlave.rresp = AXI_RESP_OK_C) then
                  v.txFifoFrame(7).data(1 downto 0) := "00";  -- No errors
               elsif (axiReadSlave.rresp = AXI_RESP_SLVERR_C) then
                  v.txFifoFrame(7).data(1 downto 0) := "01";  -- Fail bit set if Slave errors
               elsif (axiReadSlave.rresp = AXI_RESP_DECERR_C) then
                  v.txFifoFrame(7).data(1 downto 0) := "10";  -- Timout error in place of decode error
               else
                  v.txFifoFrame(7).data(1 downto 0) := "01";  -- Else just fail
               end if;
            end if;
            
         when WAIT_WRITE_RESP_S =>
            -- Reset awvalid upont awready
            if (axiWriteSlave.awready = '1') then
               v.axiWriteMaster.awvalid := '0';
            end if;

            -- Reset wvalid upon wready
            if (axiWriteSlave.wready = '1') then
               v.axiWriteMaster.wvalid := '0';
            end if;

            if (axiWriteSlave.bvalid = '1') then
               v.rxFifoRdEn := '1';
               v.txFifoWrEn := '1';
               v.state      := WAIT_RX_FRAME_S;
               if (axiWriteSlave.bresp = AXI_RESP_OK_C) then
                  v.txFifoFrame(7).data(1 downto 0) := "00";  -- No errors
               elsif (axiWriteSlave.bresp = AXI_RESP_SLVERR_C) then
                  v.txFifoFrame(7).data(1 downto 0) := "01";  -- Fail bit set if Slave errors
               elsif (axiWriteSlave.bresp = AXI_RESP_DECERR_C) then
                  v.txFifoFrame(7).data(1 downto 0) := "10";  -- Timout error in place of decode error
               else
                  v.txFifoFrame(7).data(1 downto 0) := "01";  -- Else just fail
               end if;
            end if;

      end case;

      if ((vcRxOut.valid = '1' and vcRxCommonOut.eofe = '1') or vcRxRst = '1') then
         -- Must reset the rx fifo whenever an EOFE is seen.
         -- This is how alignment issues are recovered
         v.rxFifoReset := '1';
      end if;

      if (axiClkRst = '1') then
         v := REG_INIT_C;
      end if;

      rin <= v;

      rxFifoReset    <= r.rxFifoReset;
      axiWriteMaster <= r.axiWriteMaster;
      axiReadMaster  <= r.axiReadMaster;

   end process comb;

   seq : process (axiClk) is
   begin
      if (rising_edge(axiClk)) then
         r <= rin after TPD_G;
      end if;
   end process seq;

   -- Swap words going out if EHT_MODE_G set
   ETH_MODE_2 : process (r.txFifoFrame) is
   begin
      if (ETH_MODE_G) then
         for i in 0 to 7 loop
            if (i mod 2 = 0) then
               txFifoFrame(i) <= r.txFifoFrame(i+1);
            else
               txFifoFrame(i) <= r.txFifoFrame(i-1);
            end if;
         end loop;
      else
         txFifoFrame <= r.txFifoFrame;
      end if;
   end process ETH_MODE_2;

   -- TX FIFO
   TX_FIFO_1 : entity work.FifoMux
      generic map (
         TPD_G           => TPD_G,
         RST_ASYNC_G     => false,
         GEN_SYNC_FIFO_G => SYNC_RX_FIFO_G,
         BRAM_EN_G       => true,
         FWFT_EN_G       => true,
         USE_DSP48_G     => USE_DSP48_G,
         ALTERA_RAM_G    => ALTERA_RAM_G,
         USE_BUILT_IN_G  => USE_BUILT_IN_G,
         XIL_DEVICE_G    => XIL_DEVICE_G,
         SYNC_STAGES_G   => SYNC_STAGES_G,
         WR_DATA_WIDTH_G => 144,
         RD_DATA_WIDTH_G => 18,
         LITTLE_ENDIAN_G => true,
         ADDR_WIDTH_G    => 6,
         INIT_G          => "0")
      port map (
         rst                 => axiClkRst,
         wr_clk              => axiClk,
         wr_en               => r.txFifoWrEn,
         din(15 downto 0)    => txFifoFrame(0).data,
         din(17 downto 16)   => txFifoFrame(0).flags,
         din(33 downto 18)   => txFifoFrame(1).data,
         din(35 downto 34)   => txFifoFrame(1).flags,
         din(51 downto 36)   => txFifoFrame(2).data,
         din(53 downto 52)   => txFifoFrame(2).flags,
         din(69 downto 54)   => txFifoFrame(3).data,
         din(71 downto 70)   => txFifoFrame(3).flags,
         din(87 downto 72)   => txFifoFrame(4).data,
         din(89 downto 88)   => txFifoFrame(4).flags,
         din(105 downto 90)  => txFifoFrame(5).data,
         din(107 downto 106) => txFifoFrame(5).flags,
         din(123 downto 108) => txFifoFrame(6).data,
         din(125 downto 124) => txFifoFrame(6).flags,
         din(141 downto 126) => txFifoFrame(7).data,
         din(143 downto 142) => txFifoFrame(7).flags,
         almost_full         => txFifoAFull,
         full                => txFifoFull,
         rd_clk              => vcTxClk,
         rd_en               => txFifoRdEn,
         dout                => txFifoDout,
         valid               => txFifoValid);

   -- Control tx fifo readys
   txFifoRdEn <= txFifoValid and vcTxOut.ready and not vcRxOut.remBuffAFull and not vcRxOut.remBuffFull;

   -- Signals to vcTx
   vcTxIn.valid           <= txFifoValid;
   vcTxIn.sof             <= '1' when txFifoDout(17 downto 16) = "01" else '0';
   vcTxIn.eof             <= txFifoDout(17);
   vcTxIn.eofe            <= '1' when txFifoDout(17 downto 16) = "11" else '0';
   vcTxIn.data(TX_LANE_G) <= txFifoDout(15 downto 0);



end architecture rtl;
