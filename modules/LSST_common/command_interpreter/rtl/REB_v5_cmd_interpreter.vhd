----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:     11/07/2016 
-- Design Name: 
-- Module Name:    REB_v5_cmd_interpreter - Behavioral 
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

use work.REB_v5_commands_package.all;
use work.Base_register_Set_package.all;
use work.LsstSciPackage.all;
use work.ads8634_and_mux_top_package.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity REB_v5_cmd_interpreter is

  port (reset : in std_logic;
        clk   : in std_logic;

-- signals from/to SCI
        regReq           : in  std_logic;  -- with this line the master start a read/write procedure (1 to start)
        regOp            : in  std_logic;  -- this line define if the procedure is read or write (1 to write)
        regAddr          : in  std_logic_vector(23 downto 0);  -- address bus
        statusReg        : in  std_logic_vector(31 downto 0);  -- status reg bus. The RCI handle this bus and this machine pass it to the sure if he wants to read it
        regWrEn          : in  std_logic_vector(31 downto 0);  -- write enable bus. This bus enables the data write bits
        regDataWr_masked : in  std_logic_vector(31 downto 0);  -- data write bus masked. Is the logical AND of data write bus and write enable bus
        regAck           : out std_logic;  -- acknowledge line to activate when the read/write procedure is completed
        regFail          : out std_logic;  -- line to activate when an error occurs during the read/write procedure
        regDataRd        : out std_logic_vector(31 downto 0);  -- data bus to RCI used to transfer read data
        StatusReset      : out std_logic;  -- status block reset

-- Base Register Set signals            
        busy_bus               : in std_logic_vector(31 downto 0);  -- busy bus is composed by the different register sets busy
        time_base_actual_value : in std_logic_vector(63 downto 0);  -- time base value 
        trig_tm_value_SB       : in std_logic_vector(63 downto 0);  -- Status Block trigger time 
        trig_tm_value_TB       : in std_logic_vector(63 downto 0);  -- Time Base trigger time
        trig_tm_value_seq      : in std_logic_vector(63 downto 0);  -- Sequencer Trigger time
        trig_tm_value_V_I      : in std_logic_vector(63 downto 0);  -- Voltage and current sens trigger time
        trig_tm_value_pcb_t    : in std_logic_vector(63 downto 0);  -- PCB temperature Trigger time

        trigger_ce_bus     : out std_logic_vector(31 downto 0);  -- bus to enable register sets trigger. To trigger a register set that stops itself use en AND val                                      
        trigger_val_bus    : out std_logic_vector(31 downto 0);  -- bus of register sets trigger values  
        load_time_base_lsw : out std_logic;  -- ce signal to load the time base lsw
        load_time_base_MSW : out std_logic;  -- ce signal to load the time base MSW
        cnt_preset         : out std_logic_vector(63 downto 0);  -- preset value for the time base counter

        Mgt_avcc_ok         : in  std_logic;
        Mgt_accpll_ok       : in  std_logic;
        Mgt_avtt_ok         : in  std_logic;
        V3_3v_ok            : in  std_logic;
        Switch_addr         : in  std_logic_vector(7 downto 0);
-- sync commands
        sync_cmd_delay_en   : out std_logic;
        sync_cmd_delay_read : in  std_logic_vector(7 downto 0);
        sync_cmd_mask_en    : out std_logic;
        sync_cmd_mask_read  : in  std_logic_vector(31 downto 0);

-- interrupt commands
        interrupt_mask_wr_en : out std_logic;
        interrupt_mask_read  : in  std_logic_vector(13 downto 0);

-- Image parameters
        image_size        : in  std_logic_vector(31 downto 0);  -- this register contains the image size
        image_patter_read : in  std_logic;  -- this register gives the state of image patter gen. 1 is ON
        ccd_sel_read      : in  std_logic_vector(2 downto 0);  -- this register contains the CCD to drive
        image_size_en     : out std_logic;  -- this line enables the register where the image size is written
        image_patter_en   : out std_logic;  -- this register enable the image patter gen. 1 is ON
        ccd_sel_en        : out std_logic;  -- register enable for CCD acquisition selector

-- Sequencer
        seq_time_mem_readbk      : in  std_logic_vector(15 downto 0);  -- time memory read bus
        seq_out_mem_readbk       : in  std_logic_vector(31 downto 0);  -- time memory read bus
        seq_prog_mem_readbk      : in  std_logic_vector(31 downto 0);  -- sequencer program memory read
        seq_time_mem_w_en        : out std_logic;  -- this signal enables the time memory write
        seq_out_mem_w_en         : out std_logic;  -- this signal enables the output memory write
        seq_prog_mem_w_en        : out std_logic;  -- this signal enables the program memory write
        seq_step                 : out std_logic;  -- this signal send the STEP to the sequencer. Valid on in infinite loop (the machine jump out from IL to next function)   
        seq_stop                 : out std_logic;  -- this signal send the STOP to the sequencer. Valid on in infinite loop (the machine jump out from IL to next function)
        enable_conv_shift_in     : in  std_logic;  -- this signal enable the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
        enable_conv_shift        : out std_logic;  -- this signal enable the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
        init_conv_shift          : out std_logic;  -- this signal initialize the adc_conv shifter (the adc_conv is shifted 1 clk every time is activated)
        start_add_prog_mem_en    : out std_logic;
        start_add_prog_mem_rbk   : in  std_logic_vector(9 downto 0);
        seq_ind_func_mem_we      : out std_logic;
        seq_ind_func_mem_rdbk    : in  std_logic_vector(3 downto 0);
        seq_ind_rep_mem_we       : out std_logic;
        seq_ind_rep_mem_rdbk     : in  std_logic_vector(23 downto 0);
        seq_ind_sub_add_mem_we   : out std_logic;
        seq_ind_sub_add_mem_rdbk : in  std_logic_vector(9 downto 0);
        seq_ind_sub_rep_mem_we   : out std_logic;
        seq_ind_sub_rep_mem_rdbk : in  std_logic_vector(15 downto 0);
        seq_op_code_error        : in  std_logic;
        seq_op_code_error_add    : in  std_logic_vector(9 downto 0);
        seq_op_code_error_reset  : out std_logic;

-- ASPIC
        aspic_config_r_ccd_1 : in  std_logic_vector(15 downto 0);
        aspic_config_r_ccd_2 : in  std_logic_vector(15 downto 0);
        aspic_config_r_ccd_3 : in  std_logic_vector(15 downto 0);
        aspic_op_end         : in  std_logic;
        aspic_start_trans    : out std_logic;
        aspic_start_reset    : out std_logic;

-- CCD bias DAC
        bias_dac_cmd_err      : in  std_logic_vector(8 downto 0);
        bias_v_undr_th        : in  std_logic_vector(8 downto 0);
        ccd_1_bias_load_start : out std_logic;
        ccd_1_bias_ldac_start : out std_logic;
        ccd_2_bias_load_start : out std_logic;
        ccd_2_bias_ldac_start : out std_logic;
        ccd_3_bias_load_start : out std_logic;
        ccd_3_bias_ldac_start : out std_logic;


-- CCD clock rails DAC          
        clk_rail_load_start : out std_logic;
        clk_rail_ldac_start : out std_logic;

-- Heater DAC           
        htr_load_start : out std_logic;
        htr_ldac_start : out std_logic;

-- DREB voltage and current sensors
        v6_voltage         : in std_logic_vector(15 downto 0);
        v6_voltage_error   : in std_logic;
        v6_current         : in std_logic_vector(15 downto 0);
        v6_current_error   : in std_logic;
        v9_voltage         : in std_logic_vector(15 downto 0);
        v9_voltage_error   : in std_logic;
        v9_current         : in std_logic_vector(15 downto 0);
        v9_current_error   : in std_logic;
        v24_voltage        : in std_logic_vector(15 downto 0);
        v24_voltage_error  : in std_logic;
        v24_current        : in std_logic_vector(15 downto 0);
        v24_current_error  : in std_logic;
        v40_voltage        : in std_logic_vector(15 downto 0);
        v40_voltage_error  : in std_logic;
        v40_current        : in std_logic_vector(15 downto 0);
        v40_current_error  : in std_logic;
        vn15_voltage       : in std_logic_vector(15 downto 0);
        vn15_voltage_error : in std_logic;
        vn15_current       : in std_logic_vector(15 downto 0);
        vn15_current_error : in std_logic;

-- DREB temperature
        T1_dreb       : in std_logic_vector(15 downto 0);
        T1_dreb_error : in std_logic;
        T2_dreb       : in std_logic_vector(15 downto 0);
        T2_dreb_error : in std_logic;

-- REB temperature gr1
        T1_reb_gr1       : in std_logic_vector(15 downto 0);
        T1_reb_gr1_error : in std_logic;
        T2_reb_gr1       : in std_logic_vector(15 downto 0);
        T2_reb_gr1_error : in std_logic;
        T3_reb_gr1       : in std_logic_vector(15 downto 0);
        T3_reb_gr1_error : in std_logic;
        T4_reb_gr1       : in std_logic_vector(15 downto 0);
        T4_reb_gr1_error : in std_logic;

-- REB temperature gr2
        T1_reb_gr2       : in std_logic_vector(15 downto 0);
        T1_reb_gr2_error : in std_logic;
        T2_reb_gr2       : in std_logic_vector(15 downto 0);
        T2_reb_gr2_error : in std_logic;
        T3_reb_gr2       : in std_logic_vector(15 downto 0);
        T3_reb_gr2_error : in std_logic;
        T4_reb_gr2       : in std_logic_vector(15 downto 0);
        T4_reb_gr2_error : in std_logic;

-- bias and temp ADC 
        bias_t_adc_busy    : in  std_logic;
        bias_t_adc_data    : in  array716;
        bias_t_adc_start_t : out std_logic;
        bias_t_adc_start_b : out std_logic;
        bias_t_adc_start_r : out std_logic;

-- CCD temperature
        ccd_temp_busy        : in  std_logic;
        ccd_temp             : in  std_logic_vector(23 downto 0);
        ccd_temp_start       : out std_logic;
        ccd_temp_start_reset : out std_logic;


-- REB 1wire serial number
        reb_onewire_reset : out std_logic;
        reb_sn_crc_ok     : in  std_logic;
        reb_sn_dev_error  : in  std_logic;
        reb_sn            : in  std_logic_vector(47 downto 0);
        reb_sn_timeout    : in  std_logic;

-- back bias switch
        back_bias_sw_rb    : in  std_logic;
        back_bias_cl_rb    : in  std_logic;
        back_bias_sw_error : in  std_logic;
        en_back_bias_sw    : out std_logic;

-- Jitter Cleaner
        jc_status_bus   : in  std_logic_vector(5 downto 0);
        jc_start_config : out std_logic;

-- multiboot
        start_multiboot : out std_logic;

-- XADC
        xadc_drdy_out            : in  std_logic;
        xadc_ot_out              : in  std_logic;  -- Over-Temperature alarm output
        xadc_vccaux_alarm_out    : in  std_logic;  -- VCCAUX-sensor alarm output
        xadc_vccint_alarm_out    : in  std_logic;  -- VCCINT-sensor alarm output
        xadc_user_temp_alarm_out : in  std_logic;  -- Temperature-sensor alarm output
        xadc_vbram_alarm_out     : in  std_logic;  -- VCCINT-sensor alarm output
        xadc_alarm_out           : in  std_logic;  -- OR'ed output of all the Alarms
        xadc_channel_out         : in  std_logic_vector (4 downto 0);
        xadc_do_out              : in  std_logic_vector(15 downto 0);
        xadc_den_in              : out std_logic;

-- DC/DC clock enable
        dcdc_clk_en_in : in  std_logic;
        dcdc_clk_en    : out std_logic
        );


end REB_v5_cmd_interpreter;

architecture Behavioral of REB_v5_cmd_interpreter is
  type state_type is (wait_cmd, error_state, ack_del_1, ack_del_2, wait_end_cmd,

-- BRS states
                      schema, hdl_version, SCI_ID, reserved_1, time_base_read_lsw, time_base_read_MSW,
                      reserved_2, reserved_3, state_busy, trigger_time_SB_lsw, trigger_time_SB_MSW,
                      trigger_time_TB_lsw, trigger_time_TB_MSW, trigger_time_seq_lsw, trigger_time_seq_MSW,
                      trigger_time_V_I_lsw, trigger_time_V_I_MSW, trigger_time_pcb_t_lsw, trigger_time_pcb_t_MSW,
                      v_ok_state, time_base_set_lsw, time_base_set_MSW, trigger_state, statusReg_rd,
                      sync_cmd_delay_wr_state, sync_cmd_delay_rd_state,
                      sync_cmd_mask_wr_state, sync_cmd_mask_rd_state,
                      interrupt_mask_wr_state, interrupt_mask_rd_state, status_block_rst_state,
-- Image parameters
                      read_image_size_state, read_image_patter_mode_state, read_ccd_sel_state,
                      set_image_size_state, set_img_pattern_gen_state,
                      set_ccd_sel_state,
-- Sequncer
                      func_output_wr, func_time_wr, seq_prog_mem_wr,
                      seq_step_state, seq_stop_state,
                      seq_func_time_rd, seq_func_out_rd, seq_prog_mem_rd,
                      enable_conv_shift_rd, enable_conv_shift_state, init_conv_shift_state,
                      enable_start_add_prog_mem_state, start_add_prog_mem_rd_state,
                      seq_ind_func_mem_we_state, seq_ind_func_mem_rdbk_state,
                      seq_ind_rep_mem_we_state, seq_ind_rep_mem_rdbk_state,
                      seq_ind_sub_add_mem_we_state, seq_ind_sub_add_mem_rdbk_state,
                      seq_ind_sub_rep_mem_we_state, seq_ind_sub_rep_mem_rdbk_state,
                      seq_op_code_error_rd_state, seq_op_code_error_reset_state,

-- ASPIC        
                      aspic_start_trans_state,
                      aspic_start_trans_state_1, aspic_start_trans_state_2, aspic_start_trans_state_3,
                      aspic_start_reset_state,
                      aspic_start_reset_state_1, aspic_start_reset_state_2, aspic_start_reset_state_3,
                      aspic_read_conf_ccd_1_state, aspic_read_conf_ccd_2_state,
                      aspic_read_conf_ccd_3_state,

-- CCD bias DAC 
                      ccd_1_bias_load_config_state, ccd_1_bias_ldac_state,
                      ccd_2_bias_load_config_state, ccd_2_bias_ldac_state,
                      ccd_3_bias_load_config_state, ccd_3_bias_ldac_state,
                      ccd_bias_read_error_vut_state,


-- CCD clock rails DAC  
                      clk_rail_load_config_state, clk_rail_ldac_state,

-- Heater DAC   
                      htr_load_config_state, htr_ldac_state,

-- DREB voltage and current sensors
                      v6_voltage_state, v6_current_state,
                      v9_voltage_state, v9_current_state,
                      v24_voltage_state, v24_current_state,
                      v40_voltage_state, v40_current_state,
                      vn15_voltage_state, vn15_current_state,

-- DREB temperature sensors
                      DREB_T1_state, DREB_T2_state,

-- REB temperature sensors gr1
                      REB_T1_gr1_state, REB_T2_gr1_state,
                      REB_T3_gr1_state, REB_T4_gr1_state,

-- REB temperature sensors gr2
                      REB_T1_gr2_state, REB_T2_gr2_state,
                      REB_T3_gr2_state, REB_T4_gr2_state,

-- bias and temp ADC 
                      bias_t_adc_start_t_state, bias_t_adc_start_b_state,
                      bias_t_adc_start_r_state,
                      bias_t_adc_T1_state, bias_t_adc_T2_state, bias_t_adc_T3_state,
                      bias_t_adc_T4_state, bias_t_adc_T5_state, bias_t_adc_T6_state,
                      bias_t_adc_B_state,

-- CCD temperature sensor
                      ccd_temp_start_state, ccd_temp_start_reset_state, ccd_temp_read_state,

-- REB 1wire serial number
                      reb_sn_acq_state, reb_sn_read_w0_state, reb_sn_read_w1_state,

-- back bias switch 
                      back_bias_sw_set_state, back_bias_sw_read_state,

-- Jitter Cleaner
                      jc_start_config_state, jc_read_config_state,

-- multiboot    
                      start_multiboot_state,

-- XADC
                      read_xadc_param_state, read_xadc_alarms_state,

-- DC/DC clock enable
                      dcdc_clk_en_rd, dcdc_clk_en_state

                      );

  signal pres_state, next_state : state_type;

  -- this directive is to force the encoding to gray
  -- It is required to solve a vivado bug that apperars if there are more than
  -- 134 states
  attribute fsm_encoding                           : string;
  attribute fsm_encoding of pres_state, next_state : signal is "gray";




-- RCI signals
  signal next_regAck      : std_logic;
  signal next_regFail     : std_logic;
  signal next_regDataRd   : std_logic_vector(31 downto 0);
  signal next_StatusReset : std_logic;

-- BRS signals
  signal next_trigger_ce_bus     : std_logic_vector(31 downto 0);
  signal next_trigger_val_bus    : std_logic_vector(31 downto 0);
  signal next_load_time_base_lsw : std_logic;
  signal next_load_time_base_MSW : std_logic;
  signal next_cnt_preset         : std_logic_vector(63 downto 0);

-- sync commands signals
  signal next_sync_cmd_delay_en : std_logic;
  signal next_sync_cmd_mask_en  : std_logic;

  -- interrupt signals 
  signal next_interrupt_mask_wr_en : std_logic;

-- Image parameters
  signal next_image_size_en   : std_logic;
  signal next_image_patter_en : std_logic;
  signal next_ccd_sel_en      : std_logic;

-- Sequencer
  signal next_seq_time_mem_w_en       : std_logic;  -- function outupt register enable flag
  signal next_seq_out_mem_w_en        : std_logic;  -- function time register enable flag
  signal next_seq_prog_mem_w_en       : std_logic;  -- sequencer program memory enable flag
  signal next_seq_step                : std_logic;  -- this signal send the STEP to the sequencer. Valid on in infinite loop (the machine jump out from IL to next function)   
  signal next_seq_stop                : std_logic;  -- this signal send the STOP to the sequencer. Valid on in infinite loop (the machine jump out from IL and stop all function)   
  signal next_enable_conv_shift       : std_logic;
  signal next_init_conv_shift         : std_logic;
  signal next_start_add_prog_mem_en   : std_logic;
  signal next_seq_ind_func_mem_we     : std_logic;
  signal next_seq_ind_rep_mem_we      : std_logic;
  signal next_seq_ind_sub_add_mem_we  : std_logic;
  signal next_seq_ind_sub_rep_mem_we  : std_logic;
  signal next_seq_op_code_error_reset : std_logic;

-- ASPIC
  signal next_aspic_start_trans : std_logic;
  signal next_aspic_start_reset : std_logic;

-- CCD bias DAC         
  signal next_ccd_1_bias_load_start : std_logic;
  signal next_ccd_1_bias_ldac_start : std_logic;
  signal next_ccd_2_bias_load_start : std_logic;
  signal next_ccd_2_bias_ldac_start : std_logic;
  signal next_ccd_3_bias_load_start : std_logic;
  signal next_ccd_3_bias_ldac_start : std_logic;

-- CCD clock rails DAC          
  signal next_clk_rail_load_start : std_logic;
  signal next_clk_rail_ldac_start : std_logic;

-- Heater DAC           
  signal next_htr_load_start : std_logic;
  signal next_htr_ldac_start : std_logic;

-- bias and temp ADC 
  signal next_bias_t_adc_start_t : std_logic;
  signal next_bias_t_adc_start_b : std_logic;
  signal next_bias_t_adc_start_r : std_logic;

-- CCD tempearture 
  signal next_ccd_temp_start       : std_logic;
  signal next_ccd_temp_start_reset : std_logic;

-- REB 1wire serial number
  signal next_reb_onewire_reset : std_logic;

-- back bias switch 
  signal next_en_back_bias_sw : std_logic;

-- Jitter Cleaner
  signal next_jc_start_config : std_logic;

-- multiboot
  signal next_start_multiboot : std_logic;

-- XADC
  signal next_xadc_den_in : std_logic;

-- DC/DC clock enable   
  signal next_dcdc_clk_en : std_logic;
  
  
begin

  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        pres_state <= wait_cmd;

        -- RCI reset state
        regAck      <= '0';
        regFail     <= '0';
        regDataRd   <= (others => '0');
        StatusReset <= '0';

        -- BRS reset state
        trigger_ce_bus     <= (others => '0');
        trigger_val_bus    <= (others => '0');
        load_time_base_lsw <= '0';
        load_time_base_MSW <= '0';
        cnt_preset         <= (others => '0');
        sync_cmd_delay_en  <= '0';
        sync_cmd_mask_en   <= '0';

        -- ineterrupt signals reset state
        interrupt_mask_wr_en <= '0';

        -- image parameters reset state
        image_size_en   <= '0';
        image_patter_en <= '0';
        ccd_sel_en      <= '0';

        -- Sequencer reset state                                
        seq_time_mem_w_en       <= '0';
        seq_out_mem_w_en        <= '0';
        seq_prog_mem_w_en       <= '0';
        seq_step                <= '0';
        seq_stop                <= '0';
        enable_conv_shift       <= '0';
        init_conv_shift         <= '0';
        start_add_prog_mem_en   <= '0';
        seq_ind_func_mem_we     <= '0';
        seq_ind_rep_mem_we      <= '0';
        seq_ind_sub_add_mem_we  <= '0';
        seq_ind_sub_rep_mem_we  <= '0';
        seq_op_code_error_reset <= '0';

        -- ASPIC
        aspic_start_trans <= '0';
        aspic_start_reset <= '0';

        -- CCD bias rails DAC           
        ccd_1_bias_load_start <= '0';
        ccd_1_bias_ldac_start <= '0';
        ccd_2_bias_load_start <= '0';
        ccd_2_bias_ldac_start <= '0';
        ccd_3_bias_load_start <= '0';
        ccd_3_bias_ldac_start <= '0';

        -- CCD clock rails DAC          
        clk_rail_load_start <= '0';
        clk_rail_ldac_start <= '0';

        -- Heater DAC           
        htr_load_start <= '0';
        htr_ldac_start <= '0';

        -- bias and temp ADC 
        bias_t_adc_start_t <= '0';
        bias_t_adc_start_b <= '0';
        bias_t_adc_start_r <= '0';

        -- CCD temperature 
        ccd_temp_start       <= '0';
        ccd_temp_start_reset <= '0';

        -- REB 1wire sn
        reb_onewire_reset <= '1';

        -- back bias switch set
        en_back_bias_sw <= '0';

        -- Jitter Cleaner
        jc_start_config <= '0';

        -- multiboot
        start_multiboot <= '0';

        -- XADC
        xadc_den_in <= '0';

        -- DC/DC clock enable
        dcdc_clk_en <= '0';

      else
        pres_state <= next_state;

        -- RCI latch
        regAck      <= next_regAck;
        regFail     <= next_regFail;
        regDataRd   <= next_regDataRd;
        StatusReset <= next_StatusReset;

        -- BRS latch
        trigger_ce_bus       <= next_trigger_ce_bus;
        trigger_val_bus      <= next_trigger_val_bus;
        load_time_base_lsw   <= next_load_time_base_lsw;
        load_time_base_MSW   <= next_load_time_base_MSW;
        cnt_preset           <= next_cnt_preset;
        sync_cmd_delay_en    <= next_sync_cmd_delay_en;
        sync_cmd_mask_en     <= next_sync_cmd_mask_en;
        interrupt_mask_wr_en <= next_interrupt_mask_wr_en;

        -- image parameters latch
        image_size_en   <= next_image_size_en;
        image_patter_en <= next_image_patter_en;
        ccd_sel_en      <= next_ccd_sel_en;

        -- Sequencer latch      
        seq_time_mem_w_en       <= next_seq_time_mem_w_en;
        seq_out_mem_w_en        <= next_seq_out_mem_w_en;
        seq_prog_mem_w_en       <= next_seq_prog_mem_w_en;
        seq_step                <= next_seq_step;
        seq_stop                <= next_seq_stop;
        enable_conv_shift       <= next_enable_conv_shift;
        init_conv_shift         <= next_init_conv_shift;
        start_add_prog_mem_en   <= next_start_add_prog_mem_en;
        seq_ind_func_mem_we     <= next_seq_ind_func_mem_we;
        seq_ind_rep_mem_we      <= next_seq_ind_rep_mem_we;
        seq_ind_sub_add_mem_we  <= next_seq_ind_sub_add_mem_we;
        seq_ind_sub_rep_mem_we  <= next_seq_ind_sub_rep_mem_we;
        seq_op_code_error_reset <= next_seq_op_code_error_reset;

        -- ASPIC
        aspic_start_trans <= next_aspic_start_trans;
        aspic_start_reset <= next_aspic_start_reset;

        -- CCD bias DAC         
        ccd_1_bias_load_start <= next_ccd_1_bias_load_start;
        ccd_1_bias_ldac_start <= next_ccd_1_bias_ldac_start;
        ccd_2_bias_load_start <= next_ccd_2_bias_load_start;
        ccd_2_bias_ldac_start <= next_ccd_2_bias_ldac_start;
        ccd_3_bias_load_start <= next_ccd_3_bias_load_start;
        ccd_3_bias_ldac_start <= next_ccd_3_bias_ldac_start;

        -- CCD clock rails DAC          
        clk_rail_load_start <= next_clk_rail_load_start;
        clk_rail_ldac_start <= next_clk_rail_ldac_start;

        -- Heater DAC           
        htr_load_start <= next_htr_load_start;
        htr_ldac_start <= next_htr_ldac_start;

        -- bias and temp ADC 
        bias_t_adc_start_t <= next_bias_t_adc_start_t;
        bias_t_adc_start_b <= next_bias_t_adc_start_b;
        bias_t_adc_start_r <= next_bias_t_adc_start_r;

        -- CCD temperature
        ccd_temp_start       <= next_ccd_temp_start;
        ccd_temp_start_reset <= next_ccd_temp_start_reset;

        -- REB 1wire sn
        reb_onewire_reset <= next_reb_onewire_reset;

        -- back bias switch set
        en_back_bias_sw <= next_en_back_bias_sw;

        -- Jitter Cleaner
        jc_start_config <= next_jc_start_config;

        -- multiboot
        start_multiboot <= next_start_multiboot;

        -- XADC
        xadc_den_in <= next_xadc_den_in;

        -- DC/DC clock enable
        dcdc_clk_en <= next_dcdc_clk_en;
      end if;
    end if;
  end process;


  process (pres_state, regReq , regOP, RegAddr, regdatawr_masked, regwren,

           -- BRS
           switch_addr, time_base_actual_value,
           busy_bus, trig_tm_value_sb, trig_tm_value_tb, trig_tm_value_seq, trig_tm_value_v_i, trig_tm_value_pcb_t,
           mgt_avcc_ok, statusreg,
           sync_cmd_delay_read, sync_cmd_mask_read,
           interrupt_mask_read,

           -- image param
           image_size, image_patter_read, ccd_sel_read,

           -- sequencer
           seq_time_mem_readbk, seq_out_mem_readbk, seq_prog_mem_readbk, enable_conv_shift_in, start_add_prog_mem_rbk,
           seq_ind_func_mem_rdbk, seq_ind_rep_mem_rdbk, seq_ind_sub_add_mem_rdbk, seq_ind_sub_rep_mem_rdbk, seq_op_code_error,

           -- ASPIC
           aspic_config_r_ccd_1, aspic_config_r_ccd_2, aspic_config_r_ccd_3, aspic_op_end,

           -- CCD bias
           bias_dac_cmd_err, bias_v_undr_th,

           -- V&I measure
           v6_voltage, v6_current, v9_voltage, v9_current, v24_voltage, v24_current, v40_voltage, v40_current,
           vn15_voltage, vn15_current,
           v6_voltage_error, v6_current_error, v9_voltage_error, v9_current_error, v24_voltage_error,
           v24_current_error, v40_voltage_error, v40_current_error, vn15_voltage_error, vn15_current_error,

           -- PCB temp
           t1_dreb, t1_dreb_error, t2_dreb, t2_dreb_error,
           t1_reb_gr1, t1_reb_gr1_error, t2_reb_gr1, t2_reb_gr1_error, t3_reb_gr1, t3_reb_gr1_error,
           t4_reb_gr1, t4_reb_gr1_error,
           t1_reb_gr2, t1_reb_gr2_error, t2_reb_gr2, t2_reb_gr2_error, t3_reb_gr2, t3_reb_gr2_error,
           t4_reb_gr2, t4_reb_gr2_error,

           -- bias and temp ADC 
           bias_t_adc_busy, bias_t_adc_data,

           -- CCD temp
           ccd_temp, ccd_temp_busy,

           -- REB serial number
           reb_sn_crc_ok, reb_sn, reb_sn_timeout, reb_sn_dev_error,

           -- XADC
           xadc_channel_out, xadc_do_out, xadc_ot_out, xadc_vccaux_alarm_out, xadc_vccint_alarm_out,
           xadc_user_temp_alarm_out, xadc_vbram_alarm_out, xadc_alarm_out,

           -- Bacbias switch
           back_bias_sw_rb, back_bias_cl_rb, back_bias_sw_error,

           -- others
           dcdc_clk_en_in, mgt_accpll_ok, seq_op_code_error_add
           )  
  begin

    -------------------- outputs default values --------------------
    -- RCI default state
    next_regAck      <= '0';
    next_regFail     <= '0';
    next_regDataRd   <= (others => '0');
    next_StatusReset <= '0';

                                        -- BRS default state
    next_trigger_ce_bus       <= (others => '0');
    next_trigger_val_bus      <= (others => '0');
    next_load_time_base_lsw   <= '0';
    next_load_time_base_MSW   <= '0';
    next_cnt_preset           <= (others => '0');
    next_sync_cmd_delay_en    <= '0';
    next_sync_cmd_mask_en     <= '0';
    next_interrupt_mask_wr_en <= '0';

                                        -- Image Parameters default state
    next_image_size_en   <= '0';
    next_image_patter_en <= '0';
    next_ccd_sel_en      <= '0';

                                        -- Sequencer default state
    next_seq_time_mem_w_en       <= '0';
    next_seq_out_mem_w_en        <= '0';
    next_seq_prog_mem_w_en       <= '0';
    next_seq_step                <= '0';
    next_seq_stop                <= '0';
    next_enable_conv_shift       <= '0';
    next_init_conv_shift         <= '0';
    next_start_add_prog_mem_en   <= '0';
    next_seq_ind_func_mem_we     <= '0';
    next_seq_ind_rep_mem_we      <= '0';
    next_seq_ind_sub_add_mem_we  <= '0';
    next_seq_ind_sub_rep_mem_we  <= '0';
    next_seq_op_code_error_reset <= '0';

                                        -- ASPIC
    next_aspic_start_trans <= '0';
    next_aspic_start_reset <= '0';

                                        -- CCD bias DAC         
    next_ccd_1_bias_load_start <= '0';
    next_ccd_1_bias_ldac_start <= '0';
    next_ccd_2_bias_load_start <= '0';
    next_ccd_2_bias_ldac_start <= '0';
    next_ccd_3_bias_load_start <= '0';
    next_ccd_3_bias_ldac_start <= '0';

                                        -- CCD clock rails DAC          
    next_clk_rail_load_start <= '0';
    next_clk_rail_ldac_start <= '0';

                                        -- Heater DAC           
    next_htr_load_start <= '0';
    next_htr_ldac_start <= '0';

                                        -- bias and temp ADC 
    next_bias_t_adc_start_t <= '0';
    next_bias_t_adc_start_b <= '0';
    next_bias_t_adc_start_r <= '0';

                                        -- CCD temperature 
    next_ccd_temp_start       <= '0';
    next_ccd_temp_start_reset <= '0';

                                        -- REB 1wire sn
    next_reb_onewire_reset <= '1';

                                        -- back bias switch set
    next_en_back_bias_sw <= '0';

                                        -- multiboot
    next_start_multiboot <= '0';

                                        -- Jitter Cleaner
    next_jc_start_config <= '0';

                                        -- XADC
    next_xadc_den_in <= '0';

                                        -- DC/DC clock enable
    next_dcdc_clk_en <= '0';



    case pres_state is
--------------------------------------------------------  CMD INTERPTETER --------------------------------------------------------
      
      when wait_cmd =>
        if regReq = '0' then
          next_state <= wait_cmd;
        else
          if regOp = '0' then

------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------  READ ---------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
---------- Base Register Set read

                                        -- schema
            if regAddr = read_schema_cmd then
              next_state <= schema;

                                        -- hdl version
            elsif regAddr = read_hdl_version_cmd then
              next_state <= hdl_version;

                                        -- SCI ID
            elsif regAddr = read_SCI_ID_cmd then
              next_state <= SCI_ID;

                                        -- reserved 1
            elsif regAddr = read_reserved_1_cmd then
              next_state <= reserved_1;

                                        -- time base read lsw
            elsif regAddr = time_base_lsw_cmd then
              next_state <= time_base_read_lsw;

                                        -- time base read MSW
            elsif regAddr = time_base_MSW_cmd then
              next_state <= time_base_read_MSW;

                                        -- reserved 2
            elsif regAddr = read_reserved_2_cmd then
              next_state <= reserved_2;

                                        -- reserved 3           
            elsif regAddr = read_reserved_3_cmd then
              next_state <= reserved_3;

                                        -- read busy state              
            elsif regAddr = read_state_busy_cmd then
              next_state <= state_busy;

                                        -- read trigger time lsw
            elsif regAddr = read_trig_time_SB_lsw_cmd then
              next_state <= trigger_time_SB_lsw;

                                        -- read trigger time MSW           
            elsif regAddr = read_trig_time_SB_MSW_cmd then
              next_state <= trigger_time_SB_MSW;

                                        -- read Time Base trigger time lsw      
            elsif regAddr = read_trig_time_TB_lsw_cmd then
              next_state <= trigger_time_TB_lsw;

                                        -- read Time Base trigger time MSW
            elsif regAddr = read_trig_time_TB_MSW_cmd then
              next_state <= trigger_time_TB_MSW;

                                        -- read Sequencer trigger time lsw
            elsif regAddr = read_trig_time_seq_lsw_cmd then
              next_state <= trigger_time_seq_lsw;

                                        -- read Sequencer trigger time MSW
            elsif regAddr = read_trig_time_seq_MSW_cmd then
              next_state <= trigger_time_seq_MSW;

                                        -- read Voltage and Current sens trigger time lsw       
            elsif regAddr = read_trig_time_V_I_lsw_cmd then
              next_state <= trigger_time_V_I_lsw;

                                        -- read Voltage and Current sens trigger time MSW
            elsif regAddr = read_trig_time_V_I_MSW_cmd then
              next_state <= trigger_time_V_I_MSW;

                                        -- read pcb T trigger time lsw
            elsif regAddr = read_trig_time_pcb_t_lsw_cmd then
              next_state <= trigger_time_pcb_t_lsw;

                                        -- read pcb T trigger time MSW
            elsif regAddr = read_trig_time_pcb_t_MSW_cmd then
              next_state <= trigger_time_pcb_t_MSW;

                                        -- read Voltages OK 
            elsif regAddr = read_v_ok_cmd then
              next_state <= v_ok_state;

                                        -- read status register         
            elsif (regAddr >= read_status_reg_base) and (regAddr <= read_status_reg_high) then
              next_state <= statusReg_rd;

            elsif regAddr = sync_cmd_delay_cmd then
              next_state <= sync_cmd_delay_rd_state;

            elsif regAddr = sync_cmd_mask_cmd then
              next_state <= sync_cmd_mask_rd_state;

            elsif regAddr = interrupt_mask_cmd then
              next_state <= interrupt_mask_rd_state;


              -------- Image parameters read                            
              -- read image size          
            elsif regAddr = image_size_cmd then
              next_state <= read_image_size_state;

                                        -- read image patter mode configuration
            elsif regAddr = image_patter_mode_cmd then
              next_state <= read_image_patter_mode_state;

                                        -- read CCD selector configuration
            elsif regAddr = ccd_sel_cmd then
              next_state <= read_ccd_sel_state;

              -------- Sequencer parameters read
              -- time memory read
            elsif (regAddr >= func_time_set_base) and (regAddr <= func_time_set_high) then
              next_state <= seq_func_time_rd;

                                        -- output memory read
            elsif (regAddr >= func_out_set_base) and (regAddr <= func_out_set_high) then
              next_state <= seq_func_out_rd;

                                        -- program memory read
            elsif (regAddr >= prog_mem_base) and (regAddr <= prog_mem_high) then
              next_state <= seq_prog_mem_rd;

                                        -- read ADC conv shifter configuration
            elsif regAddr = enable_conv_shift_cmd then
              next_state <= enable_conv_shift_rd;

                                        -- read the program mem start address 
            elsif regAddr = start_add_cmd then
              next_state <= start_add_prog_mem_rd_state;

                                        -- reads indirect functions memory  
            elsif (regAddr >= seq_ind_func_mem_base) and (regAddr <= seq_ind_func_mem_high) then
              next_state <= seq_ind_func_mem_rdbk_state;

                                        -- reads indirect repetitions mem 
            elsif (regAddr >= seq_ind_rep_mem_base) and (regAddr <= seq_ind_rep_mem_high) then
              next_state <= seq_ind_rep_mem_rdbk_state;

                                        -- reads indirect subroutines mem 
            elsif (regAddr >= seq_ind_sub_add_mem_base) and (regAddr <= seq_ind_sub_add_mem_high) then
              next_state <= seq_ind_sub_add_mem_rdbk_state;

                                        -- reads indirect subroutines repetitions mem 
            elsif (regAddr >= seq_ind_sub_rep_mem_base) and (regAddr <= seq_ind_sub_rep_mem_high) then
              next_state <= seq_ind_sub_rep_mem_rdbk_state;

                                        -- reads op code error flag 
            elsif regAddr = seq_op_code_error_rd_cmd then
              next_state <= seq_op_code_error_rd_state;

              --------ASPIC parameters read             
              -- ASPIC configuration ccd 1 read
            elsif regAddr = aspic_conf_read_ccd1_cmd then
              next_state <= aspic_read_conf_ccd_1_state;

                                        -- ASPIC configuration ccd 2 read
            elsif regAddr = aspic_conf_read_ccd2_cmd then
              next_state <= aspic_read_conf_ccd_2_state;

                                        -- ASPIC configuration ccd 3 read
            elsif regAddr = aspic_conf_read_ccd3_cmd then
              next_state <= aspic_read_conf_ccd_3_state;

              --------CCD bias protection error and flag read

            elsif regAddr = ccd_bias_err_vut_cmd then
              next_state <= ccd_bias_read_error_vut_state;

              --------DREB voltage and current sensors read                             
              -- V6 voltage read
            elsif regAddr = v6_voltage_cmd then
              next_state <= v6_voltage_state;

                                        -- V6 current read
            elsif regAddr = v6_current_cmd then
              next_state <= v6_current_state;

                                        -- V9 voltage read
            elsif regAddr = v9_voltage_cmd then
              next_state <= v9_voltage_state;

                                        -- V9 current read
            elsif regAddr = v9_current_cmd then
              next_state <= v9_current_state;

                                        -- V24 voltage read
            elsif regAddr = v24_voltage_cmd then
              next_state <= v24_voltage_state;

                                        -- V24 current read
            elsif regAddr = v24_current_cmd then
              next_state <= v24_current_state;

                                        -- V40 voltage read
            elsif regAddr = v40_voltage_cmd then
              next_state <= v40_voltage_state;

                                        -- V40 current read
            elsif regAddr = v40_current_cmd then
              next_state <= v40_current_state;

                                        -- Vn15 voltage read
            elsif regAddr = vn15_voltage_cmd then
              next_state <= vn15_voltage_state;

                                        -- Vn15 current read
            elsif regAddr = vn15_current_cmd then
              next_state <= vn15_current_state;

              --------DREB temperature sensors read                             
              -- DREB T1 read
            elsif regAddr = DREB_T1_cmd then
              next_state <= DREB_T1_state;

                                        -- DREB T2 read
            elsif regAddr = DREB_T2_cmd then
              next_state <= DREB_T2_state;

              --------REB temperature sensors gr1 read                          
              -- REB T1 gr1 read
            elsif regAddr = REB_T1_gr1_cmd then
              next_state <= REB_T1_gr1_state;

                                        -- REB T2 gr1 read
            elsif regAddr = REB_T2_gr1_cmd then
              next_state <= REB_T2_gr1_state;

                                        -- REB T3 gr1 read
            elsif regAddr = REB_T3_gr1_cmd then
              next_state <= REB_T3_gr1_state;

                                        -- REB T4 gr1 read
            elsif regAddr = REB_T4_gr1_cmd then
              next_state <= REB_T4_gr1_state;

              --------REB temperature sensors gr2 read                          
              -- REB T1 gr2 read
            elsif regAddr = REB_T1_gr2_cmd then
              next_state <= REB_T1_gr2_state;

                                        -- REB T2 gr2 read
            elsif regAddr = REB_T2_gr2_cmd then
              next_state <= REB_T2_gr2_state;

                                        -- REB T3 gr2 read
            elsif regAddr = REB_T3_gr2_cmd then
              next_state <= REB_T3_gr2_state;

                                        -- REB T4 gr2 read
            elsif regAddr = REB_T4_gr2_cmd then
              next_state <= REB_T4_gr2_state;

              --------bias and temp ADC 
              -- bias and temp ADC T1 read (T ASPIC)
            elsif regAddr = bias_t_adc_read_T1_cmd then
              next_state <= bias_t_adc_T1_state;

                                        -- bias and temp ADC T2 read (T ASPIC)
            elsif regAddr = bias_t_adc_read_T2_cmd then
              next_state <= bias_t_adc_T2_state;

                                        -- bias and temp ADC T3 read (T ASPIC)
            elsif regAddr = bias_t_adc_read_T3_cmd then
              next_state <= bias_t_adc_T3_state;

                                        -- bias and temp ADC T4 read (T ASPIC)
            elsif regAddr = bias_t_adc_read_T4_cmd then
              next_state <= bias_t_adc_T4_state;

                                        -- bias and temp ADC T5 read (T ASPIC)
            elsif regAddr = bias_t_adc_read_T5_cmd then
              next_state <= bias_t_adc_T5_state;

                                        -- bias and temp ADC T6 read (T ASPIC)
            elsif regAddr = bias_t_adc_read_T6_cmd then
              next_state <= bias_t_adc_T6_state;

                                        -- bias and temp ADC Bias read (T ASPIC)
            elsif regAddr = bias_t_adc_read_B_cmd then
              next_state <= bias_t_adc_B_state;

              --------CCD temeprature read                                      
            elsif regAddr = ccd_temp_read_cmd then
              next_state <= ccd_temp_read_state;

              --------REB 1wire serial number                   
              -- REB serial number word 0 read
            elsif regAddr = reb_sn_read_w0_cmd then
              next_state <= reb_sn_read_w0_state;

                                        -- REB serial number word 1 read
            elsif regAddr = reb_sn_read_w1_cmd then
              next_state <= reb_sn_read_w1_state;

                                        -- DC/DC clock enable read
            elsif regAddr = dcdc_clk_en_cmd then
              next_state <= dcdc_clk_en_rd;

              ---------- Jitter Cleaner read config    
            elsif regAddr = jc_start_config_cmd then
              next_state <= jc_read_config_state;

              -------- XADC param reads         
            elsif regAddr = read_xadc_param_cmd then
              next_state       <= read_xadc_param_state;
              next_xadc_den_in <= '1';

              -------- XADC alarms reads                
            elsif regAddr = read_xadc_alarms_cmd then
              next_state <= read_xadc_alarms_state;

              --------back bias switch read             
              -- back bias switch read
            elsif regAddr = back_bias_sw_cmd then
              next_state <= back_bias_sw_read_state;

-- ERROR                                                        
            else
              next_state   <= error_state;
              next_regFail <= '1';
              next_regAck  <= '1';
            end if;
          else

------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------  WRITE --------------------------------------------------------                                                        
------------------------------------------------------------------------------------------------------------------------

---------- Base Register Set write

                                        -- TIME BASE SET lsw 
            if regAddr = time_base_lsw_cmd then
              next_state                    <= time_base_set_lsw;
              next_load_time_base_lsw       <= '1';
              next_cnt_preset(31 downto 0)  <= regDataWr_masked;
              next_cnt_preset(63 downto 32) <= (others => '0');

                                                  -- TIME BASE SET MSW 
            elsif regAddr = time_base_MSW_cmd then
              next_state                    <= time_base_set_MSW;
              next_load_time_base_MSW       <= '1';
              next_cnt_preset(31 downto 0)  <= (others => '0');
              next_cnt_preset(63 downto 32) <= regDataWr_masked;
                                                  -- TRIGGER SET 
            elsif regAddr = trigger_set_cmd then  -- trigger
              next_state           <= trigger_state;
              next_trigger_ce_bus  <= regWrEn;
              next_trigger_val_bus <= regDataWr_masked;

---------- Status block
              -- status block reset
            elsif regAddr = read_status_reg_base then
              next_state       <= status_block_rst_state;
              next_StatusReset <= '1';

---------- Sync Commands 
              -- sync command 0 delay set
            elsif regAddr = sync_cmd_delay_cmd then
              next_state             <= sync_cmd_delay_wr_state;
              next_sync_cmd_delay_en <= '1';

              -- sync command mask set
            elsif regAddr = sync_cmd_mask_cmd then
              next_state            <= sync_cmd_mask_wr_state;
              next_sync_cmd_mask_en <= '1';

              -- interrupt mask set
            elsif regAddr = interrupt_mask_cmd then
              next_state                <= interrupt_mask_wr_state;
              next_interrupt_mask_wr_en <= '1';

---------- Image Parameters Write

                                        -- image size write                                                     
            elsif regAddr = image_size_cmd then
              next_state         <= set_image_size_state;
              next_image_size_en <= '1';

              -- Image Patter Generator enable (1 = ON)                                                 
            elsif regAddr = image_patter_mode_cmd then
              next_state           <= set_img_pattern_gen_state;
              next_image_patter_en <= '1';

                                        -- CCD selector enable (CCD 1 = lsb)                                                    
            elsif regAddr = ccd_sel_cmd then
              next_state      <= set_ccd_sel_state;
              next_ccd_sel_en <= '1';

---------- Sequencer Parameters Write

                                        -- function time write          
            elsif (regAddr >= func_time_set_base) and (regAddr <= func_time_set_high)then
              next_state             <= func_time_wr;
              next_seq_time_mem_w_en <= '1';

                                        -- function outputs write
            elsif (regAddr >= func_out_set_base) and (regAddr <= func_out_set_high) then
              next_state            <= func_output_wr;
              next_seq_out_mem_w_en <= '1';

                                        -- program memory write                 
            elsif (regAddr >= prog_mem_base) and (regAddr <= prog_mem_high) then
              next_state             <= seq_prog_mem_wr;
              next_seq_prog_mem_w_en <= '1';

                                        -- sequencer step                       
            elsif regAddr = seq_step_cmd then
              next_state    <= seq_step_state;
              next_seq_step <= '1';

                                        -- sequencer stop
            elsif regAddr = func_stop_cmd then
              next_state    <= seq_stop_state;
              next_seq_stop <= '1';

                                        -- enable video ADC conv shift
            elsif regAddr = enable_conv_shift_cmd then
              next_state             <= enable_conv_shift_state;
              next_enable_conv_shift <= '1';

                                        -- initialize video ADC conv shift
            elsif regAddr = init_conv_shift_cmd then
              next_state           <= init_conv_shift_state;
              next_init_conv_shift <= '1';

                                        -- indirect memory write                        
            elsif regAddr = start_add_cmd then
              next_state                 <= enable_start_add_prog_mem_state;
              next_start_add_prog_mem_en <= '1';
              
            elsif (regAddr >= seq_ind_func_mem_base) and (regAddr <= seq_ind_func_mem_high) then
              next_state               <= seq_ind_func_mem_we_state;
              next_seq_ind_func_mem_we <= '1';
              
            elsif (regAddr >= seq_ind_rep_mem_base) and (regAddr <= seq_ind_rep_mem_high) then
              next_state              <= seq_ind_rep_mem_we_state;
              next_seq_ind_rep_mem_we <= '1';
              
            elsif (regAddr >= seq_ind_sub_add_mem_base) and (regAddr <= seq_ind_sub_add_mem_high) then
              next_state                  <= seq_ind_sub_add_mem_we_state;
              next_seq_ind_sub_add_mem_we <= '1';
              
            elsif (regAddr >= seq_ind_sub_rep_mem_base) and (regAddr <= seq_ind_sub_rep_mem_high) then
              next_state                  <= seq_ind_sub_rep_mem_we_state;
              next_seq_ind_sub_rep_mem_we <= '1';

              -- op code error reset
            elsif regAddr = seq_op_code_error_reset_cmd then
              next_state                   <= seq_op_code_error_reset_state;
              next_seq_op_code_error_reset <= '1';


---------- ASPIC Parameters Write
              -- ASPIC start trans                                                                                                              
            elsif regAddr = aspic_start_trans_cmd then
              next_state             <= aspic_start_trans_state;
              next_aspic_start_trans <= '1';

              -- ASPIC start reset                                                                                                              
            elsif regAddr = aspic_start_reset_cmd then
              next_state             <= aspic_start_reset_state;
              next_aspic_start_reset <= '1';

---------- CCD bias DAC
              -- CCD 1
              -- start write config
            elsif regAddr = ccd_1_bias_load_config_cmd then
              next_state                 <= ccd_1_bias_load_config_state;
              next_ccd_1_bias_load_start <= '1';
                                        -- start send LDAC
            elsif regAddr = ccd_1_bias_ldac_cmd then
              next_state                 <= ccd_1_bias_ldac_state;
              next_ccd_1_bias_ldac_start <= '1';
                                        -- CCD 2
                                        -- start write config
            elsif regAddr = ccd_2_bias_load_config_cmd then
              next_state                 <= ccd_2_bias_load_config_state;
              next_ccd_2_bias_load_start <= '1';
                                        -- start send LDAC
            elsif regAddr = ccd_2_bias_ldac_cmd then
              next_state                 <= ccd_2_bias_ldac_state;
              next_ccd_2_bias_ldac_start <= '1';
                                        -- CCD 3
                                        -- start write config
            elsif regAddr = ccd_3_bias_load_config_cmd then
              next_state                 <= ccd_3_bias_load_config_state;
              next_ccd_3_bias_load_start <= '1';
                                        -- start send LDAC
            elsif regAddr = ccd_3_bias_ldac_cmd then
              next_state                 <= ccd_3_bias_ldac_state;
              next_ccd_3_bias_ldac_start <= '1';



---------- CCD clock rails DAC
              -- start write config
            elsif regAddr = clk_rail_load_config_cmd then
              next_state               <= clk_rail_load_config_state;
              next_clk_rail_load_start <= '1';
                                        -- start send LDAC
            elsif regAddr = clk_rail_ldac_cmd then
              next_state               <= clk_rail_ldac_state;
              next_clk_rail_ldac_start <= '1';

---------- Heater DAC
              -- start write config
            elsif regAddr = HTR_load_config_cmd then
              next_state          <= HTR_load_config_state;
              next_htr_load_start <= '1';
                                        -- start send LDAC
            elsif regAddr = HTR_ldac_cmd then
              next_state          <= HTR_ldac_state;
              next_htr_ldac_start <= '1';

---------- bias and temp ADC
              -- start read ASPIC T
            elsif regAddr = bias_t_adc_start_t_cmd then
              next_state              <= bias_t_adc_start_t_state;
              next_bias_t_adc_start_t <= '1';
                                        -- start read ADC channel
            elsif regAddr = bias_t_adc_start_b_cmd then
              next_state              <= bias_t_adc_start_b_state;
              next_bias_t_adc_start_b <= '1';
                                        -- start read ADC register
            elsif regAddr = bias_t_adc_start_r_cmd then
              next_state              <= bias_t_adc_start_r_state;
              next_bias_t_adc_start_r <= '1';


---------- CCD temperature
              -- start procedure
            elsif regAddr = ccd_temp_start_cmd then
              next_state          <= ccd_temp_start_state;
              next_ccd_temp_start <= '1';
              
            elsif regAddr = ccd_temp_start_reset_cmd then
              next_state                <= ccd_temp_start_reset_state;
              next_ccd_temp_start_reset <= '1';


---------- REB 1wire serial number                                                      
              -- REB 1wire serial number start acq                                                                                                                 
            elsif regAddr = reb_sn_acq_cmd then
              next_state             <= reb_sn_acq_state;
              next_reb_onewire_reset <= '0';

---------- DC/DC clock enable                                                   
            elsif regAddr = dcdc_clk_en_cmd then
              next_state       <= dcdc_clk_en_state;
              next_dcdc_clk_en <= '1';

---------- Jitter Cleaner start config                                                      
            elsif regAddr = jc_start_config_cmd then
              next_state           <= jc_start_config_state;
              next_jc_start_config <= '1';

---------- Back bias switch enable                                                      
            elsif regAddr = back_bias_sw_cmd then
              next_state           <= back_bias_sw_set_state;
              next_en_back_bias_sw <= '1';

---------- multiboot                                                    
            elsif regAddr = start_multiboot_cmd then
              next_state           <= start_multiboot_state;
              next_start_multiboot <= '1';

---------- ERROR                                                                                                        
            else
              next_state   <= error_state;
              next_regFail <= '1';
              next_regAck  <= '1';
            end if;
          end if;
        end if;





------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------  CMD EXECUTION ------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

---------------------- BASE REGISTER SET READ  --------------------------
        -- SCHEMA (add 0)               
      when schema =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= schema_value;

        -- HDL VERSION (add 1)
      when hdl_version =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= version_dev_level & LSST_SCI_VERSION & REB_vhdl_version;
        -- SCI ID (add 2)
      when SCI_ID =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= x"0000_00" & Switch_addr;
        -- RESERVED 1 (add3)
      when reserved_1 =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= reserved_1_value;
        -- TIME BASE READ lsw (add4)
      when time_base_read_lsw =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= time_base_actual_value(31 downto 0);
        -- TIME BASE READ MSW (add5)
      when time_base_read_MSW =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= time_base_actual_value(63 downto 32);
        -- RESERVED 2 (add 6)
      when reserved_2 =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= reserved_2_value;
        -- RESERVED 3 (add 7)           
      when reserved_3 =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= reserved_3_value;
        -- STATE (add 8)        
      when state_busy =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= busy_bus;
        -- TRIGGER TIME READ SB lsw  (addA)
      when trigger_time_SB_lsw =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_SB(31 downto 0);
        -- TRIGGER TIME READ SB MSW  (addB)
      when trigger_time_SB_MSW =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_SB(63 downto 32);
        -- TRIGGER TIME READ TB lsw  (addC)
      when trigger_time_TB_lsw =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_TB(31 downto 0);
        -- TRIGGER TIME READ TB LSW  (addD)
      when trigger_time_TB_MSW =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_TB(63 downto 32);
        -- TRIGGER TIME READ seq lsw  (addE)
      when trigger_time_seq_lsw =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_seq(31 downto 0);
        -- TRIGGER TIME READ seq MSW  (addF)
      when trigger_time_seq_MSW =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_seq(63 downto 32);

        -- Sync command 0 delay
      when sync_cmd_delay_rd_state =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= x"000000"&sync_cmd_delay_read;

        -- Sync command mask
      when sync_cmd_mask_rd_state =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= sync_cmd_mask_read;

        -- interrupt mask read
      when interrupt_mask_rd_state =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= x"0000" & "00" & interrupt_mask_read;

        -- TRIGGER TIME READ V_I lsw  (add10)
      when trigger_time_V_I_lsw =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_V_I(31 downto 0);
        -- TRIGGER TIME READ V_I MSW  (add11)
      when trigger_time_V_I_MSW =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_V_I(63 downto 32);
        -- TRIGGER TIME READ pcb temp lsw  (add12)
      when trigger_time_pcb_t_lsw =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_pcb_t(31 downto 0);
        -- TRIGGER TIME READ pcb temp MSW  (add13)
      when trigger_time_pcb_t_MSW =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= trig_tm_value_pcb_t(63 downto 32);
      when v_ok_state =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= x"0000000" & Mgt_avcc_ok & Mgt_accpll_ok & Mgt_avtt_ok & V3_3v_ok;
        -- immage size read (add 400005)                
      when read_image_size_state =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= image_size;

        -- image patter on read (add 400006)    
      when read_image_patter_mode_state =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= x"0000000" & "000" & image_patter_read;

        -- CCD selector read (add 400007)       
      when read_ccd_sel_state =>
        next_state     <= wait_end_cmd;
        next_regAck    <= '1';
        next_regDataRd <= x"0000000" & '0' & ccd_sel_read;

        -- status block read  
      when statusReg_rd =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= statusReg;
        next_regAck    <= '1';

---------------------- BASE REGISTER SET WRITE  --------------------------

        -- TIME BASE lsw write (add4) 
      when time_base_set_lsw =>
        next_state <= ack_del_1;

        -- TIME BASE MSW write (add5)
      when time_base_set_MSW =>
        next_state <= ack_del_1;

        -- TRIGGER write (add 9)
      when trigger_state =>
        next_state <= ack_del_1;

        -- sync command 0 delay set
      when sync_cmd_delay_wr_state =>
        next_state <= ack_del_1;

        -- sync command mask set
      when sync_cmd_mask_wr_state =>
        next_state <= ack_del_1;


        -- interrupt mask set
      when interrupt_mask_wr_state =>
        next_state <= ack_del_1;

      when status_block_rst_state =>
        next_state <= ack_del_1;



---------------------- Image Parameters Write --------------------------

        -- write the image size register 
      when set_image_size_state =>
        next_state <= ack_del_1;

        -- enables the image patter generator
      when set_img_pattern_gen_state =>
        next_state <= ack_del_1;

        -- enables the CCD selector register
      when set_ccd_sel_state =>
        next_state <= ack_del_1;

---------------------- Sequencer Parameters Write/Read --------------------------

        -- write function output state
      when func_output_wr =>
        next_state <= ack_del_1;

        -- write function time state
      when func_time_wr =>
        next_state <= ack_del_1;

        -- write program memory state
      when seq_prog_mem_wr =>
        next_state <= ack_del_1;

        -- sequencer step state
      when seq_step_state =>
        next_state <= ack_del_1;

        -- sequencer stop state
      when seq_stop_state =>
        next_state <= ack_del_1;

        -- enable video ADC conv state
      when enable_conv_shift_state =>
        next_state <= ack_del_1;

        -- initialize video ADC conv state
      when init_conv_shift_state =>
        next_state <= ack_del_1;

        -- write program start address
      when enable_start_add_prog_mem_state =>
        next_state <= ack_del_1;

        -- write indirect function mem
      when seq_ind_func_mem_we_state =>
        next_state <= ack_del_1;

        -- write indirect function repetition mem
      when seq_ind_rep_mem_we_state =>
        next_state <= ack_del_1;

        -- write indirect subrutine mem
      when seq_ind_sub_add_mem_we_state =>
        next_state <= ack_del_1;

        -- write indirect subrutine rep mem
      when seq_ind_sub_rep_mem_we_state =>
        next_state <= ack_del_1;

        -- reset op code flag
      when seq_op_code_error_reset_state =>
        next_state <= ack_del_1;


        -- sequencer time memory read           
      when seq_func_time_rd =>
        next_state                   <= wait_end_cmd;
        next_regDataRd(31 downto 16) <= x"0000";
        next_regDataRd(15 downto 0)  <= seq_time_mem_readbk;
        next_regAck                  <= '1';

        -- sequencer output memory read         
      when seq_func_out_rd =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= seq_out_mem_readbk;
        next_regAck    <= '1';

        -- sequencer program memory read                
      when seq_prog_mem_rd =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= seq_prog_mem_readbk;
        next_regAck    <= '1';

        -- enable video ADC conv shift read             
      when enable_conv_shift_rd =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000000" & "000" & enable_conv_shift_in;
        next_regAck    <= '1';

        -- program memory init address read             
      when start_add_prog_mem_rd_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"00000" & "00" & start_add_prog_mem_rbk;
        next_regAck    <= '1';

        -- indirect functions mem read          
      when seq_ind_func_mem_rdbk_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000000" & seq_ind_func_mem_rdbk;
        next_regAck    <= '1';

        -- indirect function repetitons mem read                
      when seq_ind_rep_mem_rdbk_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"00" & seq_ind_rep_mem_rdbk;
        next_regAck    <= '1';

        -- indirect subrutine address mem read          
      when seq_ind_sub_add_mem_rdbk_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"00000" & "00" & seq_ind_sub_add_mem_rdbk;
        next_regAck    <= '1';

        -- indirect subrutine repetition mem read               
      when seq_ind_sub_rep_mem_rdbk_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & seq_ind_sub_rep_mem_rdbk;
        next_regAck    <= '1';

        --op code error flag read       
      when seq_op_code_error_rd_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= "000" & seq_op_code_error & x"0000" & "00" & seq_op_code_error_add;
        next_regAck    <= '1';

---------------------- ASPIC Parameters Write/Read --------------------------
        -- read ASPIC config ccd1
      when aspic_read_conf_ccd_1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000"&aspic_config_r_ccd_1;
        next_regAck    <= '1';

        -- read ASPIC config ccd2
      when aspic_read_conf_ccd_2_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000"&aspic_config_r_ccd_2;
        next_regAck    <= '1';

        -- read ASPIC config ccd3
      when aspic_read_conf_ccd_3_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000"&aspic_config_r_ccd_3;
        next_regAck    <= '1';

-- following stses are necessariy to wait ASPIC spi fsm to start and activate busy                      
        -- ASPIC start transaction
      when aspic_start_trans_state =>
        next_state <= aspic_start_trans_state_1;
        
      when aspic_start_trans_state_1 =>
        next_state <= aspic_start_trans_state_2;
        
      when aspic_start_trans_state_2 =>
        next_state <= aspic_start_trans_state_3;
        
      when aspic_start_trans_state_3 =>
        if aspic_op_end = '1' then
          next_state <= aspic_start_trans_state_3;
        else
          next_state <= ack_del_1;
        end if;

        -- ASPIC start reset
      when aspic_start_reset_state =>
        next_state <= aspic_start_reset_state_1;
        
      when aspic_start_reset_state_1 =>
        next_state <= aspic_start_reset_state_2;
        
      when aspic_start_reset_state_2 =>
        next_state <= aspic_start_reset_state_3;
        
      when aspic_start_reset_state_3 =>
        if aspic_op_end = '1' then
          next_state <= aspic_start_reset_state_3;
        else
          next_state <= ack_del_1;
        end if;

---------------------- CCD bias DAC Write --------------------------
        -- CCD 1        
      when ccd_1_bias_load_config_state =>
        next_state <= ack_del_1;
      when ccd_1_bias_ldac_state =>
        next_state <= ack_del_1;
        -- CCD 2        
      when ccd_2_bias_load_config_state =>
        next_state <= ack_del_1;
      when ccd_2_bias_ldac_state =>
        next_state <= ack_del_1;
        -- CCD 3        
      when ccd_3_bias_load_config_state =>
        next_state <= ack_del_1;
      when ccd_3_bias_ldac_state =>
        next_state <= ack_del_1;
        -- error and Voltage Under Threshold read
      when ccd_bias_read_error_vut_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= "0000" & "000" & bias_v_undr_th & "0000" & "000" & bias_dac_cmd_err;
        next_regAck    <= '1';

---------------------- CCD clock rails DAC Write --------------------------
        
      when clk_rail_load_config_state =>
        next_state <= ack_del_1;

      when clk_rail_ldac_state =>
        next_state <= ack_del_1;

---------------------- Heater DAC Write --------------------------
        
      when HTR_load_config_state =>
        next_state <= ack_del_1;

      when HTR_ldac_state =>
        next_state <= ack_del_1;

---------------------- DREB voltage and current sensors --------------------------      
        -- V6 voltage
      when v6_voltage_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v6_voltage_error & v6_voltage;
        next_regAck    <= '1';

        -- V6 current
      when v6_current_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v6_current_error & v6_current;
        next_regAck    <= '1';

        -- V9 voltage
      when v9_voltage_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v9_voltage_error & v9_voltage;
        next_regAck    <= '1';

        -- V9 current
      when v9_current_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v9_current_error & v9_current;
        next_regAck    <= '1';

        -- V24 voltage
      when v24_voltage_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v24_voltage_error & v24_voltage;
        next_regAck    <= '1';

        -- V24 current
      when v24_current_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v24_current_error & v24_current;
        next_regAck    <= '1';

        -- V40 voltage
      when v40_voltage_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v40_voltage_error & v40_voltage;
        next_regAck    <= '1';

        -- V40 current
      when v40_current_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & v40_current_error & v40_current;
        next_regAck    <= '1';

        -- Vn15 voltage
      when vn15_voltage_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & vn15_voltage_error & vn15_voltage;
        next_regAck    <= '1';

        -- Vn15 current
      when vn15_current_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & vn15_current_error & vn15_current;
        next_regAck    <= '1';

---------------------- DREB Temperature sensors --------------------------      
        -- DREB T1 
      when DREB_T1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T1_dreb_error & T1_dreb;
        next_regAck    <= '1';

        -- DREB T2
      when DREB_T2_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T2_dreb_error & T2_dreb;
        next_regAck    <= '1';

---------------------- REB Temperature sensors group 1 --------------------------       
        -- REB T1 gr1 
      when REB_T1_gr1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T1_reb_gr1_error & T1_reb_gr1;
        next_regAck    <= '1';

        -- REB T2 gr1
      when REB_T2_gr1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T2_reb_gr1_error & T2_reb_gr1;
        next_regAck    <= '1';

        -- REB T3 gr1 
      when REB_T3_gr1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T3_reb_gr1_error & T3_reb_gr1;
        next_regAck    <= '1';

        -- REB T4 gr1
      when REB_T4_gr1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T4_reb_gr1_error & T4_reb_gr1;
        next_regAck    <= '1';

---------------------- REB Temperature sensors group 2 --------------------------       
        -- REB T1 gr2 
      when REB_T1_gr2_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T1_reb_gr2_error & T1_reb_gr2;
        next_regAck    <= '1';

        -- REB T2 gr2
      when REB_T2_gr2_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T2_reb_gr2_error & T2_reb_gr2;
        next_regAck    <= '1';

        -- REB T3 gr2 
      when REB_T3_gr2_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T3_reb_gr2_error & T3_reb_gr2;
        next_regAck    <= '1';

        -- REB T4 gr2
      when REB_T4_gr2_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" &"000" & T4_reb_gr2_error & T4_reb_gr2;
        next_regAck    <= '1';

---------------------- bias and temp ADC ----------------------  

        -- start T read
      when bias_t_adc_start_t_state =>
        if bias_t_adc_busy = '1' then
          next_state <= bias_t_adc_start_t_state;
        else
          next_state <= ack_del_1;
        end if;

        -- start Bias read
      when bias_t_adc_start_b_state =>
        if bias_t_adc_busy = '1' then
          next_state <= bias_t_adc_start_b_state;
        else
          next_state <= ack_del_1;
        end if;

        -- start Register read
      when bias_t_adc_start_r_state =>
        if bias_t_adc_busy = '1' then
          next_state <= bias_t_adc_start_r_state;
        else
          next_state <= ack_del_1;
        end if;

        -- Read T1 
      when bias_t_adc_T1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & bias_t_adc_data(0);
        next_regAck    <= '1';

        -- Read T2 
      when bias_t_adc_T2_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & bias_t_adc_data(1);
        next_regAck    <= '1';

        -- Read T3 
      when bias_t_adc_T3_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & bias_t_adc_data(2);
        next_regAck    <= '1';

        -- Read T4 
      when bias_t_adc_T4_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & bias_t_adc_data(3);
        next_regAck    <= '1';

        -- Read T5 
      when bias_t_adc_T5_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & bias_t_adc_data(4);
        next_regAck    <= '1';

        -- Read T6 
      when bias_t_adc_T6_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & bias_t_adc_data(5);
        next_regAck    <= '1';

        -- Read Bias 
      when bias_t_adc_B_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"0000" & bias_t_adc_data(6);
        next_regAck    <= '1';

---------------------- CCD Temperature sensor --------------------------                                
        -- CCD temperature read
      when ccd_temp_read_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"00" & ccd_temp;
        next_regAck    <= '1';

        -- CCD temperature start procedure
      when ccd_temp_start_state =>
        if ccd_temp_busy = '1' then
          next_state <= ccd_temp_start_state;
        else
          next_state <= ack_del_1;
        end if;
        
      when ccd_temp_start_reset_state =>
        if ccd_temp_busy = '1' then
          next_state <= ccd_temp_start_reset_state;
        else
          next_state <= ack_del_1;
        end if;


---------------------- REB 1wire serial number --------------------------                               
-- REB 1wire serial number acq
      when reb_sn_acq_state =>
        if reb_sn_crc_ok = '0' and reb_sn_dev_error = '0' and reb_sn_timeout = '0' then
          next_state             <= reb_sn_acq_state;
          next_reb_onewire_reset <= '0';
        else
          next_state <= ack_del_1;
        end if;

-- REB 1wire serial number read w 0             
      when reb_sn_read_w0_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= reb_sn(31 downto 0);
        next_regAck    <= '1';

-- REB 1wire serial number read w 1             
      when reb_sn_read_w1_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000" & '0' & reb_sn_timeout & reb_sn_dev_error & reb_sn_crc_ok & reb_sn(47 downto 32);
        next_regAck    <= '1';

---------------------- Jitter Cleaner  --------------------------      
-- read jitter cleaner status bus
      when jc_read_config_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= x"000000" & "00" & jc_status_bus;
        next_regAck    <= '1';

-- start config process 
      when jc_start_config_state =>
        next_state <= ack_del_1;

---------------------- Back bias switch enable --------------------------                               
-- Back bias enable read        
      when back_bias_sw_read_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= X"0000000" & '0' & back_bias_sw_error & back_bias_cl_rb & back_bias_sw_rb;
        next_regAck    <= '1';

        -- Back bias enable 
      when back_bias_sw_set_state =>
        next_state <= ack_del_1;

---------------------- Multiboot --------------------------                             

        -- start multiboot
      when start_multiboot_state =>
        next_state <= ack_del_1;


---------------------- XADC --------------------------                          

        -- read XADC parameter
      when read_xadc_param_state =>
        if xadc_drdy_out = '0' then
          next_state <= read_xadc_param_state;
        else
          next_state     <= wait_end_cmd;
          next_regDataRd <= X"0000" & xadc_do_out;
          next_regAck    <= '1';
        end if;

        -- read XADC alarms
      when read_xadc_alarms_state =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= X"000000" & "00" & xadc_ot_out & xadc_vccaux_alarm_out & xadc_vccint_alarm_out
                          & xadc_user_temp_alarm_out & xadc_vbram_alarm_out & xadc_alarm_out;
        next_regAck <= '1';


---------------------- DC/DC clock enable --------------------------                            
-- DC/DC clock enable read      
      when dcdc_clk_en_rd =>
        next_state     <= wait_end_cmd;
        next_regDataRd <= X"0000000" & "000" & dcdc_clk_en_in;
        next_regAck    <= '1';

        -- enable video ADC conv state
      when dcdc_clk_en_state =>
        next_state <= ack_del_1;

---------------------- WAIT END CMD  --------------------------
        
      when wait_end_cmd =>
        if regReq = '1' then
          next_state <= wait_end_cmd;
        else
          next_state <= wait_cmd;
        end if;


---------------------- delay for ACK --------------------------
      when ack_del_1 =>
        next_state <= ack_del_2;
      when ack_del_2 =>
        next_state  <= wait_end_cmd;
        next_regAck <= '1';

--------------------------------------------------------   error detected --------------------------------------------------------  
        
      when error_state =>
        if regReq = '1' then
          next_state <= error_state;
        else
          next_state <= wait_cmd;
        end if;
        
    end case;
  end process;

end Behavioral;

