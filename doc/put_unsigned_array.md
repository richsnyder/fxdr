% put_unsigned_array


Name
----

put_unsigned_array - encode a variable-length array of unsigned integers


Synopsis
--------

~~~{.synopsis}
FUNCTION put_unsigned_array(self, u8s,  maxlength) RESULT(success)
FUNCTION put_unsigned_array(self, u16s, maxlength) RESULT(success)
FUNCTION put_unsigned_array(self, u32s, maxlength) RESULT(success)

  CLASS(XDR_T) :: self
  INTEGER(KIND = C_INT16_T), DIMENSION(:), INTENT(IN) :: u8s
  INTEGER(KIND = C_INT32_T), DIMENSION(:), INTENT(IN) :: u16s
  INTEGER(KIND = C_INT64_T), DIMENSION(:), INTENT(IN) :: u32s
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: maxlength
  LOGICAL :: success
~~~


Description
-----------

The *put_unsigned_array()* method encodes a variable-length array of unsigned
integers onto the XDR object's byte stream.  While the XDR protocol defines
encodings for both 4-byte unsigned integers and 8-byte unsigned hyper integers,
FXDR only supports 4-byte unsigned integers due to limitations of Fortran.
Since Fortran does not define unsigned integer data types, they must be
represented as signed integers of a kind that can accommodate the full range of
the unsigned type, as shown in the following table:

C type   | Fortran kind
---------|-------------
uint8_t  |    C_INT16_T
uint16_t |    C_INT32_T
uint32_t |    C_INT64_T
uint64_t |  unsupported

Attempts to encode a negative value as an unsigned value will produce an
undefined result.

The position of the stream will be advanced by _length_ blocks of four bytes
each, where _length_ is the smaller of *maxlength* and the size of the array as
returned by the *size()* intrinsic function.

Return value
------------

The *put_unsigned_array()* method shall return *.TRUE.* if the integers were
successfully encoded to the byte stream.  Otherwise it shall return *.FALSE.*.


Example
-------

#### Encode and decode an array of three unsigned integers

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_SIZE_T) :: length
INTEGER(KIND = C_INT32_T), DIMENSION(3) :: u16s

u16s(1) = 123_C_INT32_T
u16s(2) = 456_C_INT32_T
u16s(3) = 789_C_INT32_T

CALL xdrs%create(44)
code = xdrs%put_unsigned_array(u16s, 10_C_SIZE_T)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get_unsigned_array(u16s, length)

CALL xdrs%destroy()
~~~


See also
--------

[put_unsigned][]
[put_unsigned_vector][]
[get_unsigned][]
[get_unsigned_vector][]
[get_unsigned_array][]
[allocate_unsigned_array][]
