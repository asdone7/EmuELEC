# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="VVVVVV"
PKG_VERSION="95ffc3a62bb91b6f6f86f69e129ce9e2b005acf4"
PKG_SHA256="2119e8b0000cad87722b7890788c77673d6916699bf566861b1d0c8eb77dfaad"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="CUSTOM"
PKG_SITE="https://github.com/TerryCavanagh/VVVVVV"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2-git SDL2_mixer"
PKG_SHORTDESC="VVVVVV License: https://github.com/TerryCavanagh/VVVVVV/blob/master/LICENSE.md"
PKG_LONGDESC="VVVVVV is a platform game all about exploring one simple mechanical idea - what if you reversed gravity instead of jumping?"
PKG_TOOLCHAIN="cmake"

if [ "$DEVICE" == "OdroidGoAdvance" -o "$DEVICE" == "RG351P" -o "$DEVICE" == "RG351V" ] || [ "$DEVICE" == "GameForce" ]; then
PKG_PATCH_DIRS="OdroidGoAdvance"
fi

PKG_CMAKE_OPTS_TARGET=" desktop_version"

pre_configure_target() {
sed -i "s/fullscreen = false/fullscreen = true/" "$PKG_BUILD/desktop_version/src/Screen.cpp"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp VVVVVV $INSTALL/usr/bin
}