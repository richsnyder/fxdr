% get_unsigned


Name
----

get_unsigned - decode an unsigned integer


Synopsis
--------

~~~{.synopsis}
FUNCTION get_unsigned(self, u8)  RESULT(success)
FUNCTION get_unsigned(self, u16) RESULT(success)
FUNCTION get_unsigned(self, u32) RESULT(success)

  CLASS(XDR_T) :: self
  INTEGER(KIND = C_INT16_T), INTENT(IN) :: u8
  INTEGER(KIND = C_INT32_T), INTENT(IN) :: u16
  INTEGER(KIND = C_INT64_T), INTENT(IN) :: u32
  LOGICAL :: success
~~~


Description
-----------

The *get_unsigned()* method decodes a single unsigned integer from the XDR
object's byte stream.  While the XDR protocol defines encodings for both 4-byte
unsigned integers and 8-byte unsigned hyper integers, FXDR only supports 4-byte
unsigned integers due to limitations of Fortran.  Since Fortran does not define
unsigned integer data types, they must be represented as signed integers of a
kind that can accommodate the full range of the unsigned type, as shown in the
following table:

C type   | Fortran kind
---------|-------------
uint8_t  |    C_INT16_T
uint16_t |    C_INT32_T
uint32_t |    C_INT64_T
uint64_t |  unsupported

The position of the stream will be advanced by one block, or four bytes.  


Return value
------------

The *get_unsigned()* method shall return *.TRUE.* if the integer was
successfully decoded to the byte stream.  Otherwise it shall return *.FALSE.*.


Example
-------

#### Encode and decode three unsigned integers

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_INT16_T) :: u8
INTEGER(KIND = C_INT32_T) :: u16
INTEGER(KIND = C_INT64_T) :: u32

CALL xdrs%create(12)
code = xdrs%put_unsigned(123_C_INT16_T)
code = xdrs%put_unsigned(456_C_INT32_T)
code = xdrs%put_unsigned(789_C_INT64_T)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get_unsigned(u8)
code = xdrs%get_unsigned(u16)
code = xdrs%get_unsigned(u32)

CALL xdrs%destroy()
~~~


See also
--------

[put_unsigned][]
[put_unsigned_vector][]
[put_unsigned_array][]
[get_unsigned_vector][]
[get_unsigned_array][]
[allocate_unsigned_array][]
