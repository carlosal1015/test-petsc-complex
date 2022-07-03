#! /usr/bin/env bash

function pull() {
  local NAMESPACE="ghcr.io/carlosal1015/aur/petsc-complex-"
  local flavours=(mumps fftw suitesparse hdf5-openmpi hypre pastix triangle python-mpi4py)
  for flavour in ${flavours[@]}; do
    docker pull ${NAMESPACE}${flavour}:latest >/dev/null 2>&1
  done
  printf "[1/2] Pull finished.\n"
}

function list() {
  docker images --format "{{.Repository}}" #| cut
  printf "[2/2] List finished.\n"
}

function extract_tutorial() {
  local INPUT=${GITPOD_REPO_ROOT}/extracted
  mkdir -p ${INPUT}
  cp -R /opt/petsc/linux-c-opt/share/petsc/ ${INPUT}
}

# pull
# list
extract_tutorial