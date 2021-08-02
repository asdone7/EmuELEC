# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2021-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="hurrican"
PKG_VERSION="f2cce99acebd1b155cbb445c26e77785a14287d6"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/drfiemost/Hurrican"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain SDL2-git SDL2_mixer libepoxy"
PKG_LONGDESC="A fork of Hurrican, freeware jump and shoot game created by Poke53280, with SDL2 enabled by default, support for libopenmpt and CRT simulation "
GET_HANDLER_SUPPORT="git"
PKG_TOOLCHAIN="cmake"

PKG_CMAKE_OPTS_TARGET=" ./Hurrican -DCMAKE_BUILD_TYPE=Release -DRENDERER=GLES2"

if [ "${DEVICE}" == "OdroidGoAdvance" -o "${DEVICE}" == "RG351P" -o "${DEVICE}" == "RG351V" ] || [ "${DEVICE}" == "GameForce" ]; then
	PKG_CMAKE_OPTS_TARGET+=" -DDEFAULT_SCREENBPP=16"
fi

if [ "${DEVICE}" == "RG351P" -o "${DEVICE}" == "RG351V" ]; then
    PKG_PATCH_DIRS="RG351"
fi

pre_configure_target() {
  git submodule update --init --recursive
}

makeinstall_target() {
mkdir -p $INSTALL/usr/bin
cp hurrican $INSTALL/usr/bin
cp "${PKG_DIR}/scripts/hurrican.sh" $INSTALL/usr/bin

mkdir -p $INSTALL/usr/config/emuelec/configs
cp -rf ${PKG_DIR}/config/* $INSTALL/usr/config/emuelec/configs/
}
