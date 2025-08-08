# -------------------------------------------------------------------------------
# -- Revision History: Cloned from REB_v5_top
# -- 31395011 Version with Bias thresholds moved into Generics, but not set differently
# -- 31395012 Version that fixes reset to not cause CCS to power down sensors or open bias switch.
# -- 313A5013 Nominally same as version 13, but refactored to use new build system and modern Vivado
# -------------------------------------------------------------------------------

# Define Firmware Version Number (and don't forget to change the register values! :facepalm:)
export PRJ_VERSION = 0x313A5013

export GIT_BYPASS=0
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
