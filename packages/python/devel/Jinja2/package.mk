# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="Jinja2"
PKG_VERSION="3.0.x"
PKG_SHA256="66c6d2140b1c92bade3b4b9423b5a6ce0967a4e68dcb4d76bfd67f1a0807d2d9"
PKG_LICENSE="BSD"
PKG_SITE="https://pypi.org/project/Jinja2/"
PKG_URL="https://github.com/pallets/jinja/archive/bb7f3a51091d91010deb1e01e69f4f255d3b3eb6.tar.gz"
PKG_DEPENDS_HOST="Python3:host setuptools:host MarkupSafe:host"
PKG_LONGDESC="Jinja is a fast, expressive, extensible templating engine."
PKG_TOOLCHAIN="manual"

make_host() {
  python3 setup.py build
}

makeinstall_host() {
  exec_thread_safe python3 setup.py install --prefix=${TOOLCHAIN}
}