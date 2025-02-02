# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="hbfbneo"
PKG_VERSION="79450ac9371db4c1efdb2662b3b87457d38fba40"
PKG_SHA256="54fa23dcea1d9dbb69ebd07e3f35a8f1222afaa2e144d86676a4aa695a9b236f"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="Non-commercial"
PKG_SITE="https://github.com/asdone7/HBFBNeo"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="libretro"
PKG_SHORTDESC="Port of Final Burn Neo to Libretro (v1.0.0.3)."
PKG_LONGDESC="Currently, FB neo supports games on Capcom CPS-1 and CPS-2 hardware, SNK Neo-Geo hardware, Toaplan hardware, Cave hardware, and various games on miscellaneous hardware. "
PKG_TOOLCHAIN="make"


pre_configure_target() {
sed -i "s|LDFLAGS += -static-libgcc -static-libstdc++|LDFLAGS += -static-libgcc|"  ./src/burner/libretro/Makefile

PKG_MAKE_OPTS_TARGET=" -C ./src/burner/libretro USE_CYCLONE=0 profile=performance"

if [[ "$TARGET_FPU" =~ "neon" ]]; then
	PKG_MAKE_OPTS_TARGET+=" HAVE_NEON=1"
fi

if [ "$DEVICE" == "OdroidGoAdvance" ] || [ "$DEVICE" == "GameForce" ]; then
	if [ "$ARCH" == "arm" ]; then
	PKG_MAKE_OPTS_TARGET+=" platform=classic_armv8_a35"
	fi
fi
perl ./src/dep/scripts/gamelist.pl -o ./src/dep/generated/driverlist.h ./src/burn/drv/neogeo ./src/burn/drv/pgm ./src/burn/drv ./src/burner/libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp $PKG_BUILD/src/burner/libretro/hbfbneo_libretro.so $INSTALL/usr/lib/libretro/
}
