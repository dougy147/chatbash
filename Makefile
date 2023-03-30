.POSIX:

OS = $(shell uname -s)
ifndef PREFIX
  PREFIX = /usr/local
endif
ifndef MANPREFIX
  MANPREFIX = $(PREFIX)/man
endif

install:
	sh ./build.sh
	@if ! [ $$(id -u) -eq 0 ]; then \
		sudo cp -f ./chatbash $(DESTDIR)$(PREFIX)/bin/chatbash ; \
	fi
	if mkdir -p /home/$$USER/.config/chatbash; then \
		mkdir -p /home/$$USER/.config/chatbash/history; \
		cp -n ./conf/chatbash.conf /home/$$USER/.config/chatbash/chatbash.conf >/dev/null; \
		chmod 644 /home/$$USER/.config/chatbash/chatbash.conf; \
	fi

uninstall:
	@if ! [ $$(id -u) -eq 0 ]; then \
		sudo rm -f $(DESTDIR)$(PREFIX)/bin/chatbash; \
	fi

.PHONY: install uninstall
