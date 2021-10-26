PWD      := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
DESTDIR  := /usr/
ETCDIR   := ${DESTDIR}/etc/
BINDIR   := ${DESTDIR}/bin/

creatdir:
	@mkdir -p "${ETCDIR}" "${BINDIR}"

install: creatdir
	install -D -m 755 "${PWD}/nm-vpngate"      "${BINDIR}/nm-vpngate"
	install -D -m 644 "${PWD}/nm-vpngate.conf" "${ETCDIR}/nm-vpngate.conf"

uninstall:
	rm -f "${BINDIR}/nm-vpngate" "${ETCDIR}/nm-vpngate.conf"

