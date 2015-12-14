PROGRAM GET_ARRAY_INT16_T

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_INT16_T, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  INTEGER(KIND = C_INT16_T), DIMENSION(:), ALLOCATABLE :: VALUES
  LOGICAL :: CODE

  CALL FILE_PATH('array_int16.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%GET_ARRAY(VALUES, 3_C_SIZE_T)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS( 32109, INT(VALUES(1)))
  CALL ASSERT_EQUALS(-21098, INT(VALUES(2)))
  CALL ASSERT_EQUALS( 10987, INT(VALUES(3)))
  DEALLOCATE(VALUES)

  CALL XDRS%DESTROY()

END PROGRAM