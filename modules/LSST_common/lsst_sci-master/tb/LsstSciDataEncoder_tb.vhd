-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

use std.textio.all;
use IEEE.std_logic_textio.all;

use work.AxiStreamPkg.all;

use work.LsstSciPackage.all;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 
  
  -- Constants
  constant TPD_G              : time := 1 ns;
  constant SYS_CLK_PERIOD_C   : time := 10 ns;
  
  signal testDataReset : std_logic;
  signal testDataClk   : std_logic;
  
  signal sysRst  : std_logic;
  signal sysClk  : std_logic;

  signal dataWrEn : std_logic;
  signal dataIn   : std_logic_vector(17 downto 0);
  signal dataSOT  : std_logic;
  signal dataEOT  : std_logic;

  signal sAxisMaster : AxiStreamMasterType;
  signal sAxisSlave  : AxiStreamSlaveType;

  signal simData  : std_logic_vector(17 downto 0);
  signal simDataAdv : std_logic;
  signal stopData : std_logic;
  signal lastPixel : std_logic;
  signal go : std_logic;
  
  type state_type is (IDLE, SOT, SEND, EOT);
  signal state, state_next : state_type;

  signal imagesSent  : std_logic_vector(31 downto 0);
  signal imagesDisc  : std_logic_vector(31 downto 0);
  signal imagesTrunc : std_logic_vector(31 downto 0);
  signal dataFormat  : std_logic_vector( 3 downto 0);
  
BEGIN
  
  -- Generate clocks and resets
  ClkRst_Sys : entity work.ClkRst
    generic map (
      CLK_PERIOD_G      => SYS_CLK_PERIOD_C,
      RST_START_DELAY_G => 0 ns,     -- Wait this long into simulation before assertingg reset
      RST_HOLD_TIME_G   => 10 ns)  -- Hold reset for this long)
    port map (
      clkP => sysClk,
      clkN => open,
      rst  => sysRst,
      rstL => open); 
  
  ClkRst_Data : entity work.ClkRst
    generic map (
      CLK_PERIOD_G      => SYS_CLK_PERIOD_C,
      RST_START_DELAY_G => 0 ns,     -- Wait this long into simulation before assertinggg reset
      RST_HOLD_TIME_G   => 200 ns)  -- Hold reset for this long)
    port map (
      clkP => testDataClk,
      clkN => open,
      rst  => testDataReset,
      rstL => open); 
  
  process(sysClk, sysRst, testDataReset, stopData)
  begin
    if rising_edge(sysClk) then
      if (sysRst = '1' or testDataReset = '1' or stopData = '1') then
        simData <= "00" & x"0001" after TPD_G;
        go <= '0' after TPD_G;
      else
        go <= '1' after TPD_G;
        if(simDataAdv = '1') then
          simData <= simData + 1 after TPD_G;
        end if;
      end if;
    end if;
  end process;


  process(sysClk)
  begin
    if (sysRst = '1') then
      state   <= IDLE after TPD_G;
    elsif rising_edge(sysClk) then
      state <= state_next after TPD_G;
    end if;
  end process;

  stopData <= '1' when dataEOT = '1' or stopData = '1' else '0';
  lastPixel <= '1' when simData = x"20" else '0';

  process (state, go, lastPixel, simData)
  begin
    dataSOT <=  '0';
    dataEOT <=  '0';
    dataWrEn <= '0';
    dataIn <= (others => '0');
    simDataAdv  <= '0';
    
    case state is
      when IDLE =>
        if(go = '1') then
          state_next <= SOT;
        else
          state_next <= IDLE;
        end if;
      when SOT =>
        dataSOT <= '1';
        dataWrEn <= '1';
        state_next <= SEND;
      when SEND =>
        dataWrEn <= '1';
        simDataAdv <= '1';
        dataIn <= simData;
        if (lastPixel = '1') then
          state_next <= EOT;
        else
          state_next <= SEND;
        end if;
      when EOT =>
        dataEOT <= '1';
        dataWrEn <= '1';
        state_next <= IDLE;
    end case;
  end process;
        
  
  -- Component Instantiation
  uut: entity work.LsstSciDataEncoder
    generic map (
      --RAFT_DATA_CONVERSION => "ZERO_EXTEND_32"
      --RAFT_DATA_CONVERSION => "TRUNC_LOW_2"
      RAFT_DATA_CONVERSION => "18B_PACK"
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

  sAxisSlave <= AXI_STREAM_SLAVE_FORCE_C;
  sAxisCtrl <= AXI_STREAM_CTRL_UNUSED_C;
  
END;
