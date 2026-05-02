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
