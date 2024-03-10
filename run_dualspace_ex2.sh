#! /usr/bin/env bash

function run_dualspace_ex2() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/dualspace/impls/lagrange/tutorials
  make ex1
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -petscdualspace_order 2 -petscdualspace_view ascii::ascii_info_detail
  mpiexec -n 1 ./ex1 -dim 2 -tensor 1 -petscdualspace_order 1 -petscdualspace_lagrange_tensor 1 -petscdualspace_view ascii::ascii_info_detail
  mpiexec -n 1 ./ex1 -dim 3 -tensor 1 -petscdualspace_order 1 -petscdualspace_components 3 -petscdualspace_form_degree 1 -petscdualspace_lagrange_trimmed 1 -petscdualspace_lagrange_tensor 1 -petscdualspace_view ascii::ascii_info_detail
  mpiexec -n 1 ./ex1 -dim 3 -tensor 0 -petscdualspace_order 1 -petscdualspace_components 3 -petscdualspace_form_degree -2 -petscdualspace_view ascii::ascii_info_detail
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -petscdualspace_order 3 -petscdualspace_lagrange_continuity 0 -petscdualspace_lagrange_node_type equispaced -petscdualspace_lagrange_node_endpoints 0 -petscdualspace_view ascii::ascii_info_detail
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -petscdualspace_order 3 -petscdualspace_lagrange_continuity 0 -petscdualspace_lagrange_node_type equispaced -petscdualspace_lagrange_node_endpoints 1 -petscdualspace_view ascii::ascii_info_detail
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -petscdualspace_order 3 -petscdualspace_lagrange_continuity 0 -petscdualspace_lagrange_node_type gaussjacobi -petscdualspace_lagrange_node_endpoints 0 -petscdualspace_view ascii::ascii_info_detail
  mpiexec -n 1 ./ex1 -dim 2 -tensor 0 -petscdualspace_order 3 -petscdualspace_lagrange_continuity 0 -petscdualspace_lagrange_node_type gaussjacobi -petscdualspace_lagrange_node_endpoints 1 -petscdualspace_view ascii::ascii_info_detail
  rm ex1
  popd
}
