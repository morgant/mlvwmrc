TEMP=tmp
CONF=.mlvwm
BIN=bin
PIXMAP=$(CONF)/pixmap
PATTERNS=$(CONF)/patterns

all: pixmap patterns

pixmap:
	#
	# make the temp directory
	#
	mkdir -p $(TEMP)
	#
	# download & extract mini-icons
	#
	curl -# -L http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/mini-icons.tar.gz -o $(TEMP)/mini-icons.tar.gz
	tar -C $(PIXMAP) -xzf $(TEMP)/mini-icons.tar.gz
	#
	# download XPM icons from source code repositories
	#
	curl -# -L https://raw.githubusercontent.com/videolan/vlc/master/share/icons/16x16/vlc.xpm -o $(PIXMAP)/vlc.xpm
	curl -# -L https://raw.githubusercontent.com/audacity/audacity/master/images/icons/16x16/audacity16.xpm -o $(PIXMAP)/audacity.xpm
	#
	# download & convert icons from source code repositories
	#
	curl -# -L https://raw.githubusercontent.com/Swordfish90/cool-retro-term/master/app/icons/32x32/cool-retro-term.png -o $(TEMP)/cool-retro-term.png
	convert $(TEMP)/cool-retro-term.png -resize 16x16\> $(PIXMAP)/cool-retro-term.xpm
	curl -# -L https://hg-edge.mozilla.org/mozilla-central/raw-file/tip/browser/branding/official/default16.png -o $(TEMP)/firefox.png
	convert $(TEMP)/firefox.png $(PIXMAP)/firefox.xpm
	curl -# -L https://raw.githubusercontent.com/tarot231/leafpad/main/data/icons/16x16/leafpad.png -o $(TEMP)/leafpad.png
	convert $(TEMP)/leafpad.png $(PIXMAP)/leafpad.xpm
	curl -# -L https://raw.githubusercontent.com/mpv-player/mpv.io/master/source/images/favicon.png -o $(TEMP)/mpv.png
	convert $(TEMP)/mpv.png -resize 16x16\> $(PIXMAP)/mpv.xpm
	curl -# -L https://raw.githubusercontent.com/godotengine/godot/master/icon.png -o $(TEMP)/godot.png
	convert $(TEMP)/godot.png -resize 16x16\> $(PIXMAP)/godot.xpm
	curl -# -L "https://gitlab.com/qemu-project/qemu/-/raw/master/ui/icons/qemu_16x16.png?ref_type=heads&inline=false" -o $(TEMP)/qemu.png
	convert $(TEMP)/qemu.png $(PIXMAP)/qemu.xpm
	curl -# -L https://raw.githubusercontent.com/scummvm/scummvm/master/icons/scummvm.ico -o $(TEMP)/scummvm.ico
	convert $(TEMP)/scummvm.ico[8] -resize 16x16\> $(PIXMAP)/scummvm.xpm
	curl -# -L https://raw.githubusercontent.com/smplayer-dev/smplayer/master/icons/smplayer_icon16.png -o $(TEMP)/smplayer.png
	convert $(TEMP)/smplayer.png $(PIXMAP)/smplayer.xpm
	curl -# -L https://raw.githubusercontent.com/zealdocs/zeal/main/assets/freedesktop/16-apps-zeal.png -o $(TEMP)/zeal.png
	convert $(TEMP)/zeal.png $(PIXMAP)/zeal.xpm
	#
	# download & convert icons from source code archives
	#
	curl -# -L http://links.twibright.com/download/links-2.29.tar.gz -o $(TEMP)/links-2.29.tar.gz
	tar -xzf $(TEMP)/links-2.29.tar.gz -C $(TEMP) links-2.29/linkswin.ico
	convert $(TEMP)/links-2.29/linkswin.ico[0] $(PIXMAP)/links.xpm
	#
	# download & convert website favicons
	#
	convert https://play0ad.com/favicon.ico $(PIXMAP)/0ad.xpm
	convert https://www.chromium.org/favicon.ico $(PIXMAP)/chromium.xpm
	curl -# -L https://claws-mail.org/favicon.ico -o $(TEMP)/claws-mail-favicon.ico
	convert $(TEMP)/claws-mail-favicon.ico $(PIXMAP)/claws-mail.xpm
	curl -# -L https://iridiumbrowser.de/favicon.ico -o $(TEMP)/iridium-favicon.ico
	convert $(TEMP)/iridium-favicon.ico[2] $(PIXMAP)/iridium.xpm
	curl -# -L https://www.netsurf-browser.org/webimages/favicon.png -o $(TEMP)/netsurf-favicon.png
	convert $(TEMP)/netsurf-favicon.png $(PIXMAP)/netsurf.xpm
	curl -# -L https://www.xpdfreader.com/img/favicon.ico -o $(TEMP)/xpdfreader-favicon.ico
	convert $(TEMP)/xpdfreader-favicon.ico[0] $(PIXMAP)/xpdfreader.xpm

patterns:
	test ! -d $(PATTERNS) && mkdir $(PATTERNS)
	curl -# -L https://forums.macrumors.com/attachments/mac-os-background-jpg.61609 -o $(PATTERNS)/mac-os-background.jpg
	curl -# -L https://wallpaperbat.com/img/250263-classic-mac-os-wallpaper.png -o $(PATTERNS)/mac-os-background-hi-res.png
	curl -# -L https://forums.macrumors.com/attachments/mac-os-default-png.61610 -o $(PATTERNS)/mac-os-default.png
	curl -# -L https://imgur.com/a/9jYy0/zip -o "$(TEMP)/Mac OS Solid Color Backgrounds.zip"
	unzip -d $(PATTERNS) "$(TEMP)/Mac OS Solid Color Backgrounds.zip"

install: install-bin
	find $(HOME) -name ".mlvwm" -type d -exec mv {}{,.$(date +%Y%m%d-%H%M%S)} \;
	cp -R $(CONF) $(HOME)/
	ln -fs $(HOME)/$(CONF)/.mlvwmrc $(HOME)/.mlvwmrc
	sed -i 's@/home2/tak/bin/pixmap@$(HOME)/$(PIXMAP)@g' $(HOME)/$(CONF)/.mlvwmrc

install-bin:
	mkdir -p $(HOME)/$(BIN)
	find ${HOME}/$(BIN) -name "mlvwm-*" ! -name "*.*" -exec mv {}{,.$(date +%Y%m%d-%H%M%S)} \;
	install -m 700 -o $(USER) $(BIN)/mlvwm-* $(HOME)/$(BIN)

clean: clean-pixmap
	rm -r $(TEMP)
	rm -rf $(PATTERNS)

clean-pixmap:
	rm $(PIXMAP)/mini*.xpm
	rm $(PIXMAP)/0ad.xpm
	rm $(PIXMAP)/audacity.xpm
	rm $(PIXMAP)/chromium.xpm
	rm $(PIXMAP)/claws-mail.xpm
	rm $(PIXMAP)/cool-retro-term.xpm
	rm $(PIXMAP)/firefox.xpm
	rm $(PIXMAP)/godot.xpm
	rm $(PIXMAP)/iridium.xpm
	rm $(PIXMAP)/leafpad.xpm
	rm $(PIXMAP)/links.xpm
	rm $(PIXMAP)/mpv.xpm
	rm $(PIXMAP)/netsurf.xpm
	rm $(PIXMAP)/qemu.xpm
	rm $(PIXMAP)/scummvm.xpm
	rm $(PIXMAP)/smplayer.xpm
	rm $(PIXMAP)/vlc.xpm
	rm $(PIXMAP)/xpdfreader.xpm
	rm $(PIXMAP)/zeal.xpm

