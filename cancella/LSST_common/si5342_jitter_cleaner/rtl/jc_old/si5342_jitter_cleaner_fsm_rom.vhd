----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:57:56 11/18/2016 
-- Design Name: 
-- Module Name:    si5342_jitter_cleaner_fsm_rom - Behavioral 
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
  use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
                             use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

                             entity si5342_jitter_cleaner_fsm_rom is
                               port (
                                 clk          : in  std_logic;
                                 reset        : in  std_logic;
                                 start_config : in  std_logic;
                                 link_busy    : in  std_logic; 
                                 jc_config    : in  std_logic_vector(1 downto 0);
                                 start_write  : out std_logic;
                                 config_busy  : out std_logic;
                                 page         : out std_logic_vector(7 downto 0);
                                 address      : out std_logic_vector(7 downto 0);
                                 data_out     : out std_logic_vector(7 downto 0)
                                 );
                             end si5342_jitter_cleaner_fsm_rom;

                             architecture Behavioral of si5342_jitter_cleaner_fsm_rom is

--  type state_type is (wait_start, send_set_io, send_pwdn);
                               
                               type state_type is (wait_start, power_down_mem_state, power_down_cmd_ex_state, 
                                                   power_up_mem_state, power_up_cmd_ex_state, 
                                                   clk_on_mem_state, clk_on_cmd_ex_state);

                               signal pres_state, next_state : state_type;
                               signal next_start_write       : std_logic;
                               signal next_config_busy       : std_logic; 
                                 signal next_rom_en : std_logic;
                               signal next_page     : std_logic_vector(7 downto 0);
                               signal next_address  : std_logic_vector(7 downto 0);
                               signal next_data_out : std_logic_vector(7 downto 0); 
                                 
                                 signal rom_add_cnt : std_logic_vector(8 downto 0); 
                                                                                      signal next_rom_add_cnt : std_logic_vector(8 downto 0); 
                                        -- ROM
                                                                                      signal rom_en           : std_logic;
                               signal rom_add  : std_logic_vector(8 downto 0);
                               signal rom_data : std_logic_vector(23 downto 0); 
                                 
                                 type rom_type is array (0 to 511) of std_logic_vector (23 downto 0);
                               signal ROM : rom_type := (x"09_43_01", x"00_1E_01", x"09_43_01", x"00_1E_00", X"00_00_00", X"00_00_00",

                                                         x"0B_24_D8", x"0B_25_00", x"00_0B_68", x"00_16_02", x"00_17_1C", x"00_18_66", x"00_19_DD", x"00_1A_DF",
                                                         x"00_2B_02", x"00_2C_09", x"00_2D_41", x"00_2E_37", x"00_2F_00", x"00_30_00", x"00_31_00", x"00_32_00",
                                                         x"00_33_00", x"00_34_37", x"00_35_00", x"00_36_37", x"00_37_00", x"00_38_00", x"00_39_00", x"00_3A_00",
                                                         x"00_3B_00", x"00_3C_37", x"00_3D_00", x"00_3F_99", x"00_40_04", x"00_41_0D", x"00_42_00", x"00_43_00",
                                                         x"00_44_0D", x"00_45_0C", x"00_46_32", x"00_47_00", x"00_48_00", x"00_49_32", x"00_4A_32", x"00_4B_00",
                                                         x"00_4C_00", x"00_4D_32", x"00_4E_05", x"00_4F_50", x"00_51_03", x"00_52_00", x"00_53_00", x"00_54_03",
                                                         x"00_55_03", x"00_56_00", x"00_57_00", x"00_58_03", x"00_59_C3", x"00_5A_AA", x"00_5B_AA", x"00_5C_0A",
                                                         x"00_5D_01", x"00_5E_00", x"00_5F_00", x"00_60_00", x"00_61_00", x"00_62_00", x"00_63_00", x"00_64_00",
                                                         x"00_65_00", x"00_66_AA", x"00_67_AA", x"00_68_0A", x"00_69_01", x"00_92_00", x"00_93_00", x"00_95_00",
                                                         x"00_96_00", x"00_98_00", x"00_9A_02", x"00_9B_20", x"00_9D_00", x"00_9E_40", x"00_A0_20", x"00_A2_02",
                                                         x"00_A8_C4", x"00_A9_F9", x"00_AA_03", x"00_AB_00", x"00_AC_00", x"01_02_01", x"01_12_06", x"01_13_09",
                                                         x"01_14_3B", x"01_15_00", x"01_17_06", x"01_18_09", x"01_19_3B", x"01_1A_00", x"01_3F_10", x"01_40_00",
                                                         x"01_41_40", x"01_42_FF", x"02_02_00", x"02_03_00", x"02_04_00", x"02_05_00", x"02_06_00", x"02_08_32",
                                                         x"02_09_00", x"02_0A_00", x"02_0B_00", x"02_0C_00", x"02_0D_00", x"02_0E_01", x"02_0F_00", x"02_10_00",
                                                         x"02_11_00", x"02_12_00", x"02_13_00", x"02_14_00", x"02_15_00", x"02_16_00", x"02_17_00", x"02_18_00",
                                                         x"02_19_00", x"02_1A_00", x"02_1B_00", x"02_1C_00", x"02_1D_00", x"02_1E_00", x"02_1F_00", x"02_20_00",
                                                         x"02_21_00", x"02_22_00", x"02_23_00", x"02_24_00", x"02_25_00", x"02_26_32", x"02_27_00", x"02_28_00",
                                                         x"02_29_00", x"02_2A_00", x"02_2B_00", x"02_2C_01", x"02_2D_00", x"02_2E_00", x"02_2F_00", x"02_31_01",
                                                         x"02_32_01", x"02_33_01", x"02_34_01", x"02_35_00", x"02_36_00", x"02_37_00", x"02_38_80", x"02_39_D4",
                                                         x"02_3A_00", x"02_3B_00", x"02_3C_00", x"02_3D_00", x"02_3E_C0", x"02_50_00", x"02_51_00", x"02_52_00",
                                                         x"02_53_00", x"02_54_00", x"02_55_00", x"02_6B_00", x"02_6C_00", x"02_6D_00", x"02_6E_00", x"02_6F_00",
                                                         x"02_70_00", x"02_71_00", x"02_72_00", x"03_02_00", x"03_03_00", x"03_04_00", x"03_05_00", x"03_06_22",
                                                         x"03_07_00", x"03_08_00", x"03_09_00", x"03_0A_00", x"03_0B_80", x"03_0C_00", x"03_0D_00", x"03_0E_00",
                                                         x"03_0F_00", x"03_10_00", x"03_11_00", x"03_12_00", x"03_13_00", x"03_14_00", x"03_15_00", x"03_16_00",
                                                         x"03_17_00", x"03_38_00", x"03_39_1F", x"03_3B_00", x"03_3C_00", x"03_3D_00", x"03_3E_00", x"03_3F_00",
                                                         x"03_40_00", x"03_41_00", x"03_42_00", x"03_43_00", x"03_44_00", x"03_45_00", x"03_46_00", x"03_59_00",
                                                         x"03_5A_00", x"03_5B_00", x"03_5C_00", x"04_87_01", x"05_02_01", x"05_08_14", x"05_09_24", x"05_0A_0B",
                                                         x"05_0B_0A", x"05_0C_07", x"05_0D_3F", x"05_0E_16", x"05_0F_2A", x"05_10_09", x"05_11_08", x"05_12_07",
                                                         x"05_13_3F", x"05_15_00", x"05_16_00", x"05_17_00", x"05_18_00", x"05_19_A8", x"05_1A_02", x"05_1B_00",
                                                         x"05_1C_00", x"05_1D_00", x"05_1E_00", x"05_1F_80", x"05_21_21", x"05_2A_01", x"05_2B_01", x"05_2C_0F",
                                                         x"05_2D_03", x"05_2E_19", x"05_2F_19", x"05_31_00", x"05_32_42", x"05_33_03", x"05_34_00", x"05_35_00",
                                                         x"05_36_08", x"05_37_00", x"05_38_00", x"05_39_00", x"08_02_35", x"08_03_05", x"08_04_00", x"09_0E_02",
                                                         x"09_43_01", x"09_49_09", x"09_4A_09", x"0A_02_00", x"0A_03_01", x"0A_04_01", x"0A_05_01", x"0B_44_2F",
                                                         x"0B_46_00", x"0B_47_00", x"0B_48_06", x"0B_4A_02", x"05_14_01", x"00_1C_01", x"0B_24_DB", x"0B_25_02",

--       X"000300", X"008602", X"002310", X"00203B", X"008300", X"004002",
--                             X"008201", X"000500", X"004001", X"002500", X"000340", X"000241",
--                             X"004002", X"008300", X"008201", X"000500", X"008101", X"000602",
--                             X"004003", X"00241E", X"000301", X"000102", X"002122", X"002021",
--                             X"000301", X"000102", X"002222", X"004001", X"000342", X"00232B",
--                             X"000900", X"000302", X"000102", X"004002", X"000900", X"008201",
--                             X"002023", X"000303", X"002433", X"000301", X"004004", X"000301",
--                             X"000102", X"002137", X"002036", X"000301", X"000102", X"002237",
--                             X"004004", X"000304", X"004040", X"002500", X"002500", X"002500",
--                             X"00030D", X"002341", X"008201", X"00400D"
                                                         others => (others => '0'));                        

                               signal rdata : std_logic_vector(23 downto 0);

