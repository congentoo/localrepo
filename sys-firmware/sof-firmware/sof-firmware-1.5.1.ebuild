# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Sound Open Firmware (SOF) binary files"

HOMEPAGE="https://www.sofproject.org"

MY_FILELIST=(
	sof-apl-v${PV}.ldc
	sof-apl-v${PV}.ri
	sof-bdw.ldc
	sof-bdw.ri
	sof-byt.ldc
	sof-byt.ri
	sof-cht.ldc
	sof-cht.ri
	sof-cnl-v${PV}.ldc
	sof-cnl-v${PV}.ri
	sof-icl-v${PV}.ldc
	sof-icl-v${PV}.ri
	sof-imx8.ldc
	sof-imx8.ri
)
#MY_SRC_URI_BASE="https://github.com/thesofproject/sof/releases/download/v${PV}"
#
#for my_file in "${MY_FILELIST[@]}" ; do
#	SRC_URI+="${MY_SRC_URI_BASE}/${my_file} -> ${P}-${my_file}  "
#done
SRC_URI="https://github.com/thesofproject/sof-bin/archive/stable-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="SOF"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S="${WORKDIR}/sof-bin-stable-v${PV}"

src_configure() {
	sed -i -e 's@^ROOT=.*$@ROOT="'"${D}"'"@' go.sh || die "sed failed"
	sed -i -e 's@^VERSION=.*$@VERSION="'"v${PV}"'"@' go.sh || die "sed failed"
}

src_install() {
	mkdir -p "${D}/lib/firmware/intel/sof" || die "mkdir failed"
	./go.sh  || die "go.sh failed"
	#insinto /lib
	#doins -r "${D}/lib/firmware"
	dodoc "${S}/README.Intel"
	dodoc "${S}/README.md"
	dodoc "${S}/LICENCE.Intel"
}
