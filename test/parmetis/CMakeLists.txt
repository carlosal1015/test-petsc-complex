#find_package(MPI REQUIRED)

add_executable(LL_parmetis LL_parmetis.cc)
target_link_libraries(LL_parmetis PUBLIC ParMETIS::ParMETIS)

add_custom_target(run_parmetis
    COMMAND mpirun -np 4 --oversubscribe LL_parmetis
    DEPENDS LL_parmetis
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)