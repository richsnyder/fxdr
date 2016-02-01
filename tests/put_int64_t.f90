! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM PUT_INT64_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT64_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_INT64_T) :: VALUE
  LOGICAL :: CODE

  CALL XDRS%CREATE(24)

  CODE = XDRS%PUT( 1234567890123456789_C_INT64_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT(-2345678901234567890_C_INT64_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT( 4567890123456789012_C_INT64_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT( 4567890123456789012_C_INT64_T)
  CALL ASSERT_FALSE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 1234567890123456789_C_INT64_T, VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(-2345678901234567890_C_INT64_T, VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 4567890123456789012_C_INT64_T, VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM
