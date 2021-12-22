# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="liberation-core-supplement"
PKG_VERSION="f8c7a0a73a1899d97320cce9f50f38199a5eeb5f"
PKG_LICENSE="FBN_FBA"
PKG_SITE="https://github.com/asdone7/liberation-core-supplement"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain util-macros"
PKG_LONGDESC="supplement retroarch core -test."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp *.so $INSTALL/usr/lib/libretro/
}

