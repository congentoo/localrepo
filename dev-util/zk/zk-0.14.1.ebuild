# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Personal wiki language server"
HOMEPAGE="https://github.com/zk-org/zk"
SRC_URI="
	https://github.com/zk-org/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/zk-org/${PN}/releases/download/v${PV}/${P}-vendor.tar.xz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	ego build -o ${PN} .
}

src_install() {
	dobin ${PN}
	dodoc *.md
}
