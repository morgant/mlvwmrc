CONF_DIR	?=	.mlvwm
BUILD_DIR	?=	../../build
TEMP_DIR	?=	../../tmp
TEMP_PIXMAP	?=	$(TEMP_DIR)/pixmap
PIXMAP_DIR	?=	$(CONF_DIR)/pixmap

all: build

clean: clean-pixmap clean-temp clean-build

build-init:
	-test ! -d $(TEMP_PIXMAP) && mkdir -p $(TEMP_PIXMAP)
	-test ! -d $(BUILD_DIR) && mkdir -p $(BUILD_DIR)

clean-temp:
	rm -r $(TEMP_PIXMAP)

clean-build:
	rm -r $(BUILD_DIR)/$(PIXMAP_DIR)

#
# Each .xpm icon (i.e. pixmap) file fetched, converted, and installed into
# this directory by this Makefile **MUST**  be listed in this `build` target,
# the `clean-pixmap` target, **AND** the `.gitignore` file in this same
# directory!
#
# The individual targets for each icon/pixmap can be found at the end of this
# file, sorted alphabetically by application name. All files fetched remotely
# for the purpose of building the final .xpm file **MUST** have a separate
# target to limit re-fetching for the purpose of limiting bandwidth and
# _especially_ to prevent rate limiting during repeated builds.
#
build: build-init \
	mini-icons \
	$(BUILD_DIR)/$(PIXMAP_DIR)/0ad.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/audacity.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/chromium.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/claws-mail.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/cool-retro-term.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/firefox.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/geeqie.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/gkrellm.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/godot.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/iridium.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/kid3.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/leafpad.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/links.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/lmms.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/mpv.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/netsurf.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/qemu.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/scummvm.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/simsu.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/smplayer.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/solvespace.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/vimb.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/vlc.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/vym.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/xpdfreader.xpm \
	$(BUILD_DIR)/$(PIXMAP_DIR)/zeal.xpm

clean-pixmap: clean-mini-icons
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/0ad.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/audacity.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/chromium.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/claws-mail.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/cool-retro-term.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/firefox.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/geeqie.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/gkrellm.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/godot.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/iridium.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/kid3.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/leafpad.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/links.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/lmms.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/mpv.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/netsurf.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/qemu.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/scummvm.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/simsu.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/smplayer.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/solvespace.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/vimb.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/vlc.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/vym.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/xpdfreader.xpm
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/zeal.xpm

########################################################################
# Icon Sets
########################################################################

# The default "Mini Icons" set, as originally provided for use with MLVWM
#
# **NOTE**: This is a good example of how to fetch and copy an entire .xpm
# icon set, as opposed to the individual application icons below.
$(TEMP_PIXMAP)/mini-icons.tar.gz:
	curl -# -L http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/mini-icons.tar.gz \
		-o $(TEMP_PIXMAP)/mini-icons.tar.gz

mini-icons: $(TEMP_PIXMAP)/mini-icons.tar.gz
	tar -C $(BUILD_DIR)/$(PIXMAP_DIR) -xzf $(TEMP_PIXMAP)/mini-icons.tar.gz

clean-mini-icons:
	rm $(BUILD_DIR)/$(PIXMAP_DIR)/mini*.xpm
	rm $(TEMP_PIXMAP)/mini-icons.tar.gz

########################################################################
# Application Icons
########################################################################

#
# 0 A.D. (Game)
#
$(BUILD_DIR)/$(PIXMAP_DIR)/0ad.xpm:
	convert https://play0ad.com/favicon.ico \
		$(BUILD_DIR)/$(PIXMAP_DIR)/0ad.xpm

#
# Audacity (Audio)
#
$(TEMP_PIXMAP)/audacity.svg:
	curl -# -L https://raw.githubusercontent.com/audacity/audacity/master/images/audacity.svg \
		-o $(TEMP_PIXMAP)/audacity.svg

$(BUILD_DIR)/$(PIXMAP_DIR)/audacity.xpm: $(TEMP_PIXMAP)/audacity.svg
	convert -background transparent \
		$(TEMP_PIXMAP)/audacity.svg \
		-resize 16x16\> \
		$(BUILD_DIR)/$(PIXMAP_DIR)/audacity.xpm

#
# Chrome/Chromium (Browser)
#
$(BUILD_DIR)/$(PIXMAP_DIR)/chromium.xpm:
	convert https://www.chromium.org/favicon.ico \
		$(BUILD_DIR)/$(PIXMAP_DIR)/chromium.xpm

