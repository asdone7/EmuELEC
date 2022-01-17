# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="liberation-core-supplement"
PKG_VERSION="f4f8e132591081e24fec6366247b20a3e9c826f7"
PKG_SHA256="cbc55979aaac208ead26860d3ebb3ae7dfde949fd3ce2f6ac695d91ca82d85d0"
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

