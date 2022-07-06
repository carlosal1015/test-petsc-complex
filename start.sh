#! /usr/bin/env bash

function arch_upgrade() {
  sudo pacman --needed --noconfirm -Syyuq >/dev/null 2>&1
  local TOOLS="clang cmake openssh shellcheck zsh"
  sudo pacman --needed --noconfirm -S ${TOOLS} >/dev/null 2>&1
  git pull origin main >/dev/null 2>&1
  unset OMPI_MCA_opal_warn_on_missing_libcuda=0
  unset PETSC_DIR=/opt/petsc/linux-c-opt
  unset PYTHONPATH=/opt/petsc/linux-c-opt/lib:${PYTHONPATH}
  printf "[0/3] Arch Linux system is up to date and happy.\n"
}

function pull_images() {
  local NAMESPACE="ghcr.io/carlosal1015/aur/petsc-complex-"
  local flavours=(mumps fftw suitesparse hdf5-openmpi hypre pastix triangle python-mpi4py)
  for flavour in ${flavours[@]}; do
    docker pull ${NAMESPACE}${flavour}:latest >/dev/null 2>&1
  done
  printf "[1/3] Pull finished.\n"
}

function list_images() {
  docker images --format "{{.Repository}}" # | cut
  printf "[2/3] List finished.\n"
}

function extract_tutorial() {
  export OMPI_MCA_opal_warn_on_missing_libcuda=0
  export PETSC_DIR=/opt/petsc/linux-c-opt
  export PYTHONPATH=${PETSC_DIR}/lib:${PYTHONPATH}
  local INPUT=${GITPOD_REPO_ROOT}/extracted
  mkdir -p ${INPUT} && cp -R ${PETSC_DIR}/share/petsc/examples/ ${INPUT}
  printf "[3/3] PETsc is ready.\n"
}

function start() {
  arch_upgrade
  pull_images
  list_images
  extract_tutorial
}

start
