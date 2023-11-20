cmake_minimum_required(VERSION 3.27.6)

set(EXEC_NAME graphics)

add_executable(${EXEC_NAME} ./app.c)
target_link_libraries(${EXEC_NAME} PUBLIC myllvm SDL2)

add_custom_target( 
  run_${EXEC_NAME}
  COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${EXEC_NAME}
)

add_dependencies(run_${EXEC_NAME} ${EXEC_NAME})
  
  
add_custom_target(
  gen_IR
  WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
  COMMAND ${CMAKE_C_COMPILER} -S -emit-llvm ${CMAKE_CURRENT_SOURCE_DIR}/app.c
          -I${PROJECT_SOURCE_DIR}/includes/ -O2
          -o ${CMAKE_CURRENT_SOURCE_DIR}/llvm_file/appIR.ll
)
