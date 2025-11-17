# List of subdirectories
SUBDIRS := $(wildcard */)

# Default target
all: $(SUBDIRS)

# Phony target for subdirectories
.PHONY: $(SUBDIRS)

# Rule to build each subdirectory
$(SUBDIRS):
	@cd $@ && $(MAKE) $(MAKECMDGOALS)

# Pass all targets to subdirectories
%:
	@for dir in $(SUBDIRS); do \
		(cd $$dir && $(MAKE) $@); \
	done

.PHONY: all