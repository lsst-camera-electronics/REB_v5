-------------------------------------------------------------------------------
-- Title      : LSST SDS
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : LsstSciDataEncoder.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-12-04
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity LsstSci18bPack is

  port (

    ---------------------------------------------------------------------------
    -- 18-bit pixel input
    ---------------------------------------------------------------------------
    DataClk  : in std_logic;
    DataWrEn : in std_logic;
    DataSOT  : in std_logic;
    DataEOT  : in std_logic;
    DataIn   : in std_logic_vector(17 downto 0);

    ---------------------------------------------------------------------------
    -- 16-bit Output to Encoder Frame Logic 
    ---------------------------------------------------------------------------
    FrameReset : in std_logic;
    FrameRdClk : in std_logic;
    FrameRdEn  : in std_logic;
    FrameSOT   : out std_logic;
    FrameEOT   : out std_logic;
    FrameValid : out std_logic;
    FrameEmpty : out std_logic;
    FrameData  : out std_logic_vector(15 downto 0)

  );

end LsstSci18bPack;

architecture LsstSci18bPack of LsstSci18bPack is
  constant TPD_G              : time := 1 ns;

  -- Input Fifo side signals
  signal intDataWrEn    : std_logic;
  signal intDataSOT     : std_logic;
  signal intDataEOT     : std_logic;
  signal intDataClk     : std_logic;
  signal intDataIn      : std_logic_vector(17 downto 0);
  
  -- Data Encoder Fifo signals
  signal fifoReset         : std_logic;
  signal fifoRdEn          : std_logic;
  signal fifoEmpty         : std_logic;
  signal fifoValid         : std_logic;
  signal fifoAck           : std_logic;
  signal fifoFull          : std_logic;
  signal fifoOF            : std_logic;
  signal fifoWrEn          : std_logic;
  signal fifoWrClk         : std_logic;
  signal fifoDataIn        : std_logic_vector(19 downto 0);
  signal fifoDataOut       : std_logic_vector(19 downto 0);
  alias  fifoDataSOT       : std_logic is fifoDataOut(19);
  alias  fifoDataEOT       : std_logic is fifoDataOut(18);
  
  -- Data Encoder Frame side signals
  signal intFrameReset : std_logic;
  signal intFrameRdClk : std_logic;
  signal intFrameRdEn  : std_logic;
  signal intFrameValid : std_logic;
  signal intFrameEmpty : std_logic;
  signal intFrameData  : std_logic_vector(17 downto 0);
  
  -- Phase Counter
  signal phaseCounter     : std_logic_vector(3 downto 0);
  signal phaseCounterNext : std_logic_vector(3 downto 0);
  signal phaseCounterEn   : std_logic;
  signal phaseCounterRst  : std_logic;


  -- Output Data Packer
  type DataPackerType is record
    data  : std_logic_vector(31 downto 0);
    sot   : std_logic;
    eot   : std_logic;
    valid : std_logic;
    phase : std_logic;
  end record;

  constant DATA_PACKER_INIT_C : DataPackerType := (
    data => (others => '0'),
    sot => '0',
    eot => '0',
    valid => '0',
    phase => '0');

  signal packer, packerNext : DataPackerType;
  
  signal dataout :std_logic_vector(17 downto 0);
