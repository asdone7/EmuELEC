# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)

PKG_NAME="liberation-core-supplement"
PKG_VERSION="1f04cfe1649c7883fa329fc031828470aed39d35"
PKG_SHA256="3f8bb5d941458a82a99217e6582a66561ec930b8aafdae81d29c894c73f8c60b"
PKG_LICENSE="FBN_FBA_MAME_GPLv2"
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

