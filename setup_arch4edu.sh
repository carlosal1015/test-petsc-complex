#! /usr/bin/env bash

function setup() {
    curl -s https://gitlab.com/dune-archiso/dune-archiso.gitlab.io/-/raw/main/templates/add_arch4edu.sh | bash
    sudo pacman --needed --noconfirm -Syuq >/dev/null 2>&1
    TOOLS="git fftw hypre metis mumps parmetis suitesparse hdf5-openmpi triangle pastix scotch superlu_dist valgrind"
    # local TOOLS="fftw hypre metis mumps parmetis-git suitesparse hdf5-openmpi triangle" # petsc | pastix scotch superlu_dist valgrind
    sudo pacman --needed --noconfirm -S ${TOOLS} >/dev/null 2>&1
}