#
# Claws-Mail (Email)
#
$(TEMP_PIXMAP)/claws-mail-favicon.ico:
	curl -# -L https://claws-mail.org/favicon.ico \
		-o $(TEMP_PIXMAP)/claws-mail-favicon.ico

$(BUILD_DIR)/$(PIXMAP_DIR)/claws-mail.xpm: $(TEMP_PIXMAP)/claws-mail-favicon.ico
	convert $(TEMP_PIXMAP)/claws-mail-favicon.ico \
		$(BUILD_DIR)/$(PIXMAP_DIR)/claws-mail.xpm

#
# Cool-Retro-Term (i.e. CRT; Terminal)
#
$(TEMP_PIXMAP)/cool-retro-term.png:
	curl -# -L https://raw.githubusercontent.com/Swordfish90/cool-retro-term/master/app/icons/32x32/cool-retro-term.png \
		-o $(TEMP_PIXMAP)/cool-retro-term.png

$(BUILD_DIR)/$(PIXMAP_DIR)/cool-retro-term.xpm: $(TEMP_PIXMAP)/cool-retro-term.png
	convert $(TEMP_PIXMAP)/cool-retro-term.png \
		-resize 16x16\> \
		$(BUILD_DIR)/$(PIXMAP_DIR)/cool-retro-term.xpm

#
# Firefox (Browser)
#
$(TEMP_PIXMAP)/firefox.png:
	curl -# -L https://hg-edge.mozilla.org/mozilla-central/raw-file/default/browser/branding/official/default16.png \
		-o $(TEMP_PIXMAP)/firefox.png

$(BUILD_DIR)/$(PIXMAP_DIR)/firefox.xpm: $(TEMP_PIXMAP)/firefox.png
	convert $(TEMP_PIXMAP)/firefox.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/firefox.xpm

#
# Geeqie (Image Browser)
#
$(TEMP_PIXMAP)/geeqie.svg:
	curl -# -L https://raw.githubusercontent.com/BestImageViewer/geeqie/master/data/icons/geeqie.svg \
		-o $(TEMP_PIXMAP)/geeqie.svg

$(BUILD_DIR)/$(PIXMAP_DIR)/geeqie.xpm: $(TEMP_PIXMAP)/geeqie.svg
	convert -background transparent \
		$(TEMP_PIXMAP)/geeqie.svg \
		-resize 16x16\> \
		$(BUILD_DIR)/$(PIXMAP_DIR)/geeqie.xpm

#
# GKrellM (Utility)
#
$(TEMP_PIXMAP)/gkrellm.png:
	curl -# -L https://git.srcbox.net/gkrellm/gkrellm/raw/branch/master/data/icons/16/gkrellm.png \
		-o $(TEMP_PIXMAP)/gkrellm.png

$(BUILD_DIR)/$(PIXMAP_DIR)/gkrellm.xpm: $(TEMP_PIXMAP)/gkrellm.png
	convert $(TEMP_PIXMAP)/gkrellm.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/gkrellm.xpm

#
# Godot (Engine/Editor)
#
$(TEMP_PIXMAP)/godot.png:
	curl -# -L https://raw.githubusercontent.com/godotengine/godot/master/main/app_icon.png \
		-o $(TEMP_PIXMAP)/godot.png

$(BUILD_DIR)/$(PIXMAP_DIR)/godot.xpm: $(TEMP_PIXMAP)/godot.png
	convert $(TEMP_PIXMAP)/godot.png \
		-resize 16x16\> \
		$(BUILD_DIR)/$(PIXMAP_DIR)/godot.xpm

#
# Iridium (Browser)
#
$(TEMP_PIXMAP)/iridium-favicon.ico:
	curl -# -L https://iridiumbrowser.de/favicon.ico \
		-o $(TEMP_PIXMAP)/iridium-favicon.ico

$(BUILD_DIR)/$(PIXMAP_DIR)/iridium.xpm: $(TEMP_PIXMAP)/iridium-favicon.ico
	convert $(TEMP_PIXMAP)/iridium-favicon.ico[2] \
		$(BUILD_DIR)/$(PIXMAP_DIR)/iridium.xpm

