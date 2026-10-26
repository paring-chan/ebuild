# Copyright 2026 paring
# Distributed under the terms of the GNU General Public License v2


EAPI=8

DESCRIPTION="Open Discord RPC server for atypical setups"
HOMEPAGE="https://arrpc.openasar.dev/"
SRC_URI="
    https://github.com/OpenAsar/arrpc/archive/refs/tags/${PV}.tar.gz -> ${P}-src.tar.gz

    https://registry.npmjs.org/ws/-/ws-8.18.3.tgz -> npm-ws-8.18.3.tgz
"
KEYWORDS="~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="
    net-libs/nodejs
"

src_install() {
    insinto /usr/lib/${PN}
    doins -r src package.json

    insinto /usr/lib/${PN}/node_modules/ws
    doins -r "${WORKDIR}/package/"*

    fperms +x /usr/lib/${PN}/src/index.js

	dosym ../lib/${PN}/src/index.js /usr/bin/arrpc
}
