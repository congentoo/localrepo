# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Linux DPTF Extract Utility"
HOMEPAGE="https://github.com/intel/dptfxtract"
SRC_URI="https://github.com/intel/dptfxtract/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="binary"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="sys-power/thermald"
RDEPEND="${DEPEND}"

src_install() {
	dosbin "${S}"/dptfxtract
	dodoc "${S}"/COPYING
	dodoc "${S}"/README.txt
}
