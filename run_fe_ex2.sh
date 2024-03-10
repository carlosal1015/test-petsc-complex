#! /usr/bin/env bash

function run_fe_ex2() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/fe/tests
  make ex2
  mpiexec -n 1 ./ex2 -dm_plex_reference_cell_domain -dm_plex_cell triangular_prism -field_petscspace_degree 0
  mpiexec -n 1 ./ex2 -dm_plex_reference_cell_domain -dm_plex_cell triangular_prism \
    -field_petscspace_type sum \
    -field_petscspace_variables 3 \
    -field_petscspace_components 3 \
    -field_petscspace_sum_spaces 2 \
    -field_petscspace_sum_concatenate false \
    -field_sumcomp_0_petscspace_variables 3 \
    -field_sumcomp_0_petscspace_components 3 \
    -field_sumcomp_0_petscspace_degree 1 \
    -field_sumcomp_1_petscspace_variables 3 \
    -field_sumcomp_1_petscspace_components 3 \
    -field_sumcomp_1_petscspace_type wxy \
    -field_petscdualspace_form_degree 0 \
    -field_petscdualspace_order 1 \
    -field_petscdualspace_components 3
  rm ex2
  popd
}
