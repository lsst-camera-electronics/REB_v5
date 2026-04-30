# check_logs.mk - Include this in each target's Makefile after system_vivado.mk
#  include ../../submodules/ruckus/system_vivado.mk
#  include ../check_logs.mk

# Checks the current target's build for timing and errors
# Uses PROJECT variable set by Ruckus

# Derive paths based on standard Vivado project structure
TIMING_RPT = $(IMPL_DIR)/$(PROJECT)_timing_summary_routed.rpt
ROUTE_STATUS = $(IMPL_DIR)/$(PROJECT)_route_status.rpt
RUNME_LOG = $(IMPL_DIR)/runme.log

.PHONY: check-log
check-log:
	@echo "Checking $(PROJECT)..."
	@ERROR=0; \
	if [ ! -d "$(IMPL_DIR)" ]; then \
		echo "  ⚠ No impl_1 directory found - build may not be complete"; \
		exit 0; \
	fi; \
	\
	if [ -f "$(TIMING_RPT)" ]; then \
		WNS=$$(awk '/^[[:space:]]*WNS\(ns\)/ {getline; getline; print $$1; exit}' "$(TIMING_RPT)" || echo "N/A"); \
		SETUP_FAILING=$$(awk '/^[[:space:]]*WNS\(ns\)/ {getline; getline; print $$3; exit}' "$(TIMING_RPT)" || echo "0"); \
		WHS=$$(awk '/^[[:space:]]*WNS\(ns\)/ {getline; getline; print $$5; exit}' "$(TIMING_RPT)" || echo "N/A"); \
		HOLD_FAILING=$$(awk '/^[[:space:]]*WNS\(ns\)/ {getline; getline; print $$7; exit}' "$(TIMING_RPT)" || echo "0"); \
		WPWS=$$(awk '/^[[:space:]]*WNS\(ns\)/ {getline; getline; print $$9; exit}' "$(TIMING_RPT)" || echo "N/A"); \
		\
		if grep -q "All user specified timing constraints are met" "$(TIMING_RPT)"; then \
			echo "  ✓ Timing: PASSED"; \
			echo "    WNS: $$WNS ns, WHS: $$WHS ns, WPWS: $$WPWS ns"; \
		elif grep -q "timing constraints are not met" "$(TIMING_RPT)"; then \
			echo "  ❌ Timing: FAILED"; \
			echo "    WNS: $$WNS ns ($$SETUP_FAILING failing endpoints)"; \
			echo "    WHS: $$WHS ns ($$HOLD_FAILING failing endpoints)"; \
			echo "    WPWS: $$WPWS ns"; \
			ERROR=1; \
		else \
			echo "  ⚠ Timing: Status unclear"; \
			echo "    WNS: $$WNS ns, WHS: $$WHS ns, WPWS: $$WPWS ns"; \
		fi; \
	else \
		echo "  ⚠ Timing: Report not found"; \
	fi; \
	\
	if [ -f "$(RUNME_LOG)" ]; then \
		ERRORS=$$(grep "^ERROR:" "$(RUNME_LOG)" | head -5 || true); \
		if [ -n "$$ERRORS" ]; then \
			echo "  ❌ Errors found:"; \
			echo "$$ERRORS" | sed 's/^/    /'; \
			ERROR=1; \
		fi; \
	fi; \
	exit $$ERROR
