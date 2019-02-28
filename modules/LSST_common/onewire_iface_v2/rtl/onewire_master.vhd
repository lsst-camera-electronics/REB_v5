library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

library UNISIM;
use UNISIM.vcomponents.all;

entity onewire_master is
  generic (
    main_clk_freq : integer                      := 100;  -- clk frequency in MHz
    word_2_write  : std_logic_vector(7 downto 0) := "00110011");
  port (
    clk         : in    std_logic;
    reset       : in    std_logic;
    start_acq   : in    std_logic;
    dq          : inout std_logic;
    done        : out   std_logic;
    d_from_chip : out   std_logic_vector(63 downto 0);
    error_bus   : out   std_logic_vector(1 downto 0)
    );
end onewire_master;

architecture Behavioral of onewire_master is

  type state_type is (idle, link_reset, wait_presence, check_pres_low, wait_end_presence, wait_init_rec,
                      wr_state, wr_first_part, wr_second_part, wr_rec,
                      rd_state, rd_first_part, rd_second_part, rd_third_part,
                      check_crc);

  signal pres_state, next_state : state_type;
  signal next_en_buffer         : std_logic;
  signal next_bus_out           : std_logic;
  signal next_done              : std_logic;
  signal next_time_cnt_en       : std_logic;
  signal next_time_cnt_init     : std_logic;
  signal next_shift_en          : std_logic;
  signal shift_en               : std_logic;
  signal presence_error         : std_logic;
  signal next_presence_error    : std_logic;
  signal crc_error              : std_logic;
  signal next_crc_error         : std_logic;
  signal next_usec_cnt          : integer range 0 to main_clk_freq + 1;
  signal usec_cnt               : integer range 0 to main_clk_freq + 1;
  signal next_word_cnt          : integer range 0 to 66;
  signal word_cnt               : integer range 0 to 66;


  signal time_cnt_init : std_logic;
  signal time_cnt_en   : std_logic;

  signal oneus_cnt : integer range 0 to main_clk_freq -1;
  signal time_cnt  : integer range 0 to 600;

  signal shift_reg_ser_in_par_out_i : std_logic_vector(63 downto 0);

  signal crc_feedback : std_logic;
  signal crc_temp     : std_logic_vector(7 downto 0);
  signal crc_out      : std_logic_vector(7 downto 0);

  signal done_int      : std_logic;
  signal error_bus_int : std_logic_vector(1 downto 0);

  signal bus_in    : std_logic;
  signal bus_out   : std_logic;
  signal en_buffer : std_logic;


  component IOBUF  -- I/O Bidirectional buffer (T=0 : I=>IO; T=1: IO=>O)
    port (
      I  : in    std_logic;
      T  : in    std_logic;
      IO : inout std_logic;
      O  : out   std_logic);
  end component;
  

begin

  io_buffer : IOBUF  -- I/O Bidirectional buffer (T=0 : I=>IO; T=1: IO=>O)
    port map (
      I  => bus_out,
      T  => en_buffer,
      IO => dq,
      O  => bus_in);

  -- time counter. It is incremented every time the 1us cont expires
  
  process (clk)
  begin  -- process
    if clk'event and clk = '1' then
      if reset = '1' or time_cnt_init = '1' then
        oneus_cnt <= 0;
        time_cnt  <= 0;
      elsif time_cnt_en = '1' then
        if oneus_cnt = main_clk_freq - 1 then
          oneus_cnt <= 0;
          time_cnt  <= time_cnt + 1;
        else
          oneus_cnt <= oneus_cnt + 1;
          time_cnt  <= time_cnt;
        end if;
      end if;
    end if;
  end process;

  -- shift ser in par out

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        shift_reg_ser_in_par_out_i <= (others => '0');
      else
        if shift_en = '1' then
          shift_reg_ser_in_par_out_i     <= shr(shift_reg_ser_in_par_out_i, x"1");
          shift_reg_ser_in_par_out_i(63) <= bus_in;
        end if;
      end if;
    end if;
  end process;

  d_from_chip <= shift_reg_ser_in_par_out_i;

  -- CRC check

  process(Clk, reset)
  begin
    crc_feedback <= bus_in xor crc_temp(7);

    if clk'event and clk = '1' then
      if reset = '1' then
        crc_temp <= (others => '0');
      else
        if shift_en = '1' then
          --crc calculation in the next four lines.
          crc_temp(0)          <= crc_feedback;
          crc_temp(3 downto 1) <= crc_temp (2 downto 0);
          crc_temp(4)          <= crc_temp(3) xor crc_feedback;
          crc_temp(5)          <= crc_temp(4) xor crc_feedback;
          crc_temp(7 downto 6) <= crc_temp (6 downto 5);
        end if;
      end if;
    end if;
  end process;

  crc_out(0) <= crc_temp(7);
  crc_out(1) <= crc_temp(6);
  crc_out(2) <= crc_temp(5);
  crc_out(3) <= crc_temp(4);
  crc_out(4) <= crc_temp(3);
  crc_out(5) <= crc_temp(2);
  crc_out(6) <= crc_temp(1);
  crc_out(7) <= crc_temp(0);

  -- Errors latch

  process(Clk, reset)
  begin
    if clk'event and clk = '1' then
      if reset = '1' or start_acq = '1' then
        error_bus_int <= (others => '0');
      else
        if done_int = '1' then
          error_bus_int <= crc_error & presence_error;
        else
          error_bus_int <= error_bus_int;
        end if;
      end if;
    end if;
  end process;

  error_bus <= error_bus_int;
  done      <= done_int;


