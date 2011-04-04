# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Executes a program with a set of capabilities."
HOMEPAGE="http://capexec.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND="sys-libs/libcap"
RDEPEND="${DEPEND}"

src_install() {
	dobin capexec
	doman capexec.1
}
