% getsize


Name
----

getsize - get the size of an XDR stream


Synopsis
--------

~~~{.synopsis}
FUNCTION getsize(self) RESULT(nbytes)

  CLASS(XDR_T) :: self
  INTEGER(KIND = C_SIZE_T) :: nbytes
~~~


Description
-----------

The *getsize()* method returns the size of an XDR stream object's internal
buffer.  The size of this buffer limits the amount of encoded data that can be
stored in the XDR stream object.


Return value
------------

The *getsize()* method shall return the size of the internal buffer, in bytes.


Example
-------

#### Print the size of an XDR stream object's buffer

~~~{.example}
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_SIZE_T) :: nbytes

CALL xdrs%create(64)
nbytes = xdrs%getsize()
CALL xdrs%destroy()

PRINT*, nbytes
~~~

The above source code, when compiled and executed, generates

~~~
64
~~~


See also
--------

[create][]
[getpos][]
