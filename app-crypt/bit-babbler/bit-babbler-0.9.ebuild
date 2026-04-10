# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

VERIFY_SIG_OPENPGP_KEY_PATH=/usr/share/openpgp-keys/bitbabbler.asc
inherit verify-sig

DESCRIPTION="Tools for BitBabbler hardware true random number generator devices"
HOMEPAGE="http://www.bitbabbler.org/"
SRC_URI="
	http://www.bitbabbler.org/downloads/${PN}_${PV}.tar.gz
	verify-sig? ( http://www.bitbabbler.org/downloads/${PN}_${PV}.tar.gz.asc )
"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="udev"

DEPEND="
	virtual/libusb:1
	udev? ( virtual/libudev )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	verify-sig? ( sec-keys/openpgp-keys-bitbabbler )
"
