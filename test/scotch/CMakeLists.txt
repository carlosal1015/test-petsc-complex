find_package(PTScotch REQUIRED)

add_executable(LL_scotch LL_scotch.c)
target_link_libraries(LL_scotch PUBLIC PTScotch::Scotch)

add_custom_target(run_scotch
    COMMAND LL_scotch
    DEPENDS LL_scotch
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR}
)