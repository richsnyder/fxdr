% put_character_array


Name
----

put_character_array - encode a variable-length array of characters


Synopsis
--------

~~~{.synopsis}
FUNCTION put_character_array(self, cs, maxlength) RESULT(success)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR), DIMENSION(:), INTENT(IN) :: cs
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: maxlength
  LOGICAL :: success
~~~


Description
-----------

The *put_character_array()* method encodes a variable-length array of
characters onto the XDR object's byte stream.  The position of the stream will
be advanced by _length_ blocks of four bytes each, where _length_ is the
smaller of *maxlength* and the size of the array as returned by the *size()*
intrinsic function.


Return value
------------

The *put_character_array()* method shall return *.TRUE.* if the characters
were successfully encoded to the byte stream.  Otherwise it shall return
*.FALSE.*.


Example
-------

#### Encode and decode an array of three characters

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_SIZE_T) :: length
CHARACTER(KIND = C_CHAR), DIMENSION(3) :: cs

cs(1) = 'a'
cs(2) = 'b'
cs(3) = 'c'

CALL xdrs%create(44)
code = xdrs%put_character_array(cs, 10_C_SIZE_T)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get_character_array(cs, length)

CALL xdrs%destroy()
~~~


See also
--------

[put_character][]
[put_character_vector][]
[get_character][]
[get_character_vector][]
[get_character_array][]
[allocate_character_array][]
