# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION=""
HOMEPAGE="http://www.bitbabbler.org/"
SRC_URI="http://www.bitbabbler.org/downloads/${PN}_${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="virtual/libusb:1"
RDEPEND="${DEPEND}"
BDEPEND=""
