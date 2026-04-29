# -------------------------------------------------------------------------------
# -- REB_v5_6p4ns_3_seq: 3-sequencer target at 6.4ns system clock
# -- Based on REB_v5_6p4ns (1-seq, 6.4ns) and REB_v5_3_seq (3-seq, 10ns)
# --
# -- 313B501C Updated sequencer and command interpreter for 6.4ns timing closure
# -------------------------------------------------------------------------------

export PRJ_VERSION = 0x313B511C

export GIT_BYPASS?=0
export OVERRIDE_SUBMODULE_LOCKS=0

export GEN_BIT_IMAGE=0
export GEN_BIT_IMAGE_GZIP=1
export GEN_MCS_IMAGE=0
export GEN_MCS_IMAGE_GZIP=0
export GEN_MULTIBOOT_IMAGE=0
export GEN_MULTIBOOT_IMAGE_GZIP=1

# Define target output
target: prom

# Define target part
export PRJ_PART = XC7K160TFFG676-1

# Use top level makefile
include ../../submodules/ruckus/system_vivado.mk

# Include log checking functionality
include ../check_logs.mk
