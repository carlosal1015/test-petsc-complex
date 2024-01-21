find_package(METIS REQUIRED)

add_executable(LL_metis LL_metis.cc)
target_link_libraries(LL_metis PUBLIC METIS::METIS)

add_custom_target(run_metis
    COMMAND LL_metis
    DEPENDS LL_metis
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)