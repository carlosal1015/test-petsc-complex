find_package(MUMPS REQUIRED)

add_executable(LL_mumps LL_mumps.c)
target_include_directories(LL_mumps PUBLIC ${MUMPS_INCLUDE_DIRS})
target_link_libraries(LL_mumps ${MUMPS_LIBRARIES})

add_custom_target(run_mumps
    COMMAND mpirun -np 4 --oversubscribe LL_mumps
    DEPENDS LL_mumps
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)