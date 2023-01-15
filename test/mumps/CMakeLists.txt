find_package(METIS REQUIRED)

add_executable(LL_mumps LL_mumps.c)
target_link_libraries(LL_metis PUBLIC METIS::METIS)

add_custom_target(run_mumps
    COMMAND LL_mumps
    DEPENDS LL_mumps
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)