TEMP=tmp
CONF=.mlvwm
PIXMAP=$(CONF)/pixmap
PATTERNS=$(CONF)/patterns

all: pixmap patterns

pixmap:
	test ! -d $(TEMP) && mkdir $(TEMP)
	curl -# -L http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/mini-icons.tar.gz -o $(TEMP)/mini-icons.tar.gz
	tar -C $(PIXMAP) -xzf $(TEMP)/mini-icons.tar.gz
	curl -# -L https://raw.githubusercontent.com/videolan/vlc/master/share/icons/16x16/vlc.xpm -o $(PIXMAP)/vlc.xpm
	convert https://www.chromium.org/favicon.ico $(PIXMAP)/chromium.xpm
	curl -# -L https://claws-mail.org/favicon.ico -o $(TEMP)/claws-mail-favicon.ico
	curl -# -L https://iridiumbrowser.de/favicon.ico -o $(TEMP)/iridium-favicon.ico
	convert $(TEMP)/claws-mail-favicon.ico $(PIXMAP)/claws-mail.xpm
	convert $(TEMP)/iridium-favicon.ico[2] $(PIXMAP)/iridium.xpm

patterns:
	test ! -d $(PATTERNS) && mkdir $(PATTERNS)
	curl -# -L https://forums.macrumors.com/attachments/mac-os-background-jpg.61609 -o $(PATTERNS)/mac-os-background.jpg
	curl -# -L https://wallpaperbat.com/img/250263-classic-mac-os-wallpaper.png -o $(PATTERNS)/mac-os-background-hi-res.png
	curl -# -L https://forums.macrumors.com/attachments/mac-os-default-png.61610 -o $(PATTERNS)/mac-os-default.png
	curl -# -L https://imgur.com/a/9jYy0/zip -o $(TEMP)/Mac\ OS\ Solid\ Color\ Backgrounds.zip
	unzip -d $(PATTERNS) $(TEMP)/Mac\ OS\ Solid\ Color\ Backgrounds.zip

install:
	cp -R $(CONF) $(HOME)/
	ln -fs $(HOME)/$(CONF)/.mlvwmrc $(HOME)/.mlvwmrc
	sed -i 's@/home2/tak/bin/pixmap@$(HOME)/$(PIXMAP)@g' $(HOME)/$(CONF)/.mlvwmrc

clean: clean-pixmap
	rm -r $(TEMP)
	rm -rf $(PATTERNS)

clean-pixmap:
	rm $(PIXMAP)/mini*.xpm
	rm $(PIXMAP)/chromium.xpm
	rm $(PIXMAP)/claws-mail.xpm
	rm $(PIXMAP)/iridium.xpm
	rm $(PIXMAP)/vlc.xpm

