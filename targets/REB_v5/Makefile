# -------------------------------------------------------------------------------
# -- Revision History:
# -- 00000000 First version (imported from REB v4_6)
# -- 302c5001 serial clk pin assigment corrected. Video ADC machine corrected.
# --          Jitter cleaner function added
# -- 302c5002 synchronous command decoder for senqwuencer start added
# -- 30335003 Look at me added, Temp busy and error fixed.
# -- 31325004 multiboot remote update added
# -- 31345004 new SCI version added and multiboot remote update added
# -- 31375005 new SCI version added with a 60 LAM bits port and sync cmd set start address
# -- 31375006 new onewire interface
# -- 31385006 new SCI with new gtx configuration
# -- 30345005
# -- 30345006
# -- 30345007 look at me various fixes (masked at start and other errors). Now the
# -- version shuld be identical to GREB 2007 and following
# -- 31395007 SCI module updated with the A and B link switch capability
# -- 31395008 Changed ADC conversion time from 750ns to 800ns
# -- 31395009 Changed ADC conversion time from 750ns to 700ns
# -- 3139500A Changed ADC conversion time from 750ns to 500ns
# -- 3139500B Retured ADC conversion time to 750ns
# --          Added STOP Synchronous command 0x30
# --          Fixed bug that caused 160ns of 0 on output when
# --           entering default state
# -- 3139500C Added register START command that specifies MAIN
# -- 3139500D Masked sequencer start with sequencer busy to reject triggers
# --          when already running.
# -- 3139500E Added FPGA_VERSION to UserID in bitfile
# -- 31395011 Version with Bias thresholds moved into Generics, but not set differently
# -- 31395012 Version that fixes reset to not cause CCS to power down sensors or open bias switch.
# -- 313A5013 Nominally same as version 12, but refactored to use new build system and modern Vivado
# -- 313A5014 Major code refactor and bugfix for version 12 register address contention
# -- 313A5015 Update to support 6.4ns and 10ns system clocks
# -------------------------------------------------------------------------------

# Define Firmware Version Number (and don't forget to change the register values! :facepalm:)
export PRJ_VERSION = 0x313A5015

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
