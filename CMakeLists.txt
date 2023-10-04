cmake_minimum_required(VERSION 3.27.6)
project(MYLLVM VERSION 1.0.0 DESCRIPTION "LLVM WITH GRAPHICS")

add_subdirectory(mainAction)

file(GLOB_RECURSE LLVM_FILES ./src/*cpp ./includes/*.hpp)

add_library(myllvm STATIC ${LLVM_FILES})

target_include_directories(myllvm PUBLIC ./includes/)

set_target_properties(myllvm PROPERTIES
  CXX_STANDARD 17
  CXX_STANDARD_REQUIRED ON
)

find_program(CLANG_FORMAT "clang-format" REQUIRED)

add_custom_target (
    format
    COMMAND clang-format
    -i
    -style=file
    ${LLVM_FILES}
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -lm")
