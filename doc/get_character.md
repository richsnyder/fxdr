% get_character


Name
----

get_character - decode a character


Synopsis
--------

~~~{.synopsis}
FUNCTION get_character(self, c) RESULT(success)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR), INTENT(OUT) :: c
  LOGICAL :: success
~~~


Description
-----------

The *get_character()* method decodes a single character from the XDR object's
byte stream.  The position of the stream will be advanced by one block, or four
bytes.


Return value
------------

The *get_character()* method shall return *.TRUE.* if the character was
successfully decoded to the byte stream.  Otherwise it shall return *.FALSE.*.


Example
-------

#### Encode and decode three characters

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
CHARACTER(KIND = C_CHAR, LEN = 3) :: s

CALL xdrs%create(12)
code = xdrs%put_character('a')
code = xdrs%put_character('b')
code = xdrs%put_character('c')

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get_character(s(1:1))
code = xdrs%get_character(s(2:2))
code = xdrs%get_character(s(3:3))

CALL xdrs%destroy()
~~~


See also
--------

[put_character][]
[put_character_vector][]
[put_character_array][]
[get_character_vector][]
[get_character_array][]
[allocate_character_array][]
