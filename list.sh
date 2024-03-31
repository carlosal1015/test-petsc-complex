#! /usr/bin/env bash

function install_namcap() {
  # unset PETSC_DIR=/opt/petsc/linux-c-opt
  # unset PYTHONPATH=/opt/petsc/linux-c-opt/lib:${PYTHONPATH}
  sudo pacman --needed --noconfirm -Syuq >/dev/null 2>&1
  sudo pacman --needed --noconfirm -S namcap >/dev/null 2>&1
}

function namcaping() {
  export PETSC_DIR=/opt/petsc/linux-c-opt
  export PYTHONPATH=/opt/petsc/linux-c-opt/lib:${PYTHONPATH}
  namcap /tmp/petsc-complex-3.21.0-2-x86_64.pkg.tar.zst >>/tmp/log.txt
}

function ldding() {
  ldd -v /opt/petsc/linux-c-opt/lib/libpetsc.so >>/tmp/log.txt
  ldd -v /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-311-x86_64-linux-gnu.so >>/tmp/log.txt
}

function objdumping() {
  objdump -p /opt/petsc/linux-c-opt/lib/libpetsc.so >>/tmp/log.txt # | grep NEEDED
}

function realdefing() {
  readelf -d /opt/petsc/linux-c-opt/lib/libpetsc.so >>/tmp/log.txt # | grep 'NEEDED'
}

function info() {
  install_namcap
  namcaping
  ldding
  objdumping
  realdefing
  cat /usr/share/pkgconfig/PETSc.pc >>/tmp/log.txt
  # source /etc/profile.d/petsc.sh
}

info
