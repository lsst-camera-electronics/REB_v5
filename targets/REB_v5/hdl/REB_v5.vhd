library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library surf;
use surf.StdRtlPkg.all;

library common;
use common.REB_v5_pkg.all;

entity REB_v5 is
  generic (
    BUILD_INFO_G : BuildInfoType
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

    -- bacbias sw
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
end entity REB_v5;

architecture Behavioral of REB_v5 is

  constant TARGET_CONFIG : RebConfigType := (
    numSequencers => 1,
    sysClkPer     => 10.0E-9,
    gdAddr        => x"0",
    odAddr        => x"1",
    rdAddr        => x"4",
    gdThresh      => (1138, 1138, 1138),
    odThresh      => (2275, 2275, 2275),
    rdThresh      => (1632, 1632, 1632)
    --         Sensor(   0,    1,    2)
  );

  constant VERSION : RebVersionType := (
    schema        => x"00000002",
    board_type    => x"3",
    vhdl_version  => x"5015",
    reserved_1    => x"00000000",
    reserved_2    => x"00000000",
    reserved_3    => x"00000000"
  );

begin
  U_REB_v5 : entity common.REB_v5_base
    generic map (
      BUILD_INFO_G => BUILD_INFO_G,
      VERSION_G    => VERSION,
      CONFIG_G     => TARGET_CONFIG
    )
    port map (
      PgpRefClk_P             => PgpRefClk_P,
      PgpRefClk_M             => PgpRefClk_M,
      PgpRx_P                 => PgpRx_P,
      PgpRx_M                 => PgpRx_M,
      PgpTx_P                 => PgpTx_P,
      PgpTx_M                 => PgpTx_M,
      aux_100mhz_clk_in       => aux_100mhz_clk_in,
      adc_data_t_ccd          => adc_data_t_ccd,
      adc_data_b_ccd          => adc_data_b_ccd,
      adc_cnv_ccd             => adc_cnv_ccd,
      adc_sck_ccd             => adc_sck_ccd,
      ASPIC_r_up_ccd_p        => ASPIC_r_up_ccd_p,
      ASPIC_r_up_ccd_n        => ASPIC_r_up_ccd_n,
      ASPIC_r_down_ccd_p      => ASPIC_r_down_ccd_p,
      ASPIC_r_down_ccd_n      => ASPIC_r_down_ccd_n,
      ASPIC_clamp_ccd_p       => ASPIC_clamp_ccd_p,
      ASPIC_clamp_ccd_n       => ASPIC_clamp_ccd_n,
      ASPIC_reset_ccd_p       => ASPIC_reset_ccd_p,
      ASPIC_reset_ccd_n       => ASPIC_reset_ccd_n,
      ASPIC_nap_ccd           => ASPIC_nap_ccd,
      ASPIC_pwdn_ccd          => ASPIC_pwdn_ccd,
      ASPIC_miso_ccd          => ASPIC_miso_ccd,
      ASPIC_ss_t_ccd          => ASPIC_ss_t_ccd,
      ASPIC_ss_b_ccd          => ASPIC_ss_b_ccd,
      ASPIC_spi_reset_ccd     => ASPIC_spi_reset_ccd,
      ASPIC_sclk_ccd          => ASPIC_sclk_ccd,
      ASPIC_mosi_ccd          => ASPIC_mosi_ccd,
      par_clk_ccd_p           => par_clk_ccd_p,
      par_clk_ccd_n           => par_clk_ccd_n,
      ser_clk_ccd_p           => ser_clk_ccd_p,
      ser_clk_ccd_n           => ser_clk_ccd_n,
      reset_gate_ccd_p        => reset_gate_ccd_p,
      reset_gate_ccd_n        => reset_gate_ccd_n,
      ldac_C_BIAS_ccd         => ldac_C_BIAS_ccd,
      din_C_BIAS_ccd          => din_C_BIAS_ccd,
      sync_C_BIAS_ccd         => sync_C_BIAS_ccd,
      sclk_C_BIAS_ccd         => sclk_C_BIAS_ccd,
      LTC2945_SCL             => LTC2945_SCL,
      LTC2945_SDA             => LTC2945_SDA,
      LTC2945n15_SCL          => LTC2945n15_SCL,
      LTC2945n15_SDA          => LTC2945n15_SDA,
      sda_temp0               => sda_temp0,
      scl_temp0               => scl_temp0,
      sda_temp1               => sda_temp1,
      scl_temp1               => scl_temp1,
      sda_temp2               => sda_temp2,
      scl_temp2               => scl_temp2,
      csb_24ADC               => csb_24ADC,
      sclk_24ADC              => sclk_24ADC,
      din_24ADC               => din_24ADC,
      dout_24ADC              => dout_24ADC,
      bias_t_adc_miso         => bias_t_adc_miso,
      bias_t_adc_cs           => bias_t_adc_cs,
      bias_t_adc_sclk         => bias_t_adc_sclk,
      bias_t_adc_mosi         => bias_t_adc_mosi,
      bias_t_adc_sam_mux_en   => bias_t_adc_sam_mux_en,
      bias_t_adc_bias_mux_en  => bias_t_adc_bias_mux_en,
      bias_t_adc_sam_mux_sel  => bias_t_adc_sam_mux_sel,
      bias_t_adc_bias_mux_sel => bias_t_adc_bias_mux_sel,
      bias_t_adc_shdn         => bias_t_adc_shdn,
      ldac_RAILS              => ldac_RAILS,
      din_RAILS               => din_RAILS,
      sclk_RAILS              => sclk_RAILS,
      sync_RAILS_dac0         => sync_RAILS_dac0,
      sync_RAILS_dac1         => sync_RAILS_dac1,
      ldac_HTR                => ldac_HTR,
      din_HTR                 => din_HTR,
      sync_HTR                => sync_HTR,
      sclk_HTR                => sclk_HTR,
      backbias_clamp          => backbias_clamp,
      backbias_ssbe           => backbias_ssbe,
      jc_refclk_out_p         => jc_refclk_out_p,
      jc_refclk_out_n         => jc_refclk_out_n,
      jc_refclk_in_p          => jc_refclk_in_p,
      jc_refclk_in_n          => jc_refclk_in_n,
      jc_miso                 => jc_miso,
      jc_mosi                 => jc_mosi,
      jc_sclk                 => jc_sclk,
      jc_cs                   => jc_cs,
      jc_los0                 => jc_los0,
      jc_lol                  => jc_lol,
      jc_reset                => jc_reset,
      ru_outSpiCsB            => ru_outSpiCsB,
      ru_outSpiMosi           => ru_outSpiMosi,
      ru_inSpiMiso            => ru_inSpiMiso,
      ru_outSpiWpB            => ru_outSpiWpB,
      ru_outSpiHoldB          => ru_outSpiHoldB,
      r_add                   => r_add,
      TEST                    => TEST,
      gpio_p                  => gpio_p,
      gpio_n                  => gpio_n,
      TEST_LED                => TEST_LED,
      Pwron_Rst_L             => Pwron_Rst_L,
      CCD_OPAMP_PD            => CCD_OPAMP_PD,
      PWR_SYNC1               => PWR_SYNC1,
      reb_sn_onewire          => reb_sn_onewire
  );
end architecture Behavioral;
