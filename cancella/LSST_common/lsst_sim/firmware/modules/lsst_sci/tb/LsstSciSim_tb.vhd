-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

use std.textio.all;
use IEEE.std_logic_textio.all;
  
use work.LsstSciPackage.all;

ENTITY sim_testbench IS
END sim_testbench;

ARCHITECTURE behavior OF sim_testbench IS 
  
  -- Constants
  constant TPD_G              : time := 1 ns;
  constant WRITE_CLK_PERIOD_C : time := 10 ns;
  constant READ_CLK_PERIOD_C  : time := 5.5 ns;
  

  signal usrRst  : std_logic;
  signal usrClk  : std_logic;

  signal dataClk  : std_logic;
  signal dataWrEn : std_logic;
  signal dataIn   : std_logic_vector(17 downto 0);
  signal dataSOT  : std_logic;
  signal dataEOT  : std_logic;
  
  signal frameReset : std_logic;
  signal frameClk : std_logic;
  signal frameValid : std_logic;
  signal frameSOF   : std_logic;
  signal frameEOF   : std_logic;
  signal frameEOFE  : std_logic;
  signal frameData  : std_logic_vector(15 downto 0);

  signal regReq : std_logic;
  signal regOp  : std_logic;
  signal regAddr : std_logic_vector(23 downto 0);
  signal regDataWr : std_logic_vector(31 downto 0);
  
  signal imagesSent  : std_logic_vector(31 downto 0);
  signal imagesDisc  : std_logic_vector(31 downto 0);
  signal imagesTrunc : std_logic_vector(31 downto 0);
  signal dataFormat  : std_logic_vector( 3 downto 0);

  signal counter : std_logic_vector(31 downto 0);
  
BEGIN
  
  -- Generate clocks and resets
  ClkRst_Write : entity work.ClkRst
    generic map (
      CLK_PERIOD_G      => WRITE_CLK_PERIOD_C,
      RST_START_DELAY_G => 0 ns,     -- Wait this long into simulation before assertingg reset
      RST_HOLD_TIME_G   => 50 ns)  -- Hold reset for this long)
    port map (
      clkP => usrClk,
      clkN => open,
      rst  => usrRst,
      rstL => open); 
  
  ClkRst_Read : entity work.ClkRst
    generic map (
      CLK_PERIOD_G      => READ_CLK_PERIOD_C,
      RST_START_DELAY_G => 0 ns,     -- Wait this long into simulation before assertinggg reset
      RST_HOLD_TIME_G   => 200 ns)  -- Hold reset for this long)
    port map (
      clkP => frameClk,
      clkN => open,
      rst  => frameReset,
      rstL => open); 

  process (usrClk)
  begin
    if(usrRst = '1' or frameReset = '1') then
      counter <= (others => '0');
    elsif rising_edge(usrClk) then
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
      regAddr <= x"700000";
      regDataWr <= x"00000001";
    elsif (counter<7) then
      regReq <= '1';
      regOp  <= '1';
      regAddr <= x"70000c";
      regDataWr <= x"00000002";
    else
      regReq <= '0';
      regOp  <= '0';
      regAddr <= x"000000";
      regDataWr <= x"00000000";
    end if;
  end process;
 
  -- Component Instantiation
  uut_simulator : entity work.RaftDataSim
    generic map (
      XIL_DEVICE_G => "VIRTEX5"
    )
    port map (
      usrClk    => usrClk,
      usrRst    => usrRst,
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
      raftClk   => dataClk,
      raftData  => dataIn
    );

  uut_encoder: entity work.LsstSciDataEncoder
    generic map (
      --RAFT_DATA_CONVERSION => "ZERO_EXTEND_32",
      --RAFT_DATA_CONVERSION => "TRUNC_LOW_2",
      RAFT_DATA_CONVERSION => "18B_PACK",
      PGP_FRAME_SIZE => x"0001bdcc",
      XIL_DEVICE_G =>  "VIRTEX5"
    )
    PORT MAP(
      DataClk      => dataClk,
      DataWrEn     => dataWrEn,
      DataSOT      => dataSOT,
      DataEOT      => dataEOT,
      DataIn       => dataIn,
      FrameClk     => frameClk,
      FrameRst     => frameReset,
      FrameTxValid => frameValid,
      FrameTxSOF   => frameSOF,
      FrameTxEOF   => frameEOF,
      FrameTxEOFE  => frameEOFE,
      FrameTxData  => frameData,
      FrameTxAFull => '0',
      ImagesSent   => imagesSent,
      ImagesDisc   => imagesDisc,
      ImagesTrunc  => imagesTrunc,
      DataFormat   => dataFormat
    );    

  process(frameClk, frameValid, frameSOF, frameEOF, frameEOFE, frameData)
    variable my_line : line;
  begin
    if rising_edge(frameClk) then
      if(frameValid = '1') then
        hwrite(my_line, frameData);
        if(frameSOF = '1') then
          write(my_line, " SOF");
        end if;
        if(frameEOF = '1') then
          write(my_line, " EOF");
        end if;
        if(frameEOFE = '1') then
          write(my_line, " EOFE");
        end if;
        writeline(output, my_line);
      end if;
    end if;
  end process;
    
  
END;
