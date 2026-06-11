TARGET_DIR := $(shell realpath .)
SRC_DIR := $(shell realpath src)
SRC_RAW_DIR := $(SRC_DIR)/raw

define HAXE
	docker run --rm \
		--volume "$(shell pwd)":/src \
		--workdir /src \
		haxe:4.2-alpine sh -c "$(strip $(1))"
endef

all:
	@$(MAKE) install
	@$(MAKE) build

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
build: copy-raw
	@$(MAKE) copy-raw
	@$(call HAXE, haxe build.hxml)

.PHONY=install
install:
	@echo "Installing dependencies"
	@$(call HAXE, haxelib newrepo || true && haxelib install --always build.hxml)
	@$(MAKE) copy-raw
