library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.AxiStreamPkg.all;
use work.SsiPkg.all;
use work.Pgp2bPkg.all;

use work.LsstSciPackage.all;

entity LsstSciNoticeEncoder is
  port (
    -------------------------------------------------------------------------
    -- Clock and Reset
    -------------------------------------------------------------------------
    sysClk : in std_logic;
    sysRst : in std_logic;
    pgpClk : in std_logic;
    pgpRst : in std_logic;
    
    -------------------------------------------------------------------------
    -- Notice Encoder Input Interface
    -------------------------------------------------------------------------
    noticeEn : in std_logic;
    notice   : in std_logic_vector(63 downto 0);
    
    -------------------------------------------------------------------------
    -- AXI-Stream Interface
    -------------------------------------------------------------------------
    mAxisMaster : out AxiStreamMasterType;
    mAxisSlave  :  in AxiStreamSlaveType;

    -------------------------------------------------------------------------
    -- Internal Status Interface
    -------------------------------------------------------------------------
    noticeSent : out std_logic;
    noticeLast : out std_logic_vector(63 downto 0));
  
end LsstSciNoticeEncoder;

architecture LsstSciNoticeEncoder of LsstSciNoticeEncoder is
  constant TPD_G : time := 1 ns;

  signal mFifoAxisMaster : AxiStreamMasterType;
  signal mFifoAxisSlave  : AxiStreamSlaveType;
  signal mFifoAxisCtrl   : AxiStreamCtrlType;

  signal fifoRdEn    : std_logic;
  signal fifoDataIn  : std_logic_vector(95 downto 0);
  signal fifoDataOut : std_logic_vector(95 downto 0);
  signal fifoValid   : std_logic;
  signal fifoEmpty   : std_logic;
  
  type StateType is (S_IDLE_C, S_WRITE_C);
  
  type RegType is record
    state           : StateType;
    mFifoAxisMaster : AxiStreamMasterType;
    fifoRdEn        : std_logic;
    noticeSent      : std_logic;
    noticeLast      : std_logic_vector(63 downto 0);
  end record RegType;

  constant REG_INIT_C : RegType := (
    state => S_IDLE_C,
    mFifoAxisMaster => AXI_STREAM_MASTER_INIT_C,
    fifoRdEn        => '0',
    noticeSent      => '0',
    noticeLast      => (others => '0'));

  signal r   : RegType := REG_INIT_C;
  signal rin : RegType;

begin

  -----------------------------------------------------------------------------
  -- Input Fifo
  -----------------------------------------------------------------------------
   fifoDataIn <= x"00000000" & notice;
   
   notice_input_fifo : entity work.FifoAsync
    generic map (
      DATA_WIDTH_G => 96,
      ADDR_WIDTH_G => 6)
    port map (
      rst => pgpRst,
      wr_clk => sysClk,
      wr_en  => noticeEn,
      din => fifoDataIn,
      wr_data_count => open,
      wr_ack => open,
      overflow => open,
      prog_full => open,
      almost_full => open,
      full => open,
      not_full => open,
      rd_clk => pgpClk,
      rd_en  => fifoRdEn,
      dout => fifoDataOut,
      rd_data_count => open,
      valid => fifoValid,
      underflow => open,
      prog_empty => open,
      empty => fifoEmpty);

  ----------------------------------------------------------------------------
  -- AxiStream Translation
  ----------------------------------------------------------------------------
  
  comb : process (pgpRst, fifoValid, fifoEmpty, fifoDataOut, mFifoAxisCtrl, r) is
    variable v : RegType;

  begin
    v := r;

    v.mFifoAxisMaster := AXI_STREAM_MASTER_INIT_C;
    v.mFifoAxisMaster.tUser := (others => '0');
    v.mFifoAxisMaster.tKeep := (others => '1');
    v.mFifoAxisMaster.tValid := '0';
    v.mFifoAxisMaster.tLast  := '0';
    v.fifoRdEn := '0';

    v.noticeSent          := fifoRdEn;
    if(noticeEn = '1') then
      v.noticeLast          := notice;
    end if;

    case r.state is

      when S_IDLE_C =>

      if fifoEmpty = '0' and mFifoAxisCtrl.pause = '0' then
        v.fifoRdEn := '1';
        v.state := S_WRITE_C;
      end if;

      when S_WRITE_C =>
        v.fifoRdEn := '0';
        if fifoValid = '1' then
          v.mFifoAxisMaster.tValid := '1';
          v.mFifoAxisMaster.tUser  := x"00000000000000000000000000000002";
          v.mFifoAxisMaster.tData  := x"00000000" & fifoDataOut(31 downto 0) & fifoDataOut(63 downto 32) & x"000000" & x"ff";
          v.mFifoAxisMaster.tLast  := '1';
          v.state := S_IDLE_C;
        end if;

    end case;

    if (pgpRst = '1') then
      v := REG_INIT_C;
    end if;
    
    rin <= v;

    mFifoAxisMaster <= r.mFifoAxisMaster;
    fifoRdEn <= r.fifoRdEn;
    
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
  Notice_AxiStreamFifo : entity work.AxiStreamFifo
    generic map (
      SLAVE_AXI_CONFIG_G  => ssiAxiStreamConfig(16, TKEEP_COMP_C),
      MASTER_AXI_CONFIG_G => SSI_PGP2B_CONFIG_C,
      FIFO_ADDR_WIDTH_G   => 9,
      FIFO_PAUSE_THRESH_G => 2**9-100)
    port map (
      -- Slave Port
      sAxisClk    => pgpClk,
      sAxisRst    => pgpRst,
      sAxisMaster => mFifoAxisMaster,
      sAxisSlave  => mFifoAxisSlave,
      sAxisCtrl   => mFifoAxisCtrl,
      -- Master Port
      mAxisClk    => pgpClk,
      mAxisRst    => pgpRst,
      mAxisMaster => mAxisMaster,
      mAxisSlave  => mAxisSlave);

end LsstSciNoticeEncoder;
