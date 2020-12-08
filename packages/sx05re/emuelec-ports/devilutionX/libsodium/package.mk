# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020 Trond Haugland (github.com/escalade)

PKG_NAME="libsodium"
PKG_VERSION="5e262eeb8f7054bdd7b5d11946f9ad7cc62c6cc6"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/jedisct1/libsodium"
PKG_URL="https://github.com/jedisct1/libsodium/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="A modern, portable, easy to use crypto library"
PKG_TOOLCHAIN="autotools"
PKG_BUILD_FLAGS="+speed"

PKG_CONFIGURE_OPTS_TARGET=" --disable-neon"
