PROGRAM PUT_VECTOR_UINT32_T

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT64_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  INTEGER(KIND = C_INT64_T), DIMENSION(3) :: VALUES
  LOGICAL :: CODE

  CALL XDRS%CREATE(24)

  VALUES(1) =          0_C_INT64_T
  VALUES(2) = 2147483648_C_INT64_T
  VALUES(3) = 4294967295_C_INT64_T
  CODE = XDRS%PUT_UNSIGNED_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  VALUES = 0_C_INT64_T
  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET_UNSIGNED_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(         0_C_INT64_T, VALUES(1))
  CALL ASSERT_EQUALS(2147483648_C_INT64_T, VALUES(2))
  CALL ASSERT_EQUALS(4294967295_C_INT64_T, VALUES(3))

  CALL XDRS%DESTROY()

END PROGRAM