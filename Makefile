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

patterns:
	test ! -d $(PATTERNS) && mkdir $(PATTERNS)
	curl -# -L https://forums.macrumors.com/attachments/mac-os-background-jpg.61609 -o $(PATTERNS)/mac-os-background.jpg
	curl -# -L https://forums.macrumors.com/attachments/mac-os-default-png.61610 -o $(PATTERNS)/mac-os-default.png

install:
	cp -R $(CONF) $(HOME)/
	ln -fs $(HOME)/$(CONF)/.mlvwmrc $(HOME)/.mlvwmrc
	sed -i 's@/home2/tak/bin/pixmap@$(HOME)/$(PIXMAP)@g' $(HOME)/$(CONF)/.mlvwmrc

clean:
	rm -r $(TEMP)
	rm -r $(PIXMAP)/mini*.xpm
	rm $(PIXMAP)/vlc.xpm
	rm -rf $(PATTERNS)
