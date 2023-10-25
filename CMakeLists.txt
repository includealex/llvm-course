cmake_minimum_required(VERSION 3.16.0)
project(MYLLVM VERSION 1.0.0 DESCRIPTION "LLVM WITH GRAPHICS")
enable_language(C)
set(CMAKE_CXX_STANDARD 17)

add_subdirectory(game)
add_subdirectory(profiler)

add_compile_options("-Wall -Wextra -O2 -Xclang -load -Xclang profiler/profiler_sources/libPass.so")
