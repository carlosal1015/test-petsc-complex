#! /usr/bin/env bash

function install_triangle() {
  local PACKAGE="archimedes-tools"
  local AUR_URL="https://aur.archlinux.org/cgit/aur.git/snapshot/${PACKAGE}.tar.gz"
  curl -LO ${AUR_URL}
  tar -xvf ${PACKAGE}.tar.gz
  pushd ${PACKAGE}
  makepkg --noconfirm -sirc
  popd
}
