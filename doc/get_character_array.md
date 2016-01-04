% get_character_array


Name
----

get_character_array - decode a variable-length array of characters


Synopsis
--------

~~~{.synopsis}
FUNCTION get_character_array(self, cs, length) RESULT(success)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR), DIMENSION(:), INTENT(OUT) :: cs
  INTEGER(KIND = C_SIZE_T), INTENT(OUT) :: length
  LOGICAL :: success
~~~


Description
-----------

The *get_character_array()* method decodes a variable-length array of
characters from the XDR object's byte stream.  The length of the array will be
returned through the *length* argument and the position of the stream will
be advanced by *length* blocks of four bytes each, plus one additional block
which is used to store the length of the array.


Return value
------------

The *get_character_array()* method shall return *.TRUE.* if the characters
were successfully decoded from the byte stream.  Otherwise it shall return
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
[put_character_array][]
[get_character][]
[get_character_vector][]
[allocate_character_array][]
