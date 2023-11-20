cmake_minimum_required(VERSION 3.27.6)
project(MYLLVM VERSION 1.0.0 DESCRIPTION "LLVM WITH GRAPHICS")

enable_language(C)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

add_subdirectory(mainAction)
set(SOURCES ${PROJECT_SOURCE_DIR}/src)
set(INCLUDES ${PROJECT_SOURCE_DIR}/includes)

file(GLOB_RECURSE LLVM_FILES ${SOURCES}/*.c ${INCLUDES}/*.h)

add_library(myllvm STATIC ${LLVM_FILES})
target_include_directories(myllvm PUBLIC ${INCLUDES})

find_program(CLANG_FORMAT "clang-format" REQUIRED)
add_custom_target (
    format
    COMMAND clang-format
    -i
    -style=file
    ${LLVM_FILES}
)
