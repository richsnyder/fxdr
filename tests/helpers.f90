! DISTRIBUTION STATEMENT A. Approved for public release; distribution is
! unlimited.  Granted clearance per 88ABW-YYYY-ZZZZ.
!
! This file is declared a work of the U.S. Government and is not subject to
! copyright protection in the United States.

MODULE HELPERS

  IMPLICIT NONE

CONTAINS

  SUBROUTINE FILE_PATH(FILENAME, PATH)
    CHARACTER(LEN = *), INTENT(IN) :: FILENAME
    CHARACTER(LEN = *), INTENT(OUT) :: PATH

    CHARACTER(LEN = 256) :: DIRNAME

    IF (COMMAND_ARGUMENT_COUNT() == 1) THEN
      CALL GET_COMMAND_ARGUMENT(1, DIRNAME)
      PATH = TRIM(DIRNAME) // '/' // FILENAME
    ELSE
      PATH = FILENAME
    END IF
  END SUBROUTINE

END MODULE
