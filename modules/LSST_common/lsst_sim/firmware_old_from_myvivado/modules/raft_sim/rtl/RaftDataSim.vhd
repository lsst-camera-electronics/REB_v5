-------------------------------------------------------------------------------
-- Title      : RCM SDS
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : RaftDataSim.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-04-29
-------------------------------------------------------------------------------
-- Description: This block contains the logic to generate a stream of
--              data mimicking the data from a raft. Currently, there are
--              only two types of data generated: incrementing and random.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RaftDataSim is
  generic (
    -------------------------------------------------------------------------
    -- Device Type
    -------------------------------------------------------------------------
    XIL_DEVICE_G : string
  );  
  port (
      -- Clock and Reset
      usrClk         :  in std_logic;
      usrRst         :  in std_logic;

      -- Register control interface
      regReq         :  in std_logic;
      regOp          :  in std_logic;
      regAddr        :  in std_logic_vector(23 downto 0);
      regDataWr      :  in std_logic_vector(31 downto 0);
      regAck         : out std_logic;
      regFail        : out std_logic;
      regDataRd      : out std_logic_vector(31 downto 0);

      -- Simulated Raft Data Interface
      raftWrEn : out std_logic;
      raftSOT  : out std_logic;
      raftEOT  : out std_logic;
      raftClk  : out std_logic;
      raftData : out std_logic_vector(17 downto 0)
   );
end RaftDataSim;

