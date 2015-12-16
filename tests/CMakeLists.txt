# Load and run select CMake files.

INCLUDE(CMakeParseArguments)

# Define functions.

FUNCTION(ADD_STANDARD_TEST A_NAME)

  # Parse the arguments to the function.
  CMAKE_PARSE_ARGUMENTS(A
    ""
    ""
    "SOURCE"
    ${ARGN}
  )

  IF(NOT A_SOURCE)
    STRING(REPLACE "-" "_" A_SOURCE "${A_NAME}.f90")
  ENDIF()

  ADD_EXECUTABLE(${A_NAME} ${A_SOURCE} assert.f90 helpers.f90)
  TARGET_LINK_LIBRARIES(${A_NAME} ${EXTRA_LIBS})
  ADD_TEST(NAME ${A_NAME} COMMAND ${A_NAME} ${CMAKE_CURRENT_SOURCE_DIR})

ENDFUNCTION()

# Include project build directories and libraries.

INCLUDE_DIRECTORIES(BEFORE ${CMAKE_CURRENT_BINARY_DIR}/../src)
LIST(APPEND EXTRA_LIBS fxdr)

# Add unit tests.

ADD_STANDARD_TEST(get-logical)
ADD_STANDARD_TEST(get-char)
ADD_STANDARD_TEST(get-int8_t)
ADD_STANDARD_TEST(get-int16_t)
ADD_STANDARD_TEST(get-int32_t)
ADD_STANDARD_TEST(get-int64_t)
ADD_STANDARD_TEST(get-uint8_t)
ADD_STANDARD_TEST(get-uint16_t)
ADD_STANDARD_TEST(get-uint32_t)
ADD_STANDARD_TEST(get-float)
ADD_STANDARD_TEST(get-double)
ADD_STANDARD_TEST(get-bytes)
ADD_STANDARD_TEST(get-string)

ADD_STANDARD_TEST(get-vector-logical)
ADD_STANDARD_TEST(get-vector-char)
ADD_STANDARD_TEST(get-vector-int8_t)
ADD_STANDARD_TEST(get-vector-int16_t)
ADD_STANDARD_TEST(get-vector-int32_t)
ADD_STANDARD_TEST(get-vector-int64_t)
ADD_STANDARD_TEST(get-vector-uint8_t)
ADD_STANDARD_TEST(get-vector-uint16_t)
ADD_STANDARD_TEST(get-vector-uint32_t)
ADD_STANDARD_TEST(get-vector-float)
ADD_STANDARD_TEST(get-vector-double)
ADD_STANDARD_TEST(get-vector-bytes)
ADD_STANDARD_TEST(get-vector-string)

ADD_STANDARD_TEST(get-array-logical)
ADD_STANDARD_TEST(get-array-char)
ADD_STANDARD_TEST(get-array-int8_t)
ADD_STANDARD_TEST(get-array-int16_t)
ADD_STANDARD_TEST(get-array-int32_t)
ADD_STANDARD_TEST(get-array-int64_t)
ADD_STANDARD_TEST(get-array-uint8_t)
ADD_STANDARD_TEST(get-array-uint16_t)
ADD_STANDARD_TEST(get-array-uint32_t)
ADD_STANDARD_TEST(get-array-float)
ADD_STANDARD_TEST(get-array-double)
ADD_STANDARD_TEST(get-array-bytes)
ADD_STANDARD_TEST(get-array-string)

ADD_STANDARD_TEST(put-logical)
ADD_STANDARD_TEST(put-char)
ADD_STANDARD_TEST(put-int8_t)
ADD_STANDARD_TEST(put-int16_t)
ADD_STANDARD_TEST(put-int32_t)
ADD_STANDARD_TEST(put-int64_t)
ADD_STANDARD_TEST(put-uint8_t)
ADD_STANDARD_TEST(put-uint16_t)
ADD_STANDARD_TEST(put-uint32_t)
ADD_STANDARD_TEST(put-float)
ADD_STANDARD_TEST(put-double)
ADD_STANDARD_TEST(put-bytes)
ADD_STANDARD_TEST(put-string)

ADD_STANDARD_TEST(put-vector-logical)
ADD_STANDARD_TEST(put-vector-char)
ADD_STANDARD_TEST(put-vector-int8_t)
ADD_STANDARD_TEST(put-vector-int16_t)
ADD_STANDARD_TEST(put-vector-int32_t)
ADD_STANDARD_TEST(put-vector-int64_t)
ADD_STANDARD_TEST(put-vector-uint8_t)
ADD_STANDARD_TEST(put-vector-uint16_t)
ADD_STANDARD_TEST(put-vector-uint32_t)
ADD_STANDARD_TEST(put-vector-float)
ADD_STANDARD_TEST(put-vector-double)
ADD_STANDARD_TEST(put-vector-bytes)
ADD_STANDARD_TEST(put-vector-string)

ADD_STANDARD_TEST(put-array-logical)
ADD_STANDARD_TEST(put-array-char)
ADD_STANDARD_TEST(put-array-int8_t)
ADD_STANDARD_TEST(put-array-int16_t)
ADD_STANDARD_TEST(put-array-int32_t)
ADD_STANDARD_TEST(put-array-int64_t)
ADD_STANDARD_TEST(put-array-uint8_t)
ADD_STANDARD_TEST(put-array-uint16_t)
ADD_STANDARD_TEST(put-array-uint32_t)
ADD_STANDARD_TEST(put-array-float)
ADD_STANDARD_TEST(put-array-double)
ADD_STANDARD_TEST(put-array-bytes)
ADD_STANDARD_TEST(put-array-string)

ADD_STANDARD_TEST(alloc-array-logical)
ADD_STANDARD_TEST(alloc-array-char)
ADD_STANDARD_TEST(alloc-array-int8_t)
ADD_STANDARD_TEST(alloc-array-int16_t)
ADD_STANDARD_TEST(alloc-array-int32_t)
ADD_STANDARD_TEST(alloc-array-int64_t)
ADD_STANDARD_TEST(alloc-array-uint8_t)
ADD_STANDARD_TEST(alloc-array-uint16_t)
ADD_STANDARD_TEST(alloc-array-uint32_t)
ADD_STANDARD_TEST(alloc-array-float)
ADD_STANDARD_TEST(alloc-array-double)
ADD_STANDARD_TEST(alloc-array-bytes)
ADD_STANDARD_TEST(alloc-array-string)
