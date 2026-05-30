all: install

SRC_DIR := $(shell realpath src)
CONFIG_DIR := $(shell realpath .)

RAW_SOURCES := $(shell find $(SRC_DIR) -type f \( -name "*.lua" -o -name "*.vim" \))
SOURCES := $(patsubst $(SRC_DIR)/%, $(CONFIG_DIR)/%, $(RAW_SOURCES))

$(CONFIG_DIR)/%.lua: $(SRC_DIR)/%.lua
	@mkdir -p $(dir $@)
	cp $< $@

$(CONFIG_DIR)/%.vim: $(SRC_DIR)/%.vim
	@mkdir -p $(dir $@)
	cp $< $@

.PHONY=sources
sources: $(SOURCES)
