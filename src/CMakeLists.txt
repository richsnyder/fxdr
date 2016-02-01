# DISTRIBUTION STATEMENT A. Approved for public release; distribution is
# unlimited.  Granted clearance per 88ABW-2016-0371.
#
# This file is declared a work of the U.S. Government and is not subject to
# copyright protection in the United States.

ADD_LIBRARY(fxdr STATIC xdr_utils.c xdr.f90)
TARGET_LINK_LIBRARIES(fxdr ${EXTRA_LIBS})
INSTALL(TARGETS fxdr ARCHIVE DESTINATION lib)
INSTALL(FILES ${CMAKE_CURRENT_BINARY_DIR}/xdr.mod DESTINATION include)
