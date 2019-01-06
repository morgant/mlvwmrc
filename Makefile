TEMP=tmp
CONF=.mlvwm
PIXMAP=$(CONF)/pixmap

all: pixmap

pixmap:
	test ! -d $(TEMP) && mkdir $(TEMP)
	test ! -d $(PIXMAP) && mkdir $(PIXMAP)
	curl -# -L http://www2u.biglobe.ne.jp/~y-miyata/mlvwm/mini-icons.tar.gz -o $(TEMP)/mini-icons.tar.gz
	tar -C $(PIXMAP) -xzf $(TEMP)/mini-icons.tar.gz
	curl -# -L http://sb.fluomedia.org/macintosh/img/apple.xpm -o $(PIXMAP)/apple.xpm
	curl -# -L http://sb.fluomedia.org/macintosh/img/finder.xpm -o $(PIXMAP)/finder.xpm
	curl -# -L http://sb.fluomedia.org/macintosh/img/balloon.xpm -o $(PIXMAP)/balloon.xpm

install:
	cp -R $(CONF) $(HOME)/
	ln -fs $(HOME)/$(CONF)/.mlvwmrc $(HOME)/.mlvwmrc
	sed -i 's@/home2/tak/bin/pixmap@$(HOME)@g' $(HOME)/$(CONF)/.mlvwmrc

clean:
	rm -r $(PIXMAP)
	rm -r $(TEMP)