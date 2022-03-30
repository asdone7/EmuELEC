# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="Ultimate-EmuELEC"
PKG_VERSION="1"
PKG_SHA256="f6af82454dca0d5d1a52e84fee24fb24baa85334de5afb7e6ef2fd1a9a36d067"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://www.deviantart.com/masterq2"
PKG_URL="https://link.jscdn.cn/1drv/aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBbzBxb2U5eUt6RzRnWkJBcVJidWNwR3VHc1Vvb3c_ZT1FOGVJWEQ.zip"
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
