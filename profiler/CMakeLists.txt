find_package(LLVM CONFIG)
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
    COMMENT "Instrumenting ${SOURCE}"
    COMMAND clang -Xclang -load -Xclang $<TARGET_FILE_DIR:profiler>/$<TARGET_FILE_NAME:profiler> ${SOURCE} -O2
)