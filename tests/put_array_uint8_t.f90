! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM PUT_ARRAY_UINT8_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT16_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_SIZE_T) :: LENGTH
  INTEGER(KIND = C_INT16_T), DIMENSION(3) :: VALUES
  LOGICAL :: CODE

  CALL XDRS%CREATE(16)

  VALUES(1) =   0
  VALUES(2) = 127
  VALUES(3) = 255
  CODE = XDRS%PUT_UNSIGNED_ARRAY(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_UNSIGNED_ARRAY(VALUES, LENGTH)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(3, INT(LENGTH))
  CALL ASSERT_EQUALS(  0, INT(VALUES(1)))
  CALL ASSERT_EQUALS(127, INT(VALUES(2)))
  CALL ASSERT_EQUALS(255, INT(VALUES(3)))

  CALL XDRS%DESTROY()

END PROGRAM
