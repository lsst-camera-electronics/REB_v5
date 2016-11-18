
# Define target output
target: bit

# Define target part
export PRJ_PART = XC7K160TFFG676-1

# List of build core directories.
export MODULE_DIRS = $(PROJ_DIR)/../../modules/StdLib  \
		     $(PROJ_DIR)/../../modules/MgtLib/gtx7  \
		     $(PROJ_DIR)/../../modules/VcLib  \
                     $(PROJ_DIR)/../../modules/pgp2/core \
                     $(PROJ_DIR)/../../modules/pgp2/gtx7 \
                     $(PROJ_DIR)/../../modules/lsst_sci \
                     $(PROJ_DIR)/../../modules/lsst_sci/gtx7 \
                     $(PROJ_DIR)/../../modules/raft_sim \
                     $(PROJ_DIR)

# Use top level makefile
include ../../modules/StdLib/build/system_vivado_v1.mk

