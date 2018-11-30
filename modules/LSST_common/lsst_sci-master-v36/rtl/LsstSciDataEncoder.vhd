library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;
use work.SsiPkg.all;
use work.Pgp2bPkg.all;

use work.LsstSciPackage.all;

entity LsstSciDataEncoder is
  generic (
    -------------------------------------------------------------------------
    -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
    -- raft data into the 16 bit PGP pipe.
    --
    -- Currently, the choices are:
    -- ZERO_EXTEND_32 : Zero extend the data to 32 bits (halves bandwidth)
    -- TRUNC_LOW_2    : Truncate the low 2 bits (loses precision)
    -- 18B_PACK       : Packed 18 bit data
    -------------------------------------------------------------------------
    RAFT_DATA_CONVERSION : string);
  port (
    -------------------------------------------------------------------------
    -- Clock and Reset
    -------------------------------------------------------------------------
    sysClk : in std_logic;
    sysRst : in std_logic;
    pgpClk : in std_logic;
    pgpRst : in std_logic;
    
    -------------------------------------------------------------------------
    -- Data Encoder Input Interface
    -------------------------------------------------------------------------
    dataIn : in LsstSciImageDataType;

    -------------------------------------------------------------------------
    -- AXI-Stream Interface
    -------------------------------------------------------------------------
    mAxisMaster : out AxiStreamMasterType;
    mAxisSlave  :  in AxiStreamSlaveType;
    
    -------------------------------------------------------------------------
    -- Internal Status Interface
    -------------------------------------------------------------------------
    statusOut     : out LsstSciImageStatusType);

end LsstSciDataEncoder;

architecture LsstSciDataEncoder of LsstSciDataEncoder is
  constant TPD_G : time := 1 ns;

  type StateType is (DATA_S, WAIT_DRAIN_S);

  type RegType is record
    dataSsiMaster : SsiMasterType;
    state         : StateType;
    imagesSent    : sl;
    imagesTrunc   : sl;
    imagesDisc    : sl;
    fifoRdEn      : sl;
    sof           : sl;
  end record RegType;

  constant REG_INIT_C : RegType := (
    dataSsiMaster => ssiMasterInit(SSI_PGP2B_CONFIG_C),
    state         => DATA_S,
    imagesSent    => '0',
    imagesTrunc   => '0',
    imagesDisc    => '0',
    fifoRdEn      => '0',
    sof           => '0');

  signal r   : RegType := REG_INIT_C;
  signal rin : RegType;

  signal dataSsiSlave : SsiSlaveType;

  signal imageDataFormat : std_logic_vector(3 downto 0);

  -- Data Encoder Fifo signals
  signal fifoRdEn          : std_logic;
  signal fifoEmpty         : std_logic;
  signal fifoValid         : std_logic;
  signal fifoDataOut       : std_logic_vector(15 downto 0);
  signal fifoDataOutSOT    : std_logic;
  signal fifoDataOutEOT    : std_logic;

  signal sAxisMaster : AxiStreamMasterType;
  signal sAxisSlave  : AxiStreamSlaveType;
  signal sAxisCtrl   : AxiStreamCtrlType;
  
