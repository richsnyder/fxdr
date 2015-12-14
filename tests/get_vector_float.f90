PROGRAM GET_VECTOR_FLOAT

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_FLOAT, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  REAL(KIND = C_FLOAT), DIMENSION(3) :: VALUES
  LOGICAL :: CODE

  CALL FILE_PATH('sample_float.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%GET_VECTOR(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 1.23456E+30_C_FLOAT, VALUES(1), 1.0E-36_C_FLOAT)
  CALL ASSERT_EQUALS(-2.34567E+30_C_FLOAT, VALUES(2), 1.0E-36_C_FLOAT)
  CALL ASSERT_EQUALS( 3.45678E-30_C_FLOAT, VALUES(3), 1.0E-36_C_FLOAT)

  CALL XDRS%DESTROY()

END PROGRAM