#
# Kid3 (Multimedia Tagger)
#
$(TEMP_PIXMAP)/kid3.png:
	curl -# -L "https://invent.kde.org/multimedia/kid3/-/raw/master/src/app/16-apps-kid3.png?ref_type=heads&inline=false" \
		-o $(TEMP_PIXMAP)/kid3.png

$(BUILD_DIR)/$(PIXMAP_DIR)/kid3.xpm: $(TEMP_PIXMAP)/kid3.png
	convert $(TEMP_PIXMAP)/kid3.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/kid3.xpm

#
# Leafpad (Text Editor)
#
$(TEMP_PIXMAP)/leafpad.png:
	curl -# -L https://raw.githubusercontent.com/tarot231/leafpad/main/data/icons/16x16/leafpad.png \
		-o $(TEMP_PIXMAP)/leafpad.png

$(BUILD_DIR)/$(PIXMAP_DIR)/leafpad.xpm: $(TEMP_PIXMAP)/leafpad.png
	convert $(TEMP_PIXMAP)/leafpad.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/leafpad.xpm

#
# Links (Browser)
#
$(TEMP_PIXMAP)/links-2.29.tar.gz:
	curl -# -L http://links.twibright.com/download/links-2.29.tar.gz \
		-o $(TEMP_PIXMAP)/links-2.29.tar.gz

$(BUILD_DIR)/$(PIXMAP_DIR)/links.xpm: $(TEMP_PIXMAP)/links-2.29.tar.gz
	tar -xzf $(TEMP_PIXMAP)/links-2.29.tar.gz -C $(TEMP_PIXMAP) \
		links-2.29/linkswin.ico
	convert $(TEMP_PIXMAP)/links-2.29/linkswin.ico[0] \
		$(BUILD_DIR)/$(PIXMAP_DIR)/links.xpm


#
# LMMS (Audio)
#
$(TEMP_PIXMAP)/lmms.ico:
	curl -# -L https://lmms.io/favicon.ico \
		-o $(TEMP_PIXMAP)/lmms.ico

$(BUILD_DIR)/$(PIXMAP_DIR)/lmms.xpm: $(TEMP_PIXMAP)/lmms.ico
	convert $(TEMP_PIXMAP)/lmms.ico[1] \
		$(BUILD_DIR)/$(PIXMAP_DIR)/lmms.xpm

#
# MPV (Media Player)
#
$(TEMP_PIXMAP)/mpv.png:
	curl -# -L https://raw.githubusercontent.com/mpv-player/mpv.io/master/source/images/favicon.png \
		-o $(TEMP_PIXMAP)/mpv.png

$(BUILD_DIR)/$(PIXMAP_DIR)/mpv.xpm: $(TEMP_PIXMAP)/mpv.png
	convert $(TEMP_PIXMAP)/mpv.png \
		-resize 16x16\> \
		$(BUILD_DIR)/$(PIXMAP_DIR)/mpv.xpm

#
# NetSurf (Browser)
#
$(TEMP_PIXMAP)/netsurf-favicon.png:
	curl -# -L https://www.netsurf-browser.org/webimages/favicon.png \
		-o $(TEMP_PIXMAP)/netsurf-favicon.png

$(BUILD_DIR)/$(PIXMAP_DIR)/netsurf.xpm: $(TEMP_PIXMAP)/netsurf-favicon.png
	convert $(TEMP_PIXMAP)/netsurf-favicon.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/netsurf.xpm

#
# QEMU (Emulator)
#
$(TEMP_PIXMAP)/qemu.png:
	curl -# -L "https://gitlab.com/qemu-project/qemu/-/raw/master/ui/icons/qemu_16x16.png?ref_type=heads&inline=false" \
		-o $(TEMP_PIXMAP)/qemu.png

$(BUILD_DIR)/$(PIXMAP_DIR)/qemu.xpm: $(TEMP_PIXMAP)/qemu.png
	convert $(TEMP_PIXMAP)/qemu.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/qemu.xpm

#
# ScummVM (Emulator)
#
$(TEMP_PIXMAP)/scummvm.ico:
	curl -# -L https://raw.githubusercontent.com/scummvm/scummvm/master/icons/scummvm.ico \
		-o $(TEMP_PIXMAP)/scummvm.ico

$(BUILD_DIR)/$(PIXMAP_DIR)/scummvm.xpm: $(TEMP_PIXMAP)/scummvm.ico
	convert $(TEMP_PIXMAP)/scummvm.ico[8] \
		-resize 16x16\> \
		$(BUILD_DIR)/$(PIXMAP_DIR)/scummvm.xpm
