cmake_minimum_required(VERSION 3.14)

project("Playing with MUMPS")

#option(USE_MPI "Use MPI" OFF)
find_package(MUMPS REQUIRED)
add_executable(LL_mumps LL_mumps.c)