library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.std_logic_misc.all;
use IEEE.NUMERIC_STD.all;

library UNISIM;
use UNISIM.VComponents.all;

library surf;
use surf.StdRtlPkg.all;

library lsst_sci;
use lsst_sci.LsstSciPackage.all;

library lsst_reb;
use lsst_reb.basic_elements_pkg.all;
use lsst_reb.SequencerPkg.all;

library common;
use common.REB_v5_commands_package.all;
use common.REB_v5_pkg.all;

entity REB_v5_base is
  generic (
    BUILD_INFO_G : BuildInfoType;
    VERSION_G    : RebVersionType;
    CONFIG_G     : RebConfigType
  );
  port (
    ------ Clock signals ------
    -- PGP serdes clk
    PgpRefClk_P : in    std_logic;
    PgpRefClk_M : in    std_logic;

    ------ PGP signals ------
    PgpRx_P : in    std_logic_vector(1 downto 0);
    PgpRx_M : in    std_logic_vector(1 downto 0);
    PgpTx_P : out   std_logic_vector(1 downto 0);
    PgpTx_M : out   std_logic_vector(1 downto 0);

    ------ Aux 100MHz Clk ------
    aux_100mhz_clk_in : in    std_logic;

    -- CCD Signals --
    -- ADC
    adc_data_t_ccd : in    Slv8Array(NUM_SENSORS_C-1 downto 0);
    adc_data_b_ccd : in    Slv8Array(NUM_SENSORS_C-1 downto 0);
    adc_cnv_ccd    : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    adc_sck_ccd    : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);

    -- ASPIC signals
    ASPIC_r_up_ccd_p   : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_r_up_ccd_n   : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_r_down_ccd_p : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_r_down_ccd_n : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_clamp_ccd_p  : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_clamp_ccd_n  : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_reset_ccd_p  : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_reset_ccd_n  : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_nap_ccd      : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_pwdn_ccd     : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);

    -- ASPIC control signals
    ASPIC_miso_ccd      : in    std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_ss_t_ccd      : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_ss_b_ccd      : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_spi_reset_ccd : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_sclk_ccd      : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    ASPIC_mosi_ccd      : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);

    -- CCD Clocks signals
    par_clk_ccd_p    : out   Slv4Array(NUM_SENSORS_C-1 downto 0);
    par_clk_ccd_n    : out   Slv4Array(NUM_SENSORS_C-1 downto 0);
    ser_clk_ccd_p    : out   Slv3Array(NUM_SENSORS_C-1 downto 0);
    ser_clk_ccd_n    : out   Slv3Array(NUM_SENSORS_C-1 downto 0);
    reset_gate_ccd_p : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    reset_gate_ccd_n : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);

    -- CCD BIAS DAC
    ldac_C_BIAS_ccd : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    din_C_BIAS_ccd  : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    sync_C_BIAS_ccd : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    sclk_C_BIAS_ccd : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);

    -- V & I sensors
    LTC2945_SCL : inout std_logic;
    LTC2945_SDA : inout std_logic;

    LTC2945n15_SCL : inout std_logic;
    LTC2945n15_SDA : inout std_logic;

    ------- Temperature ------
    -- DREB PCB temperature
    sda_temp0 : inout std_logic;
    scl_temp0 : inout std_logic;

    -- REB PCB temperature
    sda_temp1 : inout std_logic;
    scl_temp1 : inout std_logic;
    sda_temp2 : inout std_logic;
    scl_temp2 : inout std_logic;

    -- CCD temperatures
    csb_24ADC  : out   std_logic;
    sclk_24ADC : out   std_logic;
    din_24ADC  : out   std_logic;
    dout_24ADC : in    std_logic;

    ------ bias and Temp ADC ------
    bias_t_adc_miso         : in    std_logic;
    bias_t_adc_cs           : out   std_logic;
    bias_t_adc_sclk         : out   std_logic;
    bias_t_adc_mosi         : out   std_logic;
    bias_t_adc_sam_mux_en   : out   std_logic;
    bias_t_adc_bias_mux_en  : out   std_logic;
    bias_t_adc_sam_mux_sel  : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    bias_t_adc_bias_mux_sel : out   std_logic_vector(NUM_SENSORS_C-1 downto 0);
    bias_t_adc_shdn         : out   std_logic;

    ------ DACs ------
    -- CCD clock rails DAC
    ldac_RAILS      : out   std_logic;
    din_RAILS       : out   std_logic;
    sclk_RAILS      : out   std_logic;
    sync_RAILS_dac0 : out   std_logic;
    sync_RAILS_dac1 : out   std_logic;

    -- CCD heaters
    ldac_HTR : out   std_logic;
    din_HTR  : out   std_logic;
    sync_HTR : out   std_logic;
    sclk_HTR : out   std_logic;

    -- backbias sw
    backbias_clamp : out   std_logic;
    backbias_ssbe  : out   std_logic;

    ------ Jitter Cleaner ------
    jc_refclk_out_p : out   std_logic;
    jc_refclk_out_n : out   std_logic;
    jc_refclk_in_p  : in    std_logic;
    jc_refclk_in_n  : in    std_logic;

    jc_miso : in    std_logic;
    jc_mosi : out   std_logic;
    jc_sclk : out   std_logic;
    jc_cs   : out   std_logic;

    jc_los0 : in    std_logic;
    jc_lol  : in    std_logic;
    jc_reset : out   std_logic;

    ------ Remote Update ------
    ru_outSpiCsB   : out   std_logic;
    ru_outSpiMosi  : out   std_logic;
    ru_inSpiMiso   : in    std_logic;
    ru_outSpiWpB   : out   std_logic;
    ru_outSpiHoldB : out   std_logic;

    ------ MISC ------
    r_add          : in    std_logic_vector(7 downto 0);
    TEST           : out   std_logic_vector(12 downto 0);
    gpio_p         : out   std_logic;
    gpio_n         : out   std_logic;
    TEST_LED       : out   std_logic_vector(5 downto 0);
    Pwron_Rst_L    : in    std_logic;
    CCD_OPAMP_PD   : out   std_logic;
    PWR_SYNC1      : out   std_logic;
    reb_sn_onewire : inout std_logic
  );
end entity REB_v5_base;

