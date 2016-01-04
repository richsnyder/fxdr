% setpos


Name
----

setpos - set the position of an XDR byte stream


Synopsis
--------

~~~{.synopsis}
FUNCTION setpos(self, pos) RESULT(success)

  CLASS(XDR_T) :: self
  INTEGER(KIND = C_SIZE_T), INTENT(IN) :: pos
  LOGICAL :: success
~~~


Description
-----------

This method sets the current position within the XDR object's byte stream.
This position advances as data is encoded into or decoded from the stream.  The
beginning of the stream has a position of `1`.  The requested position must be
a multiple of the XDR block size of four bytes, plus one, and must be less than
the size of the byte stream.


Return value
------------

The *setpos()* method shall return *.TRUE.* if the position was successfully
set to the requested position.  Otherwise it shall return *.FALSE.*.


Example
-------

#### Encode and decode data

The program

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_INT32_T) :: n
REAL(KIND = C_DOUBLE) :: x

CALL xdrs%create(12)
code = xdrs%put(123_C_INT32_T)
code = xdrs%put(1.23_C_DOUBLE)
code = xdrs%setpos(1_C_SIZE_T)
code = xdrs%get(n)
code = xdrs%get(x)
CALL xdrs%destroy()
~~~


See also
--------

[create][]
[getpos][]
