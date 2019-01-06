TEMP=tmp
CONF=.mlvwm
PIXMAP=$(CONF)/pixmap

all: pixmap

pixmap:
	test ! -d $(TEMP) && mkdir $(TEMP)
	curl -# -L http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/mini-icons.tar.gz -o $(TEMP)/mini-icons.tar.gz
	tar -C $(PIXMAP) -xzf $(TEMP)/mini-icons.tar.gz

install:
	cp -R $(CONF) $(HOME)/
	ln -fs $(HOME)/$(CONF)/.mlvwmrc $(HOME)/.mlvwmrc
	sed -i 's@/home2/tak/bin/pixmap@$(HOME)/$(PIXMAP)@g' $(HOME)/$(CONF)/.mlvwmrc

clean:
	rm -r $(TEMP)
	rm -r $(PIXMAP)/mini*.xpm