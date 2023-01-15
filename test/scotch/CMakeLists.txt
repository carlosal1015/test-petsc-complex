option(USE_MPI "Use MPI" OFF)
find_package(METIS REQUIRED)
find_package(PTScotch REQUIRED)

add_executable(LL_scotch LL_scotch.c)
target_link_libraries(LL_scotch PUBLIC METIS::METIS PTScotch::Scotch)

add_custom_target(run_scotch
    COMMAND LL_scotch
    DEPENDS LL_scotch
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)