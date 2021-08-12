prefix = /usr/local

all: src/yockgen

src/yockgen: src/yockgen.c
	@echo "CFLAGS=$(CFLAGS)" | \
		fold -s -w 70 | \
		sed -e 's/^/# /'
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/yockgen
	install -D src/yockgen \
		$(DESTDIR)$(prefix)/bin/yockgen01

clean:
	-rm -f src/yockgen

distclean: clean

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/yockgen01

.PHONY: all install clean distclean uninstall
