function test_triangle() {
  # env > /tmp/env
  docker run -t -d --rm --name triangle ghcr.io/carlosal1015/aur/petsc-complex-triangle
  docker cp ${GITPOD_REPO_ROOT}/run.sh triangle:/home/gitpod
  # docker cp ${GITPOD_REPO_ROOT}/start.sh triangle:/home/gitpod
  docker exec -it triangle bash /home/gitpod/run.sh
  docker stop triangle
}

test_triangle
