PROGRAM PUT_ARRAY_INT16_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT16_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_INT16_T), DIMENSION(3) :: VALUES
  INTEGER(KIND = C_INT16_T), DIMENSION(:), ALLOCATABLE :: OUTPUTS
  LOGICAL :: CODE

  CALL XDRS%CREATE(16)

  VALUES(1) =  32109
  VALUES(2) = -21098
  VALUES(3) =  10987
  CODE = XDRS%PUT_ARRAY(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_ARRAY(OUTPUTS, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 32109, INT(OUTPUTS(1)))
  CALL ASSERT_EQUALS(-21098, INT(OUTPUTS(2)))
  CALL ASSERT_EQUALS( 10987, INT(OUTPUTS(3)))
  DEALLOCATE(OUTPUTS)

  CALL XDRS%DESTROY()

END PROGRAM