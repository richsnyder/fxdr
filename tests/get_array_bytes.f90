! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-YYYY-ZZZZ.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM GET_ARRAY_BYTES

  USE XDR
  USE ASSERT
  USE HELPERS
  USE, INTRINSIC :: ISO_C_BINDING, ONLY : C_CHAR, C_SIZE_T
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  CHARACTER(KIND = C_CHAR, LEN = 64), DIMENSION(3) :: VALUES
  INTEGER(KIND = C_SIZE_T), DIMENSION(3) :: LENGTHS
  INTEGER(KIND = C_SIZE_T) :: LENGTH
  LOGICAL :: CODE

  CALL FILE_PATH('array_string.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%GET_ARRAY(VALUES, LENGTHS, LENGTH)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_EQUALS(3, INT(LENGTH))
  CALL ASSERT_EQUALS(6, INT(LENGTHS(1)))
  CALL ASSERT_EQUALS(6, INT(LENGTHS(2)))
  CALL ASSERT_EQUALS(6, INT(LENGTHS(3)))
  CALL ASSERT_TRUE('abcdef' == VALUES(1))
  CALL ASSERT_TRUE('ghijkl' == VALUES(2))
  CALL ASSERT_TRUE('mnopqr' == VALUES(3))

  CALL XDRS%DESTROY()

END PROGRAM
