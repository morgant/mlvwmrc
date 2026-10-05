TEMP=tmp
CONF=.mlvwm
BIN=bin
PIXMAP=$(CONF)/pixmap
PATTERNS=$(CONF)/patterns

all: pixmap patterns

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

# For copyright and distribution reasons, it is preferred that application
# icons (i.e. pixmaps) are fetched and copied into `.mlvwm/pixmap/` instead of
# being committed to this repository. This is handled by the `Makefile` and
# `.gitignore` files in the `.mlvwm/pixmap/` directory.
#
# NOTE: This Makefile's `install` target still needs to be updated to **not**
# install the aforementioned `Makefile` & `.gitignore` when installing the
# contents of `.mlvwm/pixmap/`!
pixmap:
	cd $(PIXMAP) && make
	cd -

clean-pixmap:
	cd $(PIXMAP) && make clean
	cd -
