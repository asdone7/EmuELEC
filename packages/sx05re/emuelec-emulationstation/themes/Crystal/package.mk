# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="Crystal"
PKG_VERSION="619352e443b181f71c1f24c6072ee6d73d649ddd"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/asdone7/Crystal"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="emuelec"
PKG_SHORTDESC="Crystal theme for EMUELEC by Dim (fagnerpc)"
PKG_TOOLCHAIN="manual"
GET_HANDLER_SUPPORT="git"

make_target() {
  : not
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/emulationstation/themes/Crystal
    cp -r * $INSTALL/usr/config/emulationstation/themes/Crystal
}
