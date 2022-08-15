# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2018-present 5schatten (https://github.com/5schatten)

PKG_NAME="soundfont-generaluser"
PKG_VERSION="1.471"
PKG_SHA256="4203835164766f428c4926c097c9ea58dae431c7fb8f9dbe277b92d80da45ec2"
PKG_LICENSE="OSS"
PKG_SITE="http://www.schristiancollins.com/generaluser.php"
PKG_URL="https://link.jscdn.cn/1drv/aHR0cHM6Ly8xZHJ2Lm1zL3UvcyFBbzBxb2U5eUt6RzRnWkEtdzZmYU9INjI1MVhNRUE_ZT1ZcldBUjI.zip"
PKG_SOURCE_DIR="GeneralUser*"
PKG_DEPENDS_TARGET="toolchain"
PKG_LONGDESC="GeneralUser GS is a GM and GS compatible SoundFont bank for composing, playing MIDI files, and retro gaming."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/soundfonts
  cp GeneralUser*$PKG_VERSION.sf2 $INSTALL/usr/share/soundfonts/GeneralUser.sf2
}
