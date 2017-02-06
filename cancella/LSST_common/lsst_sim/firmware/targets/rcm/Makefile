
# Define target output
target: bit prom

export CHIPSCOPE_INSERTER_EN 1

# Define target part
export PRJ_PART = XC5VFX30TFF665-1

# List of build core directories.
export MODULE_DIRS = $(PROJ_DIR)/../../modules/StdLib  \
		     $(PROJ_DIR)/../../modules/MgtLib/gtp  \
		     $(PROJ_DIR)/../../modules/VcLib  \
                     $(PROJ_DIR)/../../modules/pgp2/core \
                     $(PROJ_DIR)/../../modules/pgp2/gtp \
                     $(PROJ_DIR)/../../modules/lsst_sci \
                     $(PROJ_DIR)/../../modules/lsst_sci/gtp \
                     $(PROJ_DIR)/../../modules/raft_sim \
                     $(PROJ_DIR)

# Use top level makefile
include ../../modules/StdLib/build/system_ise_v1.mk
