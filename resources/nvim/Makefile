define HAXE
	docker run --rm \
		--volume "$(shell pwd)":/src \
		--workdir /src \
		haxe:4.2.5-bookworm sh -c "$(strip $(1))"
endef

all:
	@$(MAKE) install
	@$(MAKE) build

.PHONY=build
build:
	@$(call HAXE, haxe build.hxml)

.PHONY=install
install:
	@echo "Installing dependencies"
	@$(call HAXE, haxelib git hxnvim https://github.com/Tolomeo/hxnvim.git main)
	@$(call HAXE, haxelib newrepo || true && haxelib install --always build.hxml)
