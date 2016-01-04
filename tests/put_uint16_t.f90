! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-YYYY-ZZZZ.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM PUT_UINT16_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT32_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_INT32_T) :: VALUE
  LOGICAL :: CODE

  CALL XDRS%CREATE(12)

  CODE = XDRS%PUT_UNSIGNED(0)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT_UNSIGNED(32768)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT_UNSIGNED(65535)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT_UNSIGNED(65535)
  CALL ASSERT_FALSE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(0, VALUE)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(32768, VALUE)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(65535, VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM
