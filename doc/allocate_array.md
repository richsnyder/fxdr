% allocate_array


Name
----

allocate_array - decode a variable-length array


Synopsis
--------

~~~{.synopsis}
FUNCTION allocate_array(self, logs, maxlength) RESULT(success)
FUNCTION allocate_array(self, i8s,  maxlength) RESULT(success)
FUNCTION allocate_array(self, i16s, maxlength) RESULT(success)
FUNCTION allocate_array(self, i32s, maxlength) RESULT(success)
FUNCTION allocate_array(self, i64s, maxlength) RESULT(success)
FUNCTION allocate_array(self, r32s, maxlength) RESULT(success)
FUNCTION allocate_array(self, r64s, maxlength) RESULT(success)
FUNCTION allocate_array(self, strs, maxlength) RESULT(success)
FUNCTION allocate_array(self, arrs, sizes, maxlength) RESULT(success)

  CLASS(XDR_T) :: self
  LOGICAL, DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: logs
  INTEGER(KIND = C_INT8_T),  DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: i8s
  INTEGER(KIND = C_INT16_T), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: i16s
  INTEGER(KIND = C_INT32_T), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: i32s
  INTEGER(KIND = C_INT64_T), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: i64s
  REAL(KIND = C_FLOAT),      DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: r32s
  REAL(KIND = C_DOUBLE),     DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: r64s
  CHARACTER(KIND = C_CHAR, LEN = *), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: strs
  CHARACTER(KIND = C_CHAR, LEN = *), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: arrs
  INTEGER(KIND = C_SIZE_T), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: sizes
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: maxlength
  LOGICAL :: success
~~~


Description
-----------

The *allocate_array()* method can be used to decode a variable-length array of
any of the following types from the XDR object's byte stream:

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

The *allocate_array()* method first examines the size of the encoded
variable-length array.  If its length is less than or equal to *maxlength*,
then the method will allocate storage for the array argument, copy values from
the encoded array into the newly allocated array, and advance the XDR byte
stream by a number of blocks equal to the length times the block size indicated
in the table above, plus one.  If the array is larger than *maxlength*, the
function returns *.FALSE.* without advancing the position of the XDR byte
stream.

When decoding an array of character strings or byte arrays, the position is
advanced by int((*n(i)* + 7) / 4) blocks for each element, where *n(i)* is the
number of bytes for the *i*-th element, again plus one block for the size of
the array.


Return value
------------

The *allocate_array()* method shall return *.TRUE.* if the values were
successfully decoded from the byte stream.  Otherwise it shall return
*.FALSE.*.


Example
-------

#### Encode and decode an array of three real numbers

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_SIZE_T) :: length
REAL(KIND = C_DOUBLE), DIMENSION(:), ALLOCATABLE :: xs

CALL xdrs%create(84)

ALLOCATE(REAL(KIND = C_DOUBLE) :: xs(3))
xs(1) = 1.2_C_DOUBLE
xs(2) = 3.4_C_DOUBLE
xs(3) = 5.6_C_DOUBLE
code = xdrs%put_array(xs, 10_C_SIZE_T)
DEALLOCATE(xs)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%allocate_array(xs, 10_C_SIZE_T)
DEALLOCATE(xs)

CALL xdrs%destroy()
~~~


See also
--------

[put][]
[put_vector][]
[put_array][]
[get][]
[get_vector][]
[get_array][]
