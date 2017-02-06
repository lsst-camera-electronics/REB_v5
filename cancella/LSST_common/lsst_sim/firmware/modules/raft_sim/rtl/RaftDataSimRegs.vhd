-------------------------------------------------------------------------------
-- Title      : RCM SDS
-- Project    : LSST
-------------------------------------------------------------------------------
-- File       : RaftDataSimRegs.vhd
-- Author     : Gregg Thayer  <jgt@slac.stanford.edu>
-- Company    : SLAC
-- Last update: 2015-12-04
-------------------------------------------------------------------------------
-- Description: This block contains the registers which control the
--              raft data simulation. It also has counters which report
--              the status of the simulation.
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011/03/21  1.0      jgt	Created from firmware version 6
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RaftDataSimRegs is
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

end RaftDataSimRegs;

architecture RaftDataSimRegs of RaftDataSimRegs is
   constant TPD_G              : time := 1 ns;

   constant CONTROL_ADDR     : std_logic_vector(23 downto 0) := x"70_0000";
   constant DATMODE_ADDR     : std_logic_vector(23 downto 0) := x"70_0001";
   constant DATSEED_ADDR     : std_logic_vector(23 downto 0) := x"70_0002";
   constant PIX_PER_SLI_ADDR : std_logic_vector(23 downto 0) := x"70_0003";
   constant PIX_SPACING_ADDR : std_logic_vector(23 downto 0) := x"70_0004";
   constant SLI_PER_IMG_ADDR : std_logic_vector(23 downto 0) := x"70_0005";
   constant SLI_SPACING_ADDR : std_logic_vector(23 downto 0) := x"70_0006";
   constant IMG_PER_ACQ_ADDR : std_logic_vector(23 downto 0) := x"70_0007";
   constant IMG_SPACING_ADDR : std_logic_vector(23 downto 0) := x"70_0008";
   constant PIX_COUNT_ADDR   : std_logic_vector(23 downto 0) := x"70_0009";
   constant SLI_COUNT_ADDR   : std_logic_vector(23 downto 0) := x"70_000A";
   constant IMG_COUNT_ADDR   : std_logic_vector(23 downto 0) := x"70_000B";
   constant ERR_SET_ADDR     : std_logic_vector(23 downto 0) := x"70_000C";
   
   signal regAddrFail    : std_logic;
   signal regDataFail    : std_logic;
   signal regReq_i       : std_logic;

   signal iPixelsPerSlice : std_logic_vector(31 downto 0);
   signal iPixelSpacing   : std_logic_vector(31 downto 0);
   signal iSlicesPerImage : std_logic_vector(31 downto 0);
   signal iSliceSpacing   : std_logic_vector(31 downto 0);
   signal iImagesPerAcq   : std_logic_vector(31 downto 0);
   signal iImageSpacing   : std_logic_vector(31 downto 0);
   
   signal iPixCount      : unsigned(31 downto 0);
   signal iSliCount      : unsigned(31 downto 0);
   signal iImgCount      : unsigned(31 downto 0);

   signal iPixCountNext  : unsigned(31 downto 0);
   signal iSliCountNext  : unsigned(31 downto 0);
   signal iImgCountNext  : unsigned(31 downto 0);

   signal countReset     : std_logic;
   
   signal iDataMode      : std_logic_vector( 7 downto 0);
   signal iDataSeed      : std_logic_vector(17 downto 0);

   signal iDebugReg      : std_logic_vector(31 downto 0);
   
   signal iRunControlEn  : std_logic;
   signal iRunControl    : std_logic;
   signal iRunning       : std_logic;
   
   type run_state_type is (IDLE, START, RUN, STOP);
   signal run_state, run_state_next : run_state_type;
   signal start_run      : std_logic;
   signal stop_run       : std_logic;
   
   -- Register delay for simulation
   constant tpd:time := 0.5 ns;
   
