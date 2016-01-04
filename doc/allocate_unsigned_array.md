% allocate_unsigned_array


Name
----

allocate_unsigned_array - allocate and decode a variable-length array of unsigned integers


Synopsis
--------

~~~{.synopsis}
FUNCTION allocate_unsigned_array(self, u8s,  maxlength) RESULT(success)
FUNCTION allocate_unsigned_array(self, u16s, maxlength) RESULT(success)
FUNCTION allocate_unsigned_array(self, u32s, maxlength) RESULT(success)

  CLASS(XDR_T) :: self
  INTEGER(KIND = C_INT16_T), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: u8s
  INTEGER(KIND = C_INT32_T), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: u16s
  INTEGER(KIND = C_INT64_T), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: u32s
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: maxlength
  LOGICAL :: success
~~~


Description
-----------

The *allocate_unsigned_array()* method first examines the size of an encoded
variable-length unsigned integer array.  If its length is less than or equal to
*maxlength*, then the method will allocate storage for *u_s*, copy values from
the encoded array into *u_s*, and advance the XDR byte stream by (length + 1)
4-byte blocks.  If the array is larger than *maxlength*, the function returns
*.FALSE.* without advancing the position of the XDR byte stream.

Note that while the XDR protocol defines encodings for both 4-byte unsigned
integers and 8-byte unsigned hyper integers, FXDR only supports 4-byte unsigned
integers due to limitations of Fortran.  Since Fortran does not define unsigned
integer data types, they must be represented as signed integers of a kind that
can accommodate the full range of the unsigned type, as shown in the following
table:

C type   | Fortran kind
---------|-------------
uint8_t  |    C_INT16_T
uint16_t |    C_INT32_T
uint32_t |    C_INT64_T
uint64_t |  unsupported


Return value
------------

The *allocate_unsigned_array()* method shall return *.TRUE.* if the integers
were successfully decoded from the byte stream.  Otherwise it shall return
*.FALSE.*.


Example
-------

#### Encode and decode an array of three unsigned integers

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_SIZE_T) :: length
INTEGER(KIND = C_INT32_T), DIMENSION(:), ALLOCATABLE :: u16s

CALL xdrs%create(44)

ALLOCATE(INTEGER(KIND = C_INT32_T) :: u16s(3))
u16s(1) = 123_C_INT32_T
u16s(2) = 456_C_INT32_T
u16s(3) = 789_C_INT32_T
code = xdrs%put_unsigned_array(u16s, 10_C_SIZE_T)
DEALLOCATE(u16s)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%allocate_unsigned_array(u16s, 10_C_SIZE_T)
DEALLOCATE(u16s)

CALL xdrs%destroy()
~~~


See also
--------

[put_unsigned][]
[put_unsigned_vector][]
[put_unsigned_array][]
[get_unsigned][]
[get_unsigned_vector][]
[get_unsigned_array][]
