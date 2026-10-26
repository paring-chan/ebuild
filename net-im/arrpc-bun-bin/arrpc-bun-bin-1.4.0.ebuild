# Copyright 2026 paring
# Distributed under the terms of the GNU General Public License v2


EAPI=8

DESCRIPTION="This is a complete TypeScript + Bun rewrite of the original arRPC project by OpenAsar."
HOMEPAGE="https://github.com/Creationsss/arrpc-bun"
SRC_URI="
    https://github.com/Creationsss/arrpc-bun/releases/download/v${PV}/arrpc-bun-linux-x64 -> ${P}-linux-amd64
"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""
S="${WORKDIR}"

RESTRICT="strip"

src_unpack() {
	cp "${DISTDIR}/${P}-linux-amd64" "${WORKDIR}/arrpc-bun" || die
}

src_install() {
    dobin "${WORKDIR}/arrpc-bun"
}
