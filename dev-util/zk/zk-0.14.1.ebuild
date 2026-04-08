# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/zk-org/zk"
ARCHIVE_URI="https://github.com/zk-org/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
https://github.com/dummy_org/zk/${PN}-0.14.1-vendor.tar.xz"
inherit golang-build golang-vcs-snapshot go-module

DESCRIPTION="Personal wiki language server"
HOMEPAGE="https://github.com/zk-org/zk"
SRC_URI="${ARCHIVE_URI}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	golang-build_src_install
	dodoc src/${EGO_PN}/*.md
}
