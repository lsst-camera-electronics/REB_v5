----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:03:28 14/09/2018 
-- Design Name: 
-- Module Name:    multiboot_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity multiboot_top is

  port (
    -- Clock and control signals
    inBitstreamClk  : in std_logic;
    inSpiClk        : in std_logic;
    inReset_EnableB : in std_logic;
    inCheckIdOnly   : in std_logic;
    inVerifyOnly    : in std_logic;

    -- DAQ signals
    inStartProg : in std_logic;
    inDaqDone   : in std_logic;

    -- Image selector
    inImageSelWe         : in  std_logic;
    inImageSel           : in  std_logic_vector(1 downto 0);
    -- Data
    inBitstreamWe        : in  std_logic;
    inBitstream32        : in  std_logic_vector(31 downto 0);
    outBitstreamFifoFull : out std_logic;

    outStarted   : out std_logic;
    outStatusReg : out std_logic_vector(15 downto 0);

    -- SPI flash ports
    -- outSpiClk is output through STARTUPE2.USRCCLKO
    outSpiCsB   : out std_logic;
    outSpiMosi  : out std_logic;
    inSpiMiso   : in  std_logic;
    outSpiWpB   : out std_logic;        -- SPI flash write protect
    outSpiHoldB : out std_logic
    );


end multiboot_top;

architecture Behaviotal of multiboot_top is

  component SpiFlashProgrammer_multiboot
    port (
      inClk               : in  std_logic;
      inReset_EnableB     : in  std_logic;
      inCheckIdOnly       : in  std_logic;
      inVerifyOnly        : in  std_logic;
      inStartProg         : in  std_logic;
      inDaqDone           : in  std_logic;
      inImageSel          : in  std_logic_vector(1 downto 0);
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
      outErrorBitstmSize  : out std_logic;
      outStarted          : out std_logic;
      outInitializeOK     : out std_logic;
      outCheckIdOK        : out std_logic;
      outEraseOK          : out std_logic;
      outProgramOK        : out std_logic;
      outVerifyOK         : out std_logic;
      outSSDReset_EnableB : out std_logic;
      outSSDStartTransfer : out std_logic;
      inSSDTransferDone   : in  std_logic;
      outSSDData8Send     : out std_logic_vector(7 downto 0);
      inSSDData8Receive   : in  std_logic_vector(7 downto 0));
  end component;

  component SpiSerDes
    port (
      inClk           : in  std_logic;
      inReset_EnableB : in  std_logic;
      inStartTransfer : in  std_logic;
      outTransferDone : out std_logic;
      inData8Send     : in  std_logic_vector(7 downto 0);
      outData8Receive : out std_logic_vector(7 downto 0);
      outSpiCsB       : out std_logic;
      outSpiClk       : out std_logic;
      outSpiMosi      : out std_logic;
      inSpiMiso       : in  std_logic);
  end component;

  component bitfile_fifo_in
    port (
      rst    : in  std_logic;
      wr_clk : in  std_logic;
      rd_clk : in  std_logic;
      din    : in  std_logic_vector(31 downto 0);
      wr_en  : in  std_logic;
      rd_en  : in  std_logic;
      dout   : out std_logic_vector(31 downto 0);
      full   : out std_logic;
      empty  : out std_logic
      );
  end component;

  component generic_reg_ce_init
    generic (
      width : integer);
    port (
      reset    : in  std_logic;
      clk      : in  std_logic;
      ce       : in  std_logic;
      init     : in  std_logic;
      data_in  : in  std_logic_vector(width downto 0);
      data_out : out std_logic_vector(width downto 0));
  end component;

  signal bitstream_fifo_empty : std_logic;
  signal DataWriteEnable      : std_logic;
  signal Ready_BusyB          : std_logic;  -- fifo write enable
  signal Data32               : std_logic_vector(31 downto 0);
  signal ImageSel             : std_logic_vector(1 downto 0);

  signal StartProg      : std_logic;
  signal StartProg_sync : std_logic;

  signal DaqDone      : std_logic;
  signal DaqDone_sync : std_logic;


  -- Status signals
  signal Done            : std_logic;
--  signal error           : std_logic;
  signal ErrorIdcode     : std_logic;
  signal ErrorErase      : std_logic;
  signal ErrorProgram    : std_logic;
  signal ErrorTimeOut    : std_logic;
  signal ErrorAddSel     : std_logic;
  signal ErrorBitstmSize : std_logic;
  signal Started         : std_logic;
  signal InitializeOK    : std_logic;
  signal CheckIdOK       : std_logic;
  signal EraseOK         : std_logic;
  signal ProgramOK       : std_logic;
  signal VerifyOK        : std_logic;
  signal status_int      : std_logic_vector(15 downto 0);
  signal status_reg      : std_logic_vector(15 downto 0);

  -- Signals for SpiSerDes - Connect to instance of SpiSerDes
  signal intspiclk        : std_logic;
  signal SSDReset_EnableB : std_logic;
  signal SSDStartTransfer : std_logic;
  signal SSDTransferDone  : std_logic;
  signal SSDData8Send     : std_logic_vector(7 downto 0);
  signal SSDData8Receive  : std_logic_vector(7 downto 0);

  
