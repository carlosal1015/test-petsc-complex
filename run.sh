#! /usr/bin/env bash

function extract_tutorial() {
  export OMPI_MCA_opal_warn_on_missing_libcuda=0
  export PETSC_DIR=/opt/petsc/linux-c-opt
  export PYTHONPATH=${PETSC_DIR}/lib:${PYTHONPATH}
  # export GITPOD_REPO_ROOT=${HOME}
  local INPUT=${GITPOD_REPO_ROOT}/extracted
  mkdir -p ${INPUT} && cp -R ${PETSC_DIR}/share/petsc/examples/ ${INPUT}
}

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

function run_dualspace() {
  run_dualspace_ex1
  run_dualspace_ex2
}

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

function install_triangle() {
  local PACKAGE="archimedes-tools"
  local AUR_URL="https://aur.archlinux.org/cgit/aur.git/snapshot/${PACKAGE}.tar.gz"
  curl -LO ${AUR_URL}
  tar -xvf ${PACKAGE}.tar.gz
  pushd ${PACKAGE}
  makepkg --noconfirm -sirc
  popd
}

function download_triangle() {
  local DATE=$(date -u +"%Y-%m-%d" --date='5 hours ago')
  local EXTENSION="-x86_64.pkg.tar.zst"
  local BASE_URL="https://github.com/carlosal1015/aur/releases/download/${DATE}"
  local PACKAGE="triangle-1.6-8${EXTENSION}"
  local GH_URL="${BASE_URL}/${PACKAGE}"
  curl -LO ${GH_URL}
}

extract_tutorial
run_examples
# download_triangle
