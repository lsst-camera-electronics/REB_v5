library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
Library UNISIM;
use UNISIM.vcomponents.all;

entity SpiFlashProgrammer_TB is
end SpiFlashProgrammer_TB;

architecture behavioral of SpiFlashProgrammer_TB is

  component SpiFlashProgrammer is
  port
  (
    inClk               : in  std_logic;
    inReset_EnableB     : in  std_logic;
    inCheckIdOnly       : in  std_logic;
    inVerifyOnly        : in  std_logic;
    inData32            : in  std_logic_vector(31 downto 0);
    inDataWriteEnable   : in  std_logic;
    outReady_BusyB      : out std_logic;
    outDone             : out std_logic;
    outError            : out std_logic;
    outErrorIdcode      : out std_logic;
    outErrorErase       : out std_logic;
    outErrorProgram     : out std_logic;
    outErrorTimeOut     : out std_logic;
    outErrorCrc         : out std_logic;
    outStarted          : out std_logic;
    outInitializeOK     : out std_logic;
    outCheckIdOK        : out std_logic;
    outEraseSwitchWordOK: out std_logic;
    outEraseOK          : out std_logic;
    outProgramOK        : out std_logic;
    outVerifyOK         : out std_logic;
    outProgramSwitchWordOK: out std_logic;

    -- Signals for SpiSerDes - Connect to instance of SpiSerDes
    outSSDReset_EnableB : out std_logic;
    outSSDStartTransfer : out std_logic;
    inSSDTransferDone   : in  std_logic;
    outSSDData8Send     : out std_logic_vector(7 downto 0);
    inSSDData8Receive   : in  std_logic_vector(7 downto 0)
  );
  end component SpiFlashProgrammer;
  
  component SpiFlashProgrammer_multiboot is
  port
  (
    inClk               : in  std_logic;
    inReset_EnableB     : in  std_logic;
    inCheckIdOnly       : in  std_logic;
    inVerifyOnly        : in  std_logic;
	 inStartProg 			: in std_logic;
	 inDaqDone				: in std_logic;
	 inImageSel				: in  std_logic_vector(1 downto 0);
    inData32            : in  std_logic_vector(31 downto 0);
    inDataWriteEnable   : in  std_logic;
    outReady_BusyB      : out std_logic;
    outDone             : out std_logic;
    outError            : out std_logic;
    outErrorIdcode      : out std_logic;
    outErrorErase       : out std_logic;
    outErrorProgram     : out std_logic;
    outErrorTimeOut     : out std_logic;
    outErrorAddSel      : out std_logic;
    outStarted          : out std_logic;
    outInitializeOK     : out std_logic;
    outCheckIdOK        : out std_logic;
    outEraseOK          : out std_logic;
    outProgramOK        : out std_logic;
    outVerifyOK         : out std_logic;

    -- Signals for SpiSerDes - Connect to instance of SpiSerDes
    outSSDReset_EnableB : out std_logic;
    outSSDStartTransfer : out std_logic;
    inSSDTransferDone   : in  std_logic;
    outSSDData8Send     : out std_logic_vector(7 downto 0);
    inSSDData8Receive   : in  std_logic_vector(7 downto 0)
  );
  end component SpiFlashProgrammer_multiboot;

  component SpiSerDes is
  port
  (
    inClk           : in  std_logic;
    inReset_EnableB : in  std_logic;
    inStartTransfer : in  std_logic;
    outTransferDone : out std_logic;
    inData8Send     : in  std_logic_vector(7 downto 0);
    outData8Receive : out std_logic_vector(7 downto 0);
    outSpiCsB       : out std_logic;
    outSpiClk       : out std_logic;
    outSpiMosi      : out std_logic;
    inSpiMiso       : in  std_logic
  );
  end component SpiSerDes;

  component N25Qxxx is
  port
  (
    S         : in std_logic;
    C         : in std_logic;
    HOLD_DQ3  : inout std_logic;
    DQ0       : inout std_logic;
    DQ1       : inout std_logic;
    Vcc       : in std_logic_vector(31 downto 0);
    Vpp_W_DQ2 : inout std_logic
  );
  end component N25Qxxx;
  
  COMPONENT data_fifo
  PORT (
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

-- fifo signals
	signal wr_clk  : std_logic := '1';
	signal din		: std_logic_vector(31 downto 0);
	signal wr_en   : std_logic := '0';
	signal fifo_full : std_logic;
	signal fifo_empty : std_logic;

  signal  inClk               : std_logic := '1';
  signal  inCheckIdOnly       : std_logic;
  signal  inVerifyOnly        : std_logic;
  signal  inStartProg 			: std_logic := '0';
  signal  inDaqDone				: std_logic := '0';
  signal  inReset_EnableB     : std_logic;
  signal  outReady_BusyB      : std_logic;
  signal  inImageSel				: std_logic_vector(1 downto 0);
  signal  inData32            : std_logic_vector(31 downto 0);
  signal  inDataWriteEnable   : std_logic;
  signal  outSpiCsB           : std_logic;
  signal  outSpiClk           : std_logic;
  signal  outSpiMosi          : std_logic;
  signal  inSpiMiso           : std_logic;
  signal  outDone             : std_logic;
  signal  outError            : std_logic;
  signal  outErrorIdcode      : std_logic;
  signal  outErrorErase       : std_logic;
  signal  outErrorProgram     : std_logic;
  signal  outErrorTimeOut     : std_logic;
  signal  outErrorCrc         : std_logic;
  signal  outErrorAddSel      : std_logic;
  signal  outStarted          : std_logic;
  signal  outInitializeOK     : std_logic;
  signal  outCheckIdOK        : std_logic;
  signal  outEraseSwitchWordOK: std_logic;
  signal  outEraseOK          : std_logic;
  signal  outProgramOK        : std_logic;
  signal  outVerifyOK         : std_logic;
  signal  outProgramSwitchWordOK: std_logic;
  signal  outSpiWpB           : std_logic;
  signal  outSpiHoldB         : std_logic := '1';
  signal  spiVcc              : std_logic_vector(31 downto 0) := X"00000CE4";

  signal  intSSDReset_EnableB : std_logic;
  signal  intSSDStartTransfer : std_logic;
  signal  intSSDTransferDone  : std_logic;
  signal  intSSDData8Send     : std_logic_vector(7 downto 0);
  signal  intSSDData8Receive  : std_logic_vector(7 downto 0);


--  signal I : integer := 0;
--  signal J : integer := 0;

  constant  tWrClkPeriod     	: time := 6.5 ns;
  constant  tHalfWrClkPeriod  : time := tWrClkPeriod / 2;
  constant  tClkPeriod        : time := 10 ns;
  constant  tHalfClkPeriod    : time := tClkPeriod / 2;
  constant  tFpgaClkToData    : time := 1 ns;
  constant  tDataToNextClk    : time := 9 ns;
  constant  tStrobe           : time := 9 ns;
  constant  tStrobeToNextClk  : time := 1 ns;
  constant  tPowerup           : time := 1 ms;
begin

--  iSpiFlashProgrammer: SpiFlashProgrammer
--  port map
--  (
--    inClk               => inClk,
--    inReset_EnableB     => inReset_EnableB,
--    inCheckIdOnly       => inCheckIdOnly,
--    inVerifyOnly        => inVerifyOnly,
--    inData32            => inData32,
--    inDataWriteEnable   => inDataWriteEnable,
--    outReady_BusyB      => outReady_BusyB,
--    outDone             => outDone,
--    outError            => outError,
--    outErrorIdcode      => outErrorIdcode,
--    outErrorErase       => outErrorErase,
--    outErrorProgram     => outErrorProgram,
--    outErrorTimeOut     => outErrorTimeOut,
--    outErrorCrc         => outErrorCrc,
--    outStarted          => outStarted,
--    outInitializeOK     => outInitializeOK,
--    outCheckIdOK        => outCheckIdOK,
--    outEraseSwitchWordOK=> outEraseSwitchWordOK,
--    outEraseOK          => outEraseOK,
--    outProgramOK        => outProgramOK,
--    outVerifyOK         => outVerifyOK,
--    outProgramSwitchWordOK=> outProgramSwitchWordOK,
--    outSSDReset_EnableB => intSSDReset_EnableB,
--    outSSDStartTransfer => intSSDStartTransfer,
--    inSSDTransferDone   => intSSDTransferDone,
--    outSSDData8Send     => intSSDData8Send,
--    inSSDData8Receive   => intSSDData8Receive
--  );

bitstream_fifo : data_fifo
  PORT MAP (
    wr_clk => wr_clk,
    rd_clk => inClk,
    din => din,
    wr_en => wr_en,
    rd_en => outReady_BusyB,
    dout => inData32,
    full => fifo_full,
    empty => fifo_empty
  );

inDataWriteEnable <= not fifo_empty;

  iSpiFlashProgrammer: SpiFlashProgrammer_multiboot
  port map
  (
    inClk               => inClk,
    inReset_EnableB     => inReset_EnableB,
    inCheckIdOnly       => inCheckIdOnly,
    inVerifyOnly        => inVerifyOnly,
	 inStartProg 			=> inStartProg,
	 inDaqDone				=> inDaqDone,
	 inImageSel				=> inImageSel,
    inData32            => inData32,
    inDataWriteEnable   => inDataWriteEnable,
    outReady_BusyB      => outReady_BusyB,
    outDone             => outDone,
    outError            => outError,
    outErrorIdcode      => outErrorIdcode,
    outErrorErase       => outErrorErase,
    outErrorProgram     => outErrorProgram,
    outErrorTimeOut     => outErrorTimeOut,
    outErrorAddSel      => outErrorAddSel,
    outStarted          => outStarted,
    outInitializeOK     => outInitializeOK,
    outCheckIdOK        => outCheckIdOK,
    outEraseOK          => outEraseOK,
    outProgramOK        => outProgramOK,
    outVerifyOK         => outVerifyOK,
    outSSDReset_EnableB => intSSDReset_EnableB,
    outSSDStartTransfer => intSSDStartTransfer,
    inSSDTransferDone   => intSSDTransferDone,
    outSSDData8Send     => intSSDData8Send,
    inSSDData8Receive   => intSSDData8Receive
  );


  iSpiSerDes: SpiSerDes port map
  (
    inClk           => inClk,
    inReset_EnableB => intSSDReset_EnableB,
    inStartTransfer => intSSDStartTransfer,
    outTransferDone => intSSDTransferDone,
    inData8Send     => intSSDData8Send,
    outData8Receive => intSSDData8Receive,
    outSpiCsB       => outSpiCsB,
    outSpiClk       => outSpiClk,
    outSpiMosi      => outSpiMosi,
    inSpiMiso       => inSpiMiso
  );

  iN25Qxxx : N25Qxxx
  port map
  (
    S         => outSpiCsB,
    C         => outSpiClk,
    HOLD_DQ3  => outSpiHoldB,
    DQ0       => outSpiMosi,
    DQ1       => inSpiMiso,
    Vcc       => spiVcc,
    Vpp_W_DQ2 => outSpiWpB
  );

  wr_clk <= not wr_clk after(tHalfWrClkPeriod);
  inClk  <= not inClk after (tHalfClkPeriod);

  stimulus : process
  begin
    inReset_EnableB   <= '1';
	 wait for 100 ns;
	 inReset_EnableB   <= '0';
	 
    inCheckIdOnly     <= '0';
    inVerifyOnly      <= '0';
    din          <= X"00000000";
--    inDataWriteEnable <= '0';
	 
	 inImageSel			 <= "01";
	 

    --wait for powerup; -- Need this for real N25Qxxx sim model
    --spiVcc                <= X"00000000";
    --wait for tClkPeriod * 2;
    --spiVcc                <= X"00000CE4";
    --wait for tPowerup;

    wait for tClkPeriod;
    wait for tStrobe;
    assert outDone = '0'  report "SFP Done expected 0" severity note;
    assert outError = '0' report "Error expected 0" severity note;
    wait for tStrobeToNextClk;

    -- CHECK ID Only
    wait for tClkPeriod;
    wait for tHalfClkPeriod;
    inCheckIdOnly   <= '1';
	 inStartProg <= '1';
	 wait for tClkPeriod;
	 inStartProg <= '0';
	 
    wait for tHalfClkPeriod;
    wait for tClkPeriod;

    wait for tClkPeriod * 90;
    wait for tFpgaClkToData;

    inCheckIdOnly   <= '0';
    wait for tDataToNextClk;

    wait for tClkPeriod * 10;

    -- VERIFY Only - Partial
    wait for tClkPeriod;
    wait for tHalfClkPeriod;
    inVerifyOnly    <= '1';
   
    wait for tHalfClkPeriod;
    wait for tClkPeriod;
	 
	  wait for 100 ns;
	 inStartProg <= '1';
	 wait for tClkPeriod;
	 inStartProg <= '0';

    wait for tClkPeriod * 500;
    wait for tFpgaClkToData;
	 inReset_EnableB <= '1';
    inVerifyOnly    <= '0';
    wait for tDataToNextClk;

    wait for tClkPeriod * 10;
	 inReset_EnableB <= '0';

    -- PROGRAM
    wait for tFpgaClkToData;
   
    wait for tDataToNextClk;
	 
	  wait for 100 ns;
	 inStartProg <= '1';
	 wait for tClkPeriod;
	 inStartProg <= '0';

--    wait for tClkPeriod * 420;

--    for J in 0 to 255 loop
--      for I in 0 to 63 loop
--        wait for tFpgaClkToData;
--        inData32          <= std_logic_vector(to_unsigned(I,32));
--        wait for tClkPeriod * 40;
--        inDataWriteEnable <= '1';
--        wait for tClkPeriod;
--        inDataWriteEnable <= '0';
--        wait for tDataToNextClk;
--      end loop;
--
--      wait for tClkPeriod * 60;
--    end loop;

		for J in 0 to 266 loop
			if fifo_empty /= '1' then
					wait until fifo_empty = '1';
			end if;
			for I in 0 to 63 loop
				wait until wr_clk'event and wr_clk = '1';
				wr_en <= '1';
				din          <= std_logic_vector(to_unsigned(I,32));
			end loop;
			wait until wr_clk'event and wr_clk = '1';
			wr_en <= '0';
    end loop;
	 
	 inDaqDone <= '1';

    wait for tFpgaClkToData;
--    inReset_EnableB       <= '1';
    wait for tDataToNextClk;


    wait;

  end process stimulus;

end architecture behavioral;

