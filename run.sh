#! /usr/bin/env bash

function arch_upgrade() {
  sudo pacman --needed --noconfirm -Syyuq >/dev/null 2>&1
  sudo pacman --needed --noconfirm -S cmake clang >/dev/null 2>&1
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
  docker images --format "{{.Repository}}" #| cut
  printf "[2/3] List finished.\n"
}

function extract_tutorial() {
  local INPUT=${GITPOD_REPO_ROOT}/extracted
  mkdir -p ${INPUT} && cp -R /opt/petsc/linux-c-opt/share/petsc/examples/ ${INPUT}
  printf "[3/3] PETsc is ready.\n"
}

function start() {
  arch_upgrade
  pull_images
  list_images
  extract_tutorial
}

function run_dualspace() {
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

function run_fe() {
  pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/dm/dt/fe/tests
  make ex1
  mpiexec -n 1 ./ex1 -dm_view
  mpiexec -n 1 ./ex1 -dm_view -potential_petscspace_degree 1
  mpiexec -n 1 ./ex1 -dm_view -potential_petscspace_degree 2
  mpiexec -n 1 ./ex1 -dm_view -potential_petscspace_degree 3
  rm ex1
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

function run_examples() {
  export OMPI_MCA_opal_warn_on_missing_libcuda=0
  export PETSC_DIR=/opt/petsc/linux-c-opt
  export PYTHONPATH=/opt/petsc/linux-c-opt/lib:${PYTHONPATH}
  # run_dualspace
  run_fe
  # pushd ${GITPOD_REPO_ROOT}/extracted/examples/src/ksp/ksp/tutorials
  # python ex100.py
  # make ex1 && mpiexec -n 1 ./ex1 -m 100000 && rm ex1
  # popd
}

# start
run_examples
