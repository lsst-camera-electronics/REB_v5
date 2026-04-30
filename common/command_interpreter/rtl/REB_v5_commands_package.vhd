library IEEE;
use IEEE.STD_LOGIC_1164.all;

library surf;
use surf.StdRtlPkg.all;

library lsst_reb;
use lsst_reb.SequencerPkg.all;

package REB_v5_commands_package is

  constant REG_SCHEMA : std_logic_vector(31 downto 0) := x"00000002";

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

  constant sync_cmd_delay_cmd : std_logic_vector(23 downto 0) := x"000015";
  constant sync_cmd_mask_cmd  : std_logic_vector(23 downto 0) := x"000016";

  constant interrupt_mask_cmd : std_logic_vector(23 downto 0) := x"000017";

  constant sys_clock_rate_cmd : std_logic_vector(23 downto 0) := x"000020";

  -- Bitstream Remote Update
  constant ru_start_cmd              : std_logic_vector(23 downto 0) := x"000100";
  constant ru_bitstream_we_cmd       : std_logic_vector(23 downto 0) := x"000101";
  constant ru_bitstream_daq_done_cmd : std_logic_vector(23 downto 0) := x"000102";
  constant ru_status_read_cmd        : std_logic_vector(23 downto 0) := x"000103";

  -- multiboot
  constant start_multiboot_cmd : std_logic_vector(23 downto 0) := x"000200";

  -- Image parameters
  constant image_size_cmd         : std_logic_vector(23 downto 0) := x"400005";
  constant image_pattern_mode_cmd : std_logic_vector(23 downto 0) := x"400006";
  constant ccd_sel_cmd            : std_logic_vector(23 downto 0) := x"400007";
  constant ccd_oe_cmd             : std_logic_vector(23 downto 0) := x"400008";

  -- Status Register
  constant read_status_reg_base : std_logic_vector(23 downto 0) := x"A00000";
  constant read_status_reg_high : std_logic_vector(23 downto 0) := x"A003ff";

  ---------------------------------------------------------------------------
  -- Sequencer Register Map
  --
  -- The Sequencer entity decodes addresses internally using the SeqRegMapType
  -- record (defined in lsst_reb.SequencerPkg).  Each field specifies the
  -- upper address byte addr[23:16] for a register block.  Instance selection
  -- uses addr[13:12] (sequencer instance or sensor index for override).
  -- The lower bits addr[9:0] provide the memory offset within each block.
  --
  -- Block          addr[23:16]  Index field     Offset field        Access
  -- -----------    -----------  --------------  ------------------  ------
  -- out_mem        x"10"        seq [13:12]     [7:0]  (0-255)     R/W
  -- time_mem       x"20"        seq [13:12]     [7:0]  (0-255)     R/W
  -- prog_mem       x"30"        seq [13:12]     [9:0]  (0-1023)    R/W
  -- step_cmd       x"31"        seq [13:12]     —                  W
  -- stop_cmd       x"32"        seq [13:12]     —                  W
  -- conv_shift     x"33"        seq [13:12]     bit 0: 0=en, 1=init R/W
  -- start_addr     x"34"        seq [13:12]     [4:0]              R/W
  -- ind_func       x"35"        seq [13:12]     [3:0]  (0-15)      R/W
  -- ind_rep        x"36"        seq [13:12]     [3:0]  (0-15)      R/W
  -- ind_sub_add    x"37"        seq [13:12]     [3:0]  (0-15)      R/W
  -- ind_sub_rep    x"38"        seq [13:12]     [3:0]  (0-15)      R/W
  -- error_stat     x"39"        seq [13:12]     bit 0: 0=rd, 1=rst R/W
  -- override       x"3A"        sensor [13:12]  —                  R/W
  --
  -- The cmd_interpreter routes any address with addr[23:16] in the range
  -- SEQ_ADDR_LOW..SEQ_ADDR_HIGH to the Sequencer via the handshake interface.
  ---------------------------------------------------------------------------
  constant SEQ_REG_MAP_C : SeqRegMapType := (
    out_mem     => x"10",
    time_mem    => x"20",
    prog_mem    => x"30",
    step_cmd    => x"31",
    stop_cmd    => x"32",
    conv_shift  => x"33",
    start_addr  => x"34",
    ind_func    => x"35",
    ind_rep     => x"36",
    ind_sub_add => x"37",
    ind_sub_rep => x"38",
    error_stat  => x"39",
    override    => x"3A"
  );

  -- Contiguous address range covering all sequencer registers.
  -- Used by the cmd_interpreter to route requests to the Sequencer block.
  constant SEQ_ADDR_LOW  : std_logic_vector(7 downto 0) := x"10";
  constant SEQ_ADDR_HIGH : std_logic_vector(7 downto 0) := x"3A";

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
  constant ccd_bias_err_vut_cmd       : std_logic_vector(23 downto 0) := x"40010F";

  constant ccd_1_gd_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401100";
  constant ccd_1_od_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401101";
  constant ccd_1_rd_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401104";
  constant ccd_2_gd_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401110";
  constant ccd_2_od_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401111";
  constant ccd_2_rd_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401114";
  constant ccd_3_gd_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401120";
  constant ccd_3_od_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401121";
  constant ccd_3_rd_thresh_read_cmd : std_logic_vector(23 downto 0) := x"401124";

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

  ---------- Jitter Cleaner
  constant jc_start_config_cmd : std_logic_vector(23 downto 0) := x"900010";

  -- DC/DC clock enable
  constant dcdc_clk_en_cmd : std_logic_vector(23 downto 0) := x"900000";

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

end package REB_v5_commands_package;

package body REB_v5_commands_package is

end package body REB_v5_commands_package;
