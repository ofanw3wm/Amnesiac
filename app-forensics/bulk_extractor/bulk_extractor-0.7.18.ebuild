# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Scans a disk image (or any other file) and extracts useful information — without parsing the file system."
HOMEPAGE="http://afflib.org/software/bulk_extractor"
SRC_URI="http://afflib.org/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
EAPI=2

DEPEND="media-gfx/exiv2
        sys-libs/zlib
        dev-libs/expat
        dev-libs/openssl"
RDEPEND="${DEPEND}"

inherit eutils

src_configure() {
	econf
}

src_install() {
	emake install DESTDIR="${D}" || \
		die "make install failed"
	dodoc AUTHORS ChangeLog README NEWS doc/Diagnosing_Crashes.txt || \
		die "dodoc failed"
}
