# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Library for guymager"
HOMEPAGE="http://libguytools.sourceforge.net/"
SRC_URI="mirror://sourceforge/libguytools/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="debug"
EAPI="2"

DEPEND="x11-libs/qt-core"
RDEPEND="${DEPEND}"

inherit qt4-r2

src_prepare() {
	echo "VERSION = ${PV}" > libguytools_version.pro.inc
}

src_configure() {
	eqmake4 tools.pro
	eqmake4 toolsstatic.pro
}

src_install() {
	insinto /usr/include/libguytools2
	doins include/*.h
	dolib.a lib/libguytools.a
}
