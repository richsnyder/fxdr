PROGRAM PUT_VECTOR_INT16_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT16_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_INT16_T), DIMENSION(3) :: VALUES
  LOGICAL :: CODE

  CALL XDRS%CREATE(12)

  VALUES(1) =  32109
  VALUES(2) = -21098
  VALUES(3) =  10987
  CODE = XDRS%PUT_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  VALUES = 0
  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 32109, INT(VALUES(1)))
  CALL ASSERT_EQUALS(-21098, INT(VALUES(2)))
  CALL ASSERT_EQUALS( 10987, INT(VALUES(3)))

  CALL XDRS%DESTROY()

END PROGRAM
