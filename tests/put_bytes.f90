PROGRAM PUT_BYTES

  USE XDR
  USE ASSERT
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_CHAR, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(KIND = C_CHAR, LEN = 16) :: VALUE
  INTEGER(KIND = C_SIZE_T) :: LENGTH
  LOGICAL :: CODE

  CALL XDRS%CREATE(36)

  CODE = XDRS%PUT('abcdef', 6_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT('ghijkl', 6_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT('mnopqr', 6_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%PUT('mnopqr', 6_C_SIZE_T)
  CALL ASSERT_FALSE(CODE)

  CODE = XDRS%SETPOS(1_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)

  CODE = XDRS%GET(VALUE, LENGTH)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(6, INT(LENGTH))
  CALL ASSERT_TRUE('abcdef' == VALUE)

  CODE = XDRS%GET(VALUE, LENGTH)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(6, INT(LENGTH))
  CALL ASSERT_TRUE('ghijkl' == VALUE)

  CODE = XDRS%GET(VALUE, LENGTH)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(6, INT(LENGTH))
  CALL ASSERT_TRUE('mnopqr' == VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM