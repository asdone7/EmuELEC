# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2017-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="rkbin"
if [ "$DEVICE" == "OdroidGoAdvance" -o "$DEVICE" == "RG351P" ]; then
PKG_VERSION="0bb1c512492386a72a3a0b5a0e18e49c636577b9"
PKG_SHA256="aa37452788219a1fb10ef3cb62b55baccf6baee2b63b9fdc1bfebc2d6fac22e0"
else
# Version is: Kwiboo/tag:libreelec-ba436b9
PKG_VERSION="ba436b9d616318a9437895457f6bbef1cc873e2b"
PKG_SHA256="72c2ef6ec1fe79da7c701056662343b9e1df1cf20e5df10bafc4ec0619ef4578"
fi
PKG_ARCH="arm aarch64"
PKG_LICENSE="nonfree"
PKG_SITE="https://github.com/rockchip-linux/rkbin"
PKG_URL="https://github.com/rockchip-linux/rkbin/archive/$PKG_VERSION.tar.gz"
PKG_LONGDESC="rkbin: Rockchip Firmware and Tool Binaries"
PKG_TOOLCHAIN="manual"
