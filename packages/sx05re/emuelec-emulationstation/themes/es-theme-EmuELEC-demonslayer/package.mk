# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="es-theme-EmuELEC-demonslayer"
PKG_VERSION="3608a7a487d1b0fc78e6769750ba5eed296bc8a5"
PKG_SHA256="45f330edeff4db63ad3f41615ff784a420bb286e21f7371b245b286c19e31503"
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
