! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM ALLOC_ARRAY_DOUBLE

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_DOUBLE, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  REAL(KIND = C_DOUBLE), DIMENSION(:), ALLOCATABLE :: VALUES
  LOGICAL :: CODE

  CALL FILE_PATH('array_double.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%ALLOCATE_ARRAY(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 1.23456E+300_C_DOUBLE, VALUES(1), 1.0E-306_C_DOUBLE)
  CALL ASSERT_EQUALS(-2.34567E+300_C_DOUBLE, VALUES(2), 1.0E-306_C_DOUBLE)
  CALL ASSERT_EQUALS( 3.45678E-300_C_DOUBLE, VALUES(3), 1.0E-306_C_DOUBLE)
  DEALLOCATE(VALUES)

  CALL XDRS%DESTROY()

END PROGRAM
