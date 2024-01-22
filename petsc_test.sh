#! /usr/bin/env bash

function test_mumps() {
  # env > /tmp/env
  docker run -t -d --rm -e GITPOD_REPO_ROOT=/home/gitpod --name mumps ghcr.io/carlosal1015/aur/petsc-complex-mumps
  docker cp ${GITPOD_REPO_ROOT}/ex19_mumps.sh mumps:/home/gitpod
  docker exec -it mumps bash /home/gitpod/ex19_mumps.sh
  docker stop mumps
}

test_mumps