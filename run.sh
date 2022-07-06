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
  run_fe_ex1
  # run_fe_ex2
  # run_fe_ex3
}

function run_examples() {
  # run_dualspace
  run_fe
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

run_examples
# download_triangle
