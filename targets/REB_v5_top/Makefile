
# Define target output
target: bit prom multiboot

# Define target part
export PRJ_PART = XC7K160TFFG676-1

# List of build core directories.
export MODULE_DIRS = $(PROJ_DIR)/../../modules/LSST_common/ADC_data_handler_v4 \
                     $(PROJ_DIR)/../../modules/LSST_common/BRS \
                     $(PROJ_DIR)/../../modules/LSST_common/LSST_basic_elements \
                     $(PROJ_DIR)/../../modules/LSST_common/SPI \
                     $(PROJ_DIR)/../../modules/LSST_common/ad7794_temp_sens \
		     $(PROJ_DIR)/../../modules/LSST_common/ads8634_and_mux \
                     $(PROJ_DIR)/../../modules/LSST_common/adt7420_multiread \
                     $(PROJ_DIR)/../../modules/LSST_common/aspic_3_program \
                     $(PROJ_DIR)/../../modules/LSST_common/command_interpreter \
                     $(PROJ_DIR)/../../modules/LSST_common/dcm_user_clk \
                     $(PROJ_DIR)/../../modules/LSST_common/dual_ad53xx \
                     $(PROJ_DIR)/../../modules/LSST_common/led_blink \
                     $(PROJ_DIR)/../../modules/LSST_common/ltc2945_V_I_sensors \
                     $(PROJ_DIR)/../../modules/LSST_common/mon_xadc \
                     $(PROJ_DIR)/../../modules/LSST_common/multiboot \
                     $(PROJ_DIR)/../../modules/LSST_common/onewire_iface \
		     $(PROJ_DIR)/../../modules/LSST_common/clk_2MHz_gen \
                     $(PROJ_DIR)/../../modules/LSST_common/seq_aligner_shifter \
                     $(PROJ_DIR)/../../modules/LSST_common/sequencer_v3 \
		     $(PROJ_DIR)/../../modules/LSST_common/si5342_jitter_cleaner \
		     $(PROJ_DIR)/../../modules/LSST_common/lsst_sci-master-v38 \
		     $(PROJ_DIR)/../../modules/LSST_common/sync_cmd_decoder \
		     $(PROJ_DIR)/../../modules/LSST_common/REB_interrupt \
		     $(PROJ_DIR)/../../modules/StdLib  \
		     $(PROJ_DIR)/../../modules/MgtLib/gtx7  \
                     $(PROJ_DIR)/../../modules/pgp2b/core \
                     $(PROJ_DIR)/../../modules/pgp2b/gtx7 \
		     $(PROJ_DIR)

#		     $(PROJ_DIR)/../../modules/LSST_common/lsst_sim/firmware/modules/lsst_sci/ \
		     $(PROJ_DIR)/../../modules/LSST_common/lsst_sim/firmware/modules/StdLib  \
		     $(PROJ_DIR)/../../modules/LSST_common/lsst_sim/firmware/modules/MgtLib/gtx7  \
		     $(PROJ_DIR)/../../modules/LSST_common/lsst_sim/firmware/modules/VcLib  \
                     $(PROJ_DIR)/../../modules/LSST_common/lsst_sim/firmware/modules/pgp2/core \
                     $(PROJ_DIR)/../../modules/LSST_common/lsst_sim/firmware/modules/pgp2/gtx7 \
		     $(PROJ_DIR)

#$(PROJ_DIR)/../../modules/LSST_common/ADC_data_handler_v4 \
                     $(PROJ_DIR)/../../modules/LSST_common/BRS \
                     $(PROJ_DIR)/../../modules/LSST_common/LSST_basic_elements \
                     $(PROJ_DIR)/../../modules/LSST_common/SPI \
                     $(PROJ_DIR)/../../modules/LSST_common/ad7794_temp_sens \
		     $(PROJ_DIR)/../../modules/LSST_common/ads8634_and_mux \
                     $(PROJ_DIR)/../../modules/LSST_common/adt7420_multiread \
                     $(PROJ_DIR)/../../modules/LSST_common/aspic_3_program \
                     $(PROJ_DIR)/../../modules/LSST_common/command_interpreter \
                     $(PROJ_DIR)/../../modules/LSST_common/dcm_user_clk \
                     $(PROJ_DIR)/../../modules/LSST_common/dual_ad53xx \
                     $(PROJ_DIR)/../../modules/LSST_common/led_blink \
                     $(PROJ_DIR)/../../modules/LSST_common/ltc2945_V_I_sensors \
                     $(PROJ_DIR)/../../modules/LSST_common/mon_xadc \
                     $(PROJ_DIR)/../../modules/LSST_common/multiboot \
                     $(PROJ_DIR)/../../modules/LSST_common/onewire_iface \
		     $(PROJ_DIR)/../../modules/LSST_common/clk_2MHz_gen \
                     $(PROJ_DIR)/../../modules/LSST_common/seq_aligner_shifter \
                     $(PROJ_DIR)/../../modules/LSST_common/sequencer_v3 \
		     $(PROJ_DIR)/../../modules/LSST_common/lsst_sci-master \
		     $(PROJ_DIR)/../../modules/StdLib  \
		     $(PROJ_DIR)/../../modules/MgtLib/gtx7  \
		     $(PROJ_DIR)/../../modules/VcLib  \
                     $(PROJ_DIR)/../../modules/pgp2/core \
                     $(PROJ_DIR)/../../modules/pgp2/gtx7/ \
		     $(PROJ_DIR)
#		    

# Use top level makefile
include ../../modules/StdLib/build/system_vivado_v1.mk

###############################################################
#### multiboot #####################################################
###############################################################
$(IMAGES_DIR)/$(PROJECT)_$(PRJ_VERSION)_multiboot.mcs: $(IMAGES_DIR)/$(PROJECT)_$(PRJ_VERSION).mcs
	$(call ACTION_HEADER,"PROM Multiboot Generate")
	@cd $(OUT_DIR); vivado -mode batch -source $(VIVADO_DIR)/mcs_jump_maker.tcl
	@echo ""
	@echo "Multiboot Prom file copied to $@"
	@echo "Don't forget to 'svn commit' when the image is stable!"

.PHONY      : multiboot
multiboot   : bit $(IMAGES_DIR)/$(PROJECT)_$(PRJ_VERSION)_multiboot.mcs