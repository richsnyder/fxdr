! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM GET_STRING

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_CHAR
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  CHARACTER(KIND = C_CHAR, LEN = 16) :: VALUE
  LOGICAL :: CODE

  CALL FILE_PATH('sample_string.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_TRUE('abcdef' == VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_TRUE('ghijkl' == VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_TRUE('mnopqr' == VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM
