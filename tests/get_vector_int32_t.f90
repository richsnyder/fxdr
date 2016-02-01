! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM GET_VECTOR_INT32_T

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT32_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  INTEGER(KIND = C_INT32_T), DIMENSION(3) :: VALUES
  LOGICAL :: CODE

  CALL FILE_PATH('sample_int32.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%GET_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(1234567890, VALUES(1))
  CALL ASSERT_EQUALS(-234567890, VALUES(2))
  CALL ASSERT_EQUALS(  34567890, VALUES(3))

  CALL XDRS%DESTROY()

END PROGRAM
