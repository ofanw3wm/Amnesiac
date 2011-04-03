# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit qt4-r2

MY_P="${P/_beta/beta}"

DESCRIPTION="Guymager is a fast and user friendly forensic imager."
HOMEPAGE="http://guymager.sourceforge.net/"
SRC_URI="mirror://sourceforge/guymager/${MY_P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug udisk smart parted"

DEPEND="x11-libs/qt-core
		x11-libs/qt-gui
		x11-libs/qt-dbus
		sys-libs/zlib
		sys-process/procps
		app-forensics/libewf
		app-forensics/libguytools"
RDEPEND="x11-libs/qt-core
		x11-libs/qt-gui
		x11-libs/qt-dbus
		sys-libs/zlib
		sys-process/procps
		hal? ( sys-apps/hal )
		udisk? ( sys-fs/udisks )
		smart? ( sys-apps/smartmontools )
		parted? ( sys-block/parted )"

S="${WORKDIR}/${MY_P}"

PATCHES=( "${FILESDIR}/${P}-create-debian-changelog.patch"
		  "${FILESDIR}/${P}-no-asm.patch" )

src_compile() {
	make

	cd manuals
	./rebuild.sh
}

src_install() {
	dobin guymager
	doman manuals/guymager.1

	insinto /usr/share/guymager
	doins  guymager_*.ts

	insinto /etc/guymager
	doins guymager.cfg
}
