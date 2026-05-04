# REB_v5 Register Map

Source: `common/command_interpreter/rtl/REB_v5_commands_package.vhd`

## Protocol

- Address width: 24 bits
- Data width: 32 bits
- `regOp = 0`: read
- `regOp = 1`: write

## Address space overview

| `addr[23:16]` | Subsystem |
|---------------|-----------|
| `0x00` | Base registers, bitstream remote update, multiboot |
| `0x10`–`0x3A` | Sequencer |
| `0x40` | DACs (clock rail, heater, CCD bias), image parameters, thresholds |
| `0x60` | Voltage/current sensors, temperature sensors, bias/temp ADC |
| `0x70` | CCD temperature sensor |
| `0x80` | 1-Wire serial number |
| `0x90` | DC/DC clock enable, jitter cleaner |
| `0xA0` | Status registers (read-only) |
| `0xB0` | ASPIC SPI configuration |
| `0xD0` | Power control |

---

## Base registers (`0x00xxxx`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x000000` | `read_schema_cmd` | R | Register schema constant (`0x00000002`) |
| `0x000001` | `read_hdl_version_cmd` | R | HDL firmware version |
| `0x000002` | `read_SCI_ID_cmd` | R | SCI interface ID |
| `0x000003` | `read_reserved_1_cmd` | R | Reserved |
| `0x000004` | `time_base_lsw_cmd` | R/W | Time base counter LSW |
| `0x000005` | `time_base_MSW_cmd` | R/W | Time base counter MSW |
| `0x000006` | `read_reserved_2_cmd` | R | Reserved |
| `0x000007` | `read_reserved_3_cmd` | R | Reserved |
| `0x000008` | `read_state_busy_cmd` | R | Busy/state of all subsystems |
| `0x000009` | `trigger_set_cmd` | R/W | Trigger enable/value |
| `0x00000A` | `read_trig_time_SB_lsw_cmd` | R | SB trigger timestamp LSW |
| `0x00000B` | `read_trig_time_SB_MSW_cmd` | R | SB trigger timestamp MSW |
| `0x00000C` | `read_trig_time_TB_lsw_cmd` | R | TB trigger timestamp LSW |
| `0x00000D` | `read_trig_time_TB_MSW_cmd` | R | TB trigger timestamp MSW |
| `0x00000E` | `read_trig_time_seq_lsw_cmd` | R | Sequencer trigger timestamp LSW |
| `0x00000F` | `read_trig_time_seq_MSW_cmd` | R | Sequencer trigger timestamp MSW |
| `0x000010` | `read_trig_time_V_I_lsw_cmd` | R | V/I trigger timestamp LSW |
| `0x000011` | `read_trig_time_V_I_MSW_cmd` | R | V/I trigger timestamp MSW |
| `0x000012` | `read_trig_time_pcb_t_lsw_cmd` | R | PCB temp trigger timestamp LSW |
| `0x000013` | `read_trig_time_pcb_t_MSW_cmd` | R | PCB temp trigger timestamp MSW |
| `0x000014` | `read_v_ok_cmd` | R | Voltages OK status |
| `0x000015` | `sync_cmd_delay_cmd` | R/W | Sync command delay |
| `0x000016` | `sync_cmd_mask_cmd` | R/W | Sync command mask |
| `0x000017` | `interrupt_mask_cmd` | R/W | Interrupt mask |
| `0x000020` | `sys_clock_rate_cmd` | R/W | System clock rate |

## Bitstream remote update (`0x000100`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x000100` | `ru_start_cmd` | W | Start remote update |
| `0x000101` | `ru_bitstream_we_cmd` | W | Bitstream FIFO write |
| `0x000102` | `ru_bitstream_daq_done_cmd` | W | DAQ done signal |
| `0x000103` | `ru_status_read_cmd` | R | Remote update status |

## Multiboot (`0x000200`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x000200` | `start_multiboot_cmd` | W | Trigger FPGA multiboot |

---

## Sequencer (`0x10xxxx`–`0x3Axxxx`)

Addresses with `addr[23:16]` in the range `0x10`..`0x3A` are routed to the
sequencer via a handshake interface. The sequencer decodes them internally
using the `SeqRegMapType` record. See
[`sequencer_v4/SEQUENCER_THEORY.md`](submodules/lsst_reb/sequencer_v4/SEQUENCER_THEORY.md)
Section 2 for memory semantics.

| `addr[23:16]` | Block | Index field | Offset field | Access |
|---------------|-------|-------------|--------------|--------|
| `0x10` | `out_mem` | seq `[13:12]` | `[7:0]` (0–255) | R/W |
| `0x20` | `time_mem` | seq `[13:12]` | `[7:0]` (0–255) | R/W |
| `0x30` | `prog_mem` | seq `[13:12]` | `[9:0]` (0–1023) | R/W |
| `0x31` | `step_cmd` | seq `[13:12]` | — | W |
| `0x32` | `stop_cmd` | seq `[13:12]` | — | W |
| `0x33` | `conv_shift` | seq `[13:12]` | bit 0: 0=en, 1=init | R/W |
| `0x34` | `start_addr` | seq `[13:12]` | `[4:0]` | R/W |
| `0x35` | `ind_func` | seq `[13:12]` | `[3:0]` (0–15) | R/W |
| `0x36` | `ind_rep` | seq `[13:12]` | `[3:0]` (0–15) | R/W |
| `0x37` | `ind_sub_add` | seq `[13:12]` | `[3:0]` (0–15) | R/W |
| `0x38` | `ind_sub_rep` | seq `[13:12]` | `[3:0]` (0–15) | R/W |
| `0x39` | `error_stat` | seq `[13:12]` | bit 0: 0=read, 1=reset | R/W |
| `0x3A` | `override` | sensor `[13:12]` | — | R/W |

In triple-sequencer targets, `addr[13:12]` selects the sequencer instance.

---

## DACs and image parameters (`0x40xxxx`)

### Clock rail DAC

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x400000` | `clk_rail_load_config_cmd` | W | Load clock rail DAC config |
| `0x400001` | `clk_rail_ldac_cmd` | W | Latch clock rail DAC |

### Heater DAC

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x400010` | `HTR_load_config_cmd` | W | Load heater DAC config |
| `0x400011` | `HTR_ldac_cmd` | W | Latch heater DAC |

### CCD bias DACs (per-CCD)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x400100` | `ccd_1_bias_load_config_cmd` | W | Load CCD1 bias DAC config |
| `0x400101` | `ccd_1_bias_ldac_cmd` | W | Latch CCD1 bias DAC |
| `0x400110` | `ccd_2_bias_load_config_cmd` | W | Load CCD2 bias DAC config |
| `0x400111` | `ccd_2_bias_ldac_cmd` | W | Latch CCD2 bias DAC |
| `0x400120` | `ccd_3_bias_load_config_cmd` | W | Load CCD3 bias DAC config |
| `0x400121` | `ccd_3_bias_ldac_cmd` | W | Latch CCD3 bias DAC |
| `0x40010F` | `ccd_bias_err_vut_cmd` | R | Bias DAC error / under-threshold |

### Threshold readback (per-CCD)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x401100` | `ccd_1_gd_thresh_read_cmd` | R | CCD1 guard drain threshold |
| `0x401101` | `ccd_1_od_thresh_read_cmd` | R | CCD1 output drain threshold |
| `0x401104` | `ccd_1_rd_thresh_read_cmd` | R | CCD1 reset drain threshold |
| `0x401110` | `ccd_2_gd_thresh_read_cmd` | R | CCD2 guard drain threshold |
| `0x401111` | `ccd_2_od_thresh_read_cmd` | R | CCD2 output drain threshold |
| `0x401114` | `ccd_2_rd_thresh_read_cmd` | R | CCD2 reset drain threshold |
| `0x401120` | `ccd_3_gd_thresh_read_cmd` | R | CCD3 guard drain threshold |
| `0x401121` | `ccd_3_od_thresh_read_cmd` | R | CCD3 output drain threshold |
| `0x401124` | `ccd_3_rd_thresh_read_cmd` | R | CCD3 reset drain threshold |

### Image parameters

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x400005` | `image_size_cmd` | R/W | Image size |
| `0x400006` | `image_pattern_mode_cmd` | R/W | Test pattern mode |
| `0x400007` | `ccd_sel_cmd` | R/W | CCD selection for acquisition |
| `0x400008` | `ccd_oe_cmd` | R/W | CCD output enable |

---

## Voltage, current, and temperature sensors (`0x60xxxx`)

### DREB supply monitors

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x600000` | `v6_voltage_cmd` | R | 6 V supply voltage |
| `0x600001` | `v6_current_cmd` | R | 6 V supply current |
| `0x600002` | `v9_voltage_cmd` | R | 9 V supply voltage |
| `0x600003` | `v9_current_cmd` | R | 9 V supply current |
| `0x600004` | `v24_voltage_cmd` | R | 24 V supply voltage |
| `0x600005` | `v24_current_cmd` | R | 24 V supply current |
| `0x600006` | `v40_voltage_cmd` | R | 40 V supply voltage |
| `0x600007` | `v40_current_cmd` | R | 40 V supply current |
| `0x600008` | `vn15_voltage_cmd` | R | −15 V supply voltage |
| `0x600009` | `vn15_current_cmd` | R | −15 V supply current |

### Temperature sensors

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x600010` | `DREB_T1_cmd` | R | DREB temperature 1 |
| `0x600011` | `DREB_T2_cmd` | R | DREB temperature 2 |
| `0x600012` | `REB_T1_gr1_cmd` | R | REB temperature 1 (group 1) |
| `0x600013` | `REB_T2_gr1_cmd` | R | REB temperature 2 (group 1) |
| `0x600014` | `REB_T3_gr1_cmd` | R | REB temperature 3 (group 1) |
| `0x600015` | `REB_T4_gr1_cmd` | R | REB temperature 4 (group 1) |
| `0x600016` | `REB_T1_gr2_cmd` | R | REB temperature 1 (group 2) |
| `0x600017` | `REB_T2_gr2_cmd` | R | REB temperature 2 (group 2) |
| `0x600018` | `REB_T3_gr2_cmd` | R | REB temperature 3 (group 2) |
| `0x600019` | `REB_T4_gr2_cmd` | R | REB temperature 4 (group 2) |

### Bias and temperature ADC (slow ADC)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x600100` | `bias_t_adc_start_t_cmd` | W | Start ASPIC temperature acquisition (all 6) |
| `0x600101` | `bias_t_adc_start_b_cmd` | W | Single-parameter acquisition (mux + ADC config) |
| `0x600102` | `bias_t_adc_start_r_cmd` | W | Start ADC internal register read |
| `0x601000` | `bias_t_adc_read_T1_cmd` | R | ASPIC temperature 1 |
| `0x601001` | `bias_t_adc_read_T2_cmd` | R | ASPIC temperature 2 |
| `0x601002` | `bias_t_adc_read_T3_cmd` | R | ASPIC temperature 3 |
| `0x601003` | `bias_t_adc_read_T4_cmd` | R | ASPIC temperature 4 |
| `0x601004` | `bias_t_adc_read_T5_cmd` | R | ASPIC temperature 5 |
| `0x601005` | `bias_t_adc_read_T6_cmd` | R | ASPIC temperature 6 |
| `0x601010` | `bias_t_adc_read_B_cmd` | R | Single-parameter readback |

---

## CCD temperature sensor (`0x70xxxx`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x700000` | `ccd_temp_start_cmd` | W | Start CCD temperature acquisition |
| `0x700001` | `ccd_temp_read_cmd` | R | Read CCD temperature |
| `0x700002` | `ccd_temp_start_reset_cmd` | W | Reset CCD temperature sensor |

---

## 1-Wire serial number (`0x80xxxx`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x800000` | `reb_sn_acq_cmd` | W | Acquire REB serial number |
| `0x800001` | `reb_sn_read_w0_cmd` | R | REB serial number word 0 |
| `0x800002` | `reb_sn_read_w1_cmd` | R | REB serial number word 1 |

---

## Enables and jitter cleaner (`0x90xxxx`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0x900000` | `dcdc_clk_en_cmd` | R/W | DC/DC clock enable |
| `0x900010` | `jc_start_config_cmd` | W | Start jitter cleaner configuration |

---

## Status registers (`0xA0xxxx`)

Source: `submodules/lsst_sci/rtl/LsstSciStatusBlock.vhd`