architecture RaftDataSim of RaftDataSim is

   signal intRaftWrEn : std_logic;
   signal intRaftSOT  : std_logic;
   signal intRaftEOT  : std_logic;
   signal intRaftClk  : std_logic;
   signal intRaftData : std_logic_vector(17 downto 0);
   signal intSimData  : std_logic_vector(17 downto 0);

   signal intRegAck : std_logic;
   signal intRegFail : std_logic;
   signal intRegDataRd : std_logic_vector(31 downto 0);
   
   -- Command and Control Registers
   signal   regDataMode          : std_logic_vector( 7 downto 0);
   signal   regDataSeed          : std_logic_vector(17 downto 0);

   signal   regDataRunEn         : std_logic;
   signal   regDataBusy          : std_logic;

   -- Simulated Data Generators
   signal   dataMode             : std_logic_vector( 7 downto 0);
   signal   dataModeNext         : std_logic_vector( 7 downto 0);
   constant INCR_MODE            : std_logic_vector( 7 downto 0) := x"00";
   constant LFSR_MODE            : std_logic_vector( 7 downto 0) := x"01";
   constant MEM_MODE             : std_logic_vector( 7 downto 0) := x"02";
   
   -- Linear Feedback Shift Register Source
   signal   lfsr      : std_logic_vector(17 downto 0);
   signal   lfsrNext  : std_logic_vector(17 downto 0);
   signal   lfsr_fb   : std_logic;
   constant LFSR_SEED : std_logic_vector(17 downto 0) := "01" & x"BEEF";

   -- Incrementing Data Source
   signal   incDat               : std_logic_vector(17 downto 0);
   signal   incDatNext           : std_logic_vector(17 downto 0);

   -- Memory Data Source
   signal memOutData     : std_logic_vector(15 downto 0);
   signal memOutAddr     : std_logic_vector(15 downto 0);
   signal memOutAddrNext : std_logic_vector(15 downto 0);
   signal memRegDataRd   : std_logic_vector(15 downto 0);
   signal memRegDataWr   : std_logic_vector(15 downto 0);
   signal memRegAddr     : std_logic_vector(15 downto 0);
   signal memRegWrEn     : std_logic_vector( 0 downto 0);
   signal memRegReq      : std_logic;
   signal memRegAck      : std_logic;
   signal memRegFail     : std_logic;
   
   -- Data Simulation State Machine
   type   raft_state_type is (IDLE, SOT, SEND, EOT, LAST_EOT, SLI_SPC, IMG_SPC);
   signal raft_state, raft_state_next : raft_state_type;
   signal in_idle : std_logic;
   signal in_sot: std_logic;
   signal in_send: std_logic;
   signal in_eot: std_logic;
   signal in_pix_spc : std_logic;
   signal in_sli_spc : std_logic;
   signal in_img_spc : std_logic;
   

   signal dataEn    : std_logic;
   signal dataInit  : std_logic;
   signal dataBusy  : std_logic;
   
   signal firstPixel : std_logic;
   signal lastPixel : std_logic;
   signal lastSlice : std_logic;
   signal firstSlice : std_logic;
   signal lastImage : std_logic;
   signal nextPixel : std_logic;
   signal nextSlice : std_logic;
   signal nextImage : std_logic;
   
   -- Data Simulation Counters
   signal pixelSpacing        : std_logic_vector(31 downto 0);
   signal pixelSpaceCount     : unsigned(31 downto 0);
   signal pixelSpaceCountNext : unsigned(31 downto 0);
   signal pixelSpaceCountRst  : std_logic;
   signal pixelSpaceCountEn   : std_logic;
   signal pixelSpaceCountInit : std_logic;

   signal sliceSpacing        : std_logic_vector(31 downto 0);
   signal sliceSpaceCount     : unsigned(31 downto 0);
   signal sliceSpaceCountNext : unsigned(31 downto 0);
   signal sliceSpaceCountEn   : std_logic;
   signal sliceSpaceCountInit : std_logic;

   signal imageSpacing        : std_logic_vector(31 downto 0);
   signal imageSpaceCount     : unsigned(31 downto 0);
   signal imageSpaceCountNext : unsigned(31 downto 0);
   signal imageSpaceCountEn   : std_logic;
   signal imageSpaceCountInit : std_logic;

   signal pixelsPerSlice      : std_logic_vector(31 downto 0);
   signal pixelCounterInit    : std_logic;
   signal pixelCounter        : unsigned(31 downto 0);
   signal pixelCounterNext    : unsigned(31 downto 0);
   signal pixelCounterEn      : std_logic;
                              
   signal slicesPerImage      : std_logic_vector(31 downto 0);
   signal sliceCounterInit    : std_logic;
   signal sliceCounter        : unsigned(31 downto 0);
   signal sliceCounterNext    : unsigned(31 downto 0);
   signal sliceCounterEn      : std_logic;

   signal imagesPerAcq        : std_logic_vector(31 downto 0);
   signal imageCounterInit    : std_logic;
   signal imageCounter        : unsigned(31 downto 0);
   signal imageCounterNext    : unsigned(31 downto 0);
   signal imageCounterEn      : std_logic;
   
   -- Debug bits
   signal debugReg         : std_logic_vector(31 downto 0);
   signal debugOmitSOT     : std_logic;
   signal debugOmitEOT     : std_logic;
   signal debugOmitLastEOT : std_logic;
   
   component RaftDataSimRegs is
      port (
         -- Clocks and Resets
         usrClk         :  in std_logic;
         usrRst         :  in std_logic;
   
         -- Register control interface
         regReq         :  in std_logic;
         regOp          :  in std_logic;
         regAddr        :  in std_logic_vector(23 downto 0);
         regDataWr      :  in std_logic_vector(31 downto 0);
         regAck         : out std_logic;
         regFail        : out std_logic;
         regDataRd      : out std_logic_vector(31 downto 0);
   
         -- Signals to and from registers
         pixelsPerSlice : out std_logic_vector(31 downto 0);
         slicesPerImage : out std_logic_vector(31 downto 0);
         imagesPerAcq   : out std_logic_vector(31 downto 0);
      
         pixelSpacing   : out std_logic_vector(31 downto 0);
         sliceSpacing   : out std_logic_vector(31 downto 0);
         imageSpacing   : out std_logic_vector(31 downto 0);
      
         dataMode       : out std_logic_vector( 7 downto 0);
         dataSeed       : out std_logic_vector(17 downto 0);

         debugReg       : out std_logic_vector(31 downto 0);
      
         dataRunEn      : out std_logic;
         dataBusy       :  in std_logic;
   
         pixelCounterEn :  in std_logic;
         imageCounterEn :  in std_logic;
         sliceCounterEn :  in std_logic
      );
   end component;


