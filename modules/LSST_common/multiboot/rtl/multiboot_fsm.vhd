library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity multiboot_fsm is
  port (
    SYSCLK   : in std_logic;
    TRIGGER  : in std_logic;
    IMAGESEL : in std_logic_vector(1 downto 0)
    );
end multiboot_fsm;

architecture Behavioral of multiboot_fsm is
  

  type FSM_STATE is (STATE_00, STATE_01, STATE_02, STATE_03, STATE_04, STATE_05,
                     STATE_06, STATE_07, STATE_08, STATE_09, STATE_10, STATE_11);
  signal   NEXT_STATE  : FSM_STATE                     := STATE_00;
  signal   CE          : std_logic                     := '1';
  signal   I           : std_logic_vector(31 downto 0) := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
  signal   ICAP_WRITE  : std_logic                     := '1';
  constant cAddrImage0 : std_logic_vector(31 downto 0) := X"00000000";  --1st image address x"00000000"
  constant cAddrImage1 : std_logic_vector(31 downto 0) := X"00010000";  --2nd image address X"00800000" swapped
  constant cAddrImage2 : std_logic_vector(31 downto 0) := X"80000000";  --3ed image address X"01000000" swapped 
  constant cAddrImage3 : std_logic_vector(31 downto 0) := X"80010000";  --4th image address X"01800000" swapped


begin
  
  ICAPE2_inst : ICAPE2
    generic map (
      ICAP_WIDTH        => "X32",
      SIM_CFG_FILE_NAME => "NONE"
      )
    port map (
      O     => open,                    -- 32-bit output (not used)
      CLK   => SYSCLK,                  -- 1-bit Clock Input
      CSIB  => CE,                      -- 1-bit Active-Low ICAP Enable
      I     => I,                       -- 32-bit iConfiguration data input bus
      RDWRB => ICAP_WRITE               -- 1-bit input: Read/Write Select input
      );

  -- all the instruction passed to ICAPE2 on I are bit swapped following the
  -- procedure described by xilinx in UG470.
  -- As an example 0xAA bit swapped is 0x55 or 0x0E is bit swapped to 0x70

  process(SYSCLK)
  begin
    if (falling_edge(SYSCLK)) then
      case NEXT_STATE is
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
          I          <= x"FFFFFFFF";    -- dummy word
          NEXT_STATE <= STATE_04;
        when STATE_04 =>
          ICAP_WRITE <= '0';
          CE         <= '0';
          I          <= x"5599AA66";  -- sync word (x"AA995566" non-bit-swapped)
          NEXT_STATE <= STATE_05;
        when STATE_05 =>
          ICAP_WRITE <= '0';
          CE         <= '0';
--            I          <= ;  -- Type 1 NO OP
          I          <= x"04000000";  -- Type 1 NO OP (x"20000000" non-bit-swapped)
          NEXT_STATE <= STATE_06;
        when STATE_06 =>
          ICAP_WRITE <= '0';
          CE         <= '0';
          I          <= x"0C400080";  -- Type 1 Write 1 word to WBSTAR (x"30020001" non-bit-swapped)
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
          I          <= x"0C000180";  -- Type 1 write 1 word to CMD (x"30008001" non-bit-swapped)
          NEXT_STATE <= STATE_09;
        when STATE_09 =>
          ICAP_WRITE <= '0';
          CE         <= '0';
          I          <= x"000000F0";  -- IPROG command (x"0000000F" non-bit-swapped)
          NEXT_STATE <= STATE_10;
        when STATE_10 =>
          ICAP_WRITE <= '0';
          CE         <= '0';
          I          <= x"04000000";  -- Type 1 NO OP (x"20000000" non-bit-swapped)
          NEXT_STATE <= STATE_11;
        when STATE_11 =>
          ICAP_WRITE <= '0';
          CE         <= '1';            -- deassert CE
          I          <= x"04000000";  -- Type 1 NO OP (x"20000000" non-bit-swapped)
          NEXT_STATE <= STATE_00;
        when others =>
          ICAP_WRITE <= '1';
          CE         <= '1';
          I          <= x"AAAAAAAA";
          NEXT_STATE <= STATE_00;
      end case;
    end if;
  end process;

end Behavioral;
