% put_character_vector


Name
----

put_character_vector - encode a fixed-length array of characters


Synopsis
--------

~~~{.synopsis}
FUNCTION put_character_vector(self, cs, length) RESULT(success)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR), DIMENSION(:), INTENT(IN) :: cs
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: length
  LOGICAL :: success
~~~


Description
-----------

The *put_character_vector()* method encodes a fixed-length array of characters
onto the XDR object's byte stream.  The position of the stream will be advanced
by `length` blocks of four bytes each.


Return value
------------

The *put_character_vector()* method shall return *.TRUE.* if the characters
were successfully encoded to the byte stream.  Otherwise it shall return
*.FALSE.*.


Example
-------

#### Encode and decode an array of three characters

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
CHARACTER(KIND = C_CHAR), DIMENSION(3) :: cs

cs(1) = 'a'
cs(2) = 'b'
cs(3) = 'c'

CALL xdrs%create(12)
code = xdrs%put_character_vector(cs, 3_C_SIZE_T)

code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get_character_vector(cs, 3_C_SIZE_T)

CALL xdrs%destroy()
~~~


See also
--------

[put_character][]
[put_character_array][]
[get_character][]
[get_character_vector][]
[get_character_array][]
[allocate_character_array][]
