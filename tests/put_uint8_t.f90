PROGRAM PUT_UINT8_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT16_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_INT16_T) :: VALUE
  LOGICAL :: CODE

  CALL XDRS%CREATE(12)

  CODE = XDRS%PUT_UNSIGNED(0_C_INT16_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT_UNSIGNED(127_C_INT16_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT_UNSIGNED(255_C_INT16_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT_UNSIGNED(255_C_INT16_T)
  CALL ASSERT_FALSE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(0, INT(VALUE))

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(127, INT(VALUE))

  CODE = XDRS%GET_UNSIGNED(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(255, INT(VALUE))

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM