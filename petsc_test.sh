#! /usr/bin/env bash

function test_local_mumps() {
  docker run -t -d --rm -e GITPOD_REPO_ROOT=/home/gitpod --name mumps ghcr.io/carlosal1015/aur/petsc-complex-mumps
  docker cp ${GITPOD_REPO_ROOT}/ex19_mumps.sh mumps:/home/gitpod
  docker exec -it mumps bash /home/gitpod/ex19_mumps.sh
  docker stop mumps
}

# test_local_mumps

function test_arch4edu_mumps() {
  docker run -t -d --rm -e GITPOD_REPO_ROOT=/home/gitpod --name metis ghcr.io/carlosal1015/aur/metis
  docker cp ${GITPOD_REPO_ROOT}/setup_arch4edu.sh metis:/home/gitpod
  docker cp ${GITPOD_REPO_ROOT}/ex19_mumps.sh metis:/home/gitpod
  docker exec -it metis bash /home/gitpod/ex19_mumps.sh
  docker stop metis
}

test_arch4edu_mumps
