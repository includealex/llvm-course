find_package(LLVM 14 CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")

set(PR_SRC profiler_sources/prof_pass.cpp)
set(PR_EXA profiler_tests/prof_example.c)

add_library(profiler SHARED ${PR_SRC})
target_include_directories(profiler PRIVATE ${LLVM_INCLUDE_DIRS})

target_sources(profiler PRIVATE
   ${PR_EXA}
)
target_link_libraries(profiler PRIVATE LLVM)

add_custom_target(run_profiler
    COMMAND clang++ -Xclang -load -Xclang $<TARGET_FILE_DIR:profiler>/$<TARGET_FILE_NAME:profiler> 
      ${CMAKE_SOURCE_DIR}/game/mainAction/app.c
      -I${PROJECT_SOURCE_DIR}/game/includes/
      ${CMAKE_CURRENT_SOURCE_DIR}/profiler_sources/log.c -c -O2 -std=c++14
)