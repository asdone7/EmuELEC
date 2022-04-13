# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="es-theme-EmuELEC-demonslayer"
PKG_VERSION="f9cfe7b6fb1ee3a6e134f8052e61f1b79f9a5656"
PKG_SHA256="a7d4b0a5adfde0352d89a7da48bf986e5a653ab8680636f9dbf687f2d049557d"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/asdone7/es-theme-EmuELEC-demonslayer"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emuelec"
PKG_SHORTDESC="The EmulationStation theme UI element is Demon Slayer, by PENG created for Emulec"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="manual"

make_target() {
  : not
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/emulationstation/themes/es-theme-EmuELEC-demonslayer
    cp -r * $INSTALL/usr/config/emulationstation/themes/es-theme-EmuELEC-demonslayer
}
