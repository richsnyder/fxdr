CMAKE_MINIMUM_REQUIRED(VERSION 3.0.0 FATAL_ERROR)

PROJECT(fxdr LANGUAGES C Fortran VERSION 0.1.0)

# Add custom modules to the module search path and mark them for installation.

LIST(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/Modules)

# Locate all of the required global dependencies.

# Add the project subdirectory.

ADD_SUBDIRECTORY(src)

# Determine whether or not to build the unit tests.

OPTION(BUILD_TESTS "Build unit tests." ON)
IF (BUILD_TESTS)
  ENABLE_TESTING()
  ADD_SUBDIRECTORY(tests)
ENDIF()

# Determine whether or not to build the documentation.

OPTION(BUILD_DOCS "Build documentation." OFF)
IF (BUILD_DOCS)
  ADD_SUBDIRECTORY(doc)
ENDIF()
