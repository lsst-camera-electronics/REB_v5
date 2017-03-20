library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity LsstSci32bZExt is
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
    FrameReset :  in std_logic;
    FrameRdClk :  in std_logic;
    FrameRdEn  :  in std_logic;
    FrameSOT   : out std_logic;
    FrameEOT   : out std_logic;
    FrameValid : out std_logic;
    FrameEmpty : out std_logic;
    FrameData  : out std_logic_vector(15 downto 0));

end LsstSci32bZExt;

architecture LsstSci32bZExt of LsstSci32bZExt is

  -- Data Encoder input side signals
  signal intDataWrEn  : std_logic;
  signal intDataSOT   : std_logic;
  signal intDataEOT   : std_logic;
  signal intDataClk   : std_logic;
  signal intDataIn    : std_logic_vector(17 downto 0);
  signal intDataInExt : std_logic_vector(31 downto 0);
  
  -- Data Encoder Fifo signals
  signal fifoReset   : std_logic;
  signal fifoRdEn    : std_logic;
  signal fifoEmpty   : std_logic;
  signal fifoValid   : std_logic;
  signal fifoFull    : std_logic;
  signal fifoWrEn    : std_logic;
  signal fifoRdClk   : std_logic;
  signal fifoWrClk   : std_logic;
  signal fifoDataIn  : std_logic_vector(35 downto 0);
  signal fifoDataOut : std_logic_vector(17 downto 0);
  signal fifoDataSOT : std_logic;
  signal fifoDataEOT : std_logic;

   component k7_afifo_36_to_18
      port (
         rst    :  in std_logic;
         wr_clk :  in std_logic;
         wr_en  :  in std_logic;
         din    :  in std_logic_vector(35 downto 0);
         full   : out std_logic;
         rd_clk :  in std_logic;
         rd_en  :  in std_logic;
         valid  : out std_logic;
         dout   : out std_logic_vector(17 downto 0);
         empty  : out std_logic);
   end component;

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
  
  -- Zero extend the 18 bit input data to 32 bits
  intDataInExt <=  x"000" & "00" & intDataIn(17 downto 0);

  -- The data encoder fifo has a write width of 36 bits and a
  -- read width of 18 bits. The most significant (35 downto 18)
  -- bits are read first followed by the least significant
  -- (18 downto 0). 
  --
  -- To remain compatible with the 16-bit version, I'll send
  -- both flags with the first half, and throw away the second half
  -- The DataSOT flag is stored such that it will be in bit 16
  -- I leave the EOT flag in the second half so that I don't lose
  -- it when I read out the last pixel
  fifoDataIn(35 downto 34) <= intDataEOT & intDataSOT;
  fifoDataIn(33 downto 18) <= intDataInExt(31 downto 16);
  fifoDataIn(17 downto 16) <= intDataEOT & intDataSOT;
  fifoDataIn(15 downto  0) <= intDataInExt(15 downto  0);
   
  -------------------------------------------------------------------------
  -- The FIFO
  -------------------------------------------------------------------------
  data_encoder_fifo : k7_afifo_36_to_18
    port map (
      rst    => fifoReset,
      wr_clk => fifoWrClk,
      wr_en  => fifoWrEn,
      din    => fifoDataIn,
      full   => fifoFull,
      rd_clk => fifoRdClk,
      rd_en  => fifoRdEn,
      valid  => fifoValid,
      dout   => fifoDataOut,
      empty  => fifoEmpty);

  ----------------------------------------------------------------------------
  -- FIFO Output side
  ----------------------------------------------------------------------------
  fifoDataSOT <= fifoDataOut(16);
  fifoDataEOT <= fifoDataOut(17);

  ----------------------------------------------------------------------------
  -- The Frame Outputs
  ----------------------------------------------------------------------------
  fifoReset  <= FrameReset;
  fifoRdClk  <= FrameRdClk;
  fifoRdEn   <= FrameRdEn;
  FrameSOT   <= fifoDataSOT;
  FrameEOT   <= fifoDataEOT;
  FrameValid <= fifoValid;
  FrameEmpty <= fifoEmpty;
  FrameData  <= fifoDataOut(15 downto 0);
   
end LsstSci32bZExt;
