cmake_minimum_required(VERSION 3.27.6)
project(guiPlots)

set(SFML_VERSION "2.6.0")

include(FetchContent)
FetchContent_Declare(
    sfml
    GIT_REPOSITORY "https://github.com/SFML/SFML.git"
    GIT_TAG        "${SFML_VERSION}"
)
### Dependency population ###

## Switched ON to build sfml as dll
set(BUILD_SHARED_LIBS ON)

# sfml
set(SFML_BUILD_EXAMPLES OFF)
set(SFML_BUILD_DOC OFF)

set(SFML_BUILD_NETWORK OFF)

set(SFML_BUILD_AUDIO ON)
set(SFML_BUILD_GRAPHICS ON)
set(SFML_BUILD_WINDOW ON)

FetchContent_MakeAvailable(sfml)

set(EXEC_NAME graphics)

add_executable(${EXEC_NAME} ./main.cpp)

target_link_libraries(${EXEC_NAME} PRIVATE myllvm sfml-graphics sfml-window)

add_custom_target( 
  run_${EXEC_NAME}
  COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${EXEC_NAME}
)

add_dependencies(run_${EXEC_NAME} ${EXEC_NAME})
