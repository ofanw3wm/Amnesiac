# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

DESCRIPTION="Tests which standard Linux kernel and PaX security features are in use."
HOMEPAGE="http://www.trapkit.de/tools/checksec.html"
SRC_URI="http://trapkit.de/tools/checksec.sh"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86"
IUSE=""
DEPEND=""
RDEPEND=""

src_unpack() {
	cp ${DISTDIR}/${A} ${WORKDIR}
}

src_install() {
	dobin checksec.sh
}
