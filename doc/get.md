% get


Name
----

get - decode a value


Synopsis
--------

~~~{.synopsis}
FUNCTION get(self, log) RESULT(success)
FUNCTION get(self, i8)  RESULT(success)
FUNCTION get(self, i16) RESULT(success)
FUNCTION get(self, i32) RESULT(success)
FUNCTION get(self, i64) RESULT(success)
FUNCTION get(self, r32) RESULT(success)
FUNCTION get(self, r64) RESULT(success)
FUNCTION get(self, str) RESULT(success)
FUNCTION get(self, arr, size) RESULT(success)

  CLASS(XDR_T) :: self
  LOGICAL, INTENT(OUT) :: log
  INTEGER(KIND = C_INT8_T),  INTENT(OUT) :: i8
  INTEGER(KIND = C_INT16_T), INTENT(OUT) :: i16
  INTEGER(KIND = C_INT32_T), INTENT(OUT) :: i32
  INTEGER(KIND = C_INT64_T), INTENT(OUT) :: i64
  REAL(KIND = C_FLOAT),      INTENT(OUT) :: r32
  REAL(KIND = C_DOUBLE),     INTENT(OUT) :: r64
  CHARACTER(KIND = C_CHAR, LEN = *), INTENT(OUT) :: str
  CHARACTER(KIND = C_CHAR, LEN = *), INTENT(OUT) :: arr
  INTEGER(KIND = C_SIZE_T),  INTENT(OUT) :: size
  LOGICAL :: success
~~~


Description
-----------

The *get()* method decodes a single value of any of the following types from
the XDR object's byte stream:

Description                     | Data type                          | Blocks
--------------------------------|------------------------------------|---------
boolean                         | LOGICAL                            | 1
1-byte integer                  | INTEGER(KIND = C_INT8_T)           | 1
2-byte integer                  | INTEGER(KIND = C_INT16_T)          | 1
4-byte integer                  | INTEGER(KIND = C_INT32_T)          | 1
8-byte integer                  | INTEGER(KIND = C_INT64_T)          | 2
single-precision floating-point | REAL(KIND = C_FLOAT)               | 1
double-precision floating-point | REAL(KIND = C_DOUBLE)              | 2
character string                | CHARACTER(KIND = C_CHAR, LEN = \*) | variable
byte array of length `size`     | CHARACTER(KIND = C_CHAR, LEN = \*) | variable


Return value
------------

The *get()* method shall return *.TRUE.* if the value was successfully decoded
from the byte stream.  Otherwise it shall return *.FALSE.*.


Example
-------

#### Encode and decode an integer and a real number

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_INT32_T) :: n
REAL(KIND = C_DOUBLE) :: x

CALL xdrs%create(12)
code = xdrs%put(123_C_INT32_T)
code = xdrs%put(1.23_C_DOUBLE)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get(n)
code = xdrs%get(x)

CALL xdrs%destroy()
~~~


See also
--------

[put][]
[put_vector][]
[put_array][]
[get_vector][]
[get_array][]
[allocate_array][]
