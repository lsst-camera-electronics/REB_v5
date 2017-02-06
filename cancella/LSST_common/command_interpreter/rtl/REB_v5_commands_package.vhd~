--
--      Package File Template
--
--      Purpose: This package defines supplemental types, subtypes, 
--               constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package REB_v4_commands_package is


-- Base Register Set 
  constant read_schema_cmd              : std_logic_vector(23 downto 0) := x"000000";
  constant read_hdl_version_cmd         : std_logic_vector(23 downto 0) := x"000001";
  constant read_SCI_ID_cmd              : std_logic_vector(23 downto 0) := x"000002";
  constant read_reserved_1_cmd          : std_logic_vector(23 downto 0) := x"000003";
  constant time_base_lsw_cmd            : std_logic_vector(23 downto 0) := x"000004";
  constant time_base_MSW_cmd            : std_logic_vector(23 downto 0) := x"000005";
  constant read_reserved_2_cmd          : std_logic_vector(23 downto 0) := x"000006";
  constant read_reserved_3_cmd          : std_logic_vector(23 downto 0) := x"000007";
  constant read_state_busy_cmd          : std_logic_vector(23 downto 0) := x"000008";
  constant trigger_set_cmd              : std_logic_vector(23 downto 0) := x"000009";
  constant read_trig_time_SB_lsw_cmd    : std_logic_vector(23 downto 0) := x"00000A";
  constant read_trig_time_SB_MSW_cmd    : std_logic_vector(23 downto 0) := x"00000B";
  constant read_trig_time_TB_lsw_cmd    : std_logic_vector(23 downto 0) := x"00000C";
  constant read_trig_time_TB_MSW_cmd    : std_logic_vector(23 downto 0) := x"00000D";
  constant read_trig_time_seq_lsw_cmd   : std_logic_vector(23 downto 0) := x"00000E";
  constant read_trig_time_seq_MSW_cmd   : std_logic_vector(23 downto 0) := x"00000F";
  constant read_trig_time_V_I_lsw_cmd   : std_logic_vector(23 downto 0) := x"000010";
  constant read_trig_time_V_I_MSW_cmd   : std_logic_vector(23 downto 0) := x"000011";
  constant read_trig_time_pcb_t_lsw_cmd : std_logic_vector(23 downto 0) := x"000012";
  constant read_trig_time_pcb_t_MSW_cmd : std_logic_vector(23 downto 0) := x"000013";

  constant read_v_ok_cmd : std_logic_vector(23 downto 0) := x"000014";

-- Image parameters
  constant image_size_cmd        : std_logic_vector(23 downto 0) := x"400005";
  constant image_patter_mode_cmd : std_logic_vector(23 downto 0) := x"400006";
  constant ccd_sel_cmd           : std_logic_vector(23 downto 0) := x"400007";

-- Status Register
  constant read_status_reg_base : std_logic_vector(23 downto 0) := x"A00000";
  constant read_status_reg_high : std_logic_vector(23 downto 0) := x"A003ff";

-- Sequencer
  constant func_time_set_base    : std_logic_vector(23 downto 0) := x"200000";
  constant func_time_set_high    : std_logic_vector(23 downto 0) := x"2000ff";
  constant func_out_set_base     : std_logic_vector(23 downto 0) := x"100000";
  constant func_out_set_high     : std_logic_vector(23 downto 0) := x"1000ff";
  constant prog_mem_base         : std_logic_vector(23 downto 0) := x"300000";
  constant prog_mem_high         : std_logic_vector(23 downto 0) := x"300fff";
  constant seq_step_cmd          : std_logic_vector(23 downto 0) := x"310000";
  constant func_stop_cmd         : std_logic_vector(23 downto 0) := x"320000";
  constant enable_conv_shift_cmd : std_logic_vector(23 downto 0) := x"330000";
  constant init_conv_shift_cmd   : std_logic_vector(23 downto 0) := x"330001";

  constant start_add_cmd : std_logic_vector(23 downto 0) := x"340000";

  constant seq_ind_func_mem_base    : std_logic_vector(23 downto 0) := x"350000";
  constant seq_ind_func_mem_high    : std_logic_vector(23 downto 0) := x"35000f";
  constant seq_ind_rep_mem_base     : std_logic_vector(23 downto 0) := x"360000";
  constant seq_ind_rep_mem_high     : std_logic_vector(23 downto 0) := x"36000f";
  constant seq_ind_sub_add_mem_base : std_logic_vector(23 downto 0) := x"370000";
  constant seq_ind_sub_add_mem_high : std_logic_vector(23 downto 0) := x"37000f";
  constant seq_ind_sub_rep_mem_base : std_logic_vector(23 downto 0) := x"380000";
  constant seq_ind_sub_rep_mem_high : std_logic_vector(23 downto 0) := x"38000f";

  constant seq_op_code_error_rd_cmd    : std_logic_vector(23 downto 0) := x"390000";
  constant seq_op_code_error_reset_cmd : std_logic_vector(23 downto 0) := x"390001";



-- CABAC (top 0 to 4 - bottom 5 to 9) 500000 DAC @ 501000

-- ASPIC 
  constant aspic_start_trans_cmd    : std_logic_vector(23 downto 0) := x"B00000";
  constant aspic_start_reset_cmd    : std_logic_vector(23 downto 0) := x"B00001";
  constant aspic_conf_read_ccd1_cmd : std_logic_vector(23 downto 0) := x"B00010";
  constant aspic_conf_read_ccd2_cmd : std_logic_vector(23 downto 0) := x"B00011";
  constant aspic_conf_read_ccd3_cmd : std_logic_vector(23 downto 0) := x"B00012";

