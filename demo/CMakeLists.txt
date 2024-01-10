cmake_minimum_required(VERSION 3.28)

project("Playing with MUMPS" C)

#option(USE_MPI "Use MPI" OFF)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR})
include(FindMUMPS)
find_package(MUMPS REQUIRED)
add_executable(LL_mumps LL_mumps.c)
#target_link_libraries(LL_mumps PUBLIC MUMPS::MUMPS)
target_link_libraries(LL_mumps ${MUMPS_LIBRARIES})
# target_include_directories(LL_mumps PUBLIC ${MUMPS_INCLUDE_DIRS})
# target_link_libraries(LL_mumps ${MUMPS_LIBRARIES})
# target_link_libraries(LL_mumps PUBLIC MUMPS::MUMPS)

add_custom_target(run_mumps
    COMMAND mpirun -np 4 --oversubscribe LL_mumps
    DEPENDS LL_mumps
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)