architecture Behavioral of REB_v5_base is

  -- Config
  constant cfg : RebConfigType := CONFIG_G;

  -- Clocks
  signal pgpRefClk       : std_logic;
  signal stable_clk      : std_logic;
  signal stable_reset    : std_logic;
  signal stable_clk_lock : std_logic;
  signal usrClk          : std_logic;
  signal sys_clk_local   : std_logic;
  signal sys_clk         : std_logic;
  signal multiboot_clk   : std_logic;
  signal aux_100mhz_clk  : std_logic;

  -- Reset
  signal n_rst            : std_logic;
  signal usrRst           : std_logic;
  signal sys_rst          : std_logic;
  signal first_reset_done : std_logic;
  signal first_reset      : std_logic;
  signal prev_sys_rst     : std_logic;

  -- SCI signals
  signal pgpLocLinkReady : std_logic;
  signal pgpRemLinkReady : std_logic;
  signal regReq          : std_logic;
  signal regOp           : std_logic;
  signal RegAddr         : std_logic_vector(23 downto 0);
  signal RegDataWr       : std_logic_vector(31 downto 0);
  signal regAck          : std_logic;
  signal regFail         : std_logic;
  signal RegDataRd       : std_logic_vector(31 downto 0);
  signal RegWrEn         : std_logic_vector(31 downto 0);
  signal SCI_DataIn      : LsstSciImageDataArray(2 downto 0) := (others => LSST_SCI_IMAGE_DATA_IN_INIT_C);

  signal StatusAddr : std_logic_vector(23 downto 0);
  signal StatusReg  : std_logic_vector(31 downto 0);
  signal StatusRst  : std_logic;

  -- CMD interpreter signals
  signal regDataWr_masked   : std_logic_vector(31 downto 0);
  signal busy_bus           : std_logic_vector(31 downto 0);
  signal trigger_ce_bus     : std_logic_vector(31 downto 0);
  signal trigger_val_bus    : std_logic_vector(31 downto 0);
  signal load_time_base_lsw : std_logic;
  signal load_time_base_MSW : std_logic;
  signal cnt_preset         : std_logic_vector(63 downto 0);

  -- sync commands signals
  signal sync_cmd_en         : std_logic;
  signal sync_cmd_in         : std_logic_vector(7 downto 0);
  signal sync_cmd_start_seq  : std_logic;
  signal sync_cmd_step_seq   : std_logic;
  signal sync_cmd_stop_seq   : std_logic;
  signal sync_cmd_main_add   : std_logic_vector(4 downto 0);
  signal sync_cmd_delay_en   : std_logic;
  signal sync_cmd_delay_read : std_logic_vector(7 downto 0);

  -- iterrupt signals
  signal interrupt_bus_in  : std_logic_vector(31 downto 0);
  signal mask_bus_in_en    : std_logic;
  signal mask_bus_out      : std_logic_vector(31 downto 0);
  signal interrupt_en_out  : std_logic;
  signal interrupt_bus_out : std_logic_vector(31 downto 0);
  signal interrupt_edge_en : std_logic_vector(31 downto 0);
  signal fe_reset_notice   : std_logic;

  -- BRS signals
  signal time_base_actual_value : std_logic_vector(63 downto 0);
  signal trig_tm_value_SB       : std_logic_vector(63 downto 0);
  signal trig_tm_value_TB       : std_logic_vector(63 downto 0);
  signal trig_tm_value_seq      : std_logic_vector(63 downto 0);
  signal trig_tm_value_V_I      : std_logic_vector(63 downto 0);
  signal trig_tm_value_pcb_t    : std_logic_vector(63 downto 0);
  signal time_base_busy         : std_logic;

  -- sequencer signals
  signal seq_start                : std_logic;
  signal sequencer_busy           : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_time_mem_readbk      : Slv16Array(cfg.numSequencers-1 downto 0);
  signal seq_out_mem_readbk       : Slv32Array(cfg.numSequencers-1 downto 0);
  signal seq_prog_mem_readbk      : Slv32Array(cfg.numSequencers-1 downto 0);
  signal seq_time_mem_w_en        : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_out_mem_w_en         : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_prog_mem_w_en        : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_step_cmd             : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_stop_cmd             : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal enable_conv_shift        : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal enable_conv_shift_out    : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal init_conv_shift          : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal end_sequence             : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal start_add_prog_mem_en    : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal start_add_prog_mem_rbk   : Slv10Array(cfg.numSequencers-1 downto 0);
  signal seq_ind_func_mem_we      : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_ind_func_mem_rdbk    : Slv4Array(cfg.numSequencers-1 downto 0);
  signal seq_ind_rep_mem_we       : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_ind_rep_mem_rdbk     : Slv24Array(cfg.numSequencers-1 downto 0);
  signal seq_ind_sub_add_mem_we   : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_ind_sub_add_mem_rdbk : Slv10Array(cfg.numSequencers-1 downto 0);
  signal seq_ind_sub_rep_mem_we   : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_ind_sub_rep_mem_rdbk : Slv16Array(cfg.numSequencers-1 downto 0);
  signal seq_op_code_error        : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_op_code_error_reset  : std_logic_vector(cfg.numSequencers-1 downto 0);
  signal seq_op_code_error_add    : Slv10Array(cfg.numSequencers-1 downto 0);

  signal sequencer_outputs : SequencerOutputArray(NUM_SENSORS_C-1 downto 0);
  signal seq_override_we   : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal seq_override_rd   : Slv32Array(NUM_SENSORS_C-1 downto 0);

  -- Image handler signals
  signal image_pattern_read : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal image_pattern_en  : std_logic;
  signal ADC_trigger       : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal pattern_reset     : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal adc_data_int      : SlV16Array(NUM_SENSORS_C-1 downto 0);
  signal adc_cnv_int       : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal adc_sck_int       : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal ccd_oe_en         : std_logic;
  signal ccd_oe            : std_logic_vector(NUM_SENSORS_C-1 downto 0);

  -- ASPIC config signals
  signal aspic_start_trans    : std_logic;
  signal aspic_start_reset    : std_logic;
  signal aspic_busy           : std_logic;
  signal aspic_config_r_ccd   : Slv16Array(NUM_SENSORS_C-1 downto 0);
  signal ASPIC_spi_reset_int  : std_logic;
  signal ASPIC_sclk_int       : std_logic;
  signal ASPIC_mosi_int       : std_logic;

  -- CCD bias DAC
  signal bias_dac_cmd_err     : Slv3Array(NUM_SENSORS_C-1 downto 0);
  signal bias_v_undr_th       : Slv3Array(NUM_SENSORS_C-1 downto 0);
  signal bias_load_start_ccd  : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal bias_ldac_start_ccd  : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal all_bias_dac_cmd_err : std_logic_vector(8 downto 0);
  signal all_bias_v_undr_th   : std_logic_vector(8 downto 0);

  signal bias_gd_thresh_ccd : Slv12Array(NUM_SENSORS_C-1 downto 0);
  signal bias_od_thresh_ccd : Slv12Array(NUM_SENSORS_C-1 downto 0);
  signal bias_rd_thresh_ccd : Slv12Array(NUM_SENSORS_C-1 downto 0);

  -- CCD clock rails DAC
  signal clk_rail_load_start : std_logic;
  signal clk_rail_ldac_start : std_logic;

  -- Heaters DAC
  signal htr_load_start : std_logic;
  signal htr_ldac_start : std_logic;

  -- CCD signals
  signal par_clk_ccd    : Slv4Array(NUM_SENSORS_C-1 downto 0);
  signal ser_clk_ccd    : Slv3Array(NUM_SENSORS_C-1 downto 0);
  signal reset_gate_ccd : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  --signal adc_data_ccd   : Slv16Array(NUM_SENSORS_C-1 downto 0);

  -- ASPIC CCD
  signal ASPIC_r_up_ccd   : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal ASPIC_r_down_ccd : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal ASPIC_clamp_ccd  : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal ASPIC_reset_ccd  : std_logic_vector(NUM_SENSORS_C-1 downto 0);

  -- ltc2945 V & I sensors read
  signal V_I_read_start     : std_logic;
  signal V_I_busy           : std_logic;
  signal V_I_n15_busy       : std_logic;
  signal V_I_busy_or        : std_logic;
  signal v6_voltage         : std_logic_vector(15 downto 0);
  signal v6_voltage_error   : std_logic;
  signal v6_current         : std_logic_vector(15 downto 0);
  signal v6_current_error   : std_logic;
  signal v9_voltage         : std_logic_vector(15 downto 0);
  signal v9_voltage_error   : std_logic;
  signal v9_current         : std_logic_vector(15 downto 0);
  signal v9_current_error   : std_logic;
  signal v24_voltage        : std_logic_vector(15 downto 0);
  signal v24_voltage_error  : std_logic;
  signal v24_current        : std_logic_vector(15 downto 0);
  signal v24_current_error  : std_logic;
  signal v40_voltage        : std_logic_vector(15 downto 0);
  signal v40_voltage_error  : std_logic;
  signal v40_current        : std_logic_vector(15 downto 0);
  signal v40_current_error  : std_logic;
  signal vn15_voltage       : std_logic_vector(15 downto 0);
  signal vn15_voltage_error : std_logic;
  signal vn15_current       : std_logic_vector(15 downto 0);
  signal vn15_current_error : std_logic;

  -- PCB temperature
  signal temp_read_start : std_logic;
  signal temp_busy       : std_logic;

  -- DREB temperature
  signal DREB_temp_busy : std_logic;
  signal T1_dreb        : std_logic_vector(15 downto 0);
  signal T1_dreb_error  : std_logic;
  signal T2_dreb        : std_logic_vector(15 downto 0);
  signal T2_dreb_error  : std_logic;

  -- REB temperature gr1
  signal REB_temp_busy_gr1 : std_logic;
  signal T1_reb_gr1        : std_logic_vector(15 downto 0);
  signal T1_reb_gr1_error  : std_logic;
  signal T2_reb_gr1        : std_logic_vector(15 downto 0);
  signal T2_reb_gr1_error  : std_logic;
  signal T3_reb_gr1        : std_logic_vector(15 downto 0);
  signal T3_reb_gr1_error  : std_logic;
  signal T4_reb_gr1        : std_logic_vector(15 downto 0);
  signal T4_reb_gr1_error  : std_logic;

  -- REB temperature gr2
  signal REB_temp_busy_gr2 : std_logic;
  signal T1_reb_gr2        : std_logic_vector(15 downto 0);
  signal T1_reb_gr2_error  : std_logic;
  signal T2_reb_gr2        : std_logic_vector(15 downto 0);
  signal T2_reb_gr2_error  : std_logic;
  signal T3_reb_gr2        : std_logic_vector(15 downto 0);
  signal T3_reb_gr2_error  : std_logic;
  signal T4_reb_gr2        : std_logic_vector(15 downto 0);
  signal T4_reb_gr2_error  : std_logic;

  -- Bias and Temp ADC
  signal start_multiread  : std_logic;
  signal start_singleread : std_logic;
  signal start_regread    : std_logic;
  signal bias_t_adc_busy  : std_logic;
  signal bias_t_adc_d_out : array716;

  -- CCD temperature
  signal ccd_temp_busy        : std_logic;
  signal ccd_temp             : std_logic_vector(23 downto 0);
  signal ccd_temp_start       : std_logic;
  signal ccd_temp_start_reset : std_logic;

  ------ MISC ------
  -- test led
  signal test_led_int : std_logic_vector(5 downto 0);
  signal dcm_locked   : std_logic;

  -- back bias switch signals
  signal en_back_bias_sw               : std_logic;
  signal back_bias_sw_protected        : std_logic;
  signal back_bias_sw_protected_int    : std_logic;
  signal back_bias_clamp_protected_int : std_logic;
  signal back_bias_sw_error            : std_logic;
  signal back_bias_sw_error_int        : std_logic;

  -- test port
  signal test_port : std_logic_vector(12 downto 0);
  signal gpio_int  : std_logic;

  signal reb_onewire_reset : std_logic;
  signal sn_start_dcm_int  : std_logic;
  signal sn_start_dcm      : std_logic;
  signal sn_start          : std_logic;
  signal reb_sn_crc_ok     : std_logic;
  signal reb_sn_dev_error  : std_logic;
  signal sn_error_bus      : std_logic_vector(1 downto 0);
  signal reb_sn            : std_logic_vector(47 downto 0);
  signal reb_sn_long       : std_logic_vector(63 downto 0);

  -- Jitter Cleaner
  signal jc_start_config  : std_logic;
  signal jc_config_busy   : std_logic;
  signal jc_config_done   : std_logic;
  signal jc_clk_ready     : std_logic;
  signal jc_clk_in_en     : std_logic;
  signal not_jc_clk_ready : std_logic;
  signal jc_status_bus    : std_logic_vector(5 downto 0);

  signal jc_refclk_out : std_logic;
  signal jc_refclk_in  : std_logic;

  -- dc_dc converter sync
  signal dcdc_clk_en_out : std_logic;
  signal dcdc_clk_en     : std_logic;

  -- multiboot
  signal start_multiboot : std_logic;

  -- bitstream Remote Update
  signal ru_start               : std_logic;
  signal ru_transfer_done       : std_logic;
  signal ru_image_ID_we         : std_logic;
  signal ru_bitstream_we        : std_logic;
  signal ru_bitstream_fifo_full : std_logic;
  signal ru_busy                : std_logic;
  signal ru_satatus_reg         : std_logic_vector(15 downto 0);
  signal ru_reboot_status       : std_logic_vector(31 downto 0);

  signal ASPIC_ss_t_ccd_int : std_logic_vector(NUM_SENSORS_C-1 downto 0);
  signal ASPIC_ss_b_ccd_int : std_logic_vector(NUM_SENSORS_C-1 downto 0);

  signal bias_t_adc_mosi_int : std_logic;
  signal bias_t_adc_cs_int   : std_logic;
  signal bias_t_adc_sclk_int : std_logic;
  signal bias_t_adc_shdn_int : std_logic;

  constant TPD_C : time := 1 ns;

begin

  assert (cfg.numSequencers = 1 or (cfg.numSequencers = NUM_SENSORS_C))
    report "The number of sequencers must be 1 or equal to the number of sensors."
    severity failure;

  regDataWr_masked         <= regDataWr and regWrEn;
  StatusAddr(23 downto 10) <= (others => '0');
  StatusAddr(9 downto 0)   <= regAddr(9 downto 0);
  test_led_int(0)          <= pgpLocLinkReady;
  test_led_int(1)          <= pgpRemLinkReady;
  test_led_int(5)          <= dcm_locked;

  -- trigger signals
  seq_start       <= (trigger_val_bus(2) and trigger_ce_bus(2)) or sync_cmd_start_seq;
  V_I_read_start  <= (trigger_val_bus(3) and trigger_ce_bus(3));
  temp_read_start <= (trigger_val_bus(4) and trigger_ce_bus(4));

  -- Voltage and current sensors busy
  V_I_busy_or <= V_I_n15_busy or V_I_busy;

  -- temperature signals
  temp_busy <= DREB_temp_busy or REB_temp_busy_gr1 or REB_temp_busy_gr2;

  -- interrupt signals
  interrupt_edge_en <= "00" & x"000" & "001" & "11101" & "11101" & "11101";

  single_sequencer : if cfg.numSequencers = 1 generate
    interrupt_bus_in <= "00" & x"000" & temp_busy & V_I_busy & fe_reset_notice &
                        "00000" &
                        "00000" &
                        sequencer_outputs(0).user_bit & SCI_DataIn(0).eot & SCI_DataIn(0).sot & sequencer_busy(0) & sequencer_busy(0);
    busy_bus         <= x"000000" & "00" & sequencer_busy & temp_busy & V_I_busy_or & uOr(sequencer_busy) & time_base_busy & '0';

  end generate single_sequencer;

  multi_sequencer : if cfg.numSequencers = 3 generate
    interrupt_bus_in <= "00" & x"000" & temp_busy & V_I_busy & fe_reset_notice &
                        sequencer_outputs(2).user_bit & SCI_DataIn(2).eot & SCI_DataIn(2).sot & sequencer_busy(2) & sequencer_busy(2) &
                        sequencer_outputs(1).user_bit & SCI_DataIn(1).eot & SCI_DataIn(1).sot & sequencer_busy(1) & sequencer_busy(1) &
                        sequencer_outputs(0).user_bit & SCI_DataIn(0).eot & SCI_DataIn(0).sot & sequencer_busy(0) & sequencer_busy(0);

    busy_bus         <= x"000000" & sequencer_busy & temp_busy & V_I_busy_or & uOr(sequencer_busy) & time_base_busy & '0';
  end generate multi_sequencer;

  ------------ Sensor signals assignment ------------
  sequencer_connection : for s in 0 to NUM_SENSORS_C-1 generate

    ASPIC_r_up_ccd(s)   <= sequencer_outputs(s).aspic_r_up;
    ASPIC_r_down_ccd(s) <= sequencer_outputs(s).aspic_r_down;
    ASPIC_reset_ccd(s)  <= sequencer_outputs(s).aspic_reset;
    ASPIC_clamp_ccd(s)  <= sequencer_outputs(s).aspic_clamp;
    ser_clk_ccd(s)      <= sequencer_outputs(s).ser_clk;
    reset_gate_ccd(s)   <= sequencer_outputs(s).reset_gate;
    par_clk_ccd(s)      <= sequencer_outputs(s).par_clk;
    ADC_trigger(s)      <= sequencer_outputs(s).adc_trigger;
    pattern_reset(s)    <= sequencer_outputs(s).pattern_reset;

    ASPIC_nap_ccd(s)       <= '0'; -- ASPIC2 nap mode active low
    ASPIC_pwdn_ccd(s)      <= '1'; -- 1 => enabled
    ASPIC_sclk_ccd(s)      <= ASPIC_sclk_int;
    ASPIC_mosi_ccd(s)      <= ASPIC_mosi_int;
    ASPIC_spi_reset_ccd(s) <= ASPIC_spi_reset_int;

    adc_cnv_ccd(s)  <= adc_cnv_int(s);
    adc_sck_ccd(s)  <= adc_sck_int(s);
    adc_data_int(s) <= adc_data_t_ccd(s) & adc_data_b_ccd(s);

  end generate sequencer_connection;

  ------------ assignment for test ------------
  test_port(11) <= sequencer_outputs(0).adc_trigger;
  test_port(12) <= sequencer_outputs(0).pattern_reset;
  test_port(0)  <= sync_cmd_en;
  test_port(1)  <= sync_cmd_start_seq;

  gpio_int <= sequencer_outputs(0).pattern_reset;

  -- Power down CCD ADC opamp (active low)
  CCD_OPAMP_PD    <= '1';

  ASPIC_ss_t_ccd  <= ASPIC_ss_t_ccd_int;
  ASPIC_ss_b_ccd  <= ASPIC_ss_b_ccd_int;

  bias_t_adc_mosi <= bias_t_adc_mosi_int;
  bias_t_adc_cs   <= bias_t_adc_cs_int;
  bias_t_adc_sclk <= bias_t_adc_sclk_int;
  bias_t_adc_shdn <= bias_t_adc_shdn_int;

  U_LocRefClkIbufds : component IBUFDS_GTE2
    port map (
      I     => PgpRefClk_P,
      IB    => PgpRefClk_M,
      CEB   => '0',
      O     => PgpRefClk,
      ODIV2 => open
    );

  ClockManager_stable_clk : entity surf.ClockManager7
    generic map (
      TPD_G              => TPD_C,
      TYPE_G             => "MMCM",
      INPUT_BUFG_G       => true,
      FB_BUFG_G          => true,
      OUTPUT_BUFG_G      => true,
      RST_IN_POLARITY_G  => '1',
      NUM_CLOCKS_G       => 1,
      BANDWIDTH_G        => "OPTIMIZED",
      CLKIN_PERIOD_G     => 4.0,
      DIVCLK_DIVIDE_G    => 1,
      CLKFBOUT_MULT_F_G  => 4.000,
      CLKOUT0_DIVIDE_F_G => 10.000,
      CLKOUT0_RST_HOLD_G => 8
    )
    port map (
      clkIn     => PgpRefClk,
      rstIn     => '0',
      clkOut(0) => stable_clk,
      locked    => stable_clk_lock,
      rstOut    => open
    );

  LsstSci_0 : entity lsst_sci.LsstSci
    generic map (
      BUILD_INFO_G => BUILD_INFO_G
    )
    port map (
      --------------------------------------------------------------------------
      -- FPGA Interface
      --------------------------------------------------------------------------
      StableClk => stable_clk,
      StableRst => '0',
      FpgaRstL  => n_rst,
      PgpRefClk => PgpRefClk,
      PgpRxP    => PgpRx_P,
      PgpRxM    => PgpRx_M,
      PgpTxP    => PgpTx_P,
      PgpTxM    => PgpTx_M,
      --------------------------------------------------------------------------
      -- Clock/Reset Generator Interface
      --------------------------------------------------------------------------
      ClkOut => usrClk,
      RstOut => usrRst,
      ClkIn  => sys_clk,
      RstIn  => sys_rst,
      --------------------------------------------------------------------------
      -- SCI Register Encoder/Decoder Interface
      --------------------------------------------------------------------------
      RegAddr   => RegAddr,
      RegReq    => regReq,
      RegOp     => regOp,
      RegDataWr => RegDataWr,
      RegWrEn   => RegWrEn,
      RegAck    => regAck,
      RegFail   => regFail,
      RegDataRd => RegDataRd,
      --------------------------------------------------------------------------
      -- Data Encoder Interface
      --------------------------------------------------------------------------
      DataIn => SCI_DataIn,
      --------------------------------------------------------------------------
      -- Notification Interface
      --------------------------------------------------------------------------
      NoticeEn             => interrupt_en_out,
      Notice(59 downto 39) => (others => '0'),
      Notice(38 downto 36) => interrupt_bus_out(17 downto 15),
      Notice(35 downto 29) => (others => '0'),
      Notice(28 downto 24) => interrupt_bus_out(14 downto 10),
      Notice(23 downto 17) => (others => '0'),
      Notice(16 downto 12) => interrupt_bus_out(9 downto 5),
      Notice(11 downto 5)  => (others => '0'),
      Notice(4 downto 0)   => interrupt_bus_out(4 downto 0),
      --------------------------------------------------------------------------
      -- Synchronous Command Interface
      --------------------------------------------------------------------------
      SyncCmdEn => sync_cmd_en,
      SyncCmd   => sync_cmd_in,
      --------------------------------------------------------------------------
      -- Status Block Interface
      --------------------------------------------------------------------------
      StatusAddr => StatusAddr,
      StatusReg  => StatusReg,
      StatusRst  => StatusRst,
      --------------------------------------------------------------------------
      -- Debug Interface
      --------------------------------------------------------------------------
      PgpLocLinkReadyOut => pgpLocLinkReady,
      PgpRemLinkReadyOut => pgpRemLinkReady,
      PgpRxPhyReadyOut   => open,
      PgpTxPhyReadyOut   => open
    );

  cmd_interpreter_0 : entity common.REB_v5_cmd_interpreter
    generic map(
      VERSION_G => VERSION_G,
      NUM_SEQUENCERS_G => cfg.numSequencers
    )
    port map (
      reset => sys_rst,
      clk   => sys_clk,
      -- signals from/to SCI
      regReq           => regReq,
      regOp            => regOp,
      regAddr          => regAddr,
      statusReg        => statusReg,
      regWrEn          => RegWrEn,
      regDataWr_masked => regDataWr_masked,
      regAck           => regAck,
      regFail          => regFail,
      regDataRd        => regDataRd,
      StatusReset      => statusRst,
      -- Base Register Set signals
      busy_bus               => busy_bus,
      time_base_actual_value => time_base_actual_value,
      trig_tm_value_SB       => trig_tm_value_SB,
      trig_tm_value_TB       => trig_tm_value_TB,
      trig_tm_value_seq      => trig_tm_value_seq,
      trig_tm_value_V_I      => trig_tm_value_V_I,
      trig_tm_value_pcb_t    => trig_tm_value_pcb_t,
      trigger_ce_bus         => trigger_ce_bus,
      trigger_val_bus        => trigger_val_bus,
      load_time_base_lsw     => load_time_base_lsw,
      load_time_base_MSW     => load_time_base_MSW,
      cnt_preset             => cnt_preset,
      Mgt_avcc_ok            => '0',
      Mgt_accpll_ok          => '0',
      Mgt_avtt_ok            => '0',
      V3_3v_ok               => '0',
      Switch_addr            => r_add,
      -- sync commands
      sync_cmd_delay_en   => sync_cmd_delay_en,
      sync_cmd_delay_read => sync_cmd_delay_read,
      -- interrupt commands
      interrupt_mask_wr_en => mask_bus_in_en,
      interrupt_mask_read  => mask_bus_out,
      -- Image parameters
      image_size         => x"00000000",
      image_pattern_read => image_pattern_read,
      ccd_sel_read       => "111",
      ccd_oe_en          => ccd_oe_en,
      ccd_oe_read        => ccd_oe,
      image_size_en      => open,
      image_pattern_en   => image_pattern_en,
      ccd_sel_en         => open,
      -- Sequencer
      seq_override_wr          => seq_override_we,
      seq_override_rd          => seq_override_rd,
      seq_time_mem_readbk      => seq_time_mem_readbk,
      seq_out_mem_readbk       => seq_out_mem_readbk,
      seq_prog_mem_readbk      => seq_prog_mem_readbk,
      seq_time_mem_w_en        => seq_time_mem_w_en,
      seq_out_mem_w_en         => seq_out_mem_w_en,
      seq_prog_mem_w_en        => seq_prog_mem_w_en,
      seq_step                 => seq_step_cmd,
      seq_stop                 => seq_stop_cmd,
      enable_conv_shift_in     => enable_conv_shift_out,
      enable_conv_shift        => enable_conv_shift,
      init_conv_shift          => init_conv_shift,
      start_add_prog_mem_en    => start_add_prog_mem_en,
      start_add_prog_mem_rbk   => start_add_prog_mem_rbk,
      seq_ind_func_mem_we      => seq_ind_func_mem_we,
      seq_ind_func_mem_rdbk    => seq_ind_func_mem_rdbk,
      seq_ind_rep_mem_we       => seq_ind_rep_mem_we,
      seq_ind_rep_mem_rdbk     => seq_ind_rep_mem_rdbk,
      seq_ind_sub_add_mem_we   => seq_ind_sub_add_mem_we,
      seq_ind_sub_add_mem_rdbk => seq_ind_sub_add_mem_rdbk,
      seq_ind_sub_rep_mem_we   => seq_ind_sub_rep_mem_we,
      seq_ind_sub_rep_mem_rdbk => seq_ind_sub_rep_mem_rdbk,
      seq_op_code_error        => seq_op_code_error,
      seq_op_code_error_add    => seq_op_code_error_add,
      seq_op_code_error_reset  => seq_op_code_error_reset,
      -- ASPIC
      aspic_config_r_ccd_1 => aspic_config_r_ccd(0),
      aspic_config_r_ccd_2 => aspic_config_r_ccd(1),
      aspic_config_r_ccd_3 => aspic_config_r_ccd(2),
      aspic_op_end         => aspic_busy,
      aspic_start_trans    => aspic_start_trans,
      aspic_start_reset    => aspic_start_reset,
      -- CCD bias DAC
      bias_dac_cmd_err      => all_bias_dac_cmd_err,
      bias_v_undr_th        => all_bias_v_undr_th,
      ccd_1_bias_load_start => bias_load_start_ccd(0),
      ccd_1_bias_ldac_start => bias_ldac_start_ccd(0),
      ccd_2_bias_load_start => bias_load_start_ccd(1),
      ccd_2_bias_ldac_start => bias_ldac_start_ccd(1),
      ccd_3_bias_load_start => bias_load_start_ccd(2),
      ccd_3_bias_ldac_start => bias_ldac_start_ccd(2),
      ccd_1_bias_gd_thresh  => bias_gd_thresh_ccd(0),
      ccd_1_bias_od_thresh  => bias_od_thresh_ccd(0),
      ccd_1_bias_rd_thresh  => bias_rd_thresh_ccd(0),
      ccd_2_bias_gd_thresh  => bias_gd_thresh_ccd(1),
      ccd_2_bias_od_thresh  => bias_od_thresh_ccd(1),
      ccd_2_bias_rd_thresh  => bias_rd_thresh_ccd(1),
      ccd_3_bias_gd_thresh  => bias_gd_thresh_ccd(2),
      ccd_3_bias_od_thresh  => bias_od_thresh_ccd(2),
      ccd_3_bias_rd_thresh  => bias_rd_thresh_ccd(2),
      -- CCD clock rails DAC
      clk_rail_load_start => clk_rail_load_start,
      clk_rail_ldac_start => clk_rail_ldac_start,
      -- Heater DAC
      htr_load_start => htr_load_start,
      htr_ldac_start => htr_ldac_start,
      -- DREB voltage and current sensors
      v6_voltage         => v6_voltage,
      v6_voltage_error   => v6_voltage_error,
      v6_current         => v6_current,
      v6_current_error   => v6_current_error,
      v9_voltage         => v9_voltage,
      v9_voltage_error   => v9_voltage_error,
      v9_current         => v9_current,
      v9_current_error   => v9_current_error,
      v24_voltage        => v24_voltage,
      v24_voltage_error  => v24_voltage_error,
      v24_current        => v24_current,
      v24_current_error  => v24_current_error,
      v40_voltage        => v40_voltage,
      v40_voltage_error  => v40_voltage_error,
      v40_current        => v40_current,
      v40_current_error  => v40_current_error,
      vn15_voltage       => vn15_voltage,
      vn15_voltage_error => vn15_voltage_error,
      vn15_current       => vn15_current,
      vn15_current_error => vn15_current_error,
      -- DREB temperature
      T1_dreb       => T1_dreb,
      T1_dreb_error => T1_dreb_error,
      T2_dreb       => T2_dreb,
      T2_dreb_error => T2_dreb_error,
      -- REB temperature gr1
      T1_reb_gr1       => T1_reb_gr1,
      T1_reb_gr1_error => T1_reb_gr1_error,
      T2_reb_gr1       => T2_reb_gr1,
      T2_reb_gr1_error => T2_reb_gr1_error,
      T3_reb_gr1       => T3_reb_gr1,
      T3_reb_gr1_error => T3_reb_gr1_error,
      T4_reb_gr1       => T4_reb_gr1,
      T4_reb_gr1_error => T4_reb_gr1_error,
      -- REB temperature gr2
      T1_reb_gr2       => T1_reb_gr2,
      T1_reb_gr2_error => T1_reb_gr2_error,
      T2_reb_gr2       => T2_reb_gr2,
      T2_reb_gr2_error => T2_reb_gr2_error,
      T3_reb_gr2       => T3_reb_gr2,
      T3_reb_gr2_error => T3_reb_gr2_error,
      T4_reb_gr2       => T4_reb_gr2,
      T4_reb_gr2_error => T4_reb_gr2_error,
      -- bias and temp ADC
      bias_t_adc_busy    => bias_t_adc_busy,
      bias_t_adc_data    => bias_t_adc_d_out,
      bias_t_adc_start_t => start_multiread,
      bias_t_adc_start_b => start_singleread,
      bias_t_adc_start_r => start_regread,
      -- CCD temperature
      ccd_temp_busy        => ccd_temp_busy,
      ccd_temp             => ccd_temp,
      ccd_temp_start       => ccd_temp_start,
      ccd_temp_start_reset => ccd_temp_start_reset,
      -- REB 1wire serial number
      reb_onewire_reset => reb_onewire_reset,
      reb_sn_crc_ok     => reb_sn_crc_ok,
      reb_sn_dev_error  => reb_sn_dev_error,
      reb_sn            => reb_sn,
      reb_sn_timeout    => '0',
      -- back bias switch
      back_bias_sw_rb    => back_bias_sw_protected_int,
      back_bias_cl_rb    => back_bias_clamp_protected_int,
      back_bias_sw_error => back_bias_sw_error_int,
      en_back_bias_sw    => en_back_bias_sw,
      -- Jitter Cleaner
      jc_status_bus   => jc_status_bus,
      jc_start_config => jc_start_config,
      -- multiboot
      remote_update_reboot_status => ru_reboot_status,
      start_multiboot             => start_multiboot,
      -- remote update
      remote_update_fifo_full  => ru_bitstream_fifo_full,
      remote_update_status_reg => ru_satatus_reg,
      start_remote_update      => ru_start,
      remote_update_bitstrm_we => ru_bitstream_we,
      remote_update_daq_done   => ru_transfer_done,
      -- DC/DC clock enable
      dcdc_clk_en_in => dcdc_clk_en_out,
      dcdc_clk_en    => dcdc_clk_en
    );

  base_reg_set_top_0 : entity lsst_reb.base_reg_set_top
    port map (
      clk                => sys_clk,
      reset              => sys_rst,
      en_time_base_cnt   => trigger_ce_bus(1),
      load_time_base_lsw => load_time_base_lsw,
      load_time_base_MSW => load_time_base_MSW,
      StatusReset        => statusRst,
      trigger_TB         => trigger_val_bus(1),
      trigger_seq        => seq_start,
      trigger_V_I_read   => V_I_read_start,
      trigger_temp_pcb   => temp_read_start,
      trigger_fast_adc   => '0',
      cnt_preset         => cnt_preset,
      cnt_busy           => time_base_busy,
      cnt_actual_value   => time_base_actual_value,
      trig_tm_value_SB   => trig_tm_value_SB,
      trig_tm_value_TB   => trig_tm_value_TB,
      trig_tm_value_seq  => trig_tm_value_seq,
      trig_tm_value_V_I  => trig_tm_value_V_I,
      trig_tm_value_pcb  => trig_tm_value_pcb_t
    );

  sync_cmd_decoder_top_1 : entity lsst_reb.sync_cmd_decoder_top
    port map (
      pgp_clk            => usrClk,
      pgp_reset          => usrRst,
      clk                => sys_clk,
      reset              => sys_rst,
      sync_cmd_en        => sync_cmd_en,
      delay_en           => sync_cmd_delay_en,
      delay_in           => regDataWr_masked(7 downto 0),
      delay_read         => sync_cmd_delay_read,
      sync_cmd           => sync_cmd_in,
      sync_cmd_start_seq => sync_cmd_start_seq,
      sync_cmd_step_seq  => sync_cmd_step_seq,
      sync_cmd_stop_seq  => sync_cmd_stop_seq,
      sync_cmd_main_add  => sync_cmd_main_add
    );

  REB_interrupt_top_1 : entity lsst_reb.REB_interrupt_top
    generic map (
      interrupt_bus_width => 32
    )
    port map (
      clk               => sys_clk,
      reset             => usrRst,
      edge_en           => interrupt_edge_en,
      interrupt_bus_in  => interrupt_bus_in,
      mask_bus_in_en    => mask_bus_in_en,
      mask_bus_in       => regDataWr_masked(31 downto 0),
      mask_bus_out      => mask_bus_out,
      interrupt_en_out  => interrupt_en_out,
      interrupt_bus_out => interrupt_bus_out
    );

  AdcDataHandlers : entity lsst_reb.AdcDataHandler
    generic map (
      NUM_SENSORS_G    => NUM_SENSORS_C,
      NUM_SEQUENCERS_G => cfg.numSequencers
    )
    port map (
      rst               => sys_rst,
      clk               => sys_clk,
      regDataWr         => regDataWr_masked,
      ccd_oe_we         => ccd_oe_en,
      ccd_oe_rd         => ccd_oe,
      testmode_rst      => pattern_reset,
      sequencer_outputs => sequencer_outputs,
      end_sequence      => end_sequence,
      trigger           => ADC_trigger,
      en_test_mode      => image_pattern_en,
      sci_data          => SCI_DataIn(NUM_SENSORS_C-1 downto 0),
      test_mode_enb_out => image_pattern_read,
      adc_data          => adc_data_int,
      adc_cnv           => adc_cnv_int,
      adc_sck           => adc_sck_int
    );

  Sequencers : entity lsst_reb.Sequencer
    generic map (
      NUM_SENSORS_G    => NUM_SENSORS_C,
      NUM_SEQUENCERS_G => cfg.numSequencers
    )
    port map (
      clk => sys_clk,
      rst => sys_rst,
      regAddr => regAddr,
      regDataWr => regDataWr_masked,
      sync_cmd_start => sync_cmd_start_seq,
      sync_cmd_stop => sync_cmd_stop_seq,
      sync_cmd_step => sync_cmd_step_seq,
      reg_cmd_start => start_add_prog_mem_en,
      reg_cmd_stop  => seq_stop_cmd,
      reg_cmd_step  => seq_step_cmd,
      sync_cmd_main_addr => sync_cmd_main_add,
      sequencer_start_addr_rd => start_add_prog_mem_rbk,
      prog_mem_we => seq_prog_mem_w_en,
      prog_mem_rd => seq_prog_mem_readbk,
      ind_func_mem_we => seq_ind_func_mem_we,
      ind_func_mem_rd => seq_ind_func_mem_rdbk,
      ind_rep_mem_we => seq_ind_rep_mem_we,
      ind_rep_mem_rd => seq_ind_rep_mem_rdbk,
      ind_sub_add_mem_we => seq_ind_sub_add_mem_we,
      ind_sub_add_mem_rd => seq_ind_sub_add_mem_rdbk,
      ind_sub_rep_mem_we => seq_ind_sub_rep_mem_we,
      ind_sub_rep_mem_rd => seq_ind_sub_rep_mem_rdbk,
      time_mem_we => seq_time_mem_w_en,
      time_mem_rd => seq_time_mem_readbk,
      out_mem_we => seq_out_mem_w_en,
      out_mem_rd => seq_out_mem_readbk,
      op_code_error_reset => seq_op_code_error_reset,
      op_code_error => seq_op_code_error,
      op_code_error_add => seq_op_code_error_add,
      override_we => seq_override_we,
      override_rd => seq_override_rd,
      sequencer_busy => sequencer_busy,
      end_sequence => end_sequence,
      sequencer_out => sequencer_outputs,
      enable_conv_shift => enable_conv_shift,
      init_conv_shift => init_conv_shift,
      enable_conv_shift_out => enable_conv_shift_out
    );


  -- ASPIC 3 and ASPIC 4 have the same SPI link
  aspic_4_spi_link_top_mux_0 : entity lsst_reb.aspic_3_spi_link_top_mux
    port map (
      clk                => sys_clk,
      reset              => sys_rst,
      start_link_trans   => aspic_start_trans,
      start_reset        => aspic_start_reset,
      miso_ccd1          => ASPIC_miso_ccd(0),
      miso_ccd2          => ASPIC_miso_ccd(1),
      miso_ccd3          => ASPIC_miso_ccd(2),
      word2send          => regDataWr_masked,
      aspic_mosi         => ASPIC_mosi_int,
      ss_t_ccd1          => ASPIC_ss_t_ccd_int(0),
      ss_t_ccd2          => ASPIC_ss_t_ccd_int(1),
      ss_t_ccd3          => ASPIC_ss_t_ccd_int(2),
      ss_b_ccd1          => ASPIC_ss_b_ccd_int(0),
      ss_b_ccd2          => ASPIC_ss_b_ccd_int(1),
      ss_b_ccd3          => ASPIC_ss_b_ccd_int(2),
      aspic_sclk         => ASPIC_sclk_int,
      aspic_n_reset      => ASPIC_spi_reset_int,
      busy               => aspic_busy,
      d_slave_ready_ccd1 => open,
      d_slave_ready_ccd2 => open,
      d_slave_ready_ccd3 => open,
      d_from_slave_ccd1  => aspic_config_r_ccd(0),
      d_from_slave_ccd2  => aspic_config_r_ccd(1),
      d_from_slave_ccd3  => aspic_config_r_ccd(2)
    );


  all_bias_v_undr_th <= bias_v_undr_th(2) & bias_v_undr_th(1) & bias_v_undr_th(0);
  all_bias_dac_cmd_err <= bias_dac_cmd_err(2) & bias_dac_cmd_err(1) & bias_dac_cmd_err(0);

  bias_dac_generate : for s in 0 to NUM_SENSORS_C-1 generate

    bias_DAC_ccd : entity lsst_reb.ad53xx_DAC_protection_top
      generic map (
        GD_add => cfg.gdAddr,
        OD_add => cfg.odAddr,
        RD_add => cfg.rdAddr,
        GD_th  => cfg.gdThresh(s),
        OD_th  => cfg.odThresh(s),
        RD_th  => cfg.rdThresh(s)
      )
      port map (
        clk             => sys_clk,
        reset           => sys_rst,
        start_write     => bias_load_start_ccd(s),
        start_ldac      => bias_ldac_start_ccd(s),
        bbs_switch_on   => back_bias_sw_protected_int,
        d_to_slave      => regDataWr_masked(15 downto 0),
        command_error   => bias_dac_cmd_err(s),
        values_under_th => bias_v_undr_th(s),
        mosi            => din_C_BIAS_ccd(s),
        ss              => sync_C_BIAS_ccd(s),
        sclk            => sclk_C_BIAS_ccd(s),
        ldac            => ldac_C_BIAS_ccd(s),
        gd_thresh       => bias_gd_thresh_ccd(s),
        od_thresh       => bias_od_thresh_ccd(s),
        rd_thresh       => bias_rd_thresh_ccd(s)
      );
  end generate bias_dac_generate;

  clk_rails_prog : entity lsst_reb.dual_ad53xx_DAC_top
    port map (
      clk         => sys_clk,
      reset       => sys_rst,
      start_write => clk_rail_load_start,
      start_ldac  => clk_rail_ldac_start,
      d_to_slave  => regDataWr_masked(16 downto 0),
      mosi        => din_RAILS,
      ss_dac_0    => sync_RAILS_dac0,
      ss_dac_1    => sync_RAILS_dac1,
      sclk        => sclk_RAILS,
      ldac        => ldac_RAILS
    );

  HTR_DAC : entity lsst_reb.ad56xx_DAC_top
    port map (
      clk         => sys_clk,
      reset       => sys_rst,
      start_write => htr_load_start,
      start_ldac  => htr_ldac_start,
      d_to_slave  => regDataWr_masked(23 downto 0),
      mosi        => din_HTR,
      ss          => sync_HTR,
      sclk        => sclk_HTR,
      ldac        => ldac_HTR
    );

  ltc2945_V_I_sens : entity lsst_reb.ltc2945_multi_read_top
    port map (
      clk               => sys_clk,
      reset             => sys_rst,
      start_procedure   => V_I_read_start,
      busy              => V_I_busy,
      error_v6_voltage  => v6_voltage_error,
      v6_voltage_out    => v6_voltage,
      error_v6_current  => v6_current_error,
      v6_current_out    => v6_current,
      error_v9_voltage  => v9_voltage_error,
      v9_voltage_out    => v9_voltage,
      error_v9_current  => v9_current_error,
      v9_current_out    => v9_current,
      error_v24_voltage => v24_voltage_error,
      v24_voltage_out   => v24_voltage,
      error_v24_current => v24_current_error,
      v24_current_out   => v24_current,
      error_v40_voltage => v40_voltage_error,
      v40_voltage_out   => v40_voltage,
      error_v40_current => v40_current_error,
      v40_current_out   => v40_current,
      sda               => LTC2945_SDA,
      scl               => LTC2945_SCL
    );

  ltc2945_V_I_sens_n15 : entity lsst_reb.ltc2945_single_read_top
    port map (
      clk             => sys_clk,
      reset           => sys_rst,
      start_procedure => V_I_read_start,
      busy            => V_I_n15_busy,

      error_v1_voltage => vn15_voltage_error,
      v1_voltage_out   => vn15_voltage,
      error_v1_current => vn15_current_error,
      v1_current_out   => vn15_current,
      sda              => LTC2945n15_SDA,
      scl              => LTC2945n15_SCL
    );

  DREB_temp_read : entity lsst_reb.adt7420_temp_multiread_2_top
    port map (
      clk             => sys_clk,
      reset           => sys_rst,
      start_procedure => temp_read_start,
      busy            => DREB_temp_busy,
      error_T1        => T1_dreb_error,
      T1_out          => T1_dreb,
      error_T2        => T2_dreb_error,
      T2_out          => T2_dreb,
      sda             => sda_temp0,
      scl             => scl_temp0
    );

  REB_temp_red_gr1 : entity lsst_reb.adt7420_temp_multiread_4_top
    port map (
      clk             => sys_clk,
      reset           => sys_rst,
      start_procedure => temp_read_start,
      busy            => REB_temp_busy_gr1,
      error_T1        => T1_reb_gr1_error,
      T1_out          => T1_reb_gr1,
      error_T2        => T2_reb_gr1_error,
      T2_out          => T2_reb_gr1,
      error_T3        => T3_reb_gr1_error,
      T3_out          => T3_reb_gr1,
      error_T4        => T4_reb_gr1_error,
      T4_out          => T4_reb_gr1,
      sda             => sda_temp1,
      scl             => scl_temp1
    );

  REB_temp_red_gr2 : entity lsst_reb.adt7420_temp_multiread_4_top
    port map (
      clk             => sys_clk,
      reset           => sys_rst,
      start_procedure => temp_read_start,
      busy            => REB_temp_busy_gr2,
      error_T1        => T1_reb_gr2_error,
      T1_out          => T1_reb_gr2,
      error_T2        => T2_reb_gr2_error,
      T2_out          => T2_reb_gr2,
      error_T3        => T3_reb_gr2_error,
      T3_out          => T3_reb_gr2,
      error_T4        => T4_reb_gr2_error,
      T4_out          => T4_reb_gr2,
      sda             => sda_temp2,
      scl             => scl_temp2
    );

  bias_and_temp_adc : entity lsst_reb.ads8634_and_mux_top
    port map (
      clk                  => sys_clk,
      reset                => sys_rst,
      start_multiread      => start_multiread,
      start_singleread     => start_singleread,
      start_read_adc_reg   => start_regread,
      mux_address_in       => regDataWr_masked(21 downto 16),
      data_to_adc          => regDataWr_masked(15 downto 0),
      miso                 => bias_t_adc_miso,
      mosi                 => bias_t_adc_mosi_int,
      ss                   => bias_t_adc_cs_int,
      sclk                 => bias_t_adc_sclk_int,
      link_busy            => bias_t_adc_busy,
      pwd_line             => bias_t_adc_shdn_int,
      mux_sam_en_out       => bias_t_adc_sam_mux_en,
      mux_bias_en_out      => bias_t_adc_bias_mux_en,
      mux_sam_address_out  => bias_t_adc_sam_mux_sel,
      mux_bias_address_out => bias_t_adc_bias_mux_sel,
      data_out             => bias_t_adc_d_out
    );

  ccd_temperature_sensor : entity lsst_reb.ad7794_top
    port map (
      clk             => sys_clk,
      reset           => sys_rst,
      start           => ccd_temp_start,
      start_reset     => ccd_temp_start_reset,
      read_write      => regDataWr_masked(19),
      ad7794_dout_rdy => dout_24ADC,
      reg_add         => regDataWr_masked(18 downto 16),
      d_to_slave      => regDataWr_masked(15 downto 0),
      ad7794_din      => din_24ADC,
      ad7794_cs       => csb_24ADC,
      ad7794_sclk     => sclk_24ADC,
      busy            => ccd_temp_busy,
      d_from_slave    => ccd_temp
    );

  ------------------------------------------------------------------------------
  -- Board Serial Number
  ------------------------------------------------------------------------------

  sn_edge_detect : component FD
    port map (
      D => dcm_locked,
      C => sys_clk,
      Q => sn_start_dcm_int
    );

  sn_start_dcm <= dcm_locked and not sn_start_dcm_int;
  sn_start     <= sn_start_dcm or reb_onewire_reset;
  reb_sn       <= reb_sn_long(55 downto 8);

  onewire_master_1 : entity lsst_reb.onewire_master
    generic map (
      main_clk_freq => 100,
      word_2_write  => "00110011"
    )
    port map (
      clk         => sys_clk,
      reset       => '0',
      start_acq   => sn_start,
      dq          => reb_sn_onewire,
      done        => open,
      d_from_chip => reb_sn_long,
      error_bus   => sn_error_bus
    );

  reb_sn_dev_error <= sn_error_bus(0);
  reb_sn_crc_ok    <= not sn_error_bus(1);

  ------------------------------------------------------------------------------
  -- Back Bias switch
  ------------------------------------------------------------------------------
  process (sys_clk) is
  begin
    if rising_edge(sys_clk) then
      if (first_reset_done = '0') then
        first_reset <= sys_rst;
        -- Detect the falling edge of the first reset
        if (prev_sys_rst = '1' and sys_rst = '0') then
          first_reset_done <= '1';
        end if;
        prev_sys_rst <= sys_rst;
      else
        first_reset <= '0';
      end if;

      if first_reset = '1' then
        back_bias_sw_protected_int <= '0';
        back_bias_sw_error_int <= '0';
      elsif en_back_bias_sw = '1' then
        back_bias_sw_protected_int <= regDataWr_masked(0) and not (or_reduce(all_bias_v_undr_th));
        back_bias_sw_error_int <= regDataWr_masked(0) and (or_reduce(all_bias_v_undr_th));
      end if;

      back_bias_clamp_protected_int <= not back_bias_sw_protected_int;

      if first_reset = '1' then
        backbias_ssbe <= '0';
        backbias_clamp <= '1';
      else
        backbias_ssbe <= back_bias_sw_protected_int;
        backbias_clamp <= back_bias_clamp_protected_int;
      end if;

    end if;
  end process;

  ------------------------------------------------------------------------------
  -- DC/DC Converter Synchronization
  ------------------------------------------------------------------------------
  dcdc_clk_gen : entity lsst_reb.clk_2MHz_generator
    port map (
      clk             => sys_clk,
      reset           => sys_rst,
      clk_2MHz_en     => dcdc_clk_en,
      clk_2MHz_en_in  => regDataWr_masked(0),
      clk_2MHz_en_out => dcdc_clk_en_out,
      clk_2MHz_out    => PWR_SYNC1
    );

  ------------------------------------------------------------------------------
  -- Remote Update
  ------------------------------------------------------------------------------
  ru_image_ID_we <= ru_start; -- this works because ru_start is
  -- internally delayed for sync.

  Remote_Update_top : entity lsst_reb.multiboot_top
    port map (
      inBitstreamClk       => sys_clk,
      inSpiClk             => multiboot_clk,
      inReset_EnableB      => sys_rst,
      inCheckIdOnly        => '0',
      inVerifyOnly         => '0',
      inStartProg          => ru_start,
      inDaqDone            => ru_transfer_done,
      inStartReboot        => start_multiboot,
      inImageSelWe         => ru_image_ID_we,
      inImageSel           => regDataWr_masked(1 downto 0),
      inBitstreamWe        => ru_bitstream_we,
      inBitstream32        => regDataWr_masked,
      outBitstreamFifoFull => ru_bitstream_fifo_full,
      outStarted           => ru_busy,
      outStatusReg         => ru_satatus_reg,
      outRebootStatus      => ru_reboot_status,
      outSpiCsB            => ru_outSpiCsB,
      outSpiMosi           => ru_outSpiMosi,
      inSpiMiso            => ru_inSpiMiso,
      outSpiWpB            => ru_outSpiWpB,
      outSpiHoldB          => ru_outSpiHoldB
    );

  led_blink_0 : entity lsst_reb.led_blink
    port map (
      clk_in  => sys_clk,
      led_out => test_led_int(3)
    );

  ClockManager_sys_clk : entity surf.ClockManager7
    generic map (
      TPD_G              => TPD_C,
      TYPE_G             => "MMCM",
      INPUT_BUFG_G       => false,
      FB_BUFG_G          => false,
      OUTPUT_BUFG_G      => false,
      RST_IN_POLARITY_G  => '1',
      NUM_CLOCKS_G       => 2,
      BANDWIDTH_G        => "OPTIMIZED",
      CLKIN_PERIOD_G     => 6.4,
      DIVCLK_DIVIDE_G    => 5,
      CLKFBOUT_MULT_F_G  => 32.000,
      CLKOUT0_DIVIDE_G   => 10,
      CLKOUT0_RST_HOLD_G => 8,
      CLKOUT1_DIVIDE_G   => 40,
      CLKOUT1_RST_HOLD_G => 8
    )
    port map (
      clkIn     => usrClk,
      rstIn     => '0',
      clkOut(0) => sys_clk_local,
      clkOut(1) => multiboot_clk,
      locked    => dcm_locked,
      rstOut    => open
    );

  -- Jitter cleaner
  jc_ref_clk_out : component ODDR
    generic map (
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT         => '1',
      SRTYPE       => "SYNC"
    )
    port map (
      Q  => jc_refclk_out,
      C  => sys_clk_local,
      CE => jc_clk_in_en,
      D1 => '1',
      D2 => '0',
      R  => '0',
      S  => '0'
    );

  jitter_cleaner : entity lsst_reb.si5342_jitter_cleaner_top
    port map (
      clk          => sys_clk,
      reset        => sys_rst,
      start_config => jc_start_config,
      jc_config    => regDataWr_masked(1 downto 0),
      config_busy  => jc_config_busy,
      jc_clk_ready => jc_config_done,
      jc_clk_in_en => jc_clk_in_en,
      miso         => jc_miso,
      mosi         => jc_mosi,
      chip_select  => jc_cs,
      sclk         => jc_sclk
    );

  jc_reset <= '1'; -- NO reset

  jc_clk_ready     <= jc_config_done and jc_lol and jc_los0;
  not_jc_clk_ready <= not jc_clk_ready;

  jc_status_bus <= '0' & '0' & jc_clk_ready & jc_config_done & jc_lol & jc_los0;

  BUFGCTRL_mux_100Mhz_clk : component BUFGCTRL
    generic map (
      INIT_OUT     => 0,
      PRESELECT_I0 => true,
      PRESELECT_I1 => false
    )
    port map (
      O       => sys_clk,
      CE0     => '1',
      CE1     => '1',
      I0      => sys_clk_local,
      I1      => jc_refclk_in,
      IGNORE0 => '0',
      IGNORE1 => '0',
      S0      => not_jc_clk_ready,
      S1      => jc_clk_ready
    );

  -- Resets
  -- Power on reset (goes to PGP part)
  Ureset : component IBUF
    port map (
      O => n_rst,
      I => Pwron_Rst_L
    );

  -- sync reset for the user part (from PGP)
  reset_sync : entity surf.Synchronizer
    generic map (
      STAGES_G => 3
    )
    port map (
      clk     => sys_clk,
      dataIn  => usrRst,
      dataOut => sys_rst
    );

  -- reset notice: this ff generates a signal for the reset notice
  reset_notice : component FDRE
    port map (
      C  => sys_clk,
      R  => sys_rst,
      CE => '1',
      D  => '1',
      Q  => fe_reset_notice
    );

  ------------------------------------------------------------------------------
  -- CCD pin assignments
  ------------------------------------------------------------------------------
  sensor_pins : for s in 0 to NUM_SENSORS_C-1 generate
    U_ASPIC_r_up_ccd_1 : component OBUFDS
      port map (
        I  => ASPIC_r_up_ccd(s),
        O  => ASPIC_r_up_ccd_p(s),
        OB => ASPIC_r_up_ccd_n(s)
      );

    U_ASPIC_r_down_ccd : component OBUFDS
      port map (
        I  => ASPIC_r_down_ccd(s),
        O  => ASPIC_r_down_ccd_p(s),
        OB => ASPIC_r_down_ccd_n(s)
      );

    U_ASPIC_clamp_ccd : component OBUFDS
      port map (
        I  => ASPIC_clamp_ccd(s),
        O  => ASPIC_clamp_ccd_p(s),
        OB => ASPIC_clamp_ccd_n(s)
      );

    U_ASPIC_reset_ccd : component OBUFDS
      port map (
        I  => ASPIC_reset_ccd(s),
        O  => ASPIC_reset_ccd_p(s),
        OB => ASPIC_reset_ccd_n(s)
      );

    par_clk_ccd_generate : for c in 0 to 3 generate

      U_par_clk_ccd : component OBUFDS
        port map (
          I  => par_clk_ccd(s)(c),
          O  => par_clk_ccd_p(s)(c),
          OB => par_clk_ccd_n(s)(c)
        );
    end generate par_clk_ccd_generate;


    ser_clk_ccd_generate : for c in 0 to NUM_SENSORS_C-1 generate

      U_ser_clk_ccd : component OBUFDS
        port map (
          I  => ser_clk_ccd(s)(c),
          O  => ser_clk_ccd_p(s)(c),
          OB => ser_clk_ccd_n(s)(c)
        );
    end generate ser_clk_ccd_generate;


    U_reset_gate_ccd : component OBUFDS
      port map (
        I  => reset_gate_ccd(s),
        O  => reset_gate_ccd_p(s),
        OB => reset_gate_ccd_n(s)
      );

  end generate sensor_pins;


  -- Jitter Cleaner
  U_jc_refclk_out_buf : component OBUFDS
    generic map (
      IOSTANDARD => "DEFAULT",
      SLEW       => "FAST"
    )

    port map (
      I  => jc_refclk_out,
      O  => jc_refclk_out_p,
      OB => jc_refclk_out_n
    );

  jc_clock_in_buf : component IBUFDS
    generic map (
      DIFF_TERM    => true,
      IBUF_LOW_PWR => false,
      IOSTANDARD   => "DEFAULT"
    )
    port map (
      O  => jc_refclk_in,
      I  => jc_refclk_in_p,
      IB => jc_refclk_in_n
    );

  IBUFG_inst : component IBUFG
    generic map (
      IBUF_LOW_PWR => true,
      IOSTANDARD   => "DEFAULT"
    )
    port map (
      O => aux_100mhz_clk,
      I => aux_100mhz_clk_in
    );

  ------ MISC ------
  -- leds
  Utest_leds : for i in 0 to 5 generate
    Utest_led : component OBUF
      port map (
        O => TEST_LED(i),
        I => test_led_int(i)
      );
  end generate Utest_leds;

  -- test points
  Utest_points : for i in 0 to 12 generate
    Utest_point : component OBUF
      port map (
        O => TEST(i),
        I => test_port(i)
      );
  end generate Utest_points;

  U_GPIO : component OBUFDS
    port map (
      I  => gpio_int,
      O  => gpio_p,
      OB => gpio_n
    );

end architecture Behavioral;
