find_package(LLVM 14 CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")

set(PR_SRC ${CMAKE_CURRENT_SOURCE_DIR}/profiler_sources/prof_pass.cpp)
set(PR_LOG ${CMAKE_CURRENT_SOURCE_DIR}/profiler_sources/log.c)

# add_library(pass SHARED ${PR_SRC})
# target_include_directories(pass PRIVATE ${LLVM_INCLUDE_DIRS})

add_custom_target(run_profiler
  COMMAND ${CMAKE_CXX_COMPILER} ${PR_SRC} -c -fPIC -I`llvm-config --includedir` -o ${CMAKE_CURRENT_BINARY_DIR}/pass.o
  COMMAND ${CMAKE_C_COMPILER} ${PR_LOG} -c -fPIC -o ${CMAKE_CURRENT_BINARY_DIR}/log.o
  COMMAND ${CMAKE_CXX_COMPILER} ${CMAKE_CURRENT_BINARY_DIR}/pass.o -shared -fPIC -o ${CMAKE_CURRENT_BINARY_DIR}/lib_pass.so
  COMMAND ${CMAKE_C_COMPILER} ${PROJECT_SOURCE_DIR}/game/mainAction/app.c  -I${PROJECT_SOURCE_DIR}/game/includes
           -c -o ${CMAKE_CURRENT_BINARY_DIR}/app.o -Xclang -load -Xclang ${CMAKE_CURRENT_BINARY_DIR}/lib_pass.so -O2
  COMMAND ${CMAKE_C_COMPILER} ${PROJECT_SOURCE_DIR}/game/src/graphics.c -I${PROJECT_SOURCE_DIR}/game/includes 
    ${CMAKE_CURRENT_BINARY_DIR}/log.o ${CMAKE_CURRENT_BINARY_DIR}/app.o -lSDL2 -o trace.out
  COMMAND ${CMAKE_CURRENT_BINARY_DIR}/trace.out > ${CMAKE_CURRENT_BINARY_DIR}/insn.trace
  COMMAND python3 pass_dump.py
)
