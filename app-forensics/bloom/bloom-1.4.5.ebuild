# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Find file fragments in disk images using sector hashing"
HOMEPAGE="http://afflib.org/?s=bloom"
SRC_URI="http://afflib.org/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="mysql afflib"
EAPI=2

DEPEND="sys-libs/zlib
        dev-libs/openssl
		mysql? ( dev-db/mysql )
		afflib? ( app-forensics/afflib )"
RDEPEND="${DEPEND}"

inherit eutils autotools

src_prepare() {
	epatch "${FILESDIR}"/${P}-use-flags.patch "${FILESDIR}"/${P}-fix-make.patch
	eautoreconf
}

src_configure() {
	econf \
		$(use_with mysql) \
		$(use_with afflib)
}

src_compile() {
	emake SUBDIRS=src
}

src_install() {
	#emake install DESTDIR="${D}" || die
	dobin src/frag_find || die
	dodoc AUTHORS ChangeLog README NEWS doc/frag_find.txt || die
}
