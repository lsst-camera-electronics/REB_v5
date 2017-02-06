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
    notice   : in std_logic_vector(31 downto 0);
    
    -------------------------------------------------------------------------
    -- AXI-Stream Interface
    -------------------------------------------------------------------------
    mAxisMaster : out AxiStreamMasterType;
    mAxisSlave  :  in AxiStreamSlaveType;

    -------------------------------------------------------------------------
    -- Internal Status Interface
    -------------------------------------------------------------------------
    noticeSent : out std_logic;
    noticeLast : out std_logic_vector(31 downto 0));
  
end LsstSciNoticeEncoder;

architecture LsstSciNoticeEncoder of LsstSciNoticeEncoder is
  constant TPD_G : time := 1 ns;

  type RegType is record
    dataSsiMaster : SsiMasterType;
    noticeSent    : std_logic;
    noticeLast    : std_logic_vector(31 downto 0);
  end record RegType;

  constant REG_INIT_C : RegType := (
    dataSsiMaster => ssiMasterInit(SSI_PGP2B_CONFIG_C),
    noticeSent    => '0',
    noticeLast    => (others => '0'));

  signal r   : RegType := REG_INIT_C;
  signal rin : RegType;

  signal noticeSsiSlave : SsiSlaveType;

  signal sAxisMaster : AxiStreamMasterType;
  signal sAxisSlave  : AxiStreamSlaveType;
  signal sAxisCtrl   : AxiStreamCtrlType;

begin

  ----------------------------------------------------------------------------
  -- AxiStream Translation
  ----------------------------------------------------------------------------
  noticeSsiSlave <= axis2ssiSlave(SSI_PGP2B_CONFIG_C, sAxisSlave, sAxisCtrl);
  
  comb : process (noticeEn, notice, noticeSsiSlave, r, sysRst) is
    variable v : RegType;

  begin
    v := r;
    
    v.dataSsiMaster.data(31 downto 0) := notice;
    v.dataSsiMaster.valid := noticeEn;
    v.dataSsiMaster.sof   := noticeEn;
    v.dataSsiMaster.eof   := noticeEn;
    v.dataSsiMaster.eofe  := '0';
    v.dataSsiMaster.keep  := X"000F";
    v.dataSsiMaster.strb  := X"000F";
    v.noticeSent          := noticeEn;

    if(noticeEn = '1') then
      v.noticeLast          := notice;
    end if;

    if (sysRst = '1') then
      v := REG_INIT_C;
    end if;
    
    rin <= v;

  end process comb;

  sAxisMaster <= ssi2AxisMaster(SSI_PGP2B_CONFIG_C, r.dataSsiMaster);
  
  noticeSent <= r.noticeSent;
  noticeLast <= r.noticeLast;
  
  seq: process (sysClk) is
  begin
    if (rising_edge(sysClk)) then
      r <= rin after TPD_G;
    end if;
  end process seq;

  -----------------------------------------------------------------------------
  -- Output Fifo
  -----------------------------------------------------------------------------
  Notice_AxiStreamFifo : entity work.AxiStreamFifo
    generic map (
      SLAVE_AXI_CONFIG_G  => SSI_PGP2B_CONFIG_C,
      MASTER_AXI_CONFIG_G => SSI_PGP2B_CONFIG_C,
      FIFO_ADDR_WIDTH_G   => 9,
      FIFO_PAUSE_THRESH_G => 2**9-100)
    port map (
      -- Slave Port
      sAxisClk    => sysClk,
      sAxisRst    => sysRst,
      sAxisMaster => sAxisMaster,
      sAxisSlave  => sAxisSlave,
      sAxisCtrl   => sAxisCtrl,
      -- Master Port
      mAxisClk    => pgpClk,
      mAxisRst    => pgpRst,
      mAxisMaster => mAxisMaster,
      mAxisSlave  => mAxisSlave);

end LsstSciNoticeEncoder;
