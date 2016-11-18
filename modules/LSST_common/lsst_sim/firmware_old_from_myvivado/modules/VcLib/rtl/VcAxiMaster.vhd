-------------------------------------------------------------------------------
-- Title      : 
-------------------------------------------------------------------------------
-- File       : VcAxiMaster.vhd
-- Author     : Benjamin Reese  <bareese@slac.stanford.edu>
-- Company    : SLAC National Accelerator Laboratory
-- Created    : 2013-09-18
-- Last update: 2014-04-01
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A Virtual Channel to AXI Master bridge.
--              Implemented as a simple wrapper around VcRegSlave.
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

entity VcAxiMaster is
   
   generic (
      TPD_G : time := 1 ns;

      RST_ASYNC_G : boolean              := false;
      LANE_G      : integer range 0 to 3 := 0;
      ETH_MODE_G  : boolean              := false;

      -- FIFO parameters
      GEN_SYNC_FIFO_G : boolean                    := false;
      BRAM_EN_G       : boolean                    := true;
      USE_DSP48_G     : string                     := "no";
      ALTERA_RAM_G    : string                     := "M-RAM";
      ALTERA_SYN_G    : boolean                    := false;
      USE_BUILT_IN_G  : boolean                    := false;  --if set to true, this module is only xilinx compatible only!!!
      XIL_DEVICE_G    : string                     := "7SERIES";  --xilinx only generic parameter
      SYNC_STAGES_G   : integer range 3 to (2**24) := 3);

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
      axiRst : in sl;

      -- Axi Interface
      axiReadMaster : out AxiLiteReadMasterType;
      axiReadSlave  : in  AxiLiteReadSlaveType;

      axiWriteMaster : out AxiLiteWriteMasterType;
      axiWriteSlave  : in  AxiLiteWriteSlaveType);

end entity VcAxiMaster;

architecture rtl of VcAxiMaster is

   type StateType is (WAIT_REQ_RISE_S, WAIT_WRITE_RESP_S, WAIT_READ_RESP_S, WAIT_REQ_FALL_S);

   type RegType is record
      state          : StateType;
      regSlaveIn     : VcRegSlaveInType;
      axiWriteMaster : AxiLiteWriteMasterType;
      axiReadMaster  : AxiLiteReadMasterType;
   end record RegType;

   constant REG_INIT_C : RegType := (
      state      => WAIT_REQ_RISE_S,
      regSlaveIn => VC_REG_SLAVE_IN_INIT_C,

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

   signal regSlaveOut : VcRegSlaveOutType;

--   attribute mark_debug : string;
--   attribute mark_debug of
--      r,
--      axiReadSlave,
--      axiWriteSlave,
--      regSlaveOut : signal is "TRUE";

begin

   VcRegSlave_1 : entity work.VcRegSlave
      generic map (
         TPD_G           => TPD_G,
         LANE_G          => LANE_G,
         RST_ASYNC_G     => RST_ASYNC_G,
         GEN_SYNC_FIFO_G => GEN_SYNC_FIFO_G,
         BRAM_EN_G       => BRAM_EN_G,
         USE_DSP48_G     => USE_DSP48_G,
         ALTERA_SYN_G    => ALTERA_SYN_G,
         ALTERA_RAM_G    => ALTERA_RAM_G,
         USE_BUILT_IN_G  => USE_BUILT_IN_G,
         XIL_DEVICE_G    => XIL_DEVICE_G,
         SYNC_STAGES_G   => SYNC_STAGES_G,
         ETH_MODE_G      => ETH_MODE_G)
      port map (
         vcRxOut       => vcRxOut,
         vcRxCommonOut => vcRxCommonOut,
         vcTxIn        => vcTxIn,
         vcTxOut       => vcTxOut,
         regSlaveIn    => r.regSlaveIn,
         regSlaveOut   => regSlaveOut,
         locClk        => axiClk,
         locRst        => axiRst,
         vcTxClk       => vcTxClk,
         vcTxRst       => vcTxRst,
         vcRxClk       => vcRxClk,
         vcRxRst       => vcRxRst);


   comb : process (axiRst, axiReadSlave, axiWriteSlave, r, regSlaveOut) is
      variable v             : RegType;
      variable validFrameVar : boolean;
   begin
      v := r;


      case (r.state) is
         when WAIT_REQ_RISE_S =>
            if (regSlaveOut.req = '1') then
               if (regSlaveOut.op = '1') then
                  -- Write
                  v.axiWriteMaster.awaddr  := "000000" & regSlaveOut.addr & "00";
                  v.axiWriteMaster.awvalid := '1';
                  v.axiWriteMaster.wdata   := regSlaveOut.wrData;
                  v.axiWriteMaster.wvalid  := '1';
                  v.state                  := WAIT_WRITE_RESP_S;
               else
                  -- read
                  v.axiReadMaster.araddr  := "000000" & regSlaveOut.addr & "00";
                  v.axiReadMaster.arvalid := '1';
                  v.state                 := WAIT_READ_RESP_S;
               end if;
            end if;

         when WAIT_READ_RESP_S =>
            -- Deassert arvalid upon arready
            if (axiReadSlave.arready = '1') then
               v.axiReadMaster.arvalid := '0';
            end if;

            -- Wait for read data, rready is preasserted
            if (axiReadSlave.rvalid = '1') then

               v.regSlaveIn.rdData := axiReadSlave.rdata;
               v.regSlaveIn.ack    := '1';

               if (axiReadSlave.rresp = AXI_RESP_OK_C) then
                  v.regSlaveIn.fail := '0';
               else
                  v.regSlaveIn.fail := '1';
               end if;

               v.state := WAIT_REQ_FALL_S;
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
               v.regSlaveIn.ack := '1';

               if (axiWriteSlave.bresp = AXI_RESP_OK_C) then
                  v.regSlaveIn.fail := '0';
               else
                  v.regSlaveIn.fail := '1';
               end if;

               v.state := WAIT_REQ_FALL_S;
            end if;

         when WAIT_REQ_FALL_S =>
            if (regSlaveOut.req = '0') then
               v.regSlaveIn.ack  := '0';
               v.regSlaveIn.fail := '0';
               v.state           := WAIT_REQ_RISE_S;
            end if;

      end case;


      if (axiRst = '1') then
         v := REG_INIT_C;
      end if;

      rin <= v;

      axiWriteMaster <= r.axiWriteMaster;
      axiReadMaster  <= r.axiReadMaster;

   end process comb;

   seq : process (axiClk) is
   begin
      if (rising_edge(axiClk)) then
         r <= rin after TPD_G;
      end if;
   end process seq;

end architecture rtl;
