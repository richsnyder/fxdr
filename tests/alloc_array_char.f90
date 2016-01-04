! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-YYYY-ZZZZ.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM ALLOC_ARRAY_CHAR

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_CHAR, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  CHARACTER(KIND = C_CHAR), DIMENSION(:), ALLOCATABLE :: VALUES
  LOGICAL :: CODE

  CALL FILE_PATH('array_char.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%ALLOCATE_CHARACTER_ARRAY(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_TRUE('a' == VALUES(1))
  CALL ASSERT_TRUE('b' == VALUES(2))
  CALL ASSERT_TRUE('c' == VALUES(3))
  DEALLOCATE(VALUES)

  CALL XDRS%DESTROY()

END PROGRAM
