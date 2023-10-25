cmake_minimum_required(VERSION 3.27.6)
project(guiPlots)

set(EXEC_NAME graphics)

add_executable(${EXEC_NAME} ./app.c)

target_link_libraries(${EXEC_NAME} PRIVATE myllvm SDL2)

add_custom_target( 
  run_${EXEC_NAME}
  COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${EXEC_NAME}
)

add_dependencies(run_${EXEC_NAME} ${EXEC_NAME})
