-------------------------------------------------------------------------------
-- Title      : LSST SDS
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : LsstSciDataEncoder.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-12-03
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

use work.LsstSciPackage.all;

entity LsstSciDataEncoder is
   generic (
      -------------------------------------------------------------------------
      -- RAFT_DATA_CONVERSION specifies the method used to put the 18 bit
      -- raft data into the 16 bit PGP pipe.
      --
      -- Currently, the choices are:
      -- ZERO_EXTEND_32: Zero extend the data to 32 bits (halves bandwidth)
      -- TRUNC_LOW_2   : Truncate the low 2 bits (loses precision)
      -------------------------------------------------------------------------
      RAFT_DATA_CONVERSION : string;

      -------------------------------------------------------------------------
      -- The PGP_FRAME_SIZE is the total size of the PGP frame that is
      -- sent over the wire.
      -- 
      -- With the current configuration of the RCE, this frame is split into
      -- PGP header and payload. This split is arbitrary and does not mark
      -- a meaningful boundary in our data stream. If Jim specifies the
      -- size of the payload, then the frame is 32 bytes larger.
      -------------------------------------------------------------------------
      PGP_FRAME_SIZE : unsigned(31 downto 0);

      -------------------------------------------------------------------------
      -- Device Type
      -------------------------------------------------------------------------
      XIL_DEVICE_G : string
   );
   port (
      -------------------------------------------------------------------------
      -- Data Encoder Input Interface
      -------------------------------------------------------------------------
      DataClk    : in std_logic;
      DataWrEn   : in std_logic;
      DataSOT    : in std_logic;
      DataEOT    : in std_logic;
      DataIn     : in std_logic_vector(17 downto 0);

      -------------------------------------------------------------------------
      -- PGP Frame interface
      -------------------------------------------------------------------------
      FrameClk     : in  std_logic;
      FrameRst     : in  std_logic;
      FrameTxValid : out std_logic;
      FrameTxSOF   : out std_logic;
      FrameTxEOF   : out std_logic;
      FrameTxEOFE  : out std_logic;
      FrameTxData  : out std_logic_vector(15 downto 0);
      FrameTxAFull :  in std_logic;

      -------------------------------------------------------------------------
      -- Internal Status Interface
      -------------------------------------------------------------------------
      ImagesSent   : out std_logic_vector(31 downto 0);
      ImagesDisc   : out std_logic_vector(31 downto 0);
      ImagesTrunc  : out std_logic_vector(31 downto 0);
      DataFormat   : out std_logic_vector( 3 downto 0)      
   );
end LsstSciDataEncoder;

architecture LsstSciDataEncoder of LsstSciDataEncoder is
  constant TPD_G : time := 1 ns;
  
   -- Data Encoder input side signals
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
   signal fifoDataOut       : std_logic_vector(15 downto 0);
   signal fifoDataOutSOT    : std_logic;
   signal fifoDataOutEOT    : std_logic;
   signal fifoDataStale     : std_logic;
   signal fifoDataStaleNext : std_logic;
   
   -- Framing Logic
   constant IN_IDLE                  : std_logic_vector(4 downto 0) := "00000";
   constant IN_SOT                   : std_logic_vector(4 downto 0) := "00001";
   constant IN_PGP_START_0           : std_logic_vector(4 downto 0) := "00010";
   constant IN_PGP_START_1           : std_logic_vector(4 downto 0) := "00011";
   constant IN_IMG_HEADER_0          : std_logic_vector(4 downto 0) := "00100";
   constant IN_IMG_HEADER_1          : std_logic_vector(4 downto 0) := "00101";
   constant IN_FIRST_PIXEL           : std_logic_vector(4 downto 0) := "00110";
   constant IN_MIDDLE                : std_logic_vector(4 downto 0) := "00111";
   constant IN_PGP_END_0             : std_logic_vector(4 downto 0) := "01000";
   constant IN_PGP_END_1             : std_logic_vector(4 downto 0) := "01001";
   constant IN_IMG_WAIT              : std_logic_vector(4 downto 0) := "01010";
   constant IN_SEND_STATUS_FRAME     : std_logic_vector(4 downto 0) := "01011";
   constant IN_STATUS_FRAME_HDR_1    : std_logic_vector(4 downto 0) := "01100";
   constant IN_STATUS_FRAME_PAYLOAD_0: std_logic_vector(4 downto 0) := "01101";
   constant IN_STATUS_FRAME_PAYLOAD_1: std_logic_vector(4 downto 0) := "01110";
   constant IN_STATUS_FRAME_END_0    : std_logic_vector(4 downto 0) := "01111";
   constant IN_STATUS_FRAME_END_1    : std_logic_vector(4 downto 0) := "10000";
   constant IN_ERR_IDLE              : std_logic_vector(4 downto 0) := "10001";
   constant IN_ERR_MIDDLE            : std_logic_vector(4 downto 0) := "10010";
   constant IN_ERR_ODD               : std_logic_vector(4 downto 0) := "10011";
   constant IN_ERR_MIDDLE_PGP_END_0  : std_logic_vector(4 downto 0) := "10100";
   constant IN_ERR_MIDDLE_PGP_END_1  : std_logic_vector(4 downto 0) := "10101";
   constant IN_ERR_WAIT              : std_logic_vector(4 downto 0) := "10110";
   constant IN_FLUSH                 : std_logic_vector(4 downto 0) := "10111";

   signal frameStateNum : std_logic_vector(4 downto 0);
   
   type frame_state_type is (IDLE,
                             SOT,
                             PGP_START_0, PGP_START_1,
                             IMG_HEADER_0, IMG_HEADER_1,
                             IMG_HEADER_2, IMG_HEADER_3,
                             FIRST_PIXEL,
                             MIDDLE,
                             PGP_END_0, PGP_END_1,
                             SEND_STATUS_FRAME,
                             STATUS_FRAME_HDR_1,
                             STATUS_FRAME_PAYLOAD_0, STATUS_FRAME_PAYLOAD_1,
                             STATUS_FRAME_PAYLOAD_2, STATUS_FRAME_PAYLOAD_3,
                             STATUS_FRAME_END_0, STATUS_FRAME_END_1,
                             ERR_IDLE,
                             ERR_MIDDLE, ERR_ODD,
                             ERR_MIDDLE_PGP_END_0, ERR_MIDDLE_PGP_END_1,
                             ERR_WAIT,
                             FLUSH);
                             
   signal frameState, frameStateNext : frame_state_type;
   signal frameStateReturn, frameStateReturnNext : frame_state_type;
   
   constant ERR_NONE         : std_logic_vector(3 downto 0) := x"0";
   constant ERR_IDLE_AFULL   : std_logic_vector(3 downto 0) := x"1";
   constant ERR_IDLE_EOT     : std_logic_vector(3 downto 0) := x"2";
   constant ERR_IDLE_MID     : std_logic_vector(3 downto 0) := x"3";
   constant ERR_MIDDLE_AFULL : std_logic_vector(3 downto 0) := x"4";
   constant ERR_MIDDLE_SOT   : std_logic_vector(3 downto 0) := x"5";
   constant ERR_MIDDLE_ODD   : std_logic_vector(3 downto 0) := x"6";
   constant ERR_WAIT_SOT     : std_logic_vector(3 downto 0) := x"7";
   constant ERR_WAIT_AFULL   : std_logic_vector(3 downto 0) := x"8";
   constant ERR_FIRST_ODD    : std_logic_vector(3 downto 0) := x"9";
   
   signal errorTypeReg       : std_logic_vector(3 downto 0);
   signal errorTypeRegNext   : std_logic_vector(3 downto 0);

   constant IMAGE_FLAG_MIDDLE : std_logic_vector(1 downto 0) := "00";
   constant IMAGE_FLAG_START  : std_logic_vector(1 downto 0) := "10";
   constant IMAGE_FLAG_STOP   : std_logic_vector(1 downto 0) := "01";
   
   signal imageFlagsReg      : std_logic_vector(1 downto 0);
   signal imageFlagsNext     : std_logic_vector(1 downto 0);

   signal frameSummary       : std_logic_vector(31 downto 0);
   signal imageDataFormat    : std_logic_vector(3 downto 0);
   
   signal frameTrigger       : std_logic;
   
   constant FRAME_SIZE       : std_logic_vector(31 downto 0) := std_logic_vector(PGP_FRAME_SIZE) - 1;
   signal   frameCounter     : std_logic_vector(31 downto 0);
   signal   frameCounterNext : std_logic_vector(31 downto 0);
   signal   frameCounterEn   : std_logic;
   signal   frameCounterRst  : std_logic;

   constant PIXEL_DATA_SIZE  : std_logic_vector(31 downto 0) := std_logic_vector(PGP_FRAME_SIZE) - 8;
   signal   pixelCounter     : std_logic_vector(31 downto 0);
   signal   pixelCounterNext : std_logic_vector(31 downto 0);
   signal   pixelCounterEn   : std_logic;
   signal   pixelCounterRst  : std_logic;

   signal   sequenceCounter     : std_logic_vector(15 downto 0);
   signal   sequenceCounterNext : std_logic_vector(15 downto 0);
   signal   sequenceCounterEn   : std_logic;

   -- Statistics Counters
   signal imagesSentCounter     : std_logic_vector(31 downto 0);
   signal imagesSentCounterNext : std_logic_vector(31 downto 0);
   signal imagesSentCounterEn   : std_logic;
   
   signal imagesDiscCounter     : std_logic_vector(31 downto 0);
   signal imagesDiscCounterNext : std_logic_vector(31 downto 0);
   signal imagesDiscCounterEn   : std_logic;
   
   signal imagesTruncCounter     : std_logic_vector(31 downto 0);
   signal imagesTruncCounterNext : std_logic_vector(31 downto 0);
   signal imagesTruncCounterEn   : std_logic;
      
   -- PGP Buffer input signals
   signal   intFrameTxData  : std_logic_vector(15 downto 0);
   signal   intFrameTxValid : std_logic;
   signal   intFrameTxEOFE  : std_logic;
   signal   intFrameEOF   : std_logic;
   signal   intFrameSOF   : std_logic;
   signal   intFrameTxAFull : std_logic;

   -- PGP side signals
   signal intFrameClk : std_logic;
   signal intFrameRst : std_logic;

