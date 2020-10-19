cmake_minimum_required(VERSION 3.13)

# ================================================================== #

include(cmake/settings/project.cmake)
project(${PROJECT_NAME} VERSION "${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_VERSION}")

# ================================================================== #
# ================================================== # Options

option(${PROJECT_NAME}_BUILD_DOCS      "Builds project documentation" ON)
option(${PROJECT_NAME}_BUILD_TESTS     "Builds project tests"         ON)

# ================================================================== #
# ================================================== # Version file

set(PROJECT_MAJOR_VERSION ${${PROJECT_NAME}_MAJOR_VERSION})
set(PROJECT_MINOR_VERSION ${${PROJECT_NAME}_MINOR_VERSION})
set(PROJECT_PATCH_VERSION ${${PROJECT_NAME}_PATCH_VERSION})

configure_file(src/version.hpp.in include/version.hpp)

# ================================================================== #
# ================================================== # Install directory

if (WIN32)
  if (DEFINED $ENV{ProgramW6432})
    set(DEFAULT_INSTALL_PATH "$ENV{ProgramW6432}/${PROJECT_NAME}")
  else()
    set(DEFAULT_INSTALL_PATH "$ENV{PROGRAMFILES}/${PROJECT_NAME}")
  endif()
else()
  set(DEFAULT_INSTALL_PATH "${CMAKE_BINARY_DIR}/installed")
endif()

if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set (CMAKE_INSTALL_PREFIX "${DEFAULT_INSTALL_PATH}" CACHE PATH "default install path" FORCE)
endif()

# ================================================================== #
# ================================================== # Principal target

file(GLOB_RECURSE HEADERS CONFIGURE_DEPENDS include/*.hpp)
file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS src/*.cpp)

add_executable(${TARGET_NAME} ${HEADERS} ${SOURCES})

include(cmake/settings/cpp.cmake)

# ================================================================== #
# ================================================== # Git Version Tracking

add_subdirectory(external/git_watcher)
target_link_libraries(${TARGET_NAME} git_watcher)

# ================================================================== #
# ================================================== # Dependencies

target_link_directories(${TARGET_NAME} PUBLIC external/lib)
target_include_directories(${TARGET_NAME} PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/include
  ${CMAKE_CURRENT_BINARY_DIR}/include
  ${CMAKE_CURRENT_SOURCE_DIR}/external/include
)

include(cmake/settings/dependencies.cmake)

# ================================================================== #
# ================================================== # Other targets

if(${PROJECT_NAME}_BUILD_DOCS)
  add_subdirectory(docs)
endif()

if(${PROJECT_NAME}_BUILD_TESTS)
  add_subdirectory(tests)
endif()

# ================================================================== #
# ================================================== # Installation

install(TARGETS ${TARGET_NAME}
  LIBRARY  DESTINATION lib
  ARCHIVE  DESTINATION lib
  RUNTIME  DESTINATION bin
  INCLUDES DESTINATION include
)