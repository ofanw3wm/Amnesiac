# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="ssdeep is a program for computing context triggered piecewise hashes (CTPH)"
HOMEPAGE="http://ssdeep.sourceforge.net/"
SRC_URI="mirror://sourceforge/ssdeep/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
EAPI=2

DEPEND=""
RDEPEND="${DEPEND}"

inherit eutils

src_configure() {
	econf
}

src_install() {
	emake install DESTDIR="${D}" || \
		die "make install failed"
	dodoc AUTHORS ChangeLog FILEFORMAT README NEWS || \
		die "dodoc failed"
}
