% put


Name
----

put - encode a value


Synopsis
--------

~~~{.synopsis}
FUNCTION put(self, log) RESULT(success)
FUNCTION put(self, i8)  RESULT(success)
FUNCTION put(self, i16) RESULT(success)
FUNCTION put(self, i32) RESULT(success)
FUNCTION put(self, i64) RESULT(success)
FUNCTION put(self, r32) RESULT(success)
FUNCTION put(self, r64) RESULT(success)
FUNCTION put(self, str) RESULT(success)
FUNCTION put(self, arr, size) RESULT(success)

  CLASS(XDR_T) :: self
  LOGICAL, INTENT(IN) :: log
  INTEGER(KIND = C_INT8_T),  INTENT(IN) :: i8
  INTEGER(KIND = C_INT16_T), INTENT(IN) :: i16
  INTEGER(KIND = C_INT32_T), INTENT(IN) :: i32
  INTEGER(KIND = C_INT64_T), INTENT(IN) :: i64
  REAL(KIND = C_FLOAT),      INTENT(IN) :: r32
  REAL(KIND = C_DOUBLE),     INTENT(IN) :: r64
  CHARACTER(KIND = C_CHAR, LEN = *), INTENT(IN) :: str
  CHARACTER(KIND = C_CHAR, LEN = *), INTENT(IN) :: arr
  INTEGER(KIND = C_SIZE_T),  INTENT(IN) :: size
  LOGICAL :: success
~~~


Description
-----------

The *put()* method encodes a single value of any of the following types onto
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

The position of the XDR byte stream is advanced by the number of blocks
indicated in the table above.  For character strings and byte arrays, the
stream is advanced by int((*n* + 7) / 4) blocks, where *n* is the number of
bytes in the string or byte array.


Return value
------------

The *put()* method shall return *.TRUE.* if the value was successfully encoded
to the byte stream.  Otherwise it shall return *.FALSE.*.


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

[put_vector][]
[put_array][]
[get][]
[get_vector][]
[get_array][]
[allocate_array][]
