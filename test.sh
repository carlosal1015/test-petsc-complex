#! /usr/bin/env bash

function test_triangle() {
  # env > /tmp/env
  docker run -t -d --rm -e GITPOD_REPO_ROOT=/home/gitpod --name triangle ghcr.io/carlosal1015/aur/petsc-complex-triangle
  docker cp ${GITPOD_REPO_ROOT}/run.sh triangle:/home/gitpod
  # docker cp ${GITPOD_REPO_ROOT}/start.sh triangle:/home/gitpod
  docker exec -it triangle bash /home/gitpod/run.sh
  docker stop triangle
}

function test_hdf5-openmpi() {
  docker run -t -d --rm -e GITPOD_REPO_ROOT=/home/gitpod --name hdf5-openmpi ghcr.io/carlosal1015/aur/petsc-complex-hdf5-openmpi
  docker cp ${GITPOD_REPO_ROOT}/run.sh hdf5-openmpi:/home/gitpod
  docker exec -it hdf5-openmpi bash /home/gitpod/run.sh
  docker stop hdf5-openmpi
}

function test_hdf5-openmpi-p4est-deal-ii() {
  docker run -t -d --rm -e GITPOD_REPO_ROOT=/home/gitpod -e P4EST_DIR=/opt/p4est-deal-ii/ --name hdf5-openmpi-p4est-deal-ii ghcr.io/carlosal1015/aur/petsc-complex-hdf5-openmpi-p4est-deal-ii
  docker cp ${GITPOD_REPO_ROOT}/run.sh hdf5-openmpi-p4est-deal-ii:/home/gitpod
  docker exec -it hdf5-openmpi-p4est-deal-ii bash /home/gitpod/run.sh
  docker stop hdf5-openmpi-p4est-deal-ii
}

function test_trilinos() {
  docker run -t -d --rm -e GITPOD_REPO_ROOT=/home/gitpod --name trilinos ghcr.io/carlosal1015/aur/petsc-complex-trilinos
  docker cp ${GITPOD_REPO_ROOT}/run.sh trilinos:/home/gitpod
  docker exec -it trilinos bash /home/gitpod/run.sh
  docker stop trilinos
}

# test_triangle
# test_hdf5-openmpi
# test_hdf5-openmpi-p4est-deal-ii
# test_trilinos

function namcap_ldd_objdump() {
  local flavours=(hdf5-openmpi)
  # local flavours=(libyaml mumps fftw suitesparse superlu superlu_dist hdf5-openmpi hypre p4est-deal-ii pastix triangle python-mpi4py hdf5-openmpi-p4est-deal-ii opencl)
  for flavour in ${flavours[@]}; do
    docker run -t -d --rm --name ${flavour} ghcr.io/carlosal1015/aur/petsc-complex-${flavour}
    docker cp ${GITPOD_REPO_ROOT}/list.sh ${flavour}:/home/gitpod
    docker exec -it ${flavour} bash /home/gitpod/list.sh
    docker cp ${flavour}:/tmp/log.txt .
    docker stop ${flavour}
    mv log.txt log-petsc-complex-${flavour}.txt
  done
}

namcap_ldd_objdump