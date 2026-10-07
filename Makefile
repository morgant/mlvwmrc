TEMP_DIR =	tmp
BUILD_DIR =	build
CONF_DIR =	.mlvwm
BIN_DIR =	bin
PIXMAP_DIR =	$(CONF_DIR)/pixmap
PATTERNS_DIR =	$(CONF_DIR)/patterns

build: build-init build-pixmaps build-patterns
	rsync -va \
		--exclude=".git/" \
		--exclude="Makefile" \
		--exclude=".gitignore" \
		$(CONF_DIR)/ \
		$(BUILD_DIR)/$(CONF_DIR)/
	rsync -va \
		--exclude=".git/" \
		--exclude=".gitignore" \
		$(BIN_DIR)/ \
		$(BUILD_DIR)/$(BIN_DIR)/
	find $(BUILD_DIR)/$(BIN_DIR) -type f -iname "mlvwm-*" \
		-exec chmod +x {} \;
	sed -i \
		's@/home2/tak/bin/pixmap@$(HOME)/$(PIXMAP_DIR)@g' \
		$(BUILD_DIR)/$(CONF_DIR)/.mlvwmrc

build-init:
	-test ! -d $(TEMP_DIR) && mkdir -p $(TEMP_DIR)
	-test ! -d $(BUILD_DIR) && mkdir -p $(BUILD_DIR)

install: install-archive install-bin
	install -o $(USER) -g $(USER) {$(BUILD_DIR),$(HOME)}/$(CONF_DIR)
	ln -fs $(HOME)/$(CONF_DIR)/.mlvwmrc $(HOME)/.mlvwmrc

install-bin:
	-test ! -d $(HOME)/$(BIN_DIR) && mkdir -p $(HOME)/$(BIN_DIR)
	install -m 700 -o $(USER) -g $(USER) \
		$(BUILD_DIR)/$(BIN_DIR)/mlvwm-* \
		$(HOME)/$(BIN_DIR)/

install-archive:
	-test -d $(HOME)/$(CONF_DIR) \
		&& mv $(HOME)/$(CONF_DIR){,.$(date +%Y%m%d-%H%M%S)}
	-test -d $(HOME)/$(BIN_DIR) \
		&& find $(HOME)/$(BIN_DIR) -type f -name "mlvwm-*" ! -name "*.*" \
			-exec mv {}{,.$(date +%Y%m%d-%H%M%S)} \;

clean: clean-pixmaps clean-patterns
	rm -r $(TEMP_DIR)
	rm -r $(BUILD_DIR)

# For copyright and distribution reasons, it is preferred that application
# icons (i.e. pixmaps) are fetched and copied into `.mlvwm/pixmap/` instead of
# being committed to this repository. This is handled by the `Makefile` and
# `.gitignore` files in the `.mlvwm/pixmap/` directory.
build-pixmaps:
	-test ! -d $(BUILD_DIR)/$(PIXMAP_DIR) \
		&& mkdir -p $(BUILD_DIR)/$(PIXMAP_DIR)
	cd $(PIXMAP_DIR) && make
	cd -

clean-pixmaps:
	cd $(PIXMAP_DIR) && make clean
	cd -

# For copyright and distribution reasons, it is preferred that desktop
# patterns are fetched and copied into `.mlvwm/patterns/` instead of being
# committed to this repository. This is handled by the `Makefile` and
# `.gitignore` files in the `.mlvwm/patterns/` directory.
build-patterns:
	cd $(PATTERNS_DIR) && make
	cd -

clean-patterns:
	cd $(PATTERNS_DIR) && make clean
	cd -