begin

  ----------------------------------------------------------------------------
  -- Here's where we choose the method for converting the 18 bit raft
  -- data to the 16 bit PGP data.
  ----------------------------------------------------------------------------
  U_gen_zero_extend_32 : if RAFT_DATA_CONVERSION = "ZERO_EXTEND_32" generate
    imageDataFormat <= LSST_DATA_32B_ZERO_EXTEND;

    data_encoder : entity work.LsstSci32bZExt
      port map (
        DataClk    => sysClk,
        DataWrEn   => dataIn.wrEn,
        DataSOT    => dataIn.sot,
        DataEOT    => dataIn.eot,
        DataIn     => dataIn.data,
        FrameReset => pgpRst,
        FrameRdClk => pgpClk,
        FrameRdEn  => fifoRdEn,
        FrameValid => fifoValid,
        FrameEmpty => fifoEmpty,
        FrameSOT   => fifoDataOutSOT,
        FrameEOT   => fifoDataOutEOT,
        FrameData  => fifoDataOut(15 downto 0));
  end generate;

  U_gen_trunc_low_2 : if RAFT_DATA_CONVERSION = "TRUNC_LOW_2" generate
    imageDataFormat <= LSST_DATA_16B_TRUNC_LOW_2;

    data_encoder : entity work.LsstSci16bTrunc
      port map (
        DataClk    => sysClk,
        DataWrEn   => dataIn.wrEn,
        DataSOT    => dataIn.sot,
        DataEOT    => dataIn.eot,
        DataIn     => dataIn.data,
        FrameReset => pgpRst,
        FrameRdClk => pgpClk,
        FrameRdEn  => fifoRdEn,
        FrameValid => fifoValid,
        FrameEmpty => fifoEmpty,
        FrameSOT   => fifoDataOutSOT,
        FrameEOT   => fifoDataOutEOT,
        FrameData  => fifoDataOut(15 downto 0));
  end generate;

  U_gen_18b_packed : if RAFT_DATA_CONVERSION = "18B_PACK" generate
    imageDataFormat <= LSST_DATA_18B_PACKED;

    data_encoder : entity work.LsstSci18bPack
      port map (
        DataClk    => sysClk,
        DataWrEn   => dataIn.wrEn,
        DataSOT    => dataIn.sot,
        DataEOT    => dataIn.eot,
        DataIn     => dataIn.data,
        FrameReset => pgpRst,
        FrameRdClk => pgpClk,
        FrameRdEn  => fifoRdEn,
        FrameValid => fifoValid,
        FrameEmpty => fifoEmpty,
        FrameSOT   => fifoDataOutSOT,
        FrameEOT   => fifoDataOutEOT,
        FrameData  => fifoDataOut(15 downto 0));
  end generate;

  statusOut.format  <= imageDataFormat;

  ----------------------------------------------------------------------------
  -- AxiStream Translation
  ----------------------------------------------------------------------------
  dataSsiSlave <= axis2ssiSlave(SSI_PGP2B_CONFIG_C, sAxisSlave, sAxisCtrl);

  comb : process (fifoDataOut, fifoDataOutSOT, fifoDataOutEOT,
                  fifoValid, dataSsiSlave, r, pgpRst) is
    variable v : RegType;

  begin
    v := r;

    v.dataSsiMaster.sof   := '0';
    v.dataSsiMaster.eof   := '0';
    v.dataSsiMaster.eofe  := '0';
    v.dataSsiMaster.valid := '0';
    v.dataSsiMaster.keep  := X"0003";
    v.dataSsiMaster.strb  := X"0003";
    v.dataSsiMaster.data  := (others => '0');
    v.fifoRdEn            := fifoValid;
    v.imagesSent          := '0';
    v.imagesTrunc         := '0';
    v.imagesDisc          := '0';
    
    case r.state is
      when DATA_S =>
        if (fifoValid = '1') then
          v.dataSsiMaster.data(15 downto 0) := fifoDataOut;

          -- Delay SOF so that it is sent with the first pixel's data
          -- EOF can be sent with an empty word with little penalty
          v.dataSsiMaster.valid := not fifoDataOutSOT;
          v.sof                 := fifoDataOutSOT;
          v.dataSsiMaster.sof   := r.sof;
          v.dataSsiMaster.eof   := fifoDataOutEOT;
          v.imagesSent          := fifoDataOutEOT;

          -- Terminate frame early if pause aserts
          if (dataSsiSlave.pause = '1') then
            v.dataSsiMaster.eofe  := '1';
            v.imagesTrunc         := '1';
            v.dataSsiMaster.valid := '1';
            v.state               := WAIT_DRAIN_S;
          end if;
        end if;
        
      when WAIT_DRAIN_S =>
        -- Drain the rest of the event
        v.dataSsiMaster := r.dataSsiMaster;
        v.fifoRdEn            := '1';
        v.dataSsiMaster.valid := '0';
        v.dataSsiMaster.eofe  := '0';

        if (fifoDataOutEOT = '1' and dataSsiSlave.pause = '0') then
          v.state := DATA_S;  
        end if;

        if (fifoDataOutSOT = '1' and dataSsiSlave.pause = '1') then
          v.imagesDisc := '1';
        end if;

      when others => null;
    end case;

    if (pgpRst = '1') then
      v := REG_INIT_C;
    end if;
    
    --------------------------------------------------------------------------  
    -- AxiStream Transmit Signals
    --------------------------------------------------------------------------
    sAxisMaster <= ssi2AxisMaster(SSI_PGP2B_CONFIG_C, r.dataSsiMaster);
    fifoRdEn    <= v.fifoRdEn;
  
    statusOut.sent  <= v.imagesSent;
    statusOut.trunc <= v.imagesTrunc;
    statusOut.disc  <= v.imagesDisc;

    rin <= v;
    
  end process comb;


  seq: process (pgpClk) is
  begin
    if (rising_edge(pgpClk)) then
      r <= rin after TPD_G;
    end if;
  end process seq;

  -----------------------------------------------------------------------------
  -- Output Fifo
  -----------------------------------------------------------------------------
  Data_AxiStreamFifo : entity work.AxiStreamFifo
    generic map (
      SLAVE_AXI_CONFIG_G  => SSI_PGP2B_CONFIG_C,
      MASTER_AXI_CONFIG_G => SSI_PGP2B_CONFIG_C,
      FIFO_ADDR_WIDTH_G   => 6,
      FIFO_PAUSE_THRESH_G => 2**6-16)
    port map (
      -- Slave Port
      sAxisClk    => pgpClk,
      sAxisRst    => pgpRst,
      sAxisMaster => sAxisMaster,
      sAxisSlave  => sAxisSlave,
      sAxisCtrl   => sAxisCtrl,
      -- Master Port
      mAxisClk    => pgpClk,
      mAxisRst    => pgpRst,
      mAxisMaster => mAxisMaster,
      mAxisSlave  => mAxisSlave);

end LsstSciDataEncoder;
