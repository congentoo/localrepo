# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="New MH mail reader"
HOMEPAGE="http://www.nongnu.org/nmh/"
SRC_URI="https://savannah.nongnu.org/download/nmh/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
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

PATCHES=(
	# fails with valgrind "illegal instruction" error
	"${FILESDIR}"/${PN}-1.8-skip-test-deb359167.patch
	# bug #319937
	"${FILESDIR}"/${PN}-1.3-db5.patch
)

src_configure() {
	# Bug 348816 & Bug 341741: The previous ebuild default of
	# /usr/bin caused unnecessary conflicts with other
	# packages. However, the default nmh libdir location causes
	# problems with cross-compiling, so we use, eg., /usr/lib64.
	# Users may use /usr/lib/nmh in scripts needing these support
	# programs in normal environments.
	local myconf=(
		--prefix="${EPREFIX}"/usr
		--libdir="${EPREFIX}"/usr/$(get_libdir)/nmh
		--mandir="${EPREFIX}"/usr/share/man
		--sysconfdir="${EPREFIX}"/etc/nmh
		$(use_with sasl cyrus-sasl)
		$(use_with ssl tls)
		$(use_with readline)
	)

	# have gdbm use flag actually control which version of db in use
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
