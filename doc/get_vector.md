% get_vector


Name
----

get_vector - decode a fixed-length array


Synopsis
--------

~~~{.synopsis}
FUNCTION get_vector(self, logs, length) RESULT(success)
FUNCTION get_vector(self, i8s,  length) RESULT(success)
FUNCTION get_vector(self, i16s, length) RESULT(success)
FUNCTION get_vector(self, i32s, length) RESULT(success)
FUNCTION get_vector(self, i64s, length) RESULT(success)
FUNCTION get_vector(self, r32s, length) RESULT(success)
FUNCTION get_vector(self, r64s, length) RESULT(success)
FUNCTION get_vector(self, strs, length) RESULT(success)
FUNCTION get_vector(self, arrs, sizes, length) RESULT(success)

  CLASS(XDR_T) :: self
  LOGICAL, DIMENSION(:), INTENT(OUT) :: logs
  INTEGER(KIND = C_INT8_T),  DIMENSION(:), INTENT(OUT) :: i8s
  INTEGER(KIND = C_INT16_T), DIMENSION(:), INTENT(OUT) :: i16s
  INTEGER(KIND = C_INT32_T), DIMENSION(:), INTENT(OUT) :: i32s
  INTEGER(KIND = C_INT64_T), DIMENSION(:), INTENT(OUT) :: i64s
  REAL(KIND = C_FLOAT),      DIMENSION(:), INTENT(OUT) :: r32s
  REAL(KIND = C_DOUBLE),     DIMENSION(:), INTENT(OUT) :: r64s
  CHARACTER(KIND = C_CHAR, LEN = *), DIMENSION(:), INTENT(OUT) :: strs
  CHARACTER(KIND = C_CHAR, LEN = *), DIMENSION(:), INTENT(OUT) :: arrs
  INTEGER(KIND = C_SIZE_T), DIMENSION(:), INTENT(OUT) :: sizes
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: length
  LOGICAL :: success
~~~


Description
-----------

The *get_vector()* method decodes a fixed-length array of any of the following
types from the XDR object's byte stream:

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
byte array                      | CHARACTER(KIND = C_CHAR, LEN = \*) | variable

The position of the XDR byte stream is advanced by `length` times the number of
blocks indicated in the above table.  When decoding an array of character
strings or byte arrays, the position is advanced by int((*n(i)* + 7) / 4)
blocks for each element, where *n(i)* is the number of bytes for the *i*-th
element.


Return value
------------

The *get_vector()* method shall return *.TRUE.* if the values were successfully
decoded from the byte stream.  Otherwise it shall return *.FALSE.*.


Example
-------

#### Encode and decode an array of three real numbers

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
REAL(KIND = C_DOUBLE), DIMENSION(3) :: xs

xs(1) = 1.2_C_DOUBLE
xs(2) = 3.4_C_DOUBLE
xs(3) = 5.6_C_DOUBLE

CALL xdrs%create(24)
code = xdrs%put_vector(xs, 3_C_SIZE_T)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get_vector(xs, 3_C_SIZE_T)

CALL xdrs%destroy()
~~~


See also
--------

[put][]
[put_array][]
[put_vector][]
[get][]
[get_array][]
[allocate_array][]