-- data control strings (format is: page_address_data)
--  constant set_io_33_cmd : std_logic_vector(23 downto 0) := x"09_43_01";
--  constant set_pwdn_cmd  : std_logic_vector(23 downto 0) := x"00_1E_01";
--  constant set_pwup_cmd  : std_logic_vector(23 downto 0) := x"00_1E_00";

                               constant pwdn_add_start : std_logic_vector(8 downto 0) := '0' & x"00";
                               constant pwdn_add_end   : std_logic_vector(8 downto 0) := '0' & x"01";

                               constant pwup_add_start : std_logic_vector(8 downto 0) := '0' & x"02";
                               constant pwup_add_end   : std_logic_vector(8 downto 0) := '0' & x"03";

                               constant clkon_add_start : std_logic_vector(8 downto 0) := '0' & x"06";
                               constant clkon_add_end   : std_logic_vector(8 downto 0) := '1' & x"15";
                               
                             begin


-- ROM process
                               
                               rdata <= ROM(conv_integer(rom_add));

                               page     <= rom_data(23 downto 16);
                               address  <= rom_data(15 downto 8);
                               data_out <= rom_data(7 downto 0);
                               rom_add  <= rom_add_cnt;


                               process (clk)
                               begin
                                 if (clk'event and clk = '1') then
                                   if (rom_en = '1') then
                                     rom_data <= rdata;
                                   end if;
                                 end if;
                               end process;

-- FSM 
                               process (clk)
                               begin
                                 if clk'event and clk = '1' then
                                   if reset = '1' then
                                     pres_state  <= wait_start;
                                     start_write <= '0';
                                     config_busy <= '0';
--        page        <= (others => '0');
--        address     <= (others => '0');
--        data_out    <= (others => '0');
                                     rom_en      <= '0';
                                     rom_add_cnt <= (others => '0');
                                   else
                                     pres_state  <= next_state;
                                     start_write <= next_start_write;
                                     config_busy <= next_config_busy;
--        page        <= next_page;
--        address     <= next_address;
--        data_out    <= next_data_out;
                                     rom_en      <= next_rom_en;
                                     rom_add_cnt <= next_rom_add_cnt;
                                   end if;
                                 end if;
                               end process;


                               process (pres_state, start_config, jc_config, link_busy, rom_add_cnt)
                               begin

                                        -------------------- outputs default values  --------------------
                                 
                                 next_start_write <= '0';
                                 next_config_busy <= '1';
--    next_page        <= (others => '0');
--    next_address     <= (others => '0');
--    next_data_out    <= (others => '0');
                                 next_rom_en      <= '0';
                                 next_rom_add_cnt <= rom_add_cnt;

                                 case pres_state is

                                   when wait_start =>
                                     if start_config = '1' and jc_config = "00" then
                                       next_state       <= power_down_mem_state;
                                       next_rom_add_cnt <= pwdn_add_start;
                                       next_rom_en      <= '1';
                                       
                                     elsif start_config = '1' and jc_config = "01" then
                                       next_state       <= power_up_mem_state;
                                       next_rom_add_cnt <= pwup_add_start;
                                       next_rom_en      <= '1';
                                       
                                     elsif start_config = '1' and jc_config = "10" then
                                       next_state       <= clk_on_mem_state;
                                       next_rom_add_cnt <= clkon_add_start;
                                       next_rom_en      <= '1';
                                       
                                     else
                                       next_state       <= wait_start;
                                       next_config_busy <= '0';
                                       next_rom_add_cnt <= (others => '0');
                                     end if;

-- Power DOWN
                                   when power_down_mem_state =>
                                     next_state       <= power_down_cmd_ex_state;
                                     next_start_write <= '1';
                                     
                                   when power_down_cmd_ex_state =>
                                     if link_busy = '1' then
                                       next_state <= power_down_cmd_ex_state;
                                     else
                                       if rom_add_cnt < pwdn_add_end then
                                         next_state       <= power_down_mem_state;
                                         next_rom_add_cnt <= rom_add_cnt + 1;
                                         next_rom_en      <= '1';
                                       else
                                         next_state       <= wait_start;
                                         next_config_busy <= '0';
                                         next_rom_add_cnt <= (others => '0');
                                       end if;
                                     end if;

-- Power UP
                                   when power_up_mem_state =>
                                     next_state       <= power_up_cmd_ex_state;
                                     next_start_write <= '1';
                                     
                                   when power_up_cmd_ex_state =>
                                     if link_busy = '1' then
                                       next_state <= power_up_cmd_ex_state;
                                     else
                                       if rom_add_cnt < pwup_add_end then
                                         next_state       <= power_up_mem_state;
                                         next_rom_add_cnt <= rom_add_cnt + 1;
                                         next_rom_en      <= '1';
                                       else
                                         next_state       <= wait_start;
                                         next_config_busy <= '0';
                                         next_rom_add_cnt <= (others => '0');
                                       end if;
                                     end if;

-- Clock ON
                                   when clk_on_mem_state =>
                                     next_state       <= clk_on_cmd_ex_state;
                                     next_start_write <= '1';
                                     
                                   when clk_on_cmd_ex_state =>
                                     if link_busy = '1' then
                                       next_state <= clk_on_cmd_ex_state;
                                     else
                                       if rom_add_cnt < clkon_add_end then
                                         next_state       <= clk_on_mem_state;
                                         next_rom_add_cnt <= rom_add_cnt + 1;
                                         next_rom_en      <= '1';
                                       else
                                         next_state       <= wait_start;
                                         next_config_busy <= '0';
                                         next_rom_add_cnt <= (others => '0');
                                       end if;
                                     end if;


--      when send_set_io =>
--        if link_busy = '0' then
--          next_state       <= send_pwdn;
--          next_start_write <= '1';
--          next_page        <= set_pwdn_cmd(23 downto 16);
--          next_address     <= set_pwdn_cmd(15 downto 8);
--          next_data_out    <= set_pwdn_cmd(7 downto 0);
--        else
--          next_state    <= send_set_io;
--          next_page     <= set_io_33_cmd(23 downto 16);
--          next_address  <= set_io_33_cmd(15 downto 8);
--          next_data_out <= set_io_33_cmd(7 downto 0);
--        end if;
--
--      when send_pwdn =>
--        if link_busy = '0' then
--          next_state <= wait_start;
--        else
--          next_state    <= send_pwdn;
--          next_page     <= set_pwdn_cmd(23 downto 16);
--          next_address  <= set_pwdn_cmd(15 downto 8);
--          next_data_out <= set_pwdn_cmd(7 downto 0);
--        end if;

                                 end case;
                               end process;

                             end Behavioral;

