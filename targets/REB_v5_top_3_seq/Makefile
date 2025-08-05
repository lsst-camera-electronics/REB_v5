
# -------------------------------------------------------------------------------
# -- Revision History:
# -- 00000000 First version (imported from REB v4_6)
# -- 302c5001 serial clk pin assigment corrected. Video ADC machine corrected.
# --          Jitter cleaner function added
# -- 302c5002 synchronous command decoder for senqwuencer start added
# -- 30335003 Look at me added, Temp busy and error fixed.
# -- 31325004 multiboot remote update added
# -- 31345004 new SCI version added and multiboot remote update added
# -- 31375105 new SCI version added with a 60 LAM bits port and sync cmd set start
# --          address and 3 sequencers
# -- 30345106 new onewire interface
# -- 30345107 look at me various fixes (masked at start and other errors). Now the
# -- version shuld be identical to GREB 2007 and following
# -- 31395107 new SCI block with A and B link switch
# -- 31395108 Changed ADC conversion time from 750ns to 800ns
# -- 31395109 Changed ADC conversion time from 750ns to 700ns
# -- 3139510B Retured ADC conversion time to 750ns
# --          Added STOP Synchronous command 0x30
# --          Fixed bug that caused 160ns of 0 on output when
# --           entering default state
# -- 3139510C Added register START command that specifies MAIN
# -- 3139510D Masked sequencer start with sequencer busy to reject triggers
# --          when already running.
# -- 3139510E Fixed Serial Number Readback
# --          Added FPGA_VERSION to UserID in bitfile
# --          Fixed zero sensor data for non-zero sensors
# -- 3139510F Fixed Sensor order in 3-sequencer version (dead end - deprecated)
# -- 31395110 Added enable mask for input to DataEncoder
# -- 31395111 Version with Bias thresholds moved into Generics, but not set differently
# -- 31395112 Version that fixes reset to not cause CCS to power down sensors or open bias switch.
# -- 31395113 Nominally same as version 13, but refactored to use new build system and modern Vivado
# -------------------------------------------------------------------------------

# Define Firmware Version Number (and don't forget to change the register values! :facepalm:)
export PRJ_VERSION = 0x31395113

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
