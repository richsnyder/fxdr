# DISTRIBUTION STATEMENT A. Approved for public release; distribution is
# unlimited.  Granted clearance per 88ABW-2016-0371.
#
# This file is declared a work of the U.S. Government and is not subject to
# copyright protection in the United States.

# Define functions.

FUNCTION(ADD_PAGES)

  SET(links ${CMAKE_CURRENT_SOURCE_DIR}/links.md)
  CONFIGURE_FILE(template.in template.txt @ONLY)

  FOREACH(page ${ARGN})
    SET(cfg ${CMAKE_CURRENT_SOURCE_DIR}/${page}.md)
    SET(src ${CMAKE_CURRENT_BINARY_DIR}/${page}_.md)
    SET(dst ${CMAKE_CURRENT_BINARY_DIR}/${page}.html)
    CONFIGURE_FILE(${cfg} ${src} @ONLY)
    ADD_CUSTOM_COMMAND(
      OUTPUT ${dst}
      MAIN_DEPENDENCY ${src}
      COMMAND ${Pandoc_EXECUTABLE}
      ARGS -s -t html5 --template=template.txt -o ${dst} ${src} ${links}
    )
    LIST(APPEND pages ${dst})
  ENDFOREACH()

  GET_FILENAME_COMPONENT(srcdir "${CMAKE_CURRENT_SOURCE_DIR}" REALPATH)
  GET_FILENAME_COMPONENT(bindir "${CMAKE_CURRENT_BINARY_DIR}" REALPATH)
  IF(bindir STREQUAL srcdir)
    LIST(APPEND pages ${CMAKE_CURRENT_SOURCE_DIR}/style.css)
  ELSE()
    SET(src ${CMAKE_CURRENT_SOURCE_DIR}/style.css)
    SET(dst ${CMAKE_CURRENT_BINARY_DIR}/style.css)
    ADD_CUSTOM_COMMAND(
      OUTPUT ${dst}
      MAIN_DEPENDENCY ${src}
      COMMAND ${CMAKE_COMMAND}
      ARGS -E copy ${src} ${dst}
    )
    LIST(APPEND pages ${dst})
  ENDIF()

  ADD_CUSTOM_TARGET(doc ALL DEPENDS ${pages})
  INSTALL(FILES ${pages} DESTINATION doc/html)

ENDFUNCTION()

# Add pages to the documentation target.

ADD_PAGES(index fxdr
    create destroy
    read_file write_file
    getsize getpos setpos
    put put_character put_unsigned
    put_vector put_character_vector put_unsigned_vector
    put_array put_character_array put_unsigned_array
    get get_character get_unsigned
    get_vector get_character_vector get_unsigned_vector
    get_array get_character_array get_unsigned_array
    allocate_array allocate_character_array allocate_unsigned_array)
