CONF		?=	../
TEMP		?=	$(CONF)/../tmp
TEMP_PIXMAP	?=	$(TEMP)/pixmap
PIXMAP		?=	$(CONF)/pixmap

all: build

clean: clean-pixmap clean-temp

temp:
	mkdir -p $(TEMP_PIXMAP)

clean-temp:
	rm -r $(TEMP_PIXMAP)

#
# Each .xpm icon (i.e. pixmap) file fetched, converted, and installed into
# this directory by # this Makefile **MUST**  be listed in this `build`
# target, the `clean-pixmap` target, **AND** the `.gitignore` file in this
# same directory!
#
# The individual targets for each icon/pixmap can be found at the end of this
# file, sorted alphabetically by application name. All files fetched remotely
# for the purpose of building the final .xpm file **MUST** have a separate
# target to limit re-fetching for the purpose of limiting bandwidth and
# _especially_ to prevent rate limiting during repeated builds.
#
build: temp \
	mini-icons \
	$(PIXMAP)/0ad.xpm \
	$(PIXMAP)/audacity.xpm \
	$(PIXMAP)/chromium.xpm \
	$(PIXMAP)/claws-mail.xpm \
	$(PIXMAP)/cool-retro-term.xpm \
	$(PIXMAP)/firefox.xpm \
	$(PIXMAP)/gkrellm.xpm \
	$(PIXMAP)/godot.xpm \
	$(PIXMAP)/iridium.xpm \
	$(PIXMAP)/leafpad.xpm \
	$(PIXMAP)/links.xpm \
	$(PIXMAP)/mpv.xpm \
	$(PIXMAP)/netsurf.xpm \
	$(PIXMAP)/qemu.xpm \
	$(PIXMAP)/scummvm.xpm \
	$(PIXMAP)/smplayer.xpm \
	$(PIXMAP)/solvespace.xpm \
	$(PIXMAP)/vimb.xpm \
	$(PIXMAP)/vlc.xpm \
	$(PIXMAP)/xpdfreader.xpm \
	$(PIXMAP)/zeal.xpm

clean-pixmap: clean-mini-icons
	rm $(PIXMAP)/0ad.xpm
	rm $(PIXMAP)/audacity.xpm
	rm $(PIXMAP)/chromium.xpm
	rm $(PIXMAP)/claws-mail.xpm
	rm $(PIXMAP)/cool-retro-term.xpm
	rm $(PIXMAP)/firefox.xpm
	rm $(PIXMAP)/gkrellm.xpm
	rm $(PIXMAP)/godot.xpm
	rm $(PIXMAP)/iridium.xpm
	rm $(PIXMAP)/leafpad.xpm
	rm $(PIXMAP)/links.xpm
	rm $(PIXMAP)/mpv.xpm
	rm $(PIXMAP)/netsurf.xpm
	rm $(PIXMAP)/qemu.xpm
	rm $(PIXMAP)/scummvm.xpm
	rm $(PIXMAP)/smplayer.xpm
	rm $(PIXMAP)/solvespace.xpm
	rm $(PIXMAP)/vimb.xpm
	rm $(PIXMAP)/vlc.xpm
	rm $(PIXMAP)/xpdfreader.xpm
	rm $(PIXMAP)/zeal.xpm

########################################################################
# Icon Sets
########################################################################

# The default "Mini Icons" set, as originally provided for use with MLVWM
#
# **NOTE**: This is a good example of how to fetch and copy an entire .xpm
# icon set, as opposed to the individual application icons below.
$(TEMP_PIXMAP)/mini-icons.tar.gz:
	curl -# -L http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/mini-icons.tar.gz -o $(TEMP_PIXMAP)/mini-icons.tar.gz

mini-icons: $(TEMP_PIXMAP)/mini-icons.tar.gz
	tar -C $(PIXMAP) -xzf $(TEMP_PIXMAP)/mini-icons.tar.gz

clean-mini-icons:
	rm $(PIXMAP)/mini*.xpm
	rm $(TEMP_PIXMAP)/mini-icons.tar.gz

########################################################################
# Application Icons
########################################################################

#
# 0 A.D. (Game)
#
$(PIXMAP)/0ad.xpm:
	convert https://play0ad.com/favicon.ico $(PIXMAP)/0ad.xpm

#
# Audacity (Audio)
#
$(PIXMAP)/audacity.xpm:
	curl -# -L https://raw.githubusercontent.com/audacity/audacity/master/images/icons/16x16/audacity16.xpm -o $(PIXMAP)/audacity.xpm

#
# Chrome/Chromium (Browser)
#
$(PIXMAP)/chromium.xpm:
	convert https://www.chromium.org/favicon.ico $(PIXMAP)/chromium.xpm

#
# Claws-Mail (Email)
#
$(TEMP_PIXMAP)/claws-mail-favicon.ico:
	curl -# -L https://claws-mail.org/favicon.ico -o $(TEMP_PIXMAP)/claws-mail-favicon.ico

$(PIXMAP)/claws-mail.xpm: $(TEMP_PIXMAP)/claws-mail-favicon.ico
	convert $(TEMP_PIXMAP)/claws-mail-favicon.ico $(PIXMAP)/claws-mail.xpm

#
# Cool-Retro-Term (i.e. CRT; Terminal)
#
$(TEMP_PIXMAP)/cool-retro-term.png:
	curl -# -L https://raw.githubusercontent.com/Swordfish90/cool-retro-term/master/app/icons/32x32/cool-retro-term.png -o $(TEMP_PIXMAP)/cool-retro-term.png

$(PIXMAP)/cool-retro-term.xpm: $(TEMP_PIXMAP)/cool-retro-term.png
	convert $(TEMP_PIXMAP)/cool-retro-term.png -resize 16x16\> $(PIXMAP)/cool-retro-term.xpm

#
# Firefox (Browser)
#
$(TEMP_PIXMAP)/firefox.png:
	curl -# -L https://hg-edge.mozilla.org/mozilla-central/raw-file/default/browser/branding/official/default16.png -o $(TEMP_PIXMAP)/firefox.png

$(PIXMAP)/firefox.xpm: $(TEMP_PIXMAP)/firefox.png
	convert $(TEMP_PIXMAP)/firefox.png $(PIXMAP)/firefox.xpm

#
# GKrellM (Utility)
#
$(TEMP_PIXMAP)/gkrellm.png:
	curl -# -L https://git.srcbox.net/gkrellm/gkrellm/raw/branch/master/data/icons/16/gkrellm.png -o $(TEMP_PIXMAP)/gkrellm.png

$(PIXMAP)/gkrellm.xpm: $(TEMP_PIXMAP)/gkrellm.png
	convert $(TEMP_PIXMAP)/gkrellm.png $(PIXMAP)/gkrellm.xpm

#
# Godot (Engine/Editor)
#
$(TEMP_PIXMAP)/godot.png:
	curl -# -L https://raw.githubusercontent.com/godotengine/godot/master/main/app_icon.png -o $(TEMP_PIXMAP)/godot.png

$(PIXMAP)/godot.xpm: $(TEMP_PIXMAP)/godot.png
	convert $(TEMP_PIXMAP)/godot.png -resize 16x16\> $(PIXMAP)/godot.xpm

#
# Iridium (Browser)
#
$(TEMP_PIXMAP)/iridium-favicon.ico:
	curl -# -L https://iridiumbrowser.de/favicon.ico -o $(TEMP_PIXMAP)/iridium-favicon.ico

$(PIXMAP)/iridium.xpm: $(TEMP_PIXMAP)/iridium-favicon.ico
	convert $(TEMP_PIXMAP)/iridium-favicon.ico[2] $(PIXMAP)/iridium.xpm

#
# Leafpad (Text Editor)
#
$(TEMP_PIXMAP)/leafpad.png:
	curl -# -L https://raw.githubusercontent.com/tarot231/leafpad/main/data/icons/16x16/leafpad.png -o $(TEMP_PIXMAP)/leafpad.png

$(PIXMAP)/leafpad.xpm: $(TEMP_PIXMAP)/leafpad.png
	convert $(TEMP_PIXMAP)/leafpad.png $(PIXMAP)/leafpad.xpm

#
# Links (Browser)
#
$(TEMP_PIXMAP)/links-2.29.tar.gz:
	curl -# -L http://links.twibright.com/download/links-2.29.tar.gz -o $(TEMP_PIXMAP)/links-2.29.tar.gz

$(PIXMAP)/links.xpm: $(TEMP_PIXMAP)/links-2.29.tar.gz
	tar -xzf $(TEMP_PIXMAP)/links-2.29.tar.gz -C $(TEMP_PIXMAP) links-2.29/linkswin.ico
	convert $(TEMP_PIXMAP)/links-2.29/linkswin.ico[0] $(PIXMAP)/links.xpm

#
# MPV (Media Player)
#
$(TEMP_PIXMAP)/mpv.png:
	curl -# -L https://raw.githubusercontent.com/mpv-player/mpv.io/master/source/images/favicon.png -o $(TEMP_PIXMAP)/mpv.png

