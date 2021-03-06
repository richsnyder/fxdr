! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM ALLOC_ARRAY_STRING

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_CHAR, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  CHARACTER(KIND = C_CHAR, LEN = 64), DIMENSION(:), ALLOCATABLE :: VALUES
  LOGICAL :: CODE

  CALL FILE_PATH('array_string.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%ALLOCATE_ARRAY(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_TRUE('abcdef' == VALUES(1))
  CALL ASSERT_TRUE('ghijkl' == VALUES(2))
  CALL ASSERT_TRUE('mnopqr' == VALUES(3))
  DEALLOCATE(VALUES)

  CALL XDRS%DESTROY()

END PROGRAM
