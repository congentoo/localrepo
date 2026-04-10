# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="New MH mail reader"
HOMEPAGE="http://www.nongnu.org/nmh/"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.savannah.nongnu.org/git/nmh.git/"
else
	SRC_URI="https://savannah.nongnu.org/download/nmh/${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="BSD"
SLOT="0"
IUSE="gdbm readline sasl ssl"

# bug 631662: sys-apps/pick also uses pick
DEPEND="gdbm? ( sys-libs/gdbm )
	!gdbm? ( sys-libs/db:= )
	>=sys-libs/ncurses-5.2:0=
	net-libs/liblockfile
	readline? ( sys-libs/readline:0= )
	sasl? ( dev-libs/cyrus-sasl )
	ssl? ( dev-libs/openssl:0= )
"
RDEPEND="${DEPEND}
	virtual/editor
	virtual/pager
	!!sys-apps/pick
"

DOCS=( ChangeLog DATE MACHINES README )

src_configure() {
	local myconf=(
		--prefix="${EPREFIX}"/usr
		--libdir="${EPREFIX}"/usr/$(get_libdir)/nmh
		--mandir="${EPREFIX}"/usr/share/man
		--sysconfdir="${EPREFIX}"/etc/nmh
		$(use_with sasl cyrus-sasl)
		$(use_with ssl tls)
		$(use_with readline)
	)

	if use gdbm; then
		myconf+=( --with-ndbmheader=gdbm/ndbm.h --with-ndbm=gdbm_compat )
	else
		if has_version ">=sys-libs/db-2"; then
			myconf+=( --with-ndbmheader=db.h --with-ndbm=db )
		else
			myconf+=( --with-ndbmheader=db1/ndbm.h --with-ndbm=db1 )
		fi
	fi

	econf "${myconf[@]}"
}
