#! /usr/bin/env bash

function install_namcap() {
  sudo pacman --needed --noconfirm -Syyuq >/dev/null 2>&1
  sudo pacman --needed --noconfirm -S namcap >/dev/null 2>&1
}

function namcaping() {
  namcap /tmp/petsc-complex-3.17.3-1-x86_64.pkg.tar.zst >>log.txt
  echo "\n" >>log.txt
}

function ldding() {
  ldd -v /opt/petsc/linux-c-opt/lib/libpetsc.so >>log.txt
  echo "\n" >>log.txt
  ldd -v /opt/petsc/linux-c-opt/lib/petsc4py/lib/PETSc.cpython-310-x86_64-linux-gnu.so >>log.txt
  echo "\n" >>log.txt
}

function objdumping() {
  # objdump -p /path/program | grep NEEDED
  echo "\n" >>log.txt
  # objdump -D -M intel file.bin | grep main.: -A20
  echo "\n" >>log.txt
}

install_namcap
ldding
objdumping
# source /etc/profile.d/petsc.sh
