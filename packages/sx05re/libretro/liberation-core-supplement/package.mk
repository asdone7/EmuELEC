# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="liberation-core-supplement"
PKG_VERSION="279bc402d551d5490b4a4321c4eaff1118e70272"
PKG_SHA256="b0f2b88b2fb30a8585068a60f4f46a135c4224c468d666e8ce49ad9867a958b2"
PKG_LICENSE="FBN_FBA"
PKG_SITE="https://github.com/asdone7/liberation-core-supplement"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain util-macros"
PKG_LONGDESC="supplement retroarch core -test."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  tar -zxvf *.tar.gz
  cp *.so $INSTALL/usr/lib/libretro/
}

