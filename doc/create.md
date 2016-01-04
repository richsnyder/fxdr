% create


Name
----

create - initialize an XDR stream object


Synopsis
--------

~~~{.synopsis}
SUBROUTINE create(self, size)
SUBROUTINE create(self, buffer, size)

  TYPE(XDR_T) :: self
  INTEGER, INTENT(IN) :: size
  CHARACTER(KIND = C_CHAR, LEN = :), POINTER, INTENT(IN) :: buffer
~~~


Description
-----------

The *create()* method initializes an XDR stream object (a variable whose type
is `XDR_T`).  The stream's data is written to, or read from, a chunk of memory
whose length is no more than `size` bytes long.

The first form allocates its own chunk of memory, which is then managed by the
stream object and will be deallocated when the object's [destroy][] method is
called.

The second form uses the supplied buffer, which must be at least `size` bytes
long.  If the buffer contains encoded data, then the stream will be ready for
decoding.  It is the user's responsibility to deallocate this buffer after
calling the object's [destroy][] method and when it is no longer needed.


Example
-------

#### Initialize to a given size

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs

CALL xdrs%create(12)
code = xdrs%put(123_C_INT32_T)
code = xdrs%put(1.23_C_DOUBLE)
CALL xdrs%destroy()
~~~

#### Initialize with a supplied buffer

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
CHARACTER(KIND = C_CHAR, LEN = :), ALLOCATABLE, TARGET :: buffer

ALLOCATE(CHARACTER(KIND = C_CHAR, LEN = 12) :: buffer)

CALL xdrs%create(buffer, len(buffer))
code = xdrs%put(123_C_INT32_T)
code = xdrs%put(1.23_C_DOUBLE)
CALL xdrs%destroy()

DEALLOCATE(buffer)
~~~


See also
--------

[destroy][]
