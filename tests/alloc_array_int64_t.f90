! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-YYYY-ZZZZ.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM ALLOC_ARRAY_INT64_T

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT64_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  INTEGER(KIND = C_INT64_T), DIMENSION(:), ALLOCATABLE :: VALUES
  LOGICAL :: CODE

  CALL FILE_PATH('array_int64.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%ALLOCATE_ARRAY(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 1234567890123456789_C_INT64_T, VALUES(1))
  CALL ASSERT_EQUALS(-2345678901234567890_C_INT64_T, VALUES(2))
  CALL ASSERT_EQUALS( 4567890123456789012_C_INT64_T, VALUES(3))
  DEALLOCATE(VALUES)

  CALL XDRS%DESTROY()

END PROGRAM