begin

   ----------------------------------------------------------------------------
   -- Input signals
   ----------------------------------------------------------------------------
   intDataClk  <= DataClk; 
   intDataWrEn <= DataWrEn;  
   intDataSOT  <= DataSOT; 
   intDataEOT  <= DataEOT; 
   intDataIn   <= DataIn;  

   ----------------------------------------------------------------------------
   -- Here's where we choose the method for converting the 18 bit raft
   -- data to the 16 bit PGP data.
   ----------------------------------------------------------------------------
   U_gen_zero_extend_32: if RAFT_DATA_CONVERSION = "ZERO_EXTEND_32" generate
      imageDataFormat <= LSST_DATA_32B_ZERO_EXTEND;

     data_encoder : entity work.LsstSci32bZExt
       generic map (XIL_DEVICE_G => XIL_DEVICE_G)
       port map (
         DataClk    => intDataClk,
         DataWrEn   => intDataWrEn,
         DataSOT    => intDataSOT,
         DataEOT    => intDataEOT,
         DataIn     => intDataIn(17 downto 0),
         FrameReset => fifoReset,
         FrameRdClk => intFrameClk,
         FrameRdEn  => fifoRdEn,
         FrameValid => fifoValid,
         FrameEmpty => fifoEmpty,
         FrameSOT   => fifoDataOutSOT,
         FrameEOT   => fifoDataOutEOT,
         FrameData  => fifoDataOut(15 downto 0)
       );

   end generate;
      
   U_gen_trunc_low_2: if RAFT_DATA_CONVERSION = "TRUNC_LOW_2" generate
      imageDataFormat <= LSST_DATA_16B_TRUNC_LOW_2;

     data_encoder : entity work.LsstSci16bTrunc
       port map (
         DataClk    => intDataClk,
         DataWrEn   => intDataWrEn,
         DataSOT    => intDataSOT,
         DataEOT    => intDataEOT,
         DataIn     => intDataIn(17 downto 0),
         FrameReset => fifoReset,
         FrameRdClk => intFrameClk,
         FrameRdEn  => fifoRdEn,
         FrameValid => fifoValid,
         FrameEmpty => fifoEmpty,
         FrameSOT   => fifoDataOutSOT,
         FrameEOT   => fifoDataOutEOT,
         FrameData  => fifoDataOut(15 downto 0)
       );
      
   end generate;


   U_gen_18b_packed : if RAFT_DATA_CONVERSION = "18B_PACK" generate
     imageDataFormat <= LSST_DATA_18B_PACKED;

     data_encoder : entity work.LsstSci18bPack
       port map (
         DataClk    => intDataClk,
         DataWrEn   => intDataWrEn,
         DataSOT    => intDataSOT,
         DataEOT    => intDataEOT,
         DataIn     => intDataIn(17 downto 0),
         FrameReset => fifoReset,
         FrameRdClk => intFrameClk,
         FrameRdEn  => fifoRdEn,
         FrameValid => fifoValid,
         FrameEmpty => fifoEmpty,
         FrameSOT   => fifoDataOutSOT,
         FrameEOT   => fifoDataOutEOT,
         FrameData  => fifoDataOut(15 downto 0)
       );

   end generate;          

   ----------------------------------------------------------------------------
   -- Output Signals
   ----------------------------------------------------------------------------
   fifoReset <= intFrameRst;

   ----------------------------------------------------------------------------
   -- PGP Framing logic
   ----------------------------------------------------------------------------

   process(intFrameClk, intFrameRst)
   begin
      if (intFrameRst = '1') then
         frameState         <= IDLE;
         frameCounter       <= FRAME_SIZE;
         pixelCounter       <= PIXEL_DATA_SIZE;
         sequenceCounter    <= x"0000";
         frameStateReturn   <= IDLE;
         errorTypeReg       <= ERR_NONE;
         imageFlagsReg      <= IMAGE_FLAG_MIDDLE;
         imagesSentCounter  <= x"00000000";
         imagesDiscCounter  <= x"00000000";
         imagesTruncCounter <= x"00000000";
         fifoDataStale      <= '0';
      elsif rising_edge(intFrameClk) then
         frameState         <= frameStateNext after TPD_G;
         frameCounter       <= frameCounterNext after TPD_G;
         pixelCounter       <= pixelCounterNext after TPD_G;
         sequenceCounter    <= sequenceCounterNext after TPD_G;
         frameStateReturn   <= frameStateReturnNext after TPD_G;
         errorTypeReg       <= errorTypeRegNext after TPD_G;
         imageFlagsReg      <= imageFlagsNext after TPD_G;
         imagesSentCounter  <= imagesSentCounterNext after TPD_G;
         imagesDiscCounter  <= imagesDiscCounterNext after TPD_G;
         imagesTruncCounter <= imagesTruncCounterNext after TPD_G;
         fifoDataStale      <= fifoDataStaleNext after TPD_G;
      end if;
   end process;

   -- Frame Counter
   process(frameCounter, frameCounterEn, frameCounterRst)
   begin
      if frameCounterRst = '1' then
         frameCounterNext <= FRAME_SIZE;
      elsif frameCounter = 0 then
         frameCounterNext <= frameCounter;
      elsif frameCounterEn = '1' then
         frameCounterNext <= frameCounter - 1;
      else
         frameCounterNext <= frameCounter;
      end if;
   end process;

   -- Pixel Counter
   process(pixelCounter, pixelCounterEn, pixelCounterRst)
   begin
      if pixelCounterRst = '1' then
         pixelCounterNext <= PIXEL_DATA_SIZE;
      elsif pixelCounter = 0 then
         pixelCounterNext <= pixelCounter;
      elsif pixelCounterEn = '1' then
         pixelCounterNext <= pixelCounter - 1;
      else
         pixelCounterNext <= pixelCounter;
      end if;
   end process;

   -- Sequence Counter
   process(sequenceCounter, sequenceCounterEn)
   begin
      if sequenceCounter = x"FFFF" then
         sequenceCounterNext <= x"0000";
      elsif sequenceCounterEn = '1' then
         sequenceCounterNext <= sequenceCounter + 1;
      else
         sequenceCounterNext <= sequenceCounter;
      end if;
   end process;

   frameCounterEn  <= intFrameTxValid;

   -- Sent Image Counter
   process(imagesSentCounter, imagesSentCounterEn)
   begin
      if imagesSentCounter = x"FFFFFFFF" then
         imagesSentCounterNext <= x"00000000";
      elsif imagesSentCounterEn = '1' then
         imagesSentCounterNext <= imagesSentCounter + 1;
      else
         imagesSentCounterNext <= imagesSentCounter;
      end if;
   end process;

   ImagesSent <= imagesSentCounter;
   
   -- Discarded Image Counter
   process(imagesDiscCounter, imagesDiscCounterEn)
   begin
      if imagesDiscCounter = x"FFFFFFFF" then
         imagesDiscCounterNext <= x"00000000";
      elsif imagesDiscCounterEn = '1' then
         imagesDiscCounterNext <= imagesDiscCounter + 1;
      else
         imagesDiscCounterNext <= imagesDiscCounter;
      end if;
   end process;

   ImagesDisc <= imagesDiscCounter;
   
   -- Truncated Image Counter
   process(imagesTruncCounter, imagesTruncCounterEn)
   begin
      if imagesTruncCounter = x"FFFFFFFF" then
         imagesTruncCounterNext <= x"00000000";
      elsif imagesTruncCounterEn = '1' then
         imagesTruncCounterNext <= imagesTruncCounter + 1;
      else
         imagesTruncCounterNext <= imagesTruncCounter;
      end if;
   end process;

   ImagesTrunc <= imagesTruncCounter;
   
   frameSummary(31) <= '0' when errorTypeReg = x"0" else '1';
   frameSummary(30 downto 29) <= imageFlagsReg;
   frameSummary(28) <= '0';
   frameSummary(27 downto 24) <= errorTypeReg;
   frameSummary(23 downto 20) <= x"0";
   frameSummary(19 downto 16) <= imageDataFormat;
   frameSummary(15 downto  0) <= sequenceCounter;

   frameTrigger <= '1' when frameCounter = x"00000010" else '0';

   DataFormat <= imageDataFormat;
   
   -- Frame State Machine
   process (frameState,
            fifoValid, fifoEmpty, fifoRdEn,
            fifoDataOut, fifoDataOutSOT, fifoDataOutEOT, fifoDataStale,
            frameCounter, errorTypeReg, frameStateReturn, imageFlagsReg,
            intFrameTxAFull, frameSummary, pixelCounter)
   begin
      errorTypeRegNext     <= errorTypeReg;
      frameStateReturnNext <= frameStateReturn;
      imageFlagsNext       <= imageFlagsReg;
      fifoDataStaleNext    <= fifoDataStale;
      
      fifoRdEn          <= '0';
      frameCounterRst   <= '0';
      pixelCounterRst   <= '0';
      pixelCounterEn    <= '0';
      sequenceCounterEn <= '0';
      intFrameTxValid   <= '0';
      intFrameSOF       <= '0';
      intFrameEOF       <= '0';
      intFrameTxEOFE    <= '0';
      intFrameTxData    <= (others => '0');

      imagesSentCounterEn  <= '0';
      imagesDiscCounterEn  <= '0';
      imagesTruncCounterEn <= '0';
      
      case frameState is
         when IDLE =>
            frameStateNum <= IN_IDLE;
            -- We'll bleed off any more EOTs
            -- After that, then only valid data will include SOT
            if fifoValid = '1' and fifoDataOutSOT = '1' then
               fifoRdEn <= '0';
               if intFrameTxAFull = '1' then
                  frameStateNext   <=  ERR_IDLE;
                  errorTypeRegNext <= ERR_IDLE_AFULL;
               else
                  frameStateNext <= SOT;
               end if;
            elsif fifoValid = '1' and fifoDataOutEOT = '0'then
               fifoRdEn <=  '0';
               frameStateNext   <= ERR_IDLE;
               errorTypeRegNext <= ERR_IDLE_MID;
            else
               fifoRdEn <= not fifoEmpty;
               frameStateNext <= IDLE;
            end if;

         when SOT =>
            frameStateNum <= IN_SOT;
            fifoRdEn <= not fifoEmpty and fifoDataOutSOT;
            
            if fifoDataOutSOT = '1' then
               frameStateNext <= SOT;
            else
               fifoDataStaleNext <= fifoValid;
               imageFlagsNext <= IMAGE_FLAG_START;
               frameStateNext <= PGP_START_0;
            end if;
            
         -- PGP requires 32 bits (2 words) of zeros at the beginning
         -- of each PGP frame.
         when PGP_START_0 =>
            frameStateNum <= IN_PGP_START_0;
            intFrameTxValid <= '1';
            intFrameSOF   <= '1';
            frameStateNext <= PGP_START_1;
         when PGP_START_1 =>
            frameStateNum <= IN_PGP_START_1;
            intFrameTxValid <= '1';
            frameStateNext <= IMG_HEADER_0;

         -- IMG_HEADER is where we place the 32 bits of LSST header word
         when IMG_HEADER_0 =>
            frameStateNum <= IN_IMG_HEADER_0;
            intFrameTxValid <= '1';
            sequenceCounterEn <= '1';
            intFrameTxData(15 downto 0) <= frameSummary(15 downto 0);
            frameStateNext <= IMG_HEADER_1;
         when IMG_HEADER_1 =>
            frameStateNum <= IN_IMG_HEADER_1;
            intFrameTxValid <= '1';
            intFrameTxData(15 downto 0) <= frameSummary(31 downto 16);
            frameStateNext <= IMG_HEADER_2;
         -- There appears to be a bug in PGP that requires an even
         -- an even number of 32 bit words in each frame. I'll deal
         -- with that by adding another header word here and requiring
         -- an even number of pixels in a slice.
         when IMG_HEADER_2 =>
            frameStateNum <= "11111";
            intFrameTxValid <= '1';
            intFrameTxData  <= x"3210";
            frameStateNext <= IMG_HEADER_3;
         when IMG_HEADER_3 =>
            frameStateNum <= "11111";
            intFrameTxValid <= '1';
            intFrameTxData  <= x"7654";
            -- If this is the first frame after SOT, the first pixel
            -- is sitting on the output of the fifo
            if fifoDataStale = '1' then
               frameStateNext <= FIRST_PIXEL;
            else
               frameStateNext <= MIDDLE;
            end if;

         -- If this is the first frame after SOT, the first datum
         -- is sitting on the output of the fifo
         when FIRST_PIXEL =>
            frameStateNum <= IN_FIRST_PIXEL;
            fifoDataStaleNext <= '0';
            intFrameTxValid <= '1';
            intFrameTxData <= fifoDataOut(15 downto 0);
            pixelCounterEn <= '1';
            frameStateNext <= MIDDLE;
            
         -- This is where we'll just hook up the image FIFO to the
         -- PGP fifo.
         when MIDDLE =>
            frameStateNum <= IN_MIDDLE;
            if pixelCounter > 0 then
               fifoRdEn <= not fifoEmpty and not fifoDataOutEOT;
            else
               fifoRdEn <= '0';
            end if;
            pixelCounterEn  <= fifoRdEn;
            intFrameTxValid <= fifoValid and not fifoDataOutEOT;
            intFrameTxData  <= fifoDataOut(15 downto 0);
            
            -- if backpressure is asserted, it's an error
            if intFrameTxAFull = '1' then
               frameStateNext <= ERR_MIDDLE;
               errorTypeRegNext <= ERR_MIDDLE_AFULL;
            -- if SOT is asserted before EOT, it's an error
            elsif fifoValid = '1' and fifoDataOutSOT = '1' then
               frameStateNext <= ERR_MIDDLE;
               errorTypeRegNext <= ERR_MIDDLE_SOT;
            elsif fifoValid = '1' and fifoDataOutEOT = '1' then
               if frameCounter(0) = '0' then
                  frameStateNext <= ERR_MIDDLE;
                  errorTypeRegNext <= ERR_MIDDLE_ODD;
               else
                  frameStateNext <= PGP_END_0;
               end if;
            -- We've got to leave 2 words for the PGP footer
            elsif frameCounter = 2 and pixelCounter = 0 then
               frameStateNext <= PGP_END_0;
            else
               frameStateNext <= MIDDLE;
            end if;

         -- PGP requires 32 bits (2 words) of zeros at the end of
         -- each PGP frame.
         when PGP_END_0 =>
            frameStateNum <= IN_PGP_END_0;
            intFrameTxValid <= '1';
            frameStateNext <= PGP_END_1;
         when PGP_END_1 =>
            frameStateNum <= IN_PGP_END_1;
            intFrameTxValid <= '1';
            intFrameEOF   <= '1';
            frameCounterRst <= '1';
            pixelCounterRst <= '1';

            -- Since the last word we read is still on the output
            -- of the FIFO, check to see if it was EOT.
            if fifoDataOutEOT =  '1' then
               frameStateReturnNext <= IDLE;
               imageFlagsNext <= IMAGE_FLAG_STOP;
               errorTypeRegNext <= ERR_NONE;
               frameStateNext <= SEND_STATUS_FRAME;
            else
               imageFlagsNext <= IMAGE_FLAG_MIDDLE;
               frameStateNext <= PGP_START_0;
            end if;

            
         -- A status frame is the smallest PGP frame we can send
         -- with a payload of a single 32 bit image status word.
         -- Before entering this state, be sure to set the
         -- frameStateReturn so we know where to go after.
         -- I should say, I have no idea if this should work or
         -- if it will synthesize into anything reasonable.
         -- If it turns out to be a bad idea, then I should probably
         -- just make another process that sends the frame and then
         -- signals back to this process when done. In fact, maybe
         -- I should just do that . . .
         when SEND_STATUS_FRAME =>
            frameStateNum <= IN_SEND_STATUS_FRAME;
            intFrameTxValid <= '1';
            intFrameSOF   <= '1';
            -- Here's where we increment the appropriate image
            -- counter if there was no error.
            -- In the error case, we'll increment the appropriate
            -- counter in the error states.
            if errorTypeReg = ERR_NONE then
               imagesSentCounterEn <= '1';
            end if;
            frameStateNext <= STATUS_FRAME_HDR_1;
         when STATUS_FRAME_HDR_1 =>
            frameStateNum <= IN_STATUS_FRAME_HDR_1;
            intFrameTxValid <= '1';
            frameStateNext <= STATUS_FRAME_PAYLOAD_0;
         when STATUS_FRAME_PAYLOAD_0 =>
            frameStateNum <= IN_STATUS_FRAME_PAYLOAD_0;
            sequenceCounterEn <= '1';
            intFrameTxValid <= '1';
            intFrameTxData(15 downto 0) <= frameSummary(15 downto 0);
            frameStateNext <= STATUS_FRAME_PAYLOAD_1;
         when STATUS_FRAME_PAYLOAD_1 =>
            frameStateNum <= IN_STATUS_FRAME_PAYLOAD_1;
            intFrameTxValid <= '1';
            intFrameTxData(15 downto 0) <= frameSummary(31 downto 16);
            frameStateNext <= STATUS_FRAME_PAYLOAD_2;
            --frameStateNext <= STATUS_FRAME_END_0;
         -- There appears to be a bug in PGP that requires an even
         -- an even number of 32 bit words in each frame. I'll deal
         -- with that by adding another header word here and requiring
         -- an even number of pixels in a slice.
         when STATUS_FRAME_PAYLOAD_2 =>
            frameStateNum <= "11111";
            intFrameTxValid <= '1';
            intFrameTxData <= x"3210";
            frameStateNext <= STATUS_FRAME_PAYLOAD_3;
         when STATUS_FRAME_PAYLOAD_3 =>
            frameStateNum <= "11111";
            intFrameTxValid <= '1';
            intFrameTxData <= x"7654";
            frameStateNext <= STATUS_FRAME_END_0;
         when STATUS_FRAME_END_0 =>
            frameStateNum <= IN_STATUS_FRAME_END_0;
            intFrameTxValid <= '1';
            frameStateNext <= STATUS_FRAME_END_1;
         when STATUS_FRAME_END_1 =>
            frameStateNum <= IN_STATUS_FRAME_END_1;
            intFrameTxValid <= '1';
            intFrameEOF   <= '1';
            frameCounterRst <= '1';
            pixelCounterRst <= '1';
            frameStateNext <= frameStateReturn;
            

         -- If we were in between images, let's send a status
         -- frame and flush until we see the next SOT, unless
         -- the error is for backpressure, in which case we can't
         -- assume there's room for a status frame. (Particularly
         -- if we've missed several images thanks to continuous
         -- backpressure.)
         when ERR_IDLE =>
            frameStateNum <= IN_ERR_IDLE;
            imagesDiscCounterEn <= '1';
            if errorTypeReg = ERR_IDLE_AFULL then
               frameStateNext <= FLUSH;
            else
               imageFlagsNext <= IMAGE_FLAG_START or IMAGE_FLAG_STOP;
               frameStateReturnNext <= FLUSH;
               frameStateNext <= SEND_STATUS_FRAME;
            end if;
            
         -- If we were in the middle of a PGP frame, let's even up
         -- the frame, end it, send a status frame with an error,
         -- and flush until the next SOT.
         when ERR_MIDDLE =>
            frameStateNum <= IN_ERR_MIDDLE;
            imagesTruncCounterEn <= '1';
            -- If the error was an odd sized frame, add a dummy
            -- word to even up the frame before proceeding
            if (errorTypeReg = ERR_MIDDLE_ODD
                or errorTypeReg = ERR_FIRST_ODD) then
               frameStateNext <= ERR_ODD;
            else
               frameStateNext <= ERR_MIDDLE_PGP_END_0;
            end if;
         when ERR_ODD =>
            intFrameTxValid <= '1';
            intFrameTxData  <= x"BEEF";
            frameStateNum <= IN_ERR_ODD;
            frameStateNext <= ERR_MIDDLE_PGP_END_0;
         when ERR_MIDDLE_PGP_END_0 =>
            intFrameTxValid <= '1';
            intFrameTxData <= x"0000";
            frameStateNum <= IN_ERR_MIDDLE_PGP_END_0;
            frameStateNext <= ERR_MIDDLE_PGP_END_1;
         when ERR_MIDDLE_PGP_END_1 =>
            intFrameTxValid <= '1';
            intFrameTxData  <= x"0000";
            intFrameEOF   <= '1';
            frameStateNum <= IN_ERR_MIDDLE_PGP_END_1;
            -- If we truncated because of a new SOT, then after
            -- sending the status frame, we should start transmitting
            -- the new image.
            if errorTypeReg = ERR_MIDDLE_SOT then
               frameStateReturnNext <= PGP_START_0;
            else
               frameStateReturnNext <=  FLUSH;
            end if;
            imageFlagsNext <= IMAGE_FLAG_STOP;
            frameStateNext <= SEND_STATUS_FRAME;

         -- If we were between PGP frames, but in an image transmission,
         -- let's end the image with a status frame and flush until the
         -- next SOT. Unless the error was an out of sequence SOT, in
         -- which case, send the status frame and start the new image.
         when ERR_WAIT =>
            frameStateNum <= IN_ERR_WAIT;
            imagesTruncCounterEn <= '1';
            if errorTypeReg = ERR_WAIT_SOT then
               frameStateReturnNext <= PGP_START_0;
            else
               frameStateReturnNext <= FLUSH;
            end if;
            imageFlagsNext <= IMAGE_FLAG_STOP;
            frameStateNext <= SEND_STATUS_FRAME;

         -- Just keep flushing the image FIFO until we reach SOT and
         -- there's no backpressure.
         when FLUSH =>
            frameStateNum <= IN_FLUSH;
            --fifoRdEn <= not fifoEmpty and not fifoDataOutSOT;
            if (fifoValid = '1' and fifoDataOutSOT = '1') then
               fifoRdEn <= '0';
               if intFrameTxAFull = '0' then
                  frameStateNext <= SOT;
                  errorTypeRegNext <= ERR_NONE;
               -- When we see a new image while flushing and there's
               -- still backpressure, we don't send a status frame.
               -- All we can do is increment the discard counter.
               else
                  imagesDiscCounterEn <= '1';
                  frameStateNext <= FLUSH;
               end if;
            else
               fifoRdEn <= not fifoEmpty;
               frameStateNext <= FLUSH;
            end if;

      end case;
   end process;

   ----------------------------------------------------------------------------
   -- PGP Transmit Signals
   --------------------------------------------------------------------------
   intFrameClk  <= FrameClk;
   intFrameRst  <= FrameRst;
   
   FrameTxValid <= intFrameTxValid;
   FrameTxSOF   <= intFrameSOF;
   FrameTxEOF   <= intFrameEOF;
   FrameTxEOFE  <= intFrameTxEOFE;
   FrameTxData  <= intFrameTxData;
   intFrameTxAFull <= FrameTxAFull;
   
end LsstSciDataEncoder;
