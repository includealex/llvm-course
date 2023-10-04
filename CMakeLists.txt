cmake_minimum_required(VERSION 3.16.3)
project(MYLLVM VERSION 1.0.0 DESCRIPTION "LLVM WITH GRAPHICS")

find_package(SFML 2.2 COMPONENTS graphics audio REQUIRED)

add_subdirectory(mainAction)

file(GLOB_RECURSE LLVM_HEADERS *.hpp)
file(GLOB_RECURSE LLVM_SOURCES *.cpp)

add_library(myllvm STATIC ${LLVM_HEADERS} ${LLVM_SOURCES})

target_link_libraries(myllvm sfml-graphics sfml-audio sfml-window)
target_include_directories(myllvm PUBLIC includes/)

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
    ${LLVM_HEADERS} ${LLVM_SOURCES}
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")