begin

   
   process (usrClk, usrRst)
   begin
      if usrRst = '1' then
         run_state <= IDLE;
      elsif rising_edge(usrClk) then
         run_state <= run_state_next after TPD_G;
      end if;
   end process;

   start_run <= '1' when iRunControlEn = '1' and iRunControl = '1' else '0';
   stop_run  <= '1' when iRunControlEn = '1' and iRunControl = '0' else '0';
   
   process (run_state, start_run, stop_run, dataBusy)
   begin
      case run_state is
         when IDLE =>
            if start_run = '1' then
               run_state_next <= START;
            else
               run_state_next <= IDLE;
            end if;
         when START =>
            if stop_run = '1' then
               run_state_next <= IDLE;
            elsif dataBusy = '1' then
               run_state_next <= RUN;
            else
               run_state_next <= START;
            end if;
         when RUN =>
            if stop_run = '1' then
               run_state_next <= STOP;
            elsif dataBusy = '0' then
               run_state_next <= IDLE;
            else
               run_state_next <= RUN;
            end if;
         when STOP =>
            if dataBusy = '0' then
               run_state_next <= IDLE;
            else
               run_state_next <= STOP;
            end if;
      end case;
   end process;

   process (run_state)
   begin
      case run_state is
         when IDLE  => iRunning <= '0';
         when START => iRunning <= '1';
         when RUN   => iRunning <= '1';
         when STOP  => iRunning <= '0';
      end case;
   end process;
   
   ----------------------------------------------------------------------------
   -- Data simulation status counters
   ----------------------------------------------------------------------------
   process (usrClk, usrRst)
   begin
      if (usrRst = '1') then
         iPixCount <= (others => '0');
         iSliCount <= (others => '0');
         iImgCount <= (others => '0');
      elsif rising_edge(usrClk) then
         iPixCount <= iPixCountNext after TPD_G;
         iSliCount <= iSliCountNext after TPD_G;
         iImgCount <= iImgCountNext after TPD_G;
      end if;
   end process;

   -- Pixel counter
   process(iPixCount, pixelCounterEn, countReset)
   begin
      if (pixelCounterEn = '1') then
         if (iPixCount = x"FFFFFFFF") then
            iPixCountNext <= (others => '0');
         else
            iPixCountNext <= iPixCount + 1;
         end if;
      elsif (countReset = '1') then
         iPixCountNext <= (others => '0');
      else        
         iPixCountNext <= iPixCount;
      end if;
   end process;

   -- Slice counter
   process(iSliCount, sliceCounterEn, countReset)
   begin
      if (sliceCounterEn = '1') then
         if (iSliCount = x"FFFFFFFF") then
            iSliCountNext <= (others => '0');
         else
            iSliCountNext <= iSliCount + 1;
         end if;
      elsif (countReset = '1') then
         iSliCountNext <= (others => '0');
      else        
         iSliCountNext <= iSliCount;
      end if;
   end process;

   -- Image counter
   process(iImgCount, imageCounterEn, countReset)
   begin
      if (imageCounterEn = '1') then
         if (iImgCount = x"FFFFFFFF") then
            iImgCountNext <= (others => '0');
         else
            iImgCountNext <= iImgCount + 1;
         end if;
      elsif (countReset = '1') then
         iImgCountNext <= (others => '0');
      else        
         iImgCountNext <= iImgCount;
      end if;
   end process;
   
   ----------------------------------------------------------------------------
   -- Raft Data Sim Register Space
   ----------------------------------------------------------------------------
   regReq_i <= regReq when regAddr(23 downto 20) = x"7" else '0';

   process (usrClk, usrRst)
   begin
      if usrRst = '1' then
         regDataRd     <= (others => '0');
         regAck        <= '0';
         regAddrFail   <= '0';
         regDataFail   <= '0';
         iDataMode     <= (others => '0');
         iDataSeed     <= "00" & x"0001";
         iPixelsPerSlice <= x"00000008";
         iPixelSpacing <= x"00000001";
         iSlicesPerImage <= x"00000004";
         iSliceSpacing   <= x"00000010";
         iImagesPerAcq   <= x"00000001";
         iImageSpacing   <= x"00000100";
         iDebugReg     <= (others => '0');
         iRunControl   <= '0';
         iRunControlEn <= '0';
         countReset    <= '1';
      elsif rising_edge(usrClk) then
         
         regAck <= regReq_i;

         if regReq_i = '1' then
            -- Write Control
            if regOp = '1' then
               countReset <= '0' after TPD_G;
               
               case regAddr is
   
                  when CONTROL_ADDR =>
                     regAddrFail    <= '0' after TPD_G;
                     regDataFail    <= '0' after TPD_G;
                     iRunControl    <= regDataWr(0) after TPD_G;
                     countReset     <= regDataWr(4) after TPD_G;
                     iRunControlEn  <= '1' after TPD_G;
                     
                  when DATMODE_ADDR =>
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     elsif regDataWr > x"FF" then
                        regDataFail <= '1' after TPD_G;
                     else
                        regDataFail <= '0' after TPD_G;
                        iDataMode   <= regDataWr( 7 downto 0) after TPD_G;
                     end if;
                     
                  when DATSEED_ADDR =>
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     elsif regDataWr > x"3FFFF" then
                        regDataFail <= '1' after TPD_G;
                     else
                        regDataFail <= '0' after TPD_G;
                        iDataSeed   <= regDataWr(17 downto 0) after TPD_G;
                     end if;
                     
                  when PIX_PER_SLI_ADDR => 
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     else
                        if regDataWr = x"00000000" then
                           regDataFail <= '1' after TPD_G;
                        else
                           regDataFail <= '0' after TPD_G;
                           iPixelsPerSlice <= regDataWr after TPD_G;
                        end if;
                     end if;
                     
                  when PIX_SPACING_ADDR => 
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     else
                        regDataFail <= '0' after TPD_G;
                        iPixelSpacing <= regDataWr after TPD_G;
                     end if;
                     
                  when SLI_PER_IMG_ADDR => 
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     else
                        if regDataWr = x"00000000" then
                           regDataFail <= '1' after TPD_G;
                        else
                           regDataFail <= '0' after TPD_G;
                           iSlicesPerImage <= regDataWr after TPD_G;
                        end if;
                     end if;
                     
                  when SLI_SPACING_ADDR => 
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     else
                        regDataFail <= '0' after TPD_G;
                        iSliceSpacing <= regDataWr after TPD_G;
                     end if;
                     
                  when IMG_PER_ACQ_ADDR => 
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     else
                        if regDataWr = x"00000000" then
                           regDataFail <= '1' after TPD_G;
                        else
                           regDataFail <= '0' after TPD_G;
                           iImagesPerAcq <= regDataWr after TPD_G;
                        end if;
                     end if;
                     
                  when IMG_SPACING_ADDR => 
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     else
                        regDataFail <= '0' after TPD_G;
                        iImageSpacing <= regDataWr after TPD_G;
                     end if;
                     
                  when ERR_SET_ADDR => 
                     regAddrFail    <= '0' after TPD_G;
                     if iRunning = '1' then
                        regDataFail <= '1' after TPD_G;
                     else
                        regDataFail <= '0' after TPD_G;
                        iDebugReg <= regDataWr after TPD_G;
                     end if;
                     
                  when others =>
                     regAddrFail    <= '1' after TPD_G;
                     regDataFail    <= '0' after TPD_G;
                     iRunControlEn  <= '0' after TPD_G;
                     iRunControl    <= '0' after TPD_G;
               end case;
               
            -- Read Control
            else
               case regAddr is
                  when CONTROL_ADDR =>
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd(31 downto  1) <= (others => '0') after TPD_G;
                     regDataRd(           0) <= iRunning after TPD_G;
                  when DATMODE_ADDR =>
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd(31 downto  8) <= (others => '0') after TPD_G;
                     regDataRd( 7 downto  0) <= iDataMode after TPD_G;
                  when DATSEED_ADDR =>
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd(31 downto 16) <= (others => '0') after TPD_G;
                     regDataRd(17 downto  0) <= iDataSeed after TPD_G;
                  when PIX_PER_SLI_ADDR => 
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= iPixelsPerSlice after TPD_G;
                  when PIX_SPACING_ADDR => 
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= iPixelSpacing after TPD_G;
                  when SLI_PER_IMG_ADDR => 
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= iSlicesPerImage after TPD_G;
                  when SLI_SPACING_ADDR => 
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= iSliceSpacing after TPD_G;
                  when IMG_PER_ACQ_ADDR => 
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= iImagesPerAcq after TPD_G;
                  when IMG_SPACING_ADDR => 
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= iImageSpacing after TPD_G;
                  when PIX_COUNT_ADDR =>
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= std_logic_vector(iPixCount) after TPD_G;
                  when SLI_COUNT_ADDR =>
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= std_logic_vector(iSliCount) after TPD_G;
                  when IMG_COUNT_ADDR =>
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= std_logic_vector(iImgCount) after TPD_G;
                  when ERR_SET_ADDR =>
                     regAddrFail             <= '0' after TPD_G;
                     regDataRd               <= std_logic_vector(iDebugReg) after TPD_G;
                  when others =>
                     regAddrFail             <= '1' after TPD_G;
                     regDataRd               <= (others => '0') after TPD_G;
               end case;
            end if;
         else
            regAddrFail   <= '0' after TPD_G;
            regDataFail   <= '0' after TPD_G;
            regDataRd     <= (others => '0') after TPD_G;
            iRunControlEn <= '0' after TPD_G;
         end if;
      end if;
   end process;          

   pixelsPerSlice <= iPixelsPerSlice;
   slicesPerImage <= iSlicesPerImage;
   imagesPerAcq   <= iImagesPerAcq;

   pixelSpacing   <= iPixelSpacing;
   sliceSpacing   <= iSliceSpacing;
   imageSpacing   <= iImageSpacing;

   dataMode   <= iDataMode;
   dataSeed   <= iDataSeed;
   
   debugReg <=  iDebugReg;
   
   regFail    <= regAddrFail or regDataFail;

   dataRunEn  <= iRunning;
   
end RaftDataSimRegs;
