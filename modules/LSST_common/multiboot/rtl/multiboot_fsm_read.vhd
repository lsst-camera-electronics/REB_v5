library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity multiboot_fsm_read is
  port (
    SYSCLK         : in  std_logic;
    RESET          : in  std_logic;
    TRIGGER        : in  std_logic;
    IMAGESEL       : in  std_logic_vector(1 downto 0);
    ICAP_OUT_VALID : out std_logic;
    ICAP_OUT       : out std_logic_vector(31 downto 0)
    );
end multiboot_fsm_read;

architecture Behavioral of multiboot_fsm_read is
  

  type FSM_STATE is (STATE_0, STATE_R00, STATE_R01, STATE_R02, STATE_R03, STATE_R04, STATE_R05,
                     STATE_R06, STATE_R07, STATE_R08, STATE_R09, STATE_R10, STATE_R11,
                     STATE_R12, STATE_R13, STATE_R14, STATE_R15,
                     STATE_00, STATE_01, STATE_02, STATE_03, STATE_04, STATE_05,
                     STATE_06, STATE_07, STATE_08, STATE_09, STATE_10, STATE_11);
  signal NEXT_STATE  : FSM_STATE                     := STATE_0;
  signal CE          : std_logic                     := '1';
  signal I           : std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
  signal O           : std_logic_vector(31 downto 0);
  signal o_valid     : std_logic;
  signal ICAP_WRITE  : std_logic                     := '1';
  signal bit_swapped : std_logic_vector(31 downto 0) := x"FFFFFFFF";
-- 24 bit addressing 
  --constant cAddrImage0 : std_logic_vector(31 downto 0) := X"00000000";  --1st image 
  --constant cAddrImage1 : std_logic_vector(31 downto 0) := X"00800000";  --2nd image 
  --constant cAddrImage2 : std_logic_vector(31 downto 0) := X"01000000";  --3ed image
  --constant cAddrImage3 : std_logic_vector(31 downto 0) := X"01800000";  --4th image 

-- 32 bit addressing 
  constant cAddrImage0 : std_logic_vector(31 downto 0) := X"00000000";  --1st image address x"00000000"
  constant cAddrImage1 : std_logic_vector(31 downto 0) := X"00008000";  --2nd image address X"00800000"shifted
  constant cAddrImage2 : std_logic_vector(31 downto 0) := X"00010000";  --3ed image address X"01000000" shifted 
  constant cAddrImage3 : std_logic_vector(31 downto 0) := X"00018000";  --4th image address X"01800000" shifted

  signal cnt : integer range 0 to 512;


  --attribute mark_debug                : string;
  --attribute mark_debug of I           : signal is "true";
  --attribute mark_debug of O           : signal is "true";
  --attribute mark_debug of bit_swapped : signal is "true";
  --attribute mark_debug of CE          : signal is "true";
  --attribute mark_debug of ICAP_WRITE  : signal is "true";
  --attribute mark_debug of o_valid     : signal is "true";
  --attribute mark_debug of NEXT_STATE  : signal is "true";