-- FSM

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state     <= idle;
        en_buffer      <= '1';
        bus_out        <= '0';
        done_int       <= '0';
        shift_en       <= '0';
        time_cnt_en    <= '0';
        time_cnt_init  <= '0';
        presence_error <= '0';
        crc_error      <= '0';
        word_cnt       <= 0;
      else
        pres_state     <= next_state;
        en_buffer      <= next_en_buffer;
        bus_out        <= next_bus_out;
        done_int       <= next_done;
        shift_en       <= next_shift_en;
        time_cnt_en    <= next_time_cnt_en;
        time_cnt_init  <= next_time_cnt_init;
        presence_error <= next_presence_error;
        crc_error      <= next_crc_error;
        word_cnt       <= next_word_cnt;
      end if;
    end if;
  end process;

  process (pres_state, start_acq, bus_in, time_cnt, word_cnt)
  begin

    -------------------- outputs default values  --------------------
    
    next_en_buffer      <= '1';
    next_bus_out        <= '0';
    next_done           <= '0';
    next_shift_en       <= '0';
    next_presence_error <= '0';
    next_crc_error      <= '0';
    next_time_cnt_en    <= '0';
    next_time_cnt_init  <= '0';
    next_word_cnt       <= word_cnt;

    case pres_state is
      when idle =>
        if start_acq = '1' then
          next_state       <= link_reset;
          next_en_buffer   <= '1';
          next_bus_out     <= '0';
          next_time_cnt_en <= '1';
        else
          next_state <= idle;
        end if;

      when link_reset =>
        if time_cnt < 560 then
          next_state       <= link_reset;
          next_en_buffer   <= '0';
          next_bus_out     <= '0';
          next_time_cnt_en <= '1';
        else
          next_state         <= wait_presence;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
          next_word_cnt      <= 0;
        end if;

      when wait_presence =>
        if time_cnt = 60 then
          next_state         <= check_pres_low;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
        else
          next_state       <= wait_presence;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        end if;

      when check_pres_low =>
        if time_cnt = 240 and bus_in = '1' then
          next_state          <= idle;
          next_en_buffer      <= '1';
          next_time_cnt_init  <= '1';
          next_presence_error <= '1';
          next_done           <= '1';
        else
          if bus_in = '0' then
            next_state       <= wait_end_presence;
            next_en_buffer   <= '1';
            next_time_cnt_en <= '1';
          else
            next_state       <= check_pres_low;
            next_en_buffer   <= '1';
            next_time_cnt_en <= '1';
          end if;
        end if;

      when wait_end_presence =>
        if time_cnt = 500 then
          if bus_in = '1' then
            next_state         <= wait_init_rec;
            next_en_buffer     <= '1';
            next_time_cnt_init <= '1';
          else
            next_state          <= idle;
            next_en_buffer      <= '1';
            next_time_cnt_init  <= '1';
            next_presence_error <= '1';
            next_done           <= '1';
          end if;
        else
          next_state       <= wait_end_presence;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        end if;

      when wait_init_rec =>
        if time_cnt = 5 then
          next_state         <= wr_state;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
        else
          next_state       <= wait_init_rec;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        end if;

      when wr_state =>
        if word_cnt < 8 then
          next_state         <= wr_first_part;
          next_en_buffer     <= '0';
          next_bus_out       <= '0';
          next_time_cnt_init <= '1';
        else
          next_state         <= rd_state;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
          next_word_cnt      <= 0;
        end if;

      when wr_first_part =>
        if time_cnt = 10 then
          next_state         <= wr_second_part;
          next_en_buffer     <= word_2_write(word_cnt);
          next_bus_out       <= '0';
          next_time_cnt_init <= '1';
        else
          next_state       <= wr_first_part;
          next_en_buffer   <= '0';
          next_bus_out     <= '0';
          next_time_cnt_en <= '1';
        end if;

      when wr_second_part =>
        if time_cnt = 70 then
          next_state         <= wr_rec;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
        else
          next_state       <= wr_second_part;
          next_en_buffer   <= word_2_write(word_cnt);
          next_bus_out     <= '0';
          next_time_cnt_en <= '1';
        end if;

      when wr_rec =>
        if time_cnt = 5 then
          next_state         <= wr_state;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
          next_word_cnt      <= word_cnt + 1;
        else
          next_state       <= wr_rec;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        end if;

      when rd_state =>
        if word_cnt < 64 then
          next_state       <= rd_first_part;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        else
          next_state         <= check_crc;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
          next_word_cnt      <= 0;
        end if;

      when rd_first_part =>
        if time_cnt = 5 then
          next_state       <= rd_second_part;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        else
          next_state       <= rd_first_part;
          next_en_buffer   <= '0';
          next_bus_out     <= '0';
          next_time_cnt_en <= '1';
        end if;

      when rd_second_part =>
        if time_cnt = 15 then
          next_state       <= rd_third_part;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
          next_word_cnt    <= word_cnt + 1;
          next_shift_en    <= '1';
        else
          next_state       <= rd_second_part;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        end if;

      when rd_third_part =>
        if time_cnt = 83 then
          next_state         <= rd_state;
          next_en_buffer     <= '1';
          next_time_cnt_init <= '1';
        else
          next_state       <= rd_third_part;
          next_en_buffer   <= '1';
          next_time_cnt_en <= '1';
        end if;

      when check_crc =>
        next_state <= idle;
        next_done  <= '1';
        if crc_out /= x"00" then        -- this is a charecteristic of maximCRC
                                        -- the CRC result of computed CRC and the
                                        -- CRC sent by the device is always 0
          next_crc_error <= '1';
        end if;
        
    end case;
  end process;

end Behavioral;
