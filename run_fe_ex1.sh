#! /usr/bin/env bash

function run_fe_ex1() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/fe/tests
  make ex1
  mpiexec -n 1 ./ex1 -dm_view
  mpiexec -n 1 ./ex1 -dm_view -potential_petscspace_degree 1
  mpiexec -n 1 ./ex1 -dm_view -potential_petscspace_degree 2
  mpiexec -n 1 ./ex1 -dm_view -potential_petscspace_degree 3
  rm ex1
  popd
}