$(PIXMAP)/mpv.xpm: $(TEMP_PIXMAP)/mpv.png
	convert $(TEMP)/mpv.png -resize 16x16\> $(PIXMAP)/mpv.xpm

#
# NetSurf (Browser)
#
$(TEMP_PIXMAP)/netsurf-favicon.png:
	curl -# -L https://www.netsurf-browser.org/webimages/favicon.png -o $(TEMP_PIXMAP)/netsurf-favicon.png

$(PIXMAP)/netsurf.xpm: $(TEMP_PIXMAP)/netsurf-favicon.png
	convert $(TEMP_PIXMAP)/netsurf-favicon.png $(PIXMAP)/netsurf.xpm

#
# QEMU (Emulator)
#
$(TEMP_PIXMAP)/qemu.png:
	curl -# -L "https://gitlab.com/qemu-project/qemu/-/raw/master/ui/icons/qemu_16x16.png?ref_type=heads&inline=false" -o $(TEMP_PIXMAP)/qemu.png

$(PIXMAP)/qemu.xpm: $(TEMP_PIXMAP)/qemu.png
	convert $(TEMP_PIXMAP)/qemu.png $(PIXMAP)/qemu.xpm

#
# ScummVM (Emulator)
#
$(TEMP_PIXMAP)/scummvm.ico:
	curl -# -L https://raw.githubusercontent.com/scummvm/scummvm/master/icons/scummvm.ico -o $(TEMP_PIXMAP)/scummvm.ico

$(PIXMAP)/scummvm.xpm: $(TEMP_PIXMAP)/scummvm.ico
	convert $(TEMP_PIXMAP)/scummvm.ico[8] -resize 16x16\> $(PIXMAP)/scummvm.xpm

#
# SMPlayer (Media Player)
#
$(TEMP_PIXMAP)/smplayer.png:
	curl -# -L https://raw.githubusercontent.com/smplayer-dev/smplayer/master/icons/smplayer_icon16.png -o $(TEMP_PIXMAP)/smplayer.png

$(PIXMAP)/smplayer.xpm: $(TEMP_PIXMAP)/smplayer.png
	convert $(TEMP_PIXMAP)/smplayer.png $(PIXMAP)/smplayer.xpm

#
# SolveSpace (CAD)
#
$(TEMP_PIXMAP)/solvespace.png:
	curl -# -L https://raw.githubusercontent.com/solvespace/solvespace/master/res/freedesktop/solvespace-16x16.png -o $(TEMP_PIXMAP)/solvespace.png

$(PIXMAP)/solvespace.xpm: $(TEMP_PIXMAP)/solvespace.png
	convert $(TEMP_PIXMAP)/solvespace.png $(PIXMAP)/solvespace.xpm

#
# Vimb (Browser)
#
$(TEMP_PIXMAP)/vimb.png:
	curl -# -L https://raw.githubusercontent.com/morgant/vimb-icon/master/.github/images/vimb-transparent-512x512.png -o $(TEMP_PIXMAP)/vimb.png

$(PIXMAP)/vimb.xpm: $(TEMP_PIXMAP)/vimb.png
	convert $(TEMP_PIXMAP)/vimb.png -resize 16x16\> $(PIXMAP)/vimb.xpm

#
# VLC (Media Player)
#
$(PIXMAP)/vlc.xpm:
	curl -# -L https://raw.githubusercontent.com/videolan/vlc/master/share/icons/16x16/vlc.xpm -o $(PIXMAP)/vlc.xpm

#
# XPDFReader (Editor)
#
$(TEMP_PIXMAP)/xpdfreader-favicon.ico:
	curl -# -L https://www.xpdfreader.com/img/favicon.ico -o $(TEMP_PIXMAP)/xpdfreader-favicon.ico

$(PIXMAP)/xpdfreader.xpm: $(TEMP_PIXMAP)/xpdfreader-favicon.ico
	convert $(TEMP_PIXMAP)/xpdfreader-favicon.ico[0] $(PIXMAP)/xpdfreader.xpm

#
# Zeal (Documentation/Browser)
#
$(TEMP_PIXMAP)/zeal.png:
	curl -# -L https://raw.githubusercontent.com/zealdocs/zeal/main/assets/freedesktop/16-apps-zeal.png -o $(TEMP_PIXMAP)/zeal.png

$(PIXMAP)/zeal.xpm: $(TEMP_PIXMAP)/zeal.png
	convert $(TEMP_PIXMAP)/zeal.png $(PIXMAP)/zeal.xpm
