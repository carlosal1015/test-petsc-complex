#! /usr/bin/env bash

source extract_tutorial.sh
source run_dual_space_ex1.sh
source run_dual_space_ex2.sh

function run_dualspace() {
  run_dualspace_ex1
  run_dualspace_ex2
}

source run_fe_ex1.sh
source run_fe_ex2.sh
source run_fe_ex3.sh

function run_fe() {
  # requires: triangle
  run_fe_ex1
  # run_fe_ex2
  # run_fe_ex3
}

function run_space() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/space/impls/ptrimmed/tests
  make ex1
  mpiexec -n 1 ./ex1
  rm ex1
  popd
}

function run_tests() {
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex1
  # mpiexec -n 1 ./ex1 -degrees 1,2,3,4,5 -points 0,.2,-.5,.8,.9,1 -interval -.5,1
  # rm ex1
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex2
  # mpiexec -n 1 ./ex2 -degrees 1,2,3 -target_points -0.3,0,.2 -src_points -1,-.3,0,.2,1
  # rm ex2
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex3
  # mpiexec -n 1 ./ex3
  # rm ex3
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex4
  # mpiexec -n 1 ./ex4
  # rm ex4
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex5
  # mpiexec -n 1 ./ex5 -petscspace_degree 1 -trace_fe_view
  # rm ex5
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex6
  # mpiexec -n 1 ./ex6
  # rm ex6
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex7
  # mpiexec -n 1 ./ex7 -verbose
  # mpiexec -n 1 ./ex7 -N 5,6
  # rm ex7
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex8
  # mpiexec -n 1 ./ex8
  # rm ex8
  # popd
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  # make ex9
  # mpiexec -n 1 ./ex9 -dim 1
  # mpiexec -n 1 ./ex9 -dim 2
  # mpiexec -n 1 ./ex9 -dim 3
  # mpiexec -n 1 ./ex9 -dim 4
  # rm ex9
  # popd
  # requires: triangle
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/tests
  make ex10
  mpiexec -n 1 ./ex10 -velocity_petscspace_degree 1 \
    -velocity_petscspace_type poly \
    -velocity_petscspace_components 2 -velocity_petscdualspace_type lagrange \
    -divu_petscspace_degree 0 \
    -divu_petscspace_type poly \
    -divu_petscdualspace_lagrange_continuity false \
    -velocity_sum_petscfe_default_quadrature_order 1 \
    -velocity_sum_petscspace_degree 1 \
    -velocity_sum_petscspace_type sum \
    -velocity_sum_petscspace_variables 2 \
    -velocity_sum_petscspace_components 2 \
    -velocity_sum_petscspace_sum_spaces 2 \
    -velocity_sum_petscspace_sum_concatenate true \
    -velocity_sum_petscdualspace_type lagrange \
    -velocity_sum_sumcomp_0_petscspace_type poly \
    -velocity_sum_sumcomp_0_petscspace_degree 1 \
    -velocity_sum_sumcomp_0_petscspace_variables 2 \
    -velocity_sum_sumcomp_0_petscspace_components 1 \
    -velocity_sum_sumcomp_1_petscspace_type poly \
    -velocity_sum_sumcomp_1_petscspace_degree 1 \
    -velocity_sum_sumcomp_1_petscspace_variables 2 \
    -velocity_sum_sumcomp_1_petscspace_components 1 \
    -divu_sum_petscspace_degree 0 \
    -divu_sum_petscspace_type sum \
    -divu_sum_petscspace_variables 2 \
    -divu_sum_petscspace_components 1 \
    -divu_sum_petscspace_sum_spaces 1 \
    -divu_sum_petscspace_sum_concatenate true \
    -divu_sum_petscdualspace_lagrange_continuity false \
    -divu_sum_sumcomp_0_petscspace_type poly \
    -divu_sum_sumcomp_0_petscspace_degree 0 \
    -divu_sum_sumcomp_0_petscspace_variables 2 \
    -divu_sum_sumcomp_0_petscspace_components 1 \
    -dm_refine 0 \
    -snes_error_if_not_converged \
    -ksp_rtol 1e-10 \
    -ksp_error_if_not_converged \
    -pc_type fieldsplit -pc_fieldsplit_type schur -divu_sum_petscdualspace_lagrange_continuity false \
    -pc_fieldsplit_schur_precondition full
  rm ex10
  popd
}

function run_field() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/field/tutorials
  make ex1
  mpiexec -n 1 ./ex1 -dm_type da -dim 2 -num_components 2 -num_point_tests 2 -num_fe_tests 2 -num_fv_tests 2 -dmfield_view
  mpiexec -n 1 ./ex1 -dm_type da -dim 1 -num_fe_tests 2
  mpiexec -n 1 ./ex1 -dm_type da -dim 2 -num_fe_tests 2
  mpiexec -n 1 ./ex1 -dm_type da -dim 3 -num_fe_tests 2
  # required: triangle
  # mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3 -num_components 2 -num_point_tests 2 -num_fe_tests 2 -num_fv_tests 2 -dmfield_view -petscspace_degree 2 -num_quad_points 1
  # mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3  -num_fe_tests 2  -petscspace_degree 0
  # mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3  -num_fe_tests 2  -petscspace_degree 1
  # mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3  -num_fe_tests 2  -petscspace_degree 2
  mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3 -num_fe_tests 2 -petscspace_poly_tensor 1 -petscspace_degree 0 -dm_plex_simplex 0
  mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3 -num_fe_tests 2 -petscspace_poly_tensor 1 -petscspace_degree 1 -dm_plex_simplex 0
  mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3 -num_fe_tests 2 -petscspace_poly_tensor 1 -petscspace_degree 2 -dm_plex_simplex 0
  mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 3 -dm_plex_box_faces 3,3,3 -num_fe_tests 2 -petscspace_poly_tensor 1 -petscspace_degree 0 -dm_plex_simplex 0
  mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 3 -dm_plex_box_faces 3,3,3 -num_fe_tests 2 -petscspace_poly_tensor 1 -petscspace_degree 1 -dm_plex_simplex 0
  mpiexec -n 1 ./ex1 -dm_type plex -dm_plex_dim 3 -dm_plex_box_faces 3,3,3 -num_fe_tests 2 -petscspace_poly_tensor 1 -petscspace_degree 2 -dm_plex_simplex 0
  # required: triangle
  # mpiexec -n 1 ./ex1 -dm_coord_space 0 -dm_type plex -dm_plex_dim 2 -dm_plex_box_faces 3,3 -num_components 2 -num_point_tests 2 -num_fe_tests 2 -num_fv_tests 2 -dmfield_view -num_quad_points 1 -test_shell
  rm ex1
  popd
}

function run_composite() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/impls/composite/tests
  make ex1
  mpiexec -n 1 ./ex1
  rm ex1
  popd
}

# function run_forest() {
#   pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/impls/forest/p4est/tests
#   make ex1
#   mpiexec -n 1 ./ex1
#   rm ex1
#   popd
# }

function run_forest_test() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/impls/forest/tests
  make ex1
  mpiexec -n 1 ./ex1 -dm_plex_simplex 0 -dm_plex_box_faces 3,3
  popd
}

function run_examples() {
  # run_dualspace
  # run_fe
  # run_space
  # run_tests
  # run_field
  # run_composite
  # run_forest
  run_forest_test
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/ksp/ksp/tutorials
  # python ex100.py
  # make ex1 && mpiexec -n 1 ./ex1 -m 100000 && rm ex1
  # popd
}

source install_triangle.sh
source download_triangle.sh

extract_tutorial
run_examples
# download_triangle
