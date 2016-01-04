% getpos


Name
----

getpos - get the position of an XDR byte stream


Synopsis
--------

~~~{.synopsis}
FUNCTION getpos(self) RESULT(pos)

  CLASS(XDR_T) :: self
  INTEGER(KIND = C_SIZE_T) :: pos
~~~


Description
-----------

The *getpos()* method returns the current position within the XDR object's byte
stream.  This position advances as data is encoded into or decoded from the
stream.  The beginning of the stream has a position of `1`.


Return value
------------

The position of the XDR byte stream, in bytes.


Example
-------

#### Print positions within the byte stream

The program

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs

CALL xdrs%create(8)
PRINT*, xdrs%getpos()
code = xdrs%put(123_C_INT32_T)
PRINT*, xdrs%getpos()
code = xdrs%put(456_C_INT32_T)
PRINT*, xdrs%getpos()
CALL xdrs%destroy()
~~~

outputs

~~~
1
5
9
~~~

Any further attempts to put data onto the stream would have failed because the
current position was beyond the end of the 8-byte stream.


See also
--------

[create][]
[setpos][]
