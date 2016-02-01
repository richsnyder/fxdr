! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM GET_UINT32_T

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT64_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  INTEGER(KIND = C_INT64_T) :: VALUE
  LOGICAL :: CODE

  CALL FILE_PATH('sample_uint32.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(0_C_INT64_T, VALUE)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(2147483648_C_INT64_T, VALUE)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(4294967295_C_INT64_T, VALUE)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM
