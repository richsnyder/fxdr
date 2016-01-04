% put_array


Name
----

put_array - encode a variable-length array


Synopsis
--------

~~~{.synopsis}
FUNCTION put_array(self, logs, maxlength) RESULT(success)
FUNCTION put_array(self, i8s,  maxlength) RESULT(success)
FUNCTION put_array(self, i16s, maxlength) RESULT(success)
FUNCTION put_array(self, i32s, maxlength) RESULT(success)
FUNCTION put_array(self, i64s, maxlength) RESULT(success)
FUNCTION put_array(self, r32s, maxlength) RESULT(success)
FUNCTION put_array(self, r64s, maxlength) RESULT(success)
FUNCTION put_array(self, strs, maxlength) RESULT(success)
FUNCTION put_array(self, arrs, sizes, maxlength) RESULT(success)

  CLASS(XDR_T) :: self
  LOGICAL, DIMENSION(:), INTENT(IN) :: logs
  INTEGER(KIND = C_INT8_T),  DIMENSION(:), INTENT(IN) :: i8s
  INTEGER(KIND = C_INT16_T), DIMENSION(:), INTENT(IN) :: i16s
  INTEGER(KIND = C_INT32_T), DIMENSION(:), INTENT(IN) :: i32s
  INTEGER(KIND = C_INT64_T), DIMENSION(:), INTENT(IN) :: i64s
  REAL(KIND = C_FLOAT),      DIMENSION(:), INTENT(IN) :: r32s
  REAL(KIND = C_DOUBLE),     DIMENSION(:), INTENT(IN) :: r64s
  CHARACTER(KIND = C_CHAR, LEN = *), DIMENSION(:), INTENT(IN) :: strs
  CHARACTER(KIND = C_CHAR, LEN = *), DIMENSION(:), INTENT(IN) :: arrs
  INTEGER(KIND = C_SIZE_T), DIMENSION(:), INTENT(IN) :: sizes
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: maxlength
  LOGICAL :: success
~~~


Description
-----------

The *put_array()* method encodes a variable-length array of any of the
following types onto the XDR object's byte stream:

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

The position of the XDR byte stream is advanced by _length_ times the number of
blocks indicated in the above table, where _length_ is the smaller of
*maxlength* and the size of the array as returned by the *size()* intrinsic
function.  When encoding an array of character strings or byte arrays, the
position is advanced by int((*n(i)* + 7) / 4) blocks for each element, where
*n(i)* is the number of bytes for the *i*-th element.


Return value
------------

The *put_array()* method shall return *.TRUE.* if the values were successfully
encoded to the byte stream.  Otherwise it shall return *.FALSE.*.


Example
-------

#### Encode and decode an array of three real numbers

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_SIZE_T) :: length
REAL(KIND = C_DOUBLE), DIMENSION(3) :: xs

xs(1) = 1.2_C_DOUBLE
xs(2) = 3.4_C_DOUBLE
xs(3) = 5.6_C_DOUBLE

CALL xdrs%create(84)
code = xdrs%put_array(xs, 10_C_SIZE_T)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get_array(xs, length)

CALL xdrs%destroy()
~~~


See also
--------

[put][]
[put_vector][]
[get][]
[get_vector][]
[get_array][]
[allocate_array][]