#
# Simsu (Game)
#
$(TEMP_PIXMAP)/simsu-1.4.8.tar.bz2:
	curl -# -L https://gottcode.org/simsu/download/?os=source \
		-o $(TEMP_PIXMAP)/simsu-1.4.8.tar.bz2

$(BUILD_DIR)/$(PIXMAP_DIR)/simsu.xpm: $(TEMP_PIXMAP)/simsu-1.4.8.tar.bz2
	tar -xjf $(TEMP_PIXMAP)/simsu-1.4.8.tar.bz2 -C $(TEMP_PIXMAP) \
		simsu-1.4.8/icons/hicolor/16x16/apps/simsu.png
	convert $(TEMP_PIXMAP)/simsu-1.4.8/icons/hicolor/16x16/apps/simsu.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/simsu.xpm

#
# SMPlayer (Media Player)
#
$(TEMP_PIXMAP)/smplayer.png:
	curl -# -L https://raw.githubusercontent.com/smplayer-dev/smplayer/master/icons/smplayer_icon16.png \
		-o $(TEMP_PIXMAP)/smplayer.png

$(BUILD_DIR)/$(PIXMAP_DIR)/smplayer.xpm: $(TEMP_PIXMAP)/smplayer.png
	convert $(TEMP_PIXMAP)/smplayer.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/smplayer.xpm

#
# SolveSpace (CAD)
#
$(TEMP_PIXMAP)/solvespace.png:
	curl -# -L https://raw.githubusercontent.com/solvespace/solvespace/master/res/freedesktop/solvespace-16x16.png \
		-o $(TEMP_PIXMAP)/solvespace.png

$(BUILD_DIR)/$(PIXMAP_DIR)/solvespace.xpm: $(TEMP_PIXMAP)/solvespace.png
	convert $(TEMP_PIXMAP)/solvespace.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/solvespace.xpm

#
# Vimb (Browser)
#
$(TEMP_PIXMAP)/vimb.png:
	curl -# -L https://raw.githubusercontent.com/morgant/vimb-icon/master/.github/images/vimb-transparent-512x512.png \
		-o $(TEMP_PIXMAP)/vimb.png

$(BUILD_DIR)/$(PIXMAP_DIR)/vimb.xpm: $(TEMP_PIXMAP)/vimb.png
	convert $(TEMP_PIXMAP)/vimb.png \
		-resize 16x16\> \
		$(BUILD_DIR)/$(PIXMAP_DIR)/vimb.xpm

#
# VLC (Media Player)
#
$(BUILD_DIR)/$(PIXMAP_DIR)/vlc.xpm:
	curl -# -L https://raw.githubusercontent.com/videolan/vlc/master/share/icons/16x16/vlc.xpm \
		-o $(BUILD_DIR)/$(PIXMAP_DIR)/vlc.xpm

#
# VYM (Editor)
#
$(BUILD_DIR)/$(PIXMAP_DIR)/vym.xpm:
	curl -# -L https://raw.githubusercontent.com/insilmaril/vym/develop/icons/vym.xpm \
		-o $(BUILD_DIR)/$(PIXMAP_DIR)/vym.xpm

#
# XPDFReader (Editor)
#
$(TEMP_PIXMAP)/xpdfreader-favicon.ico:
	curl -# -L https://www.xpdfreader.com/img/favicon.ico \
		-o $(TEMP_PIXMAP)/xpdfreader-favicon.ico

$(BUILD_DIR)/$(PIXMAP_DIR)/xpdfreader.xpm: $(TEMP_PIXMAP)/xpdfreader-favicon.ico
	convert $(TEMP_PIXMAP)/xpdfreader-favicon.ico[0] \
		$(BUILD_DIR)/$(PIXMAP_DIR)/xpdfreader.xpm

#
# Zeal (Documentation/Browser)
#
$(TEMP_PIXMAP)/zeal.png:
	curl -# -L https://raw.githubusercontent.com/zealdocs/zeal/main/assets/freedesktop/16-apps-zeal.png \
		-o $(TEMP_PIXMAP)/zeal.png

$(BUILD_DIR)/$(PIXMAP_DIR)/zeal.xpm: $(TEMP_PIXMAP)/zeal.png
	convert $(TEMP_PIXMAP)/zeal.png \
		$(BUILD_DIR)/$(PIXMAP_DIR)/zeal.xpm
