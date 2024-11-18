PWD      := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DESTDIR  := /
ETCDIR   := ${DESTDIR}/etc/
USRDIR   := ${DESTDIR}/usr
BINDIR   := ${USRDIR}/bin/

install: creatdir
	install -D -m 755 "${PWD}/nm-vpngate"          "${BINDIR}/nm-vpngate"
	install -D -m 644 "${PWD}/nm-vpngate.conf"     "${ETCDIR}/nm-vpngate.conf"
	install -D -m 644 "${PWD}/nm-vpngate.service"  "${USRDIR}/lib/systemd/system/nm-vpngate.service"

creatdir:
	@mkdir -p "${ETCDIR}" "${BINDIR}"

uninstall:
	rm -f "${BINDIR}/nm-vpngate" "${ETCDIR}/nm-vpngate.conf"

pot:
	@xgettext \
		-o po/message.pot \
		-L Shell \
		--from-code=UTF-8 \
		--no-location \
		--copyright-holder="Fascode Network" \
		--package-name="nm-vpngate" \
		nm-vpngate

