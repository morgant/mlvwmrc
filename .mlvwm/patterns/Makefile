CONF_DIR	?=	.mlvwm
BUILD_DIR	?=	../../build
TEMP_DIR	?=	../../tmp
TEMP_PATTERNS	?=	$(TEMP_DIR)/patterns
PATTERNS_DIR	?=	$(CONF_DIR)/patterns

all: build

clean: clean-patterns clean-temp clean-build

build-init:
	-test ! -d $(TEMP_PATTERNS) && mkdir -p $(TEMP_PATTERNS)
	-test ! -d $(BUILD_DIR) && mkdir -p $(BUILD_DIR)

clean-temp:
	rm -r $(TEMP_PATTERNS)

clean-build:
	rm -r $(BUILD_DIR)/$(PATTERNS_DIR)

#
# Each desktop pattern or picture file fetched, converted, and installed into
# this directory by this Makefile **MUST**  be listed in this `build` target,
# the `clean-patterns` target, **AND** the `.gitignore` file in this same
# directory!
#
# The individual targets for each pattern or set can be found at the end of
# this file, sorted alphabetically by name. All files fetched remotely for the
# purpose of building the final pattern files **MUST** have a separate target
# to limit re-fetching for the purpose of limiting bandwidth and _especially_
# to prevent rate limiting during repeated builds.
#
build: build-init \
	mac-os-solid-colors \
	$(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background.jpg \
	$(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background-hi-res.png \
	$(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-default.png

clean-patterns: clean-mac-os-solid-colors
	rm $(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background.jpg
	rm $(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background-hi-res.png
	rm $(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-default.png

########################################################################
# Pattern Sets
########################################################################

# Mac OS Solid Colors
#
# **NOTE**: This is a good example of how to fetch and copy an entire pattern
# set, as opposed to the individual patterns below.
"$(TEMP_DIR)/Mac OS Solid Color Backgrounds.zip":
	curl -# -L https://imgur.com/a/9jYy0/zip \
		-o "$(TEMP_DIR)/Mac OS Solid Color Backgrounds.zip"

mac-os-solid-colors: "$(TEMP_DIR)/Mac OS Solid Color Backgrounds.zip"
	unzip -d $(BUILD_DIR)/$(PATTERNS_DIR) \
		"$(TEMP_DIR)/Mac OS Solid Color Backgrounds.zip"

clean-mac-os-solid-colors:
	# rm $(BUILD_DIR)/$(PATTERNS_DIR)/<INSERT FILE NAMES HERE!>
	rm "$(TEMP_DIR)/Mac OS Solid Color Backgrounds.zip"

########################################################################
# Desktop Patterns
########################################################################

#
# Mac OS Desktop Picture (Original)
#
$(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background.jpg:
	curl -# -L https://forums.macrumors.com/attachments/mac-os-background-jpg.61609 \
		-o $(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background.jpg

#
# Mac OS Desktop Picture (High Res)
#
$(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background-hi-res.png:
	curl -# -L https://wallpaperbat.com/img/250263-classic-mac-os-wallpaper.png \
		-o $(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-background-hi-res.png

#
# Mac OS Default Pattern (Original)
#
$(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-default.png:
	curl -# -L https://forums.macrumors.com/attachments/mac-os-default-png.61610 \
		-o $(BUILD_DIR)/$(PATTERNS_DIR)/mac-os-default.png
