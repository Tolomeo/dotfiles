TARGET_DIR := $(shell realpath .)
SRC_DIR := $(shell realpath src)
SRC_RAW_DIR := $(SRC_DIR)/raw

all: install

RAW_SOURCES := $(shell find $(SRC_RAW_DIR) -type f \( -name "*.lua" -o -name "*.vim" \))
RAW_TARGETS := $(patsubst $(SRC_RAW_DIR)/%, $(TARGET_DIR)/%, $(RAW_SOURCES))

$(TARGET_DIR)/%.lua: $(SRC_RAW_DIR)/%.lua
	@mkdir -p $(dir $@)
	cp $< $@

$(TARGET_DIR)/%.vim: $(SRC_RAW_DIR)/%.vim
	@mkdir -p $(dir $@)
	cp $< $@

.PHONY=copy-raw
copy-raw: $(RAW_TARGETS)

.PHONY=build
build:
	@$(MAKE) copy-raw

.PHONY=install
install:
	@echo "Installing dependencies"
	haxelib newrepo
	haxelib install --always build.hxml
	@$(MAKE) sources
