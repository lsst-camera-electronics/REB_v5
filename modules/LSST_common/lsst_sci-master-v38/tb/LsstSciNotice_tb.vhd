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

  signal noticeEn : std_logic;
  signal notice:    std_logic_vector(31 downto 0);
  signal noticeSent : std_logic;
  signal noticeLast:    std_logic_vector(31 downto 0);

  signal mAxisMaster : AxiStreamMasterType;
  signal mAxisSlave  : AxiStreamSlaveType;
  
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
      mAxisMaster <= AXI_STREAM_MASTER_INIT_C;
      noticeEn <= '0';
      notice <= (others => '0');
    elsif rising_edge(sysClk) then
      counter <= counter + 1 after TPD_G;
    end if;
  end process;

  process (counter)
  begin
    if(counter < 5) then
      noticeEn <= '1';
      notice <= x"12345678";
    elsif (counter<6) then
      noticeEn <= '1';
      notice <= x"87654321";

    elsif (counter<7) then
      noticeEn <= '1';
      notice <= x"ABADCAFE";

    elsif (counter<9) then
      noticeEn <= '1';
      notice <= x"ABADBABE";

    else
      noticeEn <= '0';
      notice <= x"DEADBEEF";
    end if;

  end process;
  
  -- Component Instantiation
  uut_encoder : entity work.LsstSciNoticeEncoder
    port map (
      sysClk => sysClk,
      sysRst => sysRst,
      pgpClk => sysClk,
      pgpRst => sysRst,
      noticeEn => noticeEn,
      notice => notice,
      mAxisMaster => mAxisMaster,
      mAxisSlave => AXI_STREAM_SLAVE_FORCE_C,
      noticeSent => noticeSent,
      noticeLast => noticeLast);

  --sAxisSlave <= AXI_STREAM_SLAVE_FORCE_C;
  --sAxisCtrl <= AXI_STREAM_CTRL_UNUSED_C;

END;