--   component rcm_sim_48kb is
--     port (
--        clka  : in std_logic;
--        wea   : in std_logic_vector(0 downto 0);
--        addra : in std_logic_vector(15 downto 0);
--        dina  : in std_logic_vector(15 downto 0);
--        douta : out std_logic_vector(15 downto 0);
--        clkb  : in std_logic;
--        web   : in std_logic_vector(0 downto 0);
--        addrb : in std_logic_vector(15 downto 0);
--        dinb  : in std_logic_vector(15 downto 0);
--        doutb : out std_logic_vector(15 downto 0)
--     );
--   end component;
--
--   attribute syn_black_box : boolean;
--   attribute syn_black_box of rcm_sim_48kb : component is true;
   
   ----------------------------------------------------------------------------
   ----------------------------------------------------------------------------
   
begin

   U_RaftDataSimRegs : RaftDataSimRegs
      port map (
         usrClk         => usrClk,
         usrRst         => usrRst,
         regReq         => regReq,
         regOp          => regOp,
         regAddr        => regAddr,
         regDataWr      => regDataWr,
         regAck         => intRegAck,
         regFail        => intRegFail,
         regDataRd      => intRegDataRd,
         dataMode       => regDataMode,
         dataSeed       => regDataSeed,
         pixelsPerSlice => pixelsPerSlice,
         slicesPerImage => slicesPerImage,
         imagesPerAcq   => imagesPerAcq,
         pixelSpacing   => pixelSpacing,
         sliceSpacing   => sliceSpacing,
         imageSpacing   => imageSpacing,
         debugReg       => debugReg,
         pixelCounterEn => pixelCounterEn,
         sliceCounterEn => sliceCounterEn,
         imageCounterEn => imageCounterEn,
         dataRunEn      => regDataRunEn,
         dataBusy       => regDataBusy
      );


