# REB_v5

Firmware for the LSST Raft Electronics Board (REB), version 5.
Targets a Xilinx Kintex-7 (XC7K160T) FPGA. Built with the ruckus framework
and Vivado. The REB drives three science sensors.

## Build targets

| Target | System clock | Sequencers | Notes |
|--------|--------------|------------|-------|
| `REB_v5` | 10 ns (100 MHz) | 1 | |
| `REB_v5_6p4ns` | 6.4 ns (156.25 MHz) | 1 | |
| `REB_v5_3_seq` | 10 ns (100 MHz) | 3 | |
| `REB_v5_6p4ns_3_seq` | 6.4 ns (156.25 MHz) | 3 | |
| `REB_v5_R30_Reb1` | 10 ns (100 MHz) | 1 | Site-specific (damaged board) |
| `REB_v5_6p4ns_R30_Reb1` | 6.4 ns (156.25 MHz) | 1 | Site-specific (damaged board) |

All targets use the same RTL and produce identical register-level behaviour.

## Target configuration

All targets instantiate the same `REB_v5_base` entity, parameterised by a
`RebConfigType` record (defined in
`submodules/lsst_reb/reb_config/rtl/reb_config_pkg.vhd`).

| Field | Type | Description |
|-------|------|-------------|
| `numSequencers` | 1 or 3 | Number of sequencer instances |
| `sysClkPer` | real | System clock period (seconds) |
| `gdAddr` | 4-bit | Guard drain DAC channel address |
| `odAddr` | 4-bit | Output drain DAC channel address |
| `rdAddr` | 4-bit | Reset drain DAC channel address |
| `gdThresh` | integer×3 | Guard drain threshold per sensor |
| `odThresh` | integer×3 | Output drain threshold per sensor |
| `rdThresh` | integer×3 | Reset drain threshold per sensor |
| `reserved_1` | 32-bit | DAQ index for location-limited targets |
| `reserved_2` | 32-bit | Reserved |
| `reserved_3` | 32-bit | Reserved |

With `numSequencers=1`, a single sequencer drives all three sensors.
With `numSequencers=3`, each sensor has an independent sequencer instance
selected via `addr[13:12]` in the register interface.

The DAC channel addresses (`gdAddr=0x0`, `odAddr=0x1`, `rdAddr=0x4`) are
the same across all REB targets but differ on GREB and WREB boards.

Standard threshold values (`gdThresh=(1138,1138,1138)`,
`odThresh=(2275,2275,2275)`, `rdThresh=(1632,1632,1632)`) are used by all
targets except `R30_Reb1`, which lowers `odThresh(0)` to 10 (disabled bias)
and sets `reserved_1=0x0000003D` (DAQ location index).

## Repository layout

| Path | Contents |
|------|----------|
| `targets/REB_v5/` | Top-level entity, constraints, build scripts, binary images |
| `targets/REB_v5_6p4ns/` | Same structure, 6.4 ns variant |
| `targets/REB_v5_3_seq/` | Same structure, triple sequencer |
| `targets/REB_v5_6p4ns_3_seq/` | Same structure, 6.4 ns + triple sequencer |
| `targets/REB_v5_R30_Reb1/` | Site-specific target |
| `targets/REB_v5_6p4ns_R30_Reb1/` | Site-specific target, 6.4 ns |
| `common/command_interpreter/` | Register decode and command routing |
| `common/reb_v5_base/` | Board-level integration entity |
| `submodules/` | External dependencies (see below) |
| `build/` | Vivado project trees (local, not committed) |

## Submodules

| Submodule | Purpose |
|-----------|---------|
| `lsst_reb` | Shared REB IP library (sequencer, peripheral drivers) |
| `lsst_sci` | Science data path (PGP, image readout) |
| `surf` | SLAC firmware utilities |
| `ruckus` | Build framework |

## Building

Builds require Vivado 2025.1 and are run via ruckus:

```
cd targets/REB_v5
make
```

Binary outputs (`.bit.gz`, `.mcs.gz`) are committed to
`targets/<target>/images/`.

## Register map

See [`REGISTERS.md`](REGISTERS.md) for the full register address map.

## Documentation

- Sequencer architecture: [`submodules/lsst_reb/sequencer_v4/SEQUENCER_THEORY.md`](submodules/lsst_reb/sequencer_v4/SEQUENCER_THEORY.md)
- Sequencer testbench: [`submodules/lsst_reb/sequencer_v4/TB/README.md`](submodules/lsst_reb/sequencer_v4/TB/README.md)
