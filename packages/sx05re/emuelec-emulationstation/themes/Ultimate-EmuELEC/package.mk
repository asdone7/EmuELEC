# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="Ultimate-EmuELEC"
PKG_VERSION="381d0221bd1ccac6ecb218d7345e91a7927d2fcd"
PKG_SHA256="d81ae24aca09de339be6e3e4709a2358700850017e9944c12dad84813bd73a9c"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.deviantart.com/masterq2"
PKG_URL="https://github.com/asdone7/Ultimate-EmuELEC/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emuelec"
PKG_SHORTDESC="This EmulationStation theme is Ultimate Pie's Fork, with changes for EmuELEC by PENG"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_TOOLCHAIN="manual"

make_target() {
  : not
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/emulationstation/themes/Ultimate-EmuELEC
    cp -r * $INSTALL/usr/config/emulationstation/themes/Ultimate-EmuELEC
}