--   U_rcm_sim_48kb : rcm_sim_48kb
--      port map (
--        clka  => usrClk,
--        wea   => memRegWrEn,
--        addra => memRegAddr,
--        dina  => memRegDataWr,
--        douta => memRegDataRd,
--        clkb  => usrClk,
--        web   => (others => '0'),
--        addrb => memOutAddr,
--        dinb  => (others => '0'),
--        doutb => memOutData
--   );

   memRegReq <=  regReq when regAddr(23 downto 20) = x"6" else '0';
   
   regAck    <=  memRegAck or intRegAck;
   regFail   <= memRegFail or intRegFail;
   regDataRd <= x"0000"&memRegDataRd when memRegAck = '1' else
                intRegDataRd when intRegAck = '1' else (others => '0');

   memRegDataWr <= regDataWr(15 downto 0);
   memRegAddr   <=  regAddr(15 downto 0);
   
   process(usrClk, usrRst)
   begin
      if (usrRst = '1') then
         memRegAck     <= '0';
         memRegFail    <= '0';
         memRegWrEn(0) <= '0';
      elsif rising_edge(usrClk) then
         memRegAck <= memRegReq;

         if memRegReq = '1' then
            if memRegAddr > x"BFFF" then
               memRegFail <= '1';
               memRegWrEn(0) <= '0';
            else
               memRegFail <= '0';
               memRegWrEn(0) <= memRegReq and regOp;
            end if;
         else
            memRegFail <= '0';
            memRegWrEn(0) <= '0';
         end if;
         
      end if;
   end process;
   
   -- Register resets and clocks
   process (usrClk, usrRst)
   begin
      if (usrRst = '1') then
         raft_state       <= IDLE;
         lfsr             <= LFSR_SEED;
         incDat           <= (others => '0');
         memOutAddr       <= (others => '0');
         pixelSpaceCount  <= (others => '0');
         sliceSpaceCount  <= (others => '0');
         imageSpaceCount  <= (others => '0');
         pixelCounter     <= (others => '0');
         sliceCounter     <= (others => '0');
         imageCounter     <= (others => '0');
         dataMode         <= (others => '0');
      elsif rising_edge(usrClk) then
         raft_state       <= raft_state_next;
         lfsr             <= lfsrNext;
         incDat           <= incDatNext;
         memOutAddr       <= memOutAddrNext;
         pixelSpaceCount  <= pixelSpaceCountNext;
         sliceSpaceCount  <= sliceSpaceCountNext;
         imageSpaceCount  <= imageSpaceCountNext;
         pixelCounter     <= pixelCounterNext;
         sliceCounter     <= sliceCounterNext;
         imageCounter     <= imageCounterNext;
         dataMode         <= dataModeNext;
      end if;
   end process;

   ----------------------------------------------------------------------------
   -- Simulated Data Generation
   ----------------------------------------------------------------------------
   -- Latch the data mode
   process (dataInit, regDataMode, dataMode)
   begin
      if dataInit = '1' then
         dataModeNext <= regDataMode;
      else
         dataModeNext <= dataMode;
      end if;
   end process;
   
   -- LFSR Next State Logic
   -- 16 bits --> lfsr_fb <= lfsr(0) xor lfsr(2) xor lfsr(3) xor lfsr(5);
   -- 18 bits --> lfsr_fb <= lfsr(0) xor lfsr(7);
   lfsr_fb <= lfsr(0) xor lfsr(7);
   process (dataInit, lfsr, lfsr_fb, dataEn, regDataSeed)
   begin
      if dataInit = '1' then
         if regDataSeed = "00" & x"0000" then
            lfsrNext <= LFSR_SEED;
         else
            lfsrNext <= regDataSeed;
         end if;
      elsif dataEn = '1' then
         lfsrNext <= lfsr_fb & lfsr(17 downto 1);
      else
         lfsrNext <= lfsr;
      end if;
   end process;

   -- Incrementing Data Counter
   process (incDat, dataInit, dataEn, regDataSeed)
   begin
      if (dataInit = '1') then
         incDatNext <= regDataSeed;
      elsif (dataEn = '1') then
         if incDat = "11" & x"FFFF" then
            incDatNext <= (others => '0');
         else
            incDatNext <= std_logic_vector(unsigned(incDat)
                                           + to_unsigned(4,18));
         end if;
      else
         incDatNext <= incDat;
      end if;
   end process;

   -- Memory Data Source
   process(dataInit, dataEn, regDataSeed, memOutAddr)
   begin
      if dataInit = '1' then
         memOutAddrNext <= regDataSeed(15 downto 0);
      elsif dataEn = '1' then
         if memOutAddr = x"BFFF" then
            memOutAddrNext <= (others => '0');
         else
            memOutAddrNext <=  std_logic_vector(unsigned(memOutAddr)
                                                + to_unsigned(1,16));
         end if;
      else
         memOutAddrNext <=  memOutAddr;
      end if;
   end process;
   
   ----------------------------------------------------------------------------
   -- Data sending bookkeeping counters
   ----------------------------------------------------------------------------
   -- Pixel Spacing Counter
   process (pixelSpaceCount, pixelSpaceCountEn,
            pixelSpaceCountRst, pixelSpaceCountInit,
            pixelSpacing)
   begin
      if pixelSpaceCountInit = '1' then
         pixelSpaceCountNext <= unsigned(pixelSpacing);
      elsif (pixelSpaceCountRst = '1') then
         pixelSpaceCountNext <= x"00000000";
      elsif (pixelSpaceCountEn = '1') then
         if pixelSpaceCount > 0 then
            pixelSpaceCountNext <= pixelSpaceCount - 1;
         else
            pixelSpaceCountNext <= unsigned(pixelSpacing);
         end if;
      else
         pixelSpaceCountNext <= pixelSpaceCount;
      end if;
   end process;

   -- Slice Spacing Counter
   process (sliceSpaceCount, sliceSpaceCountEn, sliceSpaceCountInit,
            sliceSpacing)
   begin
      if sliceSpaceCountInit = '1' then
         sliceSpaceCountNext <= unsigned(sliceSpacing);
      elsif (sliceSpaceCountEn = '1') then
         if sliceSpaceCount > 0 then
            sliceSpaceCountNext <= sliceSpaceCount - 1;
         else
            sliceSpaceCountNext <= sliceSpaceCount;
         end if;
      else
         sliceSpaceCountNext <= sliceSpaceCount;
      end if;
   end process;

   -- Image Spacing Counter
   process (imageSpaceCount, imageSpaceCountEn, imageSpaceCountInit,
            imageSpacing)
   begin
      if imageSpaceCountInit = '1' then
         imageSpaceCountNext <= unsigned(imageSpacing);
      elsif (imageSpaceCountEn = '1') then
         if imageSpaceCount > 0 then
            imageSpaceCountNext <= imageSpaceCount - 1;
         else
            imageSpaceCountNext <= imageSpaceCount;
         end if;
      else
         imageSpaceCountNext <= imageSpaceCount;
      end if;
   end process;

   -- Pixel Data Counter
   process (pixelCounterInit, pixelCounter, pixelCounterEn,
            pixelsPerSlice)
   begin
      if pixelCounterInit = '1' then
         pixelCounterNext     <= unsigned(pixelsPerSlice) - 1;
      elsif (pixelCounterEn = '1') then
         if pixelCounter > 0 then
            pixelCounterNext  <= pixelCounter - 1;
         else
            pixelCounterNext  <= unsigned(pixelsPerSlice) - 1;
         end if;
      else
         pixelCounterNext     <= pixelCounter;
      end if;
   end process;

   -- Slice Data Counter
   process (sliceCounterInit, sliceCounter, sliceCounterEn,
            slicesPerImage)
   begin
      if sliceCounterInit = '1' then
         sliceCounterNext     <= unsigned(slicesPerImage) - 1;
      elsif (sliceCounterEn = '1') then
         if sliceCounter > 0 then
            sliceCounterNext  <= sliceCounter - 1;
         else
            sliceCounterNext  <= sliceCounter;
         end if;
      else
         sliceCounterNext     <= sliceCounter;
      end if;
   end process;

   -- Image Counter
   process (imageCounterInit, imageCounter, imageCounterEn,
            imagesPerAcq)
   begin
      if imageCounterInit = '1' then
         imageCounterNext <= unsigned(imagesPerAcq) - 1;
      elsif (imageCounterEn = '1') then
         if imageCounter > 0 then
            imageCounterNext <= imageCounter - 1;
         else
            imageCounterNext <= imageCounter;
         end if;
      else
         imageCounterNext <= imageCounter;
      end if;
   end process;

   
   ----------------------------------------------------------------------------
   -- Internal control logic signals
   ----------------------------------------------------------------------------
   firstPixel <= '1' when (pixelCounter = unsigned(pixelsPerSlice) - 1
                           and nextPixel = '1')               else '0';
   lastPixel <= '1' when pixelCounter = 0 and nextPixel = '1' else '0';
   firstSlice <= '1' when (sliceCounter = unsigned (slicesPerImage) - 1
                           and firstPixel = '1')              else '0';
   lastSlice <= '1' when sliceCounter = 0 and lastPixel = '1' else '0';
   lastImage <= '1' when imageCounter = 0 and lastSlice = '1' else '0';

   nextPixel <= '1' when pixelSpaceCount = 0 else '0';
   nextSlice <= '1' when sliceSpaceCount = 0 else '0';
   nextImage <= '1' when imageSpaceCount = 0 else '0';

   intSimData <= incDat when dataMode = INCR_MODE else
                 lfsr when dataMode = LFSR_MODE else
                 memOutData&"00" when dataMode =  MEM_MODE else x"a5a5"&"01";
   
   raftWrEn <= intRaftWrEn;
   raftSOT  <= intRaftSOT;
   raftEOT  <= intRaftEOT;
   intRaftClk <= usrClk;
   raftClk  <= intRaftClk;
   raftData <= intRaftData;
   regDataBusy <= dataBusy;

   ----------------------------------------------------------------------------
   -- Debug decoding
   ----------------------------------------------------------------------------
   debugOmitSOT     <= debugReg(0);
   debugOmitEOT     <= debugReg(1);
   debugOmitLastEOT <= debugReg(2);

   
   ----------------------------------------------------------------------------
   -- Data simulation state machine
   ----------------------------------------------------------------------------
   -- Raft FSM Next State Logic
   process (raft_state, regDataRunEn, intSimData,
            nextPixel, lastPixel,
            nextSlice, lastSlice,
            nextImage, lastImage,
            debugOmitSOT, debugOmitEOT, debugOmitLastEOT)
   begin
      intRaftWrEn         <= '0';
      intRaftSOT          <= '0';
      intRaftEOT          <= '0';
      intRaftData         <= (others => '0');
      dataEn              <= '0';
      dataInit            <= '0';
      dataBusy            <= '0';
      pixelCounterInit    <= '0';
      pixelCounterEn      <= '0';
      pixelSpaceCountInit <= '0';
      pixelSpaceCountEn   <= '0';
      pixelSpaceCountRst  <= '0';
      sliceCounterInit    <= '0';
      sliceCounterEn      <= '0';
      sliceSpaceCountInit <= '0';
      sliceSpaceCountEn   <= '0';
      imageCounterInit    <= '0';
      imageCounterEn      <= '0';
      imageSpaceCountInit <= '0';
      imageSpaceCountEn   <= '0';
      in_idle             <= '0';
      in_sot              <= '0';
      in_send             <= '0';
      in_eot              <= '0';
      in_pix_spc          <= '0';
      in_sli_spc          <= '0';
      in_img_spc          <= '0';

      case raft_state is
         when IDLE =>
            in_idle             <= '1';
            dataInit            <= '1';
            pixelCounterInit    <= '1';
            pixelSpaceCountInit <= '1';
            sliceCounterInit    <= '1';
            sliceSpaceCountInit <= '1';
            imageCounterInit    <= '1';
            imageSpaceCountInit <= '1';

            if regDataRunEn = '1' then
               raft_state_next <= SOT;
            else
               raft_state_next <= IDLE;
            end if;

         when SOT =>
            in_sot <= '1';
            dataBusy <= '1';
            intRaftWrEn <= '1';
            intRaftSOT <= not debugOmitSOT;
            raft_state_next <= SEND;
            
         when SEND =>
            in_send        <= '1';

            dataEn              <= nextPixel;
            intRaftData         <= intSimData;
            intRaftWrEn         <= nextPixel;
            dataBusy            <= not lastImage;
            pixelCounterEn      <= nextPixel;
            pixelSpaceCountEn   <= not nextPixel;
            pixelSpaceCountInit <= nextPixel;

            sliceCounterEn      <= lastPixel;
            sliceSpaceCountInit <= nextSlice;

            imageCounterEn      <= lastSlice;
            imageSpaceCountInit <= nextImage;
            
            if lastPixel = '1' and lastSlice = '0' then
               raft_state_next <= SLI_SPC;
            elsif lastPixel = '1' and lastSlice = '1' and lastImage = '1' then
               raft_state_next <= LAST_EOT;
            elsif lastPixel = '1' and lastSlice = '1' and lastImage = '0' then
               raft_state_next <= EOT;
            else
               raft_state_next <= SEND;
            end if;

         when EOT =>
            in_eot <= '1';
            intRaftWrEn <= '1';
            intRaftEOT <= not (debugOmitEOT);
            dataBusy <= '1';
            raft_state_next <= IMG_SPC;
               
         when LAST_EOT =>
            in_eot <= '1';
            intRaftWrEn <= '1';
            intRaftEOT <= not (debugOmitLastEOT or debugOmitEOT);
            raft_state_next <= IDLE;
               
         when SLI_SPC =>
            in_sli_spc <= '1';

            dataBusy <= '1';

            pixelSpaceCountRst <= '1';
            
            sliceSpaceCountInit <= '0';
            sliceSpaceCountEn <= '1';

            if nextSlice = '1' then
               raft_state_next <= SEND;
            else
               raft_state_next <= SLI_SPC;
            end if;

         when IMG_SPC =>
            in_img_spc <= '1';

            dataBusy <= '1';

            pixelSpaceCountRst <= '1';
            
            sliceCounterInit <= '1';
            
            imageSpaceCountInit <= '0';
            imageSpaceCountEn <= '1';

            if nextImage = '1' then
               raft_state_next <= SOT;
            else
               raft_state_next <= IMG_SPC;
            end if;
            
            
      end case;
   end process;

end RaftDataSim;
      
      
