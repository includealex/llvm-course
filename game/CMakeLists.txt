add_subdirectory(mainAction)
set(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src)
set(INCLUDES ${CMAKE_CURRENT_SOURCE_DIR}/includes)

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
