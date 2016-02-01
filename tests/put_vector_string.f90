! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM PUT_VECTOR_STRING

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_CHAR, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(KIND = C_CHAR, LEN = 6), DIMENSION(3) :: VALUES
  LOGICAL :: CODE

  CALL XDRS%CREATE(36)

  VALUES(1) = 'abcdef'
  VALUES(2) = 'ghijkl'
  VALUES(3) = 'mnopqr'
  CODE = XDRS%PUT_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  VALUES = '---'
  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_TRUE('abcdef' == VALUES(1))
  CALL ASSERT_TRUE('ghijkl' == VALUES(2))
  CALL ASSERT_TRUE('mnopqr' == VALUES(3))

  CALL XDRS%DESTROY()

END PROGRAM
