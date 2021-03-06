! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM PUT_ARRAY_LOGICAL

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_SIZE_T) :: LENGTH
  LOGICAL, DIMENSION(2) :: VALUES
  LOGICAL :: CODE

  CALL XDRS%CREATE(12)

  VALUES(1) = .FALSE.
  VALUES(2) = .TRUE.
  CODE = XDRS%PUT_ARRAY(VALUES, 2_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_ARRAY(VALUES, LENGTH)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(2, INT(LENGTH))
  CALL ASSERT_FALSE(VALUES(1))
  CALL ASSERT_TRUE(VALUES(2))

  CALL XDRS%DESTROY()

END PROGRAM
