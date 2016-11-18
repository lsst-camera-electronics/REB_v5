library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.StdRtlPkg.all;
use work.Pgp2bPkg.all;
use work.LsstSciPackage.all;

entity LsstSciStatusBlock is
  port (
    -- Application Logic Signals
    StatusClk   :  in std_logic;
    StatusRst   :  in std_logic;
    StatusAddr  :  in std_logic_vector(23 downto 0);
    StatusReg   : out std_logic_vector(31 downto 0);
    
    -- SCI side signals
    PgpClk      :  in std_logic;
    PgpRst      :  in std_logic;
    
    ImagesSent  :  in std_logic;
    ImagesTrunc :  in std_logic;
    ImagesDisc  :  in std_logic;
    DataFormat  :  in std_logic_vector( 3 downto 0);

    NoticeSent  :  in std_logic;
    NoticeLast  :  in std_logic_vector(31 downto 0);
    
    PgpRxOut    :  in Pgp2bRxOutType;
    PgpTxOut    :  in Pgp2bTxOutType);
  
end LsstSciStatusBlock;

architecture LsstSciStatusBlock of LsstSciStatusBlock is
  constant TPD_G : time := 1 ns;
  
  -- Status Block Address Map
  constant VERSION_ADDR       : std_logic_vector(9 downto 0) := "00" & x"00";
  constant LNKSTAT_ADDR       : std_logic_vector(9 downto 0) := "00" & x"01";
  constant REM_DATA_ADDR      : std_logic_vector(9 downto 0) := "00" & x"02";
  constant CERR_CNT_ADDR      : std_logic_vector(9 downto 0) := "00" & x"03";
  constant LDWN_CNT_ADDR      : std_logic_vector(9 downto 0) := "00" & x"04";
  constant LERR_CNT_ADDR      : std_logic_vector(9 downto 0) := "00" & x"05";
  constant REM_OFLOW_VC0_ADDR : std_logic_vector(9 downto 0) := "00" & x"06";
  constant REM_OFLOW_VC1_ADDR : std_logic_vector(9 downto 0) := "00" & x"07";
  constant REM_OFLOW_VC2_ADDR : std_logic_vector(9 downto 0) := "00" & x"08";
  constant REM_OFLOW_VC3_ADDR : std_logic_vector(9 downto 0) := "00" & x"09";
  constant REM_PAUSE_VC0_ADDR : std_logic_vector(9 downto 0) := "00" & x"0A"; 
  constant REM_PAUSE_VC1_ADDR : std_logic_vector(9 downto 0) := "00" & x"0B";
  constant REM_PAUSE_VC2_ADDR : std_logic_vector(9 downto 0) := "00" & x"0C";
  constant REM_PAUSE_VC3_ADDR : std_logic_vector(9 downto 0) := "00" & x"0D";
  constant RX_ERR_CNT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"0E";
  constant RX_CNT_ADDR        : std_logic_vector(9 downto 0) := "00" & x"0F";
  constant LOC_OFLOW_VC0_ADDR : std_logic_vector(9 downto 0) := "00" & x"10";
  constant LOC_OFLOW_VC1_ADDR : std_logic_vector(9 downto 0) := "00" & x"11";
  constant LOC_OFLOW_VC2_ADDR : std_logic_vector(9 downto 0) := "00" & x"12";
  constant LOC_OFLOW_VC3_ADDR : std_logic_vector(9 downto 0) := "00" & x"13";
  constant LOC_PAUSE_VC0_ADDR : std_logic_vector(9 downto 0) := "00" & x"14"; 
  constant LOC_PAUSE_VC1_ADDR : std_logic_vector(9 downto 0) := "00" & x"15";
  constant LOC_PAUSE_VC2_ADDR : std_logic_vector(9 downto 0) := "00" & x"16";
  constant LOC_PAUSE_VC3_ADDR : std_logic_vector(9 downto 0) := "00" & x"17";
  constant TX_ERR_CNT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"18";
  constant TX_CNT_ADDR        : std_logic_vector(9 downto 0) := "00" & x"19";
  constant IMAGE_SENT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"20";
  constant IMAGE_DISC_ADDR    : std_logic_vector(9 downto 0) := "00" & x"21";
  constant IMAGE_TRUNC_ADDR   : std_logic_vector(9 downto 0) := "00" & x"22";
  constant DATA_FORMAT_ADDR   : std_logic_vector(9 downto 0) := "00" & x"23";
  constant OPCODE_CNT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"24";
  constant OPCODE_LAST_ADDR   : std_logic_vector(9 downto 0) := "00" & x"25";
  constant NOTICE_CNT_ADDR    : std_logic_vector(9 downto 0) := "00" & x"26";
  constant NOTICE_LAST_ADDR   : std_logic_vector(9 downto 0) := "00" & x"27";
  
  constant REG_MAX_ADDR : std_logic_vector(11 downto 0) := x"027";

  -- Update machine counter
  signal registerCounter : std_logic_vector(11 downto 0);

  -- Statistic counters
  type CounterType is record
    cell_error     : slv(31 downto 0);
    link_down      : slv(31 downto 0);
    link_error     : slv(31 downto 0);
    rem_oflow_vc0  : slv(31 downto 0);
    rem_oflow_vc1  : slv(31 downto 0);
    rem_oflow_vc2  : slv(31 downto 0);
    rem_oflow_vc3  : slv(31 downto 0);
    rem_pause_vc0  : slv(31 downto 0);
    rem_pause_vc1  : slv(31 downto 0);
    rem_pause_vc2  : slv(31 downto 0);
    rem_pause_vc3  : slv(31 downto 0);
    rx_frame_error : slv(31 downto 0);
    rx_frames      : slv(31 downto 0);
    loc_oflow_vc0  : slv(31 downto 0);
    loc_oflow_vc1  : slv(31 downto 0);
    loc_oflow_vc2  : slv(31 downto 0);
    loc_oflow_vc3  : slv(31 downto 0);
    loc_pause_vc0  : slv(31 downto 0);
    loc_pause_vc1  : slv(31 downto 0);
    loc_pause_vc2  : slv(31 downto 0);
    loc_pause_vc3  : slv(31 downto 0);
    tx_frame_error : slv(31 downto 0);
    tx_frames      : slv(31 downto 0);
    image_sent     : slv(31 downto 0);
    image_trunc    : slv(31 downto 0);
    image_disc     : slv(31 downto 0);
    opcode_cnt     : slv(31 downto 0);
    opcode_last    : slv(31 downto 0);
    notice_cnt     : slv(31 downto 0);
    notice_last    : slv(31 downto 0);
    pgpRxOut       : Pgp2bRxOutType;
    pgpTxOut       : Pgp2bTxOutType;
  end record CounterType;

  constant COUNTER_INIT_C : CounterType := (
    cell_error     => (others => '0'),
    link_down      => (others => '0'),
    link_error     => (others => '0'),
    rem_oflow_vc0  => (others => '0'),
    rem_oflow_vc1  => (others => '0'),
    rem_oflow_vc2  => (others => '0'),
    rem_oflow_vc3  => (others => '0'),
    rem_pause_vc0  => (others => '0'),
    rem_pause_vc1  => (others => '0'),
    rem_pause_vc2  => (others => '0'),
    rem_pause_vc3  => (others => '0'),
    rx_frame_error => (others => '0'),
    rx_frames      => (others => '0'),
    loc_oflow_vc0  => (others => '0'),
    loc_oflow_vc1  => (others => '0'),
    loc_oflow_vc2  => (others => '0'),
    loc_oflow_vc3  => (others => '0'),
    loc_pause_vc0  => (others => '0'),
    loc_pause_vc1  => (others => '0'),
    loc_pause_vc2  => (others => '0'),
    loc_pause_vc3  => (others => '0'),
    tx_frame_error => (others => '0'),
    tx_frames      => (others => '0'),
    image_sent     => (others => '0'),
    image_trunc    => (others => '0'),
    image_disc     => (others => '0'),
    opcode_cnt     => (others => '0'),
    opcode_last    => (others => '0'),
    notice_cnt     => (others => '0'),
    notice_last    => (others => '0'),
    pgpRxOut       => PGP2B_RX_OUT_INIT_C,
    pgpTxOut       => PGP2B_TX_OUT_INIT_C);

  signal r   : CounterType := COUNTER_INIT_C;
  signal rin : CounterType;
   
  -- counter reset signal
  signal statusReset      : std_logic;
   
  -- block ram interface signals
  signal memWrClk  : std_logic;
  signal memWrEn   : std_logic; 
  signal memWrEnV  : std_logic_vector(0 downto 0); 
  signal memWrAddr : std_logic_vector( 9 downto 0);
  signal memWrData : std_logic_vector(31 downto 0);
  signal memRdClk  : std_logic;
  signal memRdAddr : std_logic_vector( 9 downto 0);
  signal memRdData : std_logic_vector(31 downto 0);

