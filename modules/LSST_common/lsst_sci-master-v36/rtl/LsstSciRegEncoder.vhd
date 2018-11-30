library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;
use work.AxiLitePkg.all;
use work.SsiPkg.all;
use work.Pgp2bPkg.all;

entity LsstSciRegEncoder is
  port (
    -- AXI-Stream Interface
    sAxisClk    :  in sl;
    sAxisRst    :  in sl;
    sAxisMaster :  in AxiStreamMasterType;
    sAxisCtrl   : out AxiStreamCtrlType;
    mAxisClk    :  in sl;
    mAxisRst    :  in sl;
    mAxisMaster : out AxiStreamMasterType;
    mAxisSlave  :  in AxiStreamSlaveType;
     
    -- SCI interface
    regClk      :  in sl;
    regRst      :  in sl;
    regReq      : out sl;
    regOp       : out sl;
    regAddr     : out slv(23 downto 0);
    regDataWr   : out slv(31 downto 0);
    regAck      :  in sl;
    regFail     :  in sl;
    regDataRd   :  in slv(31 downto 0));
  
end LsstSciRegEncoder;

architecture rtl of LsstSciRegEncoder is
  constant TPD_G : time := 1 ns;
  
  signal axiReadMaster  : AxiLiteReadMasterType;
  signal axiReadSlave   : AxiLiteReadSlaveType;
  signal axiWriteMaster : AxiLiteWriteMasterType;
  signal axiWriteSlave  : AxiLiteWriteSlaveType;
  
  type RegType is record
    axiReadSlave  : AxiLiteReadSlaveType;
    axiWriteSlave : AxiLiteWriteSlaveType;
    regReq        : sl;
    regOp         : sl;
    regAddr       : slv(23 downto 0);
    regDataWr     : slv(31 downto 0);
  end record RegType;

  constant REG_INIT_C : RegType := (
    axiReadSlave  => AXI_LITE_READ_SLAVE_INIT_C,
    axiWriteSlave => AXI_LITE_WRITE_SLAVE_INIT_C,
    regReq        => '0',
    regOp         => '0',
    regAddr       => (others => '0'),
    regDataWr     => (others => '0')); 

  signal r   : RegType := REG_INIT_C;
  signal rin : RegType;

begin

  -----------------------------------------------------------------------------
  -- SCI Register Interface to Axi Lite 
  -----------------------------------------------------------------------------
  comb : process (regRst, axiReadMaster,axiWriteMaster,
                  regAck, regFail, regDataRd, r) is
    variable v         : RegType;
    variable axiStatus : AxiLiteStatusType;

  begin
    -- Latch the current value
    v := r;
    
    -- Determine the transaction type
    axiSlaveWaitTxn(axiWriteMaster, axiReadMaster,
                    v.axiWriteSlave, v.axiReadSlave, axiStatus);
    
    if (axiStatus.readEnable = '1') then
      v.regReq := '1';
      v.regOp  := '0';
      v.regAddr(23 downto 0) := axiReadMaster.araddr(25 downto 2);
      
      v.axiReadSlave.arready := regAck;
      v.axiReadSlave.rvalid  := regAck;
      if (regFail = '1') then
        v.axiReadSlave.rresp := AXI_RESP_DECERR_C;
      else
        v.axiReadSlave.rresp := AXI_RESP_OK_C;
      end if;
      v.axiReadSlave.rdata   := regDataRd;
      
    elsif (axiStatus.writeEnable = '1') then
      v.regReq := '1';
      v.regOp  := '1';
      v.regAddr(23 downto 0) := axiWriteMaster.awaddr(25 downto 2);
      v.regDataWr := axiWriteMaster.wdata;
      
      v.axiWriteSlave.awready := regAck;
      v.axiWriteSlave.wready  := regAck;
      v.axiWriteSlave.bvalid  := regAck;
      if (regFail = '1') then
        v.axiWriteSlave.bresp := AXI_RESP_DECERR_C;
      else
        v.axiWriteSlave.bresp := AXI_RESP_OK_C;
      end if;

    else
      v := REG_INIT_C;
    
    end if;
    
    -- Reset
    if (regRst = '1') then
      v := REG_INIT_C;
    end if;
    
    -- Register the variable for next clock cycle
    rin <= v;
    
  end process comb;

  -- Outputs 
  axiReadSlave   <= r.axiReadSlave;
  axiWriteSlave  <= r.axiWriteSlave;
  regReq         <= r.regReq;
  regOp          <= r.regOp;
  regDataWr      <= r.regDataWr;
  regAddr        <= r.regAddr;
  
  seq : process (regClk) is
  begin
    if (rising_edge(regClk)) then
      r <= rin after TPD_G;
    end  if;
  end process seq;

  -----------------------------------------------------------------------------
  -- Axi Stream to Axi Lite
  -----------------------------------------------------------------------------
  AxiLiteMaster : entity work.SsiAxiLiteMaster
    generic map (
      USE_BUILT_IN_G      => false,
      AXI_STREAM_CONFIG_G => SSI_PGP2B_CONFIG_C,
      RESP_THOLD_G        => 4)

    port map (
      -- Streaming Slave (Rx) Interface (sAxisClk domain) 
      sAxisClk            => sAxisClk,
      sAxisRst            => sAxisRst,
      sAxisMaster         => sAxisMaster,
      sAxisSlave          => open,
      sAxisCtrl           => sAxisCtrl,
      -- Streaming Master (Tx) Data Interface (mAxisClk domain)
      mAxisClk            => mAxisClk,
      mAxisRst            => mAxisRst,
      mAxisMaster         => mAxisMaster,
      mAxisSlave          => mAxisSlave,
      -- AXI Lite Bus (axiLiteClk domain)
      axiLiteClk          => regClk,
      axiLiteRst          => regRst,
      mAxiLiteReadMaster  => axiReadMaster,
      mAxiLiteReadSlave   => axiReadSlave,
      mAxiLiteWriteMaster => axiWriteMaster,
      mAxiLiteWriteSlave  => axiWriteSlave);
  
end architecture rtl;
