----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:16:58 06/06/2016 
-- Design Name: 
-- Module Name:    ltc2945_single_read_fsm - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity ltc2945_single_read_fsm is

  port (
    clk             : in std_logic;
    reset           : in std_logic;
    start_procedure : in std_logic;
    end_i2c         : in std_logic;

    busy         : out std_logic;
    start_i2c    : out std_logic;
    i2c_rw       : out std_logic;
    device_addr  : out std_logic_vector(6 downto 0);  --address of target slave
    reg_add      : out std_logic_vector (7 downto 0);
    i2c_data_wr  : out std_logic_vector (7 downto 0);
    latch_en_bus : out std_logic_vector(1 downto 0)
    );

end ltc2945_single_read_fsm;

architecture Behavioral of ltc2945_single_read_fsm is

  type state_type is (wait_start, write_control, read_V_sens_1, read_I_sens_1);

  signal pres_state, next_state : state_type;
  signal next_busy              : std_logic;
  signal next_start_i2c         : std_logic;
  signal next_i2c_rw            : std_logic;
  signal next_device_addr       : std_logic_vector(6 downto 0);
  signal next_reg_add           : std_logic_vector(7 downto 0);
  signal next_i2c_data_wr       : std_logic_vector(7 downto 0);
  signal next_latch_en_bus      : std_logic_vector(1 downto 0);

  constant V1_dev_add : std_logic_vector (6 downto 0) := x"D"&"001";

  constant control_add  : std_logic_vector (7 downto 0) := x"00";
  constant control_word : std_logic_vector (7 downto 0) := x"01";

  constant V_reg_add : std_logic_vector (7 downto 0) := x"1E";
  constant I_reg_add : std_logic_vector (7 downto 0) := x"14";

begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state   <= wait_start;
        busy         <= '0';
        start_i2c    <= '0';
        i2c_rw       <= '0';
        device_addr  <= (others => '0');
        reg_add      <= (others => '0');
        i2c_data_wr  <= (others => '0');
        latch_en_bus <= (others => '0');
      else
        pres_state   <= next_state;
        busy         <= next_busy;
        start_i2c    <= next_start_i2c;
        i2c_rw       <= next_i2c_rw;
        device_addr  <= next_device_addr;
        reg_add      <= next_reg_add;
        i2c_data_wr  <= next_i2c_data_wr;
        latch_en_bus <= next_latch_en_bus;
      end if;
    end if;
  end process;

  process (start_procedure, end_i2c, pres_state)

  begin

    -------------------- outputs defoult values --------------------
    next_busy         <= '1';
    next_start_i2c    <= '0';
    next_i2c_rw       <= '1';
    next_device_addr  <= (others => '0');
    next_reg_add      <= (others => '0');
    next_i2c_data_wr  <= (others => '0');
    next_latch_en_bus <= (others => '0');

    case pres_state is
      
      when wait_start =>
        if start_procedure = '0' then
          next_state <= wait_start;
          next_busy  <= '0';
        else
          next_state       <= write_control;
          next_start_i2c   <= '1';
          next_i2c_rw      <= '0';
          next_device_addr <= V1_dev_add;
          next_reg_add     <= control_add;
          next_i2c_data_wr <= control_word;
        end if;

      when write_control =>
        if end_i2c = '0' then
          next_state       <= write_control;
          next_start_i2c   <= '1';
          next_i2c_rw      <= '0';
          next_device_addr <= V1_dev_add;
          next_reg_add     <= control_add;
          next_i2c_data_wr <= control_word;
        else
          next_state        <= read_V_sens_1;
          next_start_i2c    <= '1';
          next_device_addr  <= V1_dev_add;
          next_reg_add      <= V_reg_add;
          next_latch_en_bus <= "01";
        end if;

      when read_V_sens_1 =>
        if end_i2c = '0' then
          next_state        <= read_V_sens_1;
          next_device_addr  <= V1_dev_add;
          next_reg_add      <= V_reg_add;
          next_latch_en_bus <= "01";
        else
          next_state        <= read_I_sens_1;
          next_start_i2c    <= '1';
          next_device_addr  <= V1_dev_add;
          next_reg_add      <= I_reg_add;
          next_latch_en_bus <= "10";
        end if;

      when read_I_sens_1 =>
        if end_i2c = '0' then
          next_state        <= read_I_sens_1;
          next_device_addr  <= V1_dev_add;
          next_reg_add      <= I_reg_add;
          next_latch_en_bus <= "10";
        else
          next_state <= wait_start;
        end if;
        
    end case;
  end process;

end Behavioral;