begin

  StatusRst_Inst : entity work.RstSync
    generic map (
      IN_POLARITY_G  => '1',
      OUT_POLARITY_G => '1')
    port map (
      clk      => pgpClk,
      asyncRst => StatusRst,
      syncRst  => statusReset);
  
  ----------------------------------------------------------------------------
  -- Block Memory
  ----------------------------------------------------------------------------
  memWrClk    <= PgpClk;
  memRdClk    <= StatusClk;
  statusReg   <= memRdData;
  memRdAddr   <= StatusAddr(9 downto 0);
  memWrEnV(0) <= memWrEn;
  
  U_status_block_mem : entity work.k7_status_block_mem
    port map (
      clka  => memWrClk,
      wea   => memWrEnV,
      addra => memWrAddr,
      dina  => memWrData,
      clkb  => memRdClk,
      rstb  => StatusRst,
      addrb => memRdAddr,
      doutb => memRdData);
  
  ----------------------------------------------------------------------------
  -- Update Machine
  ----------------------------------------------------------------------------
  process (PgpClk, PgpRst)
  begin
    if PgpRst = '1' then
      registerCounter <=  (others => '0');
    elsif rising_edge(PgpClk) then
      if registerCounter /= REG_MAX_ADDR then
        registerCounter <= registerCounter + 1;
      else
        registerCounter <= x"000";
      end if;
    end if;
  end process;

  process (registerCounter, r, pgpTxOut, pgpRxOut, dataFormat)
  begin
    memWrEn   <= '0';
    memWrData <= (others => '0');
    memWrAddr <= (others => '0');
    case registerCounter is
      when x"000" => 
        memWrEn   <= '1';
        memWrAddr <= VERSION_ADDR;
        memWrData(31 downto 12) <= (others => '0');
        memWrData(11 downto  0) <= LSST_SCI_VERSION;
      when x"001" =>
        memWrEn <= '1';
        memWrAddr <= LNKSTAT_ADDR;
        memWrData <= "0000" &
                     pgpTxOut.locOverflow & pgpRxOut.remOverflow
                     & pgpTxOut.locPause & pgpRxOut.remPause
                     & "00" & pgpRxOut.linkPolarity
                     & "000" & pgpTxOut.linkReady
                     & pgpRxOut.remLinkReady & pgpRxOut.linkReady
                     & pgpTxOut.phyTxReady & pgpRxOut.phyRxReady;
      when x"002" =>
        memWrEn <= '1';
        memWrAddr <= REM_DATA_ADDR;
        memWrData <= x"000000" & pgpRxOut.remLinkData;
      when x"003" =>
        memWrEn <= '1';
        memWrAddr <= CERR_CNT_ADDR;
        memWrData <= r.cell_error; 
      when x"004" =>
        memWrEn <= '1';
        memWrAddr <= LDWN_CNT_ADDR;
        memWrData <= r.link_down;
      when x"005" =>
        memWrEn <= '1';
        memWrAddr <= LERR_CNT_ADDR;
        memWrData <= r.link_error;
      when x"006" =>
        memWrEn <= '1'; 
        memWrAddr <= REM_OFLOW_VC0_ADDR;
        memWrData <= r.rem_oflow_vc0;
      when x"007" =>
        memWrEn <= '1';
        memWrAddr <= REM_OFLOW_VC1_ADDR;
        memWrData <= r.rem_oflow_vc1;
      when x"008" =>
        memWrEn <= '1';
        memWrAddr <= REM_OFLOW_VC2_ADDR;
        memWrData <= r.rem_oflow_vc2;
      when x"009" =>
        memWrEn <= '1';
        memWrAddr <= REM_OFLOW_VC3_ADDR;
        memWrData <= r.rem_oflow_vc3;
      when x"00A" =>
        memWrEn <= '1'; 
        memWrAddr <= REM_PAUSE_VC0_ADDR;
        memWrData <= r.rem_pause_vc0;
      when x"00B" =>
        memWrEn <= '1';
        memWrAddr <= REM_PAUSE_VC1_ADDR;
        memWrData <= r.rem_pause_vc1;
      when x"00C" =>
        memWrEn <= '1';
        memWrAddr <= REM_PAUSE_VC2_ADDR;
        memWrData <= r.rem_pause_vc2;
      when x"00D" =>
        memWrEn <= '1';
        memWrAddr <= REM_PAUSE_VC3_ADDR;
        memWrData <= r.rem_pause_vc3;
      when x"00E" =>
        memWrEn <= '1';
        memWrAddr <= RX_ERR_CNT_ADDR;
        memWrData <= r.rx_frame_error;
      when x"00F" =>
        memWrEn <= '1';
        memWrAddr <= RX_CNT_ADDR;
        memWrData <= r.rx_frames;
      when x"010" =>
        memWrEn <= '1'; 
        memWrAddr <= LOC_OFLOW_VC0_ADDR;
        memWrData <= r.loc_oflow_vc0;
      when x"011" =>
        memWrEn <= '1';
        memWrAddr <= LOC_OFLOW_VC1_ADDR;
        memWrData <= r.loc_oflow_vc1;
      when x"012" =>
        memWrEn <= '1';
        memWrAddr <= LOC_OFLOW_VC2_ADDR;
        memWrData <= r.loc_oflow_vc2;
      when x"013" =>
        memWrEn <= '1';
        memWrAddr <= LOC_OFLOW_VC3_ADDR;
        memWrData <= r.loc_oflow_vc3;
      when x"014" =>
        memWrEn <= '1'; 
        memWrAddr <= LOC_PAUSE_VC0_ADDR;
        memWrData <= r.loc_pause_vc0;
      when x"015" =>
        memWrEn <= '1';
        memWrAddr <= LOC_PAUSE_VC1_ADDR;
        memWrData <= r.loc_pause_vc1;
      when x"016" =>
        memWrEn <= '1';
        memWrAddr <= LOC_PAUSE_VC2_ADDR;
        memWrData <= r.loc_pause_vc2;
      when x"017" =>
        memWrEn <= '1';
        memWrAddr <= LOC_PAUSE_VC3_ADDR;
        memWrData <= r.loc_pause_vc3;
      when x"018" =>
        memWrEn <= '1';
        memWrAddr <= TX_ERR_CNT_ADDR;
        memWrData <= r.tx_frame_error;
      when x"019" =>
        memWrEn <= '1';
        memWrAddr <= TX_CNT_ADDR;
        memWrData <= r.tx_frames;
      when x"01A" =>
        memWrEn <= '1';
        memWrAddr <= IMAGE_SENT_ADDR;
        memWrData <= r.image_sent;
      when x"01B" =>
        memWrEn <= '1';
        memWrAddr <= IMAGE_DISC_ADDR;
        memWrData <= r.image_disc;
      when x"01C" =>
        memWrEn <= '1';
        memWrAddr <= IMAGE_TRUNC_ADDR;
        memWrData <= r.image_trunc;
      when x"01D" =>
        memWrEn <= '1';
        memWrAddr <= DATA_FORMAT_ADDR;
        memWrData <= x"0000000" & DataFormat;
      when x"01E" =>
        memWrEn <= '1';
        memWrAddr <= OPCODE_CNT_ADDR;
        memWrData <= r.opcode_cnt;
      when x"01F" =>
        memWrEn <= '1';
        memWrAddr <= OPCODE_LAST_ADDR;
        memWrData <= r.opcode_last;
      when x"020" =>
        memWrEn <= '1';
        memWrAddr <= NOTICE_CNT_ADDR;
        memWrData <= r.notice_cnt;
      when x"021" =>
        memWrEn <= '1';
        memWrAddr <= NOTICE_LAST_ADDR;
        memWrData <= r.notice_last;
      when others =>
        memWrEn   <= '0';
        memWrAddr <= (others => '0');
        memWrData <= (others => '0');
    end case;
  end process;
               
  ----------------------------------------------------------------------------
  -- Counters
  ----------------------------------------------------------------------------
   comb : process (statusReset, r, pgpRxOut, pgpTxOut,
                   ImagesSent, ImagesTrunc, ImagesDisc,
                   NoticeSent, NoticeLast) is
     variable v : CounterType;

   begin
     v := r;

     v.pgpRxOut := pgpRxOut;
     v.pgpTxOut := pgpTxOut;
     
     if(statusReset = '1') then
       v := COUNTER_INIT_C;
     else
     
       if(pgpRxOut.cellError = '1') then
         v.cell_error := r.cell_error + 1;
       end if;
  
       if(pgpRxOut.linkDown = '1') then
         v.link_down := r.link_down + 1;
       end if;
  
       if(pgpRxOut.linkError = '1') then
         v.link_error := r.link_error + 1;
       end if;
  
       if(pgpRxOut.remOverflow(0)='1' and r.pgpRxOut.remOverflow(0)='0') then
         v.rem_oflow_vc0 := r.rem_oflow_vc0 + 1;
       end if;
       if(pgpRxOut.remOverflow(1)='1' and r.pgpRxOut.remOverflow(1)='0') then
         v.rem_oflow_vc1 := r.rem_oflow_vc1 + 1;
       end if;
       if(pgpRxOut.remOverflow(2)='1' and r.pgpRxOut.remOverflow(2)='0') then
         v.rem_oflow_vc2 := r.rem_oflow_vc2 + 1;
       end if;
       if(pgpRxOut.remOverflow(3)='1' and r.pgpRxOut.remOverflow(3)='0') then
         v.rem_oflow_vc3 := r.rem_oflow_vc3 + 1;
       end if;
       if(pgpRxOut.remPause(0)='1' and r.pgpRxOut.remPause(0)='0') then
         v.rem_pause_vc0 := r.rem_pause_vc0 + 1;
       end if;
       if(pgpRxOut.remPause(1)='1' and r.pgpRxOut.remPause(1)='0') then
         v.rem_pause_vc1 := r.rem_pause_vc1 + 1;
       end if;
       if(pgpRxOut.remPause(2)='1' and r.pgpRxOut.remPause(2)='0') then
         v.rem_pause_vc2 := r.rem_pause_vc2 + 1;
       end if;
       if(pgpRxOut.remPause(3)='1' and r.pgpRxOut.remPause(3)='0') then
         v.rem_pause_vc3 := r.rem_pause_vc3 + 1;
       end if;
  
       if(pgpRxOut.frameRxErr = '1') then
         v.rx_frame_error := r.rx_frame_error + 1;
       end if;
       if(pgpRxOut.frameRx = '1' or pgpRxOut.frameRxErr = '1') then
         v.rx_frames := r.rx_frames + 1;
       end if;
  
       if(pgpTxOut.locOverflow(0)='1' and r.pgpTxOut.locOverflow(0)='0') then
         v.loc_oflow_vc0 := r.loc_oflow_vc0 + 1;
       end if;
       if(pgpTxOut.locOverflow(1)='1' and r.pgpTxOut.locOverflow(1)='0') then
         v.loc_oflow_vc1 := r.loc_oflow_vc1 + 1;
       end if;
       if(pgpTxOut.locOverflow(2)='1' and r.pgpTxOut.locOverflow(2)='0') then
         v.loc_oflow_vc2 := r.loc_oflow_vc2 + 1;
       end if;
       if(pgpTxOut.locOverflow(3)='1' and r.pgpTxOut.locOverflow(3)='0') then
         v.loc_oflow_vc3 := r.loc_oflow_vc3 + 1;
       end if;
       if(pgpTxOut.locPause(0)='1' and r.pgpTxOut.locPause(0)='0') then
         v.loc_pause_vc0 := r.loc_pause_vc0 + 1;
       end if;
       if(pgpTxOut.locPause(1)='1' and r.pgpTxOut.locPause(1)='0') then
         v.loc_pause_vc1 := r.loc_pause_vc1 + 1;
       end if;
       if(pgpTxOut.locPause(2)='1' and r.pgpTxOut.locPause(2)='0') then
         v.loc_pause_vc2 := r.loc_pause_vc2 + 1;
       end if;
       if(pgpTxOut.locPause(3)='1' and r.pgpTxOut.locPause(3)='0') then
         v.loc_pause_vc3 := r.loc_pause_vc3 + 1;
       end if;

       if(pgpTxOut.frameTxErr = '1') then
         v.tx_frame_error := r.tx_frame_error + 1;
       end if;
       if(pgpTxOut.frameTx = '1' or pgpTxOut.frameTxErr = '1') then
         v.tx_frames := r.tx_frames + 1;
       end if;
       
       if(ImagesSent = '1') then
         v.image_sent := r.image_sent + 1;
       end if;
       if(ImagesTrunc = '1') then
         v.image_trunc := r.image_trunc + 1;
       end if;
       if(ImagesDisc = '1') then
         v.image_disc := r.image_disc + 1;
       end if;

       if(pgpRxOut.opCodeEn = '1') then
         v.opcode_cnt := r.opcode_cnt + 1;
         v.opcode_last := x"000000" & pgpRxOut.opCode;
       end if;

       if(NoticeSent = '1') then
         v.notice_cnt := r.notice_cnt + 1;
         v.notice_last := NoticeLast;
       end if;
     end if;

     rin <= v;
     
   end process comb;

   seq : process(pgpClk) is
   begin
     if(rising_edge(pgpClk)) then
       r <= rin after TPD_G;
     end if;
   end process seq;
     
end LsstSciStatusBlock;
