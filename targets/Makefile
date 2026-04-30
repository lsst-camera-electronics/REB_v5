# List of subdirectories
SUBDIRS := $(wildcard */)

# Default target
all: $(SUBDIRS)

# Phony targets
.PHONY: all check-logs $(SUBDIRS)

# Rule to build each subdirectory
$(SUBDIRS):
	@cd $@ && $(MAKE) $(MAKECMDGOALS)

# Check logs across all targets
check-logs:
	@echo "========================================================"
	@echo "Checking all Vivado builds for timing and errors..."
	@echo "========================================================"
	@ERROR=0; \
	for dir in $(SUBDIRS); do \
		if [ -f "$$dir/Makefile" ]; then \
			(cd $$dir && $(MAKE) check-log) || ERROR=1; \
		fi; \
	done; \
	echo ""; \
	echo "========================================================"; \
	if [ $$ERROR -eq 0 ]; then \
		echo "✓ All checks passed"; \
	else \
		echo "❌ FAILURES DETECTED"; \
	fi; \
	echo "========================================================"; \
	exit $$ERROR

# Pass all targets to subdirectories
%:
	@for dir in $(SUBDIRS); do \
		(cd $$dir && $(MAKE) $@); \
	done
