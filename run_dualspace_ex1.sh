#! /usr/bin/env bash

function run_dualspace_ex1() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/dualspace/impls/lagrange/tests
  make ex1
  mpiexec -n 1 ./ex1 -dim 0
  mpiexec -n 1 ./ex1 -dim 1 -continuous 0 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 1 -continuous 1 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -continuous 0 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -continuous 1 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 2 -tensor 1 -continuous 0 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 2 -tensor 1 -continuous 1 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 3 -tensor 0 -continuous 0 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 3 -tensor 0 -continuous 1 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 3 -tensor 1 -continuous 0 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 3 -tensor 1 -continuous 1 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 3 -tensor 2 -continuous 0 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 3 -tensor 2 -continuous 1 -trimmed 0
  mpiexec -n 1 ./ex1 -dim 1 -continuous 0 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 1 -continuous 1 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -continuous 0 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -continuous 1 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 2 -tensor 1 -continuous 0 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 2 -tensor 1 -continuous 1 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 3 -tensor 0 -continuous 0 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 3 -tensor 0 -continuous 1 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 3 -tensor 1 -continuous 0 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 3 -tensor 1 -continuous 1 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 3 -tensor 2 -continuous 0 -trimmed 1
  mpiexec -n 1 ./ex1 -dim 3 -tensor 2 -continuous 1 -trimmed 1
  rm ex1
  popd
}
