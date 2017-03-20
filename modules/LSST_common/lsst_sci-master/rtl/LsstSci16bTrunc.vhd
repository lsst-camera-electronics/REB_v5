library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity LsstSci16bTrunc is
  
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

end LsstSci16bTrunc;

architecture LsstSci16bTrunc of LsstSci16bTrunc is

  -- Data Encoder input side signals
  signal intDataWrEn : std_logic;
  signal intDataSOT  : std_logic;
  signal intDataEOT  : std_logic;
  signal intDataClk  : std_logic;
  signal intDataIn   : std_logic_vector(17 downto 0);
  
  -- Data Encoder Fifo signals
  signal fifoReset   : std_logic;
  signal fifoRdEn    : std_logic;
  signal fifoEmpty   : std_logic;
  signal fifoValid   : std_logic;
  signal fifoFull    : std_logic;
  signal fifoWrEn    : std_logic;
  signal fifoRdClk   : std_logic;
  signal fifoWrClk   : std_logic;
  signal fifoDataIn  : std_logic_vector(17 downto 0);
  signal fifoDataOut : std_logic_vector(17 downto 0);
  
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
  -- FIFO Input side
  -------------------------------------------------------------------------
  fifoWrClk <= intDataClk;
  fifoWrEn  <= intDataWrEn;
  
  fifoDataIn(16)          <= intDataSOT;
  fifoDataIn(17)          <= intDataEOT;
  fifoDataIn(15 downto 0) <= intDataIn(17 downto 2);
   
  -------------------------------------------------------------------------
  -- The FIFO
  -------------------------------------------------------------------------
  data_encoder_fifo : entity work.FifoAsync
    generic map (
      FWFT_EN_G    => true,
      DATA_WIDTH_G => 18,
      ADDR_WIDTH_G => 12)
    port map (
      rst           => fifoReset,
      wr_clk        => fifoWrClk,
      wr_en         => fifoWrEn,
      din           => fifoDataIn(17 downto 0),
      wr_data_count => open,
      wr_ack        => open,
      overflow      => open,
      prog_full     => open,
      almost_full   => open,
      full          => fifoFull,
      not_full      => open,
      rd_clk        => fifoRdClk,
      rd_en         => fifoRdEn,
      dout          => fifoDataOut,
      rd_data_count => open,
      valid         => fifoValid,
      underflow     => open,
      prog_empty    => open,
      almost_empty  => open,
      empty         => fifoEmpty);
      
  ----------------------------------------------------------------------------
  -- The Frame Outputs
  ----------------------------------------------------------------------------
  fifoReset  <= FrameReset;
  fifoRdClk  <= FrameRdClk;
  fifoRdEn   <= FrameRdEn;
  FrameSOT   <= fifoDataOut(16);
  FrameEOT   <= fifoDataOut(17);
  FrameValid <= fifoValid;
  FrameEmpty <= fifoEmpty;
  FrameData  <= fifoDataOut(15 downto 0);
  
end LsstSci16bTrunc;
