cmake_minimum_required(VERSION 3.27.6)
project(MYLLVM VERSION 1.0.0 DESCRIPTION "LLVM WITH GRAPHICS")

set(CMAKE_C_COMPILER "/usr/bin/clang-14")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++-14")

add_subdirectory(game)
add_subdirectory(profiler)

add_compile_options("-std=c++14 -Wall -Wextra -O2 -Xclang -load -Xclang profiler/profiler_sources/libPass.so")
