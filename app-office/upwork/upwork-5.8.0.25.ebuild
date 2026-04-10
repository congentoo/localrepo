# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop pax-utils rpm xdg-utils

DESCRIPTION="Project collaboration and tracking software for upwork.com"
HOMEPAGE="https://www.upwork.com/"
HASH="e119f6b95355474f"
BUILD="1fc24"
SRC_URI="
	https://upwork-usw2-desktopapp.upwork.com/binaries/v${PV//./_}_${HASH}/${P}-${BUILD}.x86_64.rpm -> ${P}_x86_64.rpm"
# FIXME: requires custom fetchcommand
#USER_AGENT="Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101 Firefox/102.0"
#FETCHCOMMAND="wget -v --user-agent=\"${USER_AGENT}\" -t 3 -T 60 --passive-ftp -O \"\${DISTDIR}/\${FILE}\" \"\${URI}\""
#RESUMECOMMAND="wget -v --user-agent=\"${USER_AGENT}\" -c -t 3 -T 60 --passive-ftp -O \"\${DISTDIR}/\${FILE}\" \"\${URI}\""


LICENSE="ODESK"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist mirror"

RDEPEND="
	dev-libs/expat
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/freetype
	sys-apps/dbus
	sys-libs/libcap
	x11-libs/gtk+:3[cups]
	x11-libs/libXinerama
	x11-libs/libXScrnSaver
	x11-libs/libXtst
"

S="${WORKDIR}"

PATCHES=( "${FILESDIR}/${PN}-desktop-r2.patch" )

# Binary only distribution
QA_PREBUILT="*"

src_install() {
	pax-mark m opt/Upwork/upwork

	insinto /opt
	doins -r opt/Upwork
	fperms 0755 /opt/Upwork/upwork
	fperms 0755 /opt/Upwork/chrome-sandbox
	fperms 0755 /opt/Upwork/chrome_crashpad_handler
	fperms 0755 /opt/Upwork/cmon

	insinto /usr/share
	doins -r usr/share/icons

	domenu usr/share/applications/upwork.desktop
	doicon usr/share/icons/hicolor/128x128/apps/upwork.png

}

pkg_postinst() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	xdg_icon_cache_update
	xdg_desktop_database_update
}