begin


   ----------------------------------------------------------------------------
   -- Input signals
   ----------------------------------------------------------------------------
   intDataClk  <= DataClk; 
   intDataWrEn <= DataWrEn;  
   intDataSOT  <= DataSOT; 
   intDataEOT  <= DataEOT; 
   intDataIn   <= DataIn;  

   -------------------------------------------------------------------------
   -- Input FIFO - Input side
   -------------------------------------------------------------------------
   fifoReset <= intFrameReset;
   fifoWrClk <= intDataClk;
   fifoWrEn  <= intDataWrEn;

   fifoDataIn(19)           <= intDataSOT;
   fifoDataIn(18)           <= intDataEOT;
   fifoDataIn(17 downto 0)  <= intDataIn(17 downto 0);

   -------------------------------------------------------------------------
   -- The FIFO
   -------------------------------------------------------------------------
   -- not sure why, but the FifoAsyncBuiltin doesn't seem to work
   data_encoder_fifo : entity work.FifoAsync
     generic map (
       DATA_WIDTH_G => 20,
       ADDR_WIDTH_G => 12
     )
     port map (
       rst           => fifoReset,
       wr_clk        => fifoWrClk,
       wr_en         => fifoWrEn,
       din           => fifoDataIn(19 downto 0),
       wr_data_count => open,
       wr_ack        => fifoAck,
       overflow      => fifoOF,
       prog_full     => open,
       almost_full   => open,
       full          => fifoFull,
       not_full      => open,
       rd_clk        => intFrameRdClk,
       rd_en         => fifoRdEn,
       dout          => fifoDataOut(19 downto 0),
       rd_data_count => open,
       valid         => fifoValid,
       underflow     => open,
       prog_empty    => open,
       almost_empty  => open,
       empty         => fifoEmpty
     );

   ----------------------------------------------------------------------------
   -- The Phase Counter
   ----------------------------------------------------------------------------
   phaseCounterEn <= '1' when fifoValid = '1' and fifoDataOut(19) = '0' else
                     '1' when phaseCounter = x"8" else
                     '0';
   phaseCounterRst <= intFrameReset or packer.eot;
   
   process(phaseCounter, phaseCounterEn, phaseCounterRst)
   begin
     if phaseCounterRst = '1' then
       phaseCounterNext <= (others => '0');
     elsif phaseCounterEn = '1' then
       if phaseCounter = 8 then
         phaseCounterNext <= (others => '0');
       else
         phaseCounterNext <= phaseCounter+1;
       end if;
     else
       phaseCounterNext <= phaseCounter;
     end if;                           
   end process;
     
   process(intFrameRdClk, fifoReset)
   begin
     if fifoReset = '1' then
       phaseCounter <= (others => '0') after TPD_G;
     elsif rising_edge(intFrameRdClk) then
       phaseCounter <= phaseCounterNext after TPD_G;
     end if;
   end process;

   ----------------------------------------------------------------------------
   -- The Output Data Buffer
   ----------------------------------------------------------------------------
   process(phaseCounter, fifoReset, fifoDataOut, fifoValid, fifoEmpty, intFrameRdEn, packer.data)
   begin
     if (fifoReset = '1') then
       packerNext <= DATA_PACKER_INIT_C;
     else
       fifoRdEn <= not fifoEmpty;
       packerNext.valid <= fifoValid;
       packerNext.sot   <= fifoDataSOT;
       packerNext.eot   <= fifoDataEOT;
       case phaseCounter is
         when x"0" =>                     -- blue
           packerNext.data(31 downto 18) <= (others => '0');
           packerNext.data(17 downto  0) <= fifoDataOut(17 downto 0);
           packerNext.phase <= '0';
         when x"1" =>                     -- brown
           packerNext.data(31 downto 18) <= fifoDataOut(13 downto 0);
           packerNext.data(17 downto 16) <= packer.data(17 downto 16);
           packerNext.data(15 downto  4) <= (others => '0');
           packerNext.data( 3 downto  0) <= fifoDataOut(17 downto 14);
           packerNext.phase <= '1';
         when x"2" =>                     -- aqua
           packerNext.data(31 downto 22) <= (others => '0');
           packerNext.data(21 downto  4) <= fifoDataOut(17 downto  0);
           packerNext.data( 3 downto  0) <= packer.data(3 downto 0);
           packerNext.phase <= '0';
         when x"3" =>                     -- green
           packerNext.data(31 downto 22) <= fifoDataOut(9 downto 0);
           packerNext.data(21 downto 16) <= packer.data(21 downto 16);
           packerNext.data(15 downto  8) <= (others => '0');
           packerNext.data( 7 downto  0) <= fifoDataOut(17 downto 10);
           packerNext.phase <= '1';
         when x"4" =>                     -- magenta
           packerNext.data(31 downto 26) <= (others => '0');
           packerNext.data(25 downto  8) <= fifoDataOut(17 downto 0);
           packerNext.data( 7 downto  0) <= packer.data(7 downto 0);
           packerNext.phase <= '0';
         when x"5" =>                     -- orange
           packerNext.data(31 downto 26) <= fifoDataOut(5 downto 0);
           packerNext.data(25 downto 16) <= packer.data(25 downto 16);
           packerNext.data(15 downto 12) <= (others => '0');
           packerNext.data(11 downto  0) <= fifoDataOut(17 downto 6);
           packerNext.phase <= '1';
         when x"6" =>                     -- purple
           packerNext.data(31 downto 30) <= (others => '0');
           packerNext.data(29 downto 12) <= fifoDataOut(17 downto 0);
           packerNext.data(11 downto  0) <= packer.data(11 downto 0);
           packerNext.phase <= '0';
         when x"7" =>                     -- red
           packerNext.data(31 downto 30) <= fifoDataOut(1 downto 0);
           packerNext.data(29 downto 16) <= packer.data(29 downto 16);
           packerNext.data(15 downto  0) <= fifoDataOut(17 downto 2);         
           packerNext.eot <= '0';
           fifoRdEn <= not fifoValid;
           packerNext.phase <= '1'; 
        when x"8" =>                     -- yellow
           packerNext.data(31 downto 16) <= (others => '0');
           packerNext.data(15 downto  0) <= packer.data(15 downto 0);
           packerNext.valid <= '1';
           packerNext.phase <= '0';
         when others =>
           packerNext <= DATA_PACKER_INIT_C;
       end case;
     end if;
   end process;

  
   process (intFrameRdClk, fifoReset)
   begin
     if(fifoReset = '1') then
       packer <= DATA_PACKER_INIT_C;
     elsif rising_edge(intFrameRdClk) then
       packer <= packerNext after TPD_G;
     end if;
   end process;

   dataout(15 downto 0) <= packer.data(15 downto  0) when packer.phase = '0' else packer.data(31 downto 16);
   dataout(17) <= packer.sot;
   dataout(16) <= packer.eot;
   
   ----------------------------------------------------------------------------
   -- Output FIFO
   ----------------------------------------------------------------------------
   output_fifo : entity work.FifoAsync
     generic map (
       DATA_WIDTH_G => 18,
       ADDR_WIDTH_G => 12
     )
     port map (
       rst           => fifoReset,
       wr_clk        => intFrameRdClk,
       wr_en         => packer.valid,
       din           => dataout,
       wr_data_count => open,
       wr_ack        => open,
       overflow      => open,
       prog_full     => open,
       almost_full   => open,
       full          => open,
       not_full      => open,
       rd_clk        => intFrameRdClk,
       rd_en         => intFrameRdEn,
       dout          => intFrameData(17 downto 0),
       rd_data_count => open,
       valid         => intFrameValid,
       underflow     => open,
       prog_empty    => open,
       almost_empty  => open,
       empty         => intFrameEmpty
     );


   
   ----------------------------------------------------------------------------
   -- The Frame Outputs
   ----------------------------------------------------------------------------
   intFrameReset <= FrameReset;
   intFrameRdClk <= FrameRdClk;
   intFrameRdEn  <= FrameRdEn;
   FrameSOT      <= intFrameData(17);
   FrameEOT      <= intFrameData(16);
   FrameValid    <= intFrameValid;
   FrameEmpty    <= intFrameEmpty;
   FrameData     <= intFrameData(15 downto 0);
   
end LsstSci18bPack;
