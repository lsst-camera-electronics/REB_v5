-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

use std.textio.all;
use IEEE.std_logic_textio.all;

use work.AxiStreamPkg.all;

use work.LsstSciPackage.all;

ENTITY sim_testbench IS
END sim_testbench;

ARCHITECTURE behavior OF sim_testbench IS 
  
  -- Constants
  constant TPD_G              : time := 1 ns;
  constant SYS_CLK_PERIOD_C : time := 10 ns;
  

  signal sysRst  : std_logic;
  signal sysClk  : std_logic;

  signal dataWrEn : std_logic;
  signal dataIn   : std_logic_vector(17 downto 0);
  signal dataSOT  : std_logic;
  signal dataEOT  : std_logic;
  
  signal sAxisMaster : AxiStreamMasterType;
  signal sAxisSlave  : AxiStreamSlaveType;
  signal sAxisCtrl   : AxiStreamCtrlType;

  signal regReq : std_logic;
  signal regOp  : std_logic;
  signal regAddr : std_logic_vector(23 downto 0);
  signal regDataWr : std_logic_vector(31 downto 0);
  
  signal imagesSent  : std_logic_vector(31 downto 0);
  signal imagesTrunc : std_logic_vector(31 downto 0);
  signal dataFormat  : std_logic_vector( 3 downto 0);

  signal counter : std_logic_vector(31 downto 0);
  
BEGIN
  
  -- Generate clocks and resets
  ClkRst_Sys : entity work.ClkRst
    generic map (
      CLK_PERIOD_G      => SYS_CLK_PERIOD_C,
      RST_START_DELAY_G => 0 ns,     -- Wait this long into simulation before assertingg reset
      RST_HOLD_TIME_G   => 50 ns)  -- Hold reset for this long)
    port map (
      clkP => sysClk,
      clkN => open,
      rst  => sysRst,
      rstL => open); 
  
  process (sysClk)
  begin
    if(sysRst = '1') then
      counter <= (others => '0');
    elsif rising_edge(sysClk) then
      counter <= counter + 1 after TPD_G;
    end if;
  end process;

  process (counter)
  begin
    if(counter < 5) then
      regReq <= '0';
      regOp  <= '0';
      regAddr <= x"000000";
      regDataWr <= x"00000000";
    elsif (counter<6) then
      regReq <= '1';
      regOp  <= '1';
      regAddr <= x"700001";
      regDataWr <= x"00000003";
    elsif (counter<7) then
      regReq <= '1';
      regOp  <= '1';
      regAddr <= x"700004";
      regDataWr <= x"00000000";
    elsif (counter<9) then
      regReq <= '1';
      regOp  <= '1';
      regAddr <= x"700005";
      regDataWr <= x"03333000";
    elsif (counter<9) then
      regReq <= '1';
      regOp  <= '1';
      regAddr <= x"700006";
      regDataWr <= x"00000010";
    elsif (counter<10) then
      regReq <= '1';
      regOp  <= '1';
      regAddr <= x"700000";
      regDataWr <= x"00000001";
    else
      regReq <= '0';
      regOp  <= '0';
      regAddr <= x"000000";
      regDataWr <= x"00000000";
    end if;

    if (counter>130 and counter<180) then
      sAxisSlave.tReady <= '0';
    else
      sAxisSlave.tReady <= '1';
    end if;
    
    if (counter>100 and counter<200) then
      sAxisCtrl.pause <= '1';
      sAxisCtrl.overflow <= '0';
      sAxisCtrl.idle <= '0';
    else
      sAxisCtrl.pause <= '0';
      sAxisCtrl.overflow <= '0';
      sAxisCtrl.idle <= '0';
    end if;
    

  end process;
 
  -- Component Instantiation
  uut_simulator : entity work.RaftDataSim
    generic map (
      XIL_DEVICE_G => "7SERIES"
    )
    port map (
      usrClk    => sysClk,
      usrRst    => sysRst,
      regReq    => regReq,
      regOp     => regOp,
      regAddr   => regAddr,
      regDataWr => regDataWr,
      regAck    => open,
      regFail   => open,
      regDataRd => open,
      raftWrEn  => dataWrEn,
      raftSOT   => dataSOT,
      raftEOT   => dataEOT,
      raftClk   => open,
      raftData  => dataIn
    );

  uut_encoder: entity work.LsstSciDataEncoder
    generic map (
      --RAFT_DATA_CONVERSION => "ZERO_EXTEND_32"
      RAFT_DATA_CONVERSION => "TRUNC_LOW_2"
      --RAFT_DATA_CONVERSION => "18B_PACK"
    )
    PORT MAP(
      sysClk      => sysClk,
      sysRst      => sysRst,
      dataWrEn     => dataWrEn,
      dataSOT      => dataSOT,
      dataEOT      => dataEOT,
      dataIn       => dataIn,
      sAxisMaster  => sAxisMaster,
      sAxisSlave   => sAxisSlave,
      sAxisCtrl    => sAxisCtrl,
      imagesSent   => imagesSent,
      imagesTrunc  => imagesTrunc,
      dataFormat   => dataFormat
    );    

  --sAxisSlave <= AXI_STREAM_SLAVE_FORCE_C;
  --sAxisCtrl <= AXI_STREAM_CTRL_UNUSED_C;

END;
