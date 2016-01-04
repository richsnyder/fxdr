% put_character


Name
----

put_character - encode a character


Synopsis
--------

~~~{.synopsis}
FUNCTION put_character(self, c) RESULT(success)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR), INTENT(IN) :: c
  LOGICAL :: success
~~~


Description
-----------

The *put_character()* method encodes a single character onto the XDR object's
byte stream.  The position of the stream will be advanced by one block, or four
bytes.


Return value
------------

The *put_character()* method shall return *.TRUE.* if the character was
successfully encoded to the byte stream.  Otherwise it shall return *.FALSE.*.


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

[put_character_vector][]
[put_character_array][]
[get_character][]
[get_character_vector][]
[get_character_array][]
[allocate_character_array][]
