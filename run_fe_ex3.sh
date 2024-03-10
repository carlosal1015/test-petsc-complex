#! /usr/bin/env bash

function run_fe_ex3() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/fe/tests
  make ex3
  mpiexec -n 1 ./ex3 -dm_plex_reference_cell_domain -dm_plex_cell triangle -petscspace_degree 1 -snes_error_if_not_converged -ksp_error_if_not_converged -pc_type lu
  mpiexec -n 1 ./ex3 -dm_refine 2 -convest_num_refine 4 gives convergence rate 2.0
  mpiexec -n 1 ./ex3 -snes_convergence_estimate -convest_num_refine 2
  mpiexec -n 1 ./ex3 -dm_plex_reference_cell_domain -dm_plex_cell triangular_prism \
    -petscspace_type sum \
    -petscspace_variables 3 \
    -petscspace_components 3 \
    -petscspace_sum_spaces 2 \
    -petscspace_sum_concatenate false \
    -sumcomp_0_petscspace_variables 3 \
    -sumcomp_0_petscspace_components 3 \
    -sumcomp_0_petscspace_degree 1 \
    -sumcomp_1_petscspace_variables 3 \
    -sumcomp_1_petscspace_components 3 \
    -sumcomp_1_petscspace_type wxy \
    -petscdualspace_form_degree 0 \
    -petscdualspace_order 1 \
    -petscdualspace_components 3 \
    -snes_error_if_not_converged -ksp_error_if_not_converged -pc_type lu
  mpiexec -n 1 ./ex3 -func constant
  mpiexec -n 1 ./ex3 -func linear
  # mpiexec -n 1 ./ex3 -func prime
  mpiexec -n 1 ./ex3 -func linear -shear 1 -flatten 1e-5
  rm ex3
  popd
}
