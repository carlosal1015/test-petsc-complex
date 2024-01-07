#! /usr/bin/env bash

function arch_upgrade() {
  sudo pacman --needed --noconfirm -Syuq >/dev/null 2>&1
  local TOOLS="clang cmake shellcheck" # zsh
  sudo pacman --needed --noconfirm -S ${TOOLS} >/dev/null 2>&1
  git pull origin main >/dev/null 2>&1
  unset OMPI_MCA_opal_warn_on_missing_libcuda=0
  unset PETSC_DIR=/opt/petsc/linux-c-opt
  unset PYTHONPATH=/opt/petsc/linux-c-opt/lib:${PYTHONPATH}
  printf "[0/2] Arch Linux system is up to date and happy.\n"
}

function pull_images() {
  local NAMESPACE="ghcr.io/carlosal1015/aur/petsc-complex-"
  local flavours=(mumps fftw suitesparse hdf5-openmpi hypre p4est-deal-ii pastix triangle python-mpi4py hdf5-openmpi-p4est-deal-ii sundials trilinos valgrind) # opencl
  for flavour in ${flavours[@]}; do
    docker pull ${NAMESPACE}${flavour}:latest >/dev/null 2>&1
  done
  printf "[1/2] Pull finished.\n"
}

function list_images() {
  docker images --format "{{.Repository}}" # | cut
  printf "[2/2] List finished.\n"
}

function start() {
  arch_upgrade
  pull_images
  list_images
}

start
