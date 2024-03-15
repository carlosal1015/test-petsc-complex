#! /usr/bin/env bash

function extract_tutorial() {
  export PETSC_DIR=/opt/petsc/linux-c-opt
  export PYTHONPATH=${PETSC_DIR}/lib:${PYTHONPATH}
  # export GITPOD_REPO_ROOT=${HOME}
  local INPUT=${GITPOD_REPO_ROOT}/extracted
  mkdir -p ${INPUT} && cp -R ${PETSC_DIR}/share/petsc/examples/ ${INPUT}
}
