cmake_minimum_required(VERSION 3.14)

project("Playing with MUMPS" C)

#option(USE_MPI "Use MPI" OFF)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR})
include(FindMUMPS)
find_package(MUMPS REQUIRED)
add_executable(LL_mumps LL_mumps.c)
target_link_libraries(LL_mumps PUBLIC MUMPS::MUMPS)