---------- CCD bias DAC
  constant ccd_1_bias_load_config_cmd : std_logic_vector(23 downto 0) := x"400100";
  constant ccd_1_bias_ldac_cmd        : std_logic_vector(23 downto 0) := x"400101";
  constant ccd_2_bias_load_config_cmd : std_logic_vector(23 downto 0) := x"400110";
  constant ccd_2_bias_ldac_cmd        : std_logic_vector(23 downto 0) := x"400111";
  constant ccd_3_bias_load_config_cmd : std_logic_vector(23 downto 0) := x"400120";
  constant ccd_3_bias_ldac_cmd        : std_logic_vector(23 downto 0) := x"400121";

---------- CCD clock rails DAC
  constant clk_rail_load_config_cmd : std_logic_vector(23 downto 0) := x"400000";
  constant clk_rail_ldac_cmd        : std_logic_vector(23 downto 0) := x"400001";

---------- Heater DAC
  constant HTR_load_config_cmd : std_logic_vector(23 downto 0) := x"400010";
  constant HTR_ldac_cmd        : std_logic_vector(23 downto 0) := x"400011";

---------- DREB voltage and current sensors
  constant v6_voltage_cmd   : std_logic_vector(23 downto 0) := x"600000";
  constant v6_current_cmd   : std_logic_vector(23 downto 0) := x"600001";
  constant v9_voltage_cmd   : std_logic_vector(23 downto 0) := x"600002";
  constant v9_current_cmd   : std_logic_vector(23 downto 0) := x"600003";
  constant v24_voltage_cmd  : std_logic_vector(23 downto 0) := x"600004";
  constant v24_current_cmd  : std_logic_vector(23 downto 0) := x"600005";
  constant v40_voltage_cmd  : std_logic_vector(23 downto 0) := x"600006";
  constant v40_current_cmd  : std_logic_vector(23 downto 0) := x"600007";
  constant vn15_voltage_cmd : std_logic_vector(23 downto 0) := x"600008";
  constant vn15_current_cmd : std_logic_vector(23 downto 0) := x"600009";

---------- DREB temperature sensors
  constant DREB_T1_cmd : std_logic_vector(23 downto 0) := x"600010";
  constant DREB_T2_cmd : std_logic_vector(23 downto 0) := x"600011";

---------- REB temperature sensors GR1
  constant REB_T1_gr1_cmd : std_logic_vector(23 downto 0) := x"600012";
  constant REB_T2_gr1_cmd : std_logic_vector(23 downto 0) := x"600013";
  constant REB_T3_gr1_cmd : std_logic_vector(23 downto 0) := x"600014";
  constant REB_T4_gr1_cmd : std_logic_vector(23 downto 0) := x"600015";

---------- REB temperature sensors GR2
  constant REB_T1_gr2_cmd : std_logic_vector(23 downto 0) := x"600016";
  constant REB_T2_gr2_cmd : std_logic_vector(23 downto 0) := x"600017";
  constant REB_T3_gr2_cmd : std_logic_vector(23 downto 0) := x"600018";
  constant REB_T4_gr2_cmd : std_logic_vector(23 downto 0) := x"600019";

---------- bias and temp ADC
  constant bias_t_adc_start_t_cmd : std_logic_vector(23 downto 0) := x"600100";
  constant bias_t_adc_start_b_cmd : std_logic_vector(23 downto 0) := x"600101";
  constant bias_t_adc_start_r_cmd : std_logic_vector(23 downto 0) := x"600102";

  constant bias_t_adc_read_T1_cmd : std_logic_vector(23 downto 0) := x"601000";
  constant bias_t_adc_read_T2_cmd : std_logic_vector(23 downto 0) := x"601001";
  constant bias_t_adc_read_T3_cmd : std_logic_vector(23 downto 0) := x"601002";
  constant bias_t_adc_read_T4_cmd : std_logic_vector(23 downto 0) := x"601003";
  constant bias_t_adc_read_T5_cmd : std_logic_vector(23 downto 0) := x"601004";
  constant bias_t_adc_read_T6_cmd : std_logic_vector(23 downto 0) := x"601005";

  constant bias_t_adc_read_B_cmd : std_logic_vector(23 downto 0) := x"601010";

---------- XADC
  constant read_xadc_param_cmd  : std_logic_vector(23 downto 0) := x"610000";
  constant read_xadc_alarms_cmd : std_logic_vector(23 downto 0) := x"610001";


---------- CCD temperature sensor
  constant ccd_temp_read_cmd        : std_logic_vector(23 downto 0) := x"700001";
  constant ccd_temp_start_cmd       : std_logic_vector(23 downto 0) := x"700000";
  constant ccd_temp_start_reset_cmd : std_logic_vector(23 downto 0) := x"700002";

---------- REB 1wire serial number
  constant reb_sn_acq_cmd     : std_logic_vector(23 downto 0) := x"800000";
  constant reb_sn_read_w0_cmd : std_logic_vector(23 downto 0) := x"800001";
  constant reb_sn_read_w1_cmd : std_logic_vector(23 downto 0) := x"800002";

---------- Miscellanea 
-- back bias switch 
  constant back_bias_sw_cmd : std_logic_vector(23 downto 0) := x"D00000";

-- multiboot
  constant start_multiboot_cmd : std_logic_vector(23 downto 0) := x"F00000";

-- DC/DC clock enable
  constant dcdc_clk_en_cmd : std_logic_vector(23 downto 0) := x"900000";

end REB_v4_commands_package;

package body REB_v4_commands_package is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;

end REB_v4_commands_package;
