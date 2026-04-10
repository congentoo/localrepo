# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OpenPGP keys used to sign BitBabbler releases"
HOMEPAGE="http://www.bitbabbler.org/"
# Key: 8EAF7354 2433 9DDD FE83 5628 1258 31AE 66E7 0556
# Owner: BitBabbler Sales <sales@bitbabbler.org>
# Source: keyserver.ubuntu.com
SRC_URI="
	https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x8eaf735424339dddfe835628125831ae66e70556
		-> openpgp-keys-bitbabbler-${PV}-8EAF735424339DDDFE835628125831AE66E70556.asc
"
S="${WORKDIR}"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	insinto /usr/share/openpgp-keys
	newins "${DISTDIR}/openpgp-keys-bitbabbler-${PV}-8EAF735424339DDDFE835628125831AE66E70556.asc" bitbabbler.asc
}
