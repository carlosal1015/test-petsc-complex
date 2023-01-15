cmake_minimum_required(VERSION 3.14)

project("AUR tests") # LANGUAGES CXX VERSION 0.1

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake)
include(FindMETIS)
include(FindParMETIS)

add_subdirectory("metis")
add_subdirectory("parmetis")
add_subdirectory("mumps")