begin
  
  ICAPE2_inst : ICAPE2
    generic map (
      ICAP_WIDTH        => "X32",
      SIM_CFG_FILE_NAME => "NONE"
      )
    port map (
      O     => O,                       -- 32-bit output (not used)
      CLK   => SYSCLK,                  -- 1-bit Clock Input
      CSIB  => CE,                      -- 1-bit Active-Low ICAP Enable
      I     => bit_swapped,             -- 32-bit iConfiguration data input bus
      RDWRB => ICAP_WRITE               -- 1-bit input: Read/Write Select input
      );

  -- all the instruction passed to ICAPE2 on I are bit swapped following the
  -- procedure described by xilinx in UG470.
  -- As an example 0xAA bit swapped is 0x55 or 0x0E is bit swapped to 0x70
  -- Bit swap the ICAP bytes
  bit_swapped(31 downto 24) <= I(24)&I(25)&I(26)&I(27)&I(28)&I(29)&I(30)&I(31);
  bit_swapped(23 downto 16) <= I(16)&I(17)&I(18)&I(19)&I(20)&I(21)&I(22)&I(23);
  bit_swapped(15 downto 8)  <= I(8)&I(9)&I(10)&I(11)&I(12)&I(13)&I(14)&I(15);
  bit_swapped(7 downto 0)   <= I(0)&I(1)&I(2)&I(3)&I(4)&I(5)&I(6)&I(7);

  ICAP_OUT(31 downto 24) <= O(24)&I(25)&O(26)&O(27)&O(28)&O(29)&O(30)&O(31);
  ICAP_OUT(23 downto 16) <= O(16)&O(17)&O(18)&O(19)&O(20)&O(21)&O(22)&O(23);
  ICAP_OUT(15 downto 8)  <= O(8)&O(9)&O(10)&O(11)&O(12)&O(13)&O(14)&O(15);
  ICAP_OUT(7 downto 0)   <= O(0)&O(1)&O(2)&O(3)&O(4)&O(5)&O(6)&O(7);

  --ICAP_OUT       <= O;
  ICAP_OUT_VALID <= o_valid;

  process(SYSCLK)
  begin
     o_valid    <= '0';
       cnt        <= cnt;
    if (falling_edge(SYSCLK)) then
      if RESET = '1' then
        o_valid    <= '0';
        cnt        <= 0;
        ICAP_WRITE <= '1';
        CE         <= '1';
        I          <= x"00000000";
        NEXT_STATE <= STATE_0;
      else
        
        case NEXT_STATE is
          when STATE_0 =>
            if (cnt = 255) then
              --  if (TRIGGER = '1') then
              ICAP_WRITE <= '1';
              CE         <= '1';
              I          <= x"00000000";
              NEXT_STATE <= STATE_R00;
            else
              ICAP_WRITE <= '1';
              CE         <= '1';
              I          <= x"AAAABBBB";
              NEXT_STATE <= STATE_0;
              cnt        <= cnt + 1;
            end if;
          when STATE_R00 =>
            ICAP_WRITE <= '0';
            CE         <= '1';
            I          <= x"00000000";
            NEXT_STATE <= STATE_R01;
          when STATE_R01 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"FFFFFFFF";  -- dummy word
            NEXT_STATE <= STATE_R02;
          when STATE_R02 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"AA995566";  -- sync word
            NEXT_STATE <= STATE_R03;
          when STATE_R03 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"20000000";  -- NOP word
            NEXT_STATE <= STATE_R04;
          when STATE_R04 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"20000000";  -- NOP word
            NEXT_STATE <= STATE_R05;
          when STATE_R05 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"2802C001";  --READ BOOTSTS word
            NEXT_STATE <= STATE_R06;
          when STATE_R06 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"20000000";  -- NOP word
            NEXT_STATE <= STATE_R07;
          when STATE_R07 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"20000000";  -- NOP word
            NEXT_STATE <= STATE_R08;
          when STATE_R08 =>
            ICAP_WRITE <= '1';
            CE         <= '1';          -- CE @ 1 to switch R/W to 1
            I          <= x"00000000";  -- 
            NEXT_STATE <= STATE_R09;
          when STATE_R09 =>
            ICAP_WRITE <= '1';
            CE         <= '0';          -- CE @ 0 R/W to 1 (read)
            I          <= x"00000000";  -- 
            NEXT_STATE <= STATE_R10;
          when STATE_R10 =>
            ICAP_WRITE <= '1';
            CE         <= '0';
            I          <= x"00000000";  -- wait for ICAPE out 
            NEXT_STATE <= STATE_R11;
          when STATE_R11 =>
            ICAP_WRITE <= '1';
            CE         <= '0';
            I          <= x"00000000";  -- wait for ICAPE out 
            NEXT_STATE <= STATE_R12;
          when STATE_R12 =>
            ICAP_WRITE <= '1';
            CE         <= '0';
            I          <= x"00000000";  -- wait for ICAPE out 
            NEXT_STATE <= STATE_R13;
          when STATE_R13 =>
            o_valid    <= '1';
            ICAP_WRITE <= '1';
            CE         <= '0';
            I          <= x"00000000";  -- wait for ICAPE out 
            NEXT_STATE <= STATE_R14;
          when STATE_R14 =>
            ICAP_WRITE <= '1';
            CE         <= '0';
            I          <= x"00000000";  -- wait for ICAPE out 
            NEXT_STATE <= STATE_R15;
          when STATE_R15 =>
            ICAP_WRITE <= '1';
            CE         <= '0';
            I          <= x"00000000";  -- wait for ICAPE out 
            NEXT_STATE <= STATE_00;

          when STATE_00 =>
            if (TRIGGER = '1') then
              ICAP_WRITE <= '1';
              CE         <= '1';
              I          <= x"00000000";
              NEXT_STATE <= STATE_01;
            else
              ICAP_WRITE <= '1';
              CE         <= '1';
              I          <= x"AAAABBBB";
              NEXT_STATE <= STATE_00;
            end if;
          when STATE_01 =>
            ICAP_WRITE <= '0';
            CE         <= '1';
            I          <= x"00000000";
            NEXT_STATE <= STATE_02;
          when STATE_02 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"00000000";
            NEXT_STATE <= STATE_03;
          when STATE_03 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"FFFFFFFF";  -- dummy word
            NEXT_STATE <= STATE_04;
          when STATE_04 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"AA995566";  -- sync word (x"AA995566" non-bit-swapped)
            NEXT_STATE <= STATE_05;
          when STATE_05 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
--            I          <= ;  -- Type 1 NO OP
            I          <= x"20000000";  -- Type 1 NO OP (x"20000000" non-bit-swapped)
            NEXT_STATE <= STATE_06;
          when STATE_06 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"30020001";  -- Type 1 Write 1 word to WBSTAR (x"30020001" non-bit-swapped)
            NEXT_STATE <= STATE_07;
          when STATE_07 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            -- I          <= x"000E0000";  -- Warm boot start address  (x"00700000" non-bit-swapped)
            if IMAGESEL = "00" then
              I <= cAddrImage0;
            elsif IMAGESEL = "01" then
              I <= cAddrImage1;
            elsif IMAGESEL = "10" then
              I <= cAddrImage2;
            else
              I <= cAddrImage3;
            end if;
            NEXT_STATE <= STATE_08;
          when STATE_08 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"30008001";  -- Type 1 write 1 word to CMD (x"30008001" non-bit-swapped)
            NEXT_STATE <= STATE_09;
          when STATE_09 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"0000000F";  -- IPROG command (x"0000000F" non-bit-swapped)
            NEXT_STATE <= STATE_10;
          when STATE_10 =>
            ICAP_WRITE <= '0';
            CE         <= '0';
            I          <= x"20000000";  -- Type 1 NO OP (x"20000000" non-bit-swapped)
            NEXT_STATE <= STATE_11;
          when STATE_11 =>
            ICAP_WRITE <= '0';
            CE         <= '1';          -- deassert CE
            I          <= x"20000000";  -- Type 1 NO OP (x"20000000" non-bit-swapped)
            NEXT_STATE <= STATE_00;
          when others =>
            ICAP_WRITE <= '1';
            CE         <= '1';
            I          <= x"AAAAAAAA";
            NEXT_STATE <= STATE_00;
        end case;
      end if;
    end if;
  end process;

end Behavioral;
