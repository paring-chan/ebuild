EAPI=8

inherit cargo git-r3 desktop xdg

DESCRIPTION="Your next music player"
HOMEPAGE="https://github.com/Kopuz-org/kopuz"

EGIT_REPO_URI="https://github.com/Kopuz-org/kopuz.git"
EGIT_BRANCH="master"

LICENSE="EUPL-1.2"
SLOT="0"
IUSE=""

V8_VERSION="130.0.7"
V8_TRIPLE="x86_64-unknown-linux-gnu"
V8_ARCHIVE="librusty_v8_release_${V8_TRIPLE}.a.gz"
V8_DISTFILE="rusty_v8-${V8_VERSION}-${V8_TRIPLE}.a.gz"

RDEPEND="
    dev-libs/wayland
    media-libs/vulkan-loader
    x11-misc/xcb
    x11-libs/libxkbcommon
    x11-libs/libX11
    media-libs/fontconfig
    media-libs/freetype
    media-libs/alsa-lib
    media-libs/opus

    dev-libs/openssl
"
BDEPEND="
    dev-build/cmake
"

SRC_URI="
    https://github.com/denoland/rusty_v8/releases/download/v${V8_VERSION}/${V8_ARCHIVE} -> ${V8_DISTFILE}
"

RUST_MIN_VER="1.95.0"

src_unpack() {
    git-r3_src_unpack
    cargo_live_src_unpack
}

src_configure() {
    cargo_src_configure \
        -p kopuz \
        -p kopuz-kopuzd \
        -p kopuz-ctl
}

src_compile() {
    export RUSTY_V8_ARCHIVE="${DISTDIR}/${V8_DISTFILE}"
    cargo_src_compile
}

src_install() {
    dobin "$(cargo_target_dir)/kopuz"
    dobin "$(cargo_target_dir)/kopuzd"
    dobin "$(cargo_target_dir)/kopuzctl"
}
