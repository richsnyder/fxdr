! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM PUT_INT8_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT8_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_INT8_T) :: VALUE
  LOGICAL :: CODE

  CALL XDRS%CREATE(12)

  CODE = XDRS%PUT(119)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT(-86)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT(102)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT(102)
  CALL ASSERT_FALSE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(119, INT(VALUE))

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(-86, INT(VALUE))

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(102, INT(VALUE))

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM
