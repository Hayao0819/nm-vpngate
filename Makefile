DESTDIR     ?=
PREFIX      ?= /usr
BINDIR      ?= $(PREFIX)/bin
SYSCONFDIR  ?= /etc
SYSTEMDDIR  ?= $(PREFIX)/lib/systemd/system

.PHONY: install uninstall

install:
	install -Dm755 nm-vpngate         $(DESTDIR)$(BINDIR)/nm-vpngate
	install -Dm644 nm-vpngate.conf    $(DESTDIR)$(SYSCONFDIR)/nm-vpngate.conf
	install -Dm644 nm-vpngate.service $(DESTDIR)$(SYSTEMDDIR)/nm-vpngate.service

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/nm-vpngate
	rm -f $(DESTDIR)$(SYSCONFDIR)/nm-vpngate.conf
	rm -f $(DESTDIR)$(SYSTEMDDIR)/nm-vpngate.service
