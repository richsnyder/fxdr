% allocate_character_array


Name
----

allocate_character_array - allocate and decode a variable-length array of characters


Synopsis
--------

~~~{.synopsis}
FUNCTION allocate_character_array(self, cs, maxlength) RESULT(success)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR), DIMENSION(:), ALLOCATABLE, INTENT(OUT) :: cs
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: maxlength
  LOGICAL :: success
~~~


Description
-----------

The *allocate_character_array()* method first examines the size of an encoded
variable-length character array.  If its length is less than or equal to
*maxlength*, then the method will allocate storage for *cs*, copy values from
the encoded array into *cs*, and advance the XDR byte stream by (length + 1)
4-byte blocks.  If the array is larger than *maxlength*, the function returns
*.FALSE.* without advancing the position of the XDR byte stream.


Return value
------------

The *allocate_character_array()* method shall return *.TRUE.* if the characters
were successfully decoded from the byte stream.  Otherwise it shall return
*.FALSE.*.


Example
-------

#### Encode and decode an array of three characters

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_SIZE_T) :: length
CHARACTER(KIND = C_CHAR), DIMENSION(:), ALLOCATABLE :: cs

CALL xdrs%create(44)

ALLOCATE(CHARACTER(KIND = C_CHAR) :: cs(3))
cs(1) = 'a'
cs(2) = 'b'
cs(3) = 'c'
code = xdrs%put_character_array(cs, 10_C_SIZE_T)
DEALLOCATE(cs)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%allocate_character_array(cs, 10_C_SIZE_T)
DEALLOCATE(cs)

CALL xdrs%destroy()
~~~


See also
--------

[put_character][]
[put_character_vector][]
[put_character_array][]
[get_character][]
[get_character_vector][]
[get_character_array][]
