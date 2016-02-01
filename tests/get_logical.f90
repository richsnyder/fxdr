! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-2016-0371.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

PROGRAM GET_LOGICAL

  USE XDR
  USE ASSERT
  USE HELPERS
  IMPLICIT NONE

  TYPE(XDR_T) :: XDRS
  CHARACTER(LEN = 256) :: FILENAME
  LOGICAL :: VALUE
  LOGICAL :: CODE

  CALL FILE_PATH('sample_bool.xdr', FILENAME)
  CALL XDRS%READ_FILE(FILENAME)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_FALSE(VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_TRUE(CODE)
  CALL ASSERT_TRUE(VALUE)

  CODE = XDRS%GET(VALUE)
  CALL ASSERT_FALSE(CODE)

  CALL XDRS%DESTROY()

END PROGRAM