### PGP link status

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0xA00000` | `VERSION` | R | SCI firmware version |
| `0xA00001` | `LNKSTAT` | R | PGP link status flags |
| `0xA00002` | `REM_DATA` | R | Remote link data |
| `0xA00003` | `CERR_CNT` | R | Cell error count |
| `0xA00004` | `LDWN_CNT` | R | Link-down count |
| `0xA00005` | `LERR_CNT` | R | Link error count |
| `0xA00006` | `REM_OFLOW_VC0` | R | Remote overflow count (VC0) |
| `0xA00007` | `REM_OFLOW_VC1` | R | Remote overflow count (VC1) |
| `0xA00008` | `REM_OFLOW_VC2` | R | Remote overflow count (VC2) |
| `0xA00009` | `REM_OFLOW_VC3` | R | Remote overflow count (VC3) |
| `0xA0000A` | `REM_PAUSE_VC0` | R | Remote pause status (VC0) |
| `0xA0000B` | `REM_PAUSE_VC1` | R | Remote pause status (VC1) |
| `0xA0000C` | `REM_PAUSE_VC2` | R | Remote pause status (VC2) |
| `0xA0000D` | `REM_PAUSE_VC3` | R | Remote pause status (VC3) |
| `0xA0000E` | `RX_ERR_CNT` | R | Rx frame error count |
| `0xA0000F` | `RX_CNT` | R | Rx frame count |
| `0xA00010` | `LOC_OFLOW_VC0` | R | Local overflow count (VC0) |
| `0xA00011` | `LOC_OFLOW_VC1` | R | Local overflow count (VC1) |
| `0xA00012` | `LOC_OFLOW_VC2` | R | Local overflow count (VC2) |
| `0xA00013` | `LOC_OFLOW_VC3` | R | Local overflow count (VC3) |
| `0xA00014` | `LOC_PAUSE_VC0` | R | Local pause status (VC0) |
| `0xA00015` | `LOC_PAUSE_VC1` | R | Local pause status (VC1) |
| `0xA00016` | `LOC_PAUSE_VC2` | R | Local pause status (VC2) |
| `0xA00017` | `LOC_PAUSE_VC3` | R | Local pause status (VC3) |
| `0xA00018` | `TX_ERR_CNT` | R | Tx frame error count |
| `0xA00019` | `TX_CNT` | R | Tx frame count |
| `0xA00020` | `OPCODE_CNT` | R | OpCode received count |
| `0xA00021` | `OPCODE_LAST` | R | Last OpCode value |
| `0xA00022` | `NOTICE_CNT` | R | Notice sent count |
| `0xA00023` | `NOTICE_LAST_0` | R | Last notice value [31:0] |
| `0xA00024` | `NOTICE_LAST_1` | R | Last notice value [63:32] |
| `0xA00025` | `PGP_SIDE` | R | PGP link A/B side |

### Image encoder status

Three identical groups for data virtual channels 0–2.

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0xA00030` | `IMAGE_SENT0` | R | Encoder 0: frames sent |
| `0xA00031` | `IMAGE_DISC0` | R | Encoder 0: frames discarded |
| `0xA00032` | `IMAGE_TRUNC0` | R | Encoder 0: frames truncated |
| `0xA00033` | `IMAGE_FORMAT0` | R | Encoder 0: data format |
| `0xA00040` | `IMAGE_SENT1` | R | Encoder 1: frames sent |
| `0xA00041` | `IMAGE_DISC1` | R | Encoder 1: frames discarded |
| `0xA00042` | `IMAGE_TRUNC1` | R | Encoder 1: frames truncated |
| `0xA00043` | `IMAGE_FORMAT1` | R | Encoder 1: data format |
| `0xA00050` | `IMAGE_SENT2` | R | Encoder 2: frames sent |
| `0xA00051` | `IMAGE_DISC2` | R | Encoder 2: frames discarded |
| `0xA00052` | `IMAGE_TRUNC2` | R | Encoder 2: frames truncated |
| `0xA00053` | `IMAGE_FORMAT2` | R | Encoder 2: data format |

### Build info

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0xA00100`–`0xA0013F` | `BUILD_STRING` | R | Build string (64 words, little-endian) |
| `0xA00140`–`0xA00144` | `GIT_HASH` | R | Git hash (5 words, little-endian) |
| `0xA00145` | `FW_VERSION` | R | Firmware version |

---

## ASPIC SPI configuration (`0xB0xxxx`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0xB00000` | `aspic_start_trans_cmd` | W | Start ASPIC SPI transfer |
| `0xB00001` | `aspic_start_reset_cmd` | W | Start ASPIC reset |
| `0xB00010` | `aspic_conf_read_ccd1_cmd` | R | ASPIC config readback (CCD1) |
| `0xB00011` | `aspic_conf_read_ccd2_cmd` | R | ASPIC config readback (CCD2) |
| `0xB00012` | `aspic_conf_read_ccd3_cmd` | R | ASPIC config readback (CCD3) |

---

## Power control (`0xD0xxxx`)

| Address | Name | Access | Description |
|---------|------|--------|-------------|
| `0xD00000` | `back_bias_sw_cmd` | R/W | Back-bias switch control |
