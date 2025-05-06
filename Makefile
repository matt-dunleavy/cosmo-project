# Default compiler selection - can be overridden with TOOLCHAIN=gcc|clang|cosmo
TOOLCHAIN ?= auto

# Installation prefix - can be overridden, e.g., make PREFIX=/usr/local install
PREFIX ?= $(HOME)/.local
DESTDIR ?=

# Determine compiler based on TOOLCHAIN value
ifeq ($(TOOLCHAIN), gcc)
    CC = gcc
    DEBUGGER = gdb
else ifeq ($(TOOLCHAIN), clang)
    CC = clang
    DEBUGGER = lldb
else ifeq ($(TOOLCHAIN), cosmo)
    CC = cosmocc
    CFLAGS_EXTRA = -DAPE=1 -O2
    DEBUGGER = lldb
else ifeq ($(TOOLCHAIN), auto)
    # Auto-detect available compiler - defaulting to cosmocc
    CC = cosmocc
    CFLAGS_EXTRA = -DAPE=1 -O2
    DEBUGGER = lldb
else
    $(error Unknown toolchain: $(TOOLCHAIN). Use 'gcc', 'clang', 'cosmo', or 'auto')
endif

# Common flags
# -MMD generates dependency files (.d)
# -MP ensures dummy targets for headers are created, preventing errors if a header is deleted
CFLAGS = -std=c23 -Wall -Wextra -pedantic -g -MMD -MP $(CFLAGS_EXTRA)
INCLUDE = -Iinclude
SRC_DIR = src
BUILD_DIR = build/$(TOOLCHAIN)
BIN_DIR = bin
TARGET = $(BIN_DIR)/cosmo-project
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))
DEPS = $(OBJS:.o=.d) # Dependency files

# Check if source files exist
ifneq ($(SRCS),)
all: directories $(TARGET)
else
all:
	@echo "No source files found in $(SRC_DIR). Nothing to build."
	@exit 1
endif

directories:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(BIN_DIR)

# Compile
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

# Link
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) -o $(TARGET)

# Clean - Remove build artifacts and the target binary directory
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Rebuild
rebuild: clean all

# Run
run: all
	$(TARGET)

# Install the binary to $(DESTDIR)$(PREFIX)/bin
install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp $(TARGET) $(DESTDIR)$(PREFIX)/bin/$(notdir $(TARGET))
	chmod +x $(DESTDIR)$(PREFIX)/bin/$(notdir $(TARGET))

# Uninstall the binary from $(DESTDIR)$(PREFIX)/bin
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(notdir $(TARGET))

# Debug
debug: all
	$(DEBUGGER) $(TARGET)

# Show the current toolchain configuration
info:
	@echo "Current configuration:"
	@echo "  Compiler: $(CC)"
	@echo "  Debugger: $(DEBUGGER)"
	@echo "  CFLAGS: $(CFLAGS)"
	@echo "  Build directory: $(BUILD_DIR)"
	@echo "  Target binary: $(TARGET)"

# Include dependency files, suppressing errors if they don't exist yet
-include $(DEPS)

.PHONY: all directories clean rebuild run debug info