begin  -- Behaviotal

  DataWriteEnable <= not bitstream_fifo_empty;

  status_int <= "0000" & '0' & Done & ErrorIdcode & ErrorErase & ErrorProgram & ErrorTimeOut & ErrorAddSel &
                ErrorBitstmSize & InitializeOK & CheckIdOK & EraseOK & ProgramOK;

  outSpiWpB   <= CheckIdOK;             -- SPI flash write protect
  outSpiHoldB <= '1';

  -- sync stages from inBitstreamClk to inSpiClk

  start_sync1 : FD port map (D => inStartProg, C => inSpiClk, Q => StartProg_sync);
  start_sync2 : FD port map (D => StartProg_sync, C => inSpiClk, Q => StartProg);

  done_sync1 : FD port map (D => inDaqDone, C => inSpiClk, Q => DaqDone_sync);
  done_sync2 : FD port map (D => DaqDone_sync, C => inSpiClk, Q => DaqDone);

  bitstream_fifo : bitfile_fifo_in
    port map (
      rst    => inReset_EnableB,
      wr_clk => inBitstreamClk,
      rd_clk => inSpiClk,
      din    => inBitstream32,
      wr_en  => inBitstreamWe,
      rd_en  => Ready_BusyB,
      dout   => Data32,
      full   => outBitstreamFifoFull,
      empty  => bitstream_fifo_empty
      );

  slot_ID_reg : generic_reg_ce_init
    generic map (
      width => 1)
    port map (
      reset    => inReset_EnableB,
      clk      => inBitstreamClk,
      ce       => inImageSelWe,
      init     => '0',
      data_in  => inImageSel,
      data_out => Imagesel
      );

  status_register : generic_reg_ce_init
    generic map (
      width => 15)
    port map (
      reset    => inReset_EnableB,
      clk      => inSpiClk,
      ce       => '1',
      init     => StartProg,
      data_in  => status_int,
      data_out => status_reg
      );

  status_sync_1 : generic_reg_ce_init
    generic map (
      width => 15)
    port map (
      reset    => inReset_EnableB,
      clk      => inBitstreamClk,
      ce       => '1',
      init     => '0',
      data_in  => status_reg,
      data_out => outStatusReg
      );


  SpiFlashProgrammer_multiboot_1 : SpiFlashProgrammer_multiboot
    port map (
      inClk               => inSpiClk,
      inReset_EnableB     => inReset_EnableB,
      inCheckIdOnly       => inCheckIdOnly,
      inVerifyOnly        => inVerifyOnly,
      inStartProg         => StartProg,
      inDaqDone           => DaqDone,
      inImageSel          => ImageSel,
      inData32            => Data32,
      inDataWriteEnable   => DataWriteEnable,
      outReady_BusyB      => Ready_BusyB,
      outDone             => Done,
      outError            => open,
      outErrorIdcode      => ErrorIdcode,
      outErrorErase       => ErrorErase,
      outErrorProgram     => ErrorProgram,
      outErrorTimeOut     => ErrorTimeOut,
      outErrorAddSel      => ErrorAddSel,
      outErrorBitstmSize  => ErrorBitstmSize,
      outStarted          => OutStarted,
      outInitializeOK     => InitializeOK,
      outCheckIdOK        => CheckIdOK,
      outEraseOK          => EraseOK,
      outProgramOK        => ProgramOK,
      outVerifyOK         => VerifyOK,
      outSSDReset_EnableB => SSDReset_EnableB,
      outSSDStartTransfer => SSDStartTransfer,
      inSSDTransferDone   => SSDTransferDone,
      outSSDData8Send     => SSDData8Send,
      inSSDData8Receive   => SSDData8Receive);




  iSpiSerDes : SpiSerDes port map
    (
      inClk           => inSpiClk,
      inReset_EnableB => SSDReset_EnableB,
      inStartTransfer => SSDStartTransfer,
      outTransferDone => SSDTransferDone,
      inData8Send     => SSDData8Send,
      outData8Receive => SSDData8Receive,
      outSpiCsB       => outSpiCsB,
      outSpiClk       => intSpiClk,
      outSpiMosi      => outSpiMosi,
      inSpiMiso       => inSpiMiso
      );

  STARTUPE2_inst : STARTUPE2
    port map (
      CLK       => '0',
      GSR       => '0',  -- 1-bit input: Global Set/Reset input (GSR cannot be used for the port name)
      GTS       => '0',  -- 1-bit input: Global 3-state input (GTS cannot be used for the port name)
      KEYCLEARB => '1',
      PACK      => '1',  -- 1-bit input: PROGRAM acknowledge input
      USRCCLKO  => intSpiClk,           -- 1-bit input: User CCLK input
      USRCCLKTS => '0',
      USRDONEO  => '1',
      USRDONETS => '1'
      );


end Behaviotal;
