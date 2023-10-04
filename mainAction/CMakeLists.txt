cmake_minimum_required(VERSION 3.16.3)
project(guiPlots)

file(GLOB_RECURSE LLVM_RUN_SOURCES main.cpp)
set(EXEC_NAME graphics)

add_executable(${EXEC_NAME} ${LLVM_RUN_SOURCES})

target_link_libraries(${EXEC_NAME} myllvm)

add_custom_target( 
  run_${EXEC_NAME}
  COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${EXEC_NAME}
)

add_dependencies(run_${EXEC_NAME} ${EXEC_NAME})