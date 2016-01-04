% destroy


Name
----

destroy - destroy an XDR stream object


Synopsis
--------

~~~{.synopsis}
SUBROUTINE destroy(self, size)

  TYPE(XDR_T) :: self
~~~


Description
-----------

The *destroy()* method destroys an XDR stream object.  The chunk of memory used
to hold encoded data will be deallocated if it is owned by the stream object.  
An XDR stream object can be reused after calling `destroy`, but only if the
next method called is either [create][] or [read_file][].


Example
-------

#### Destroy an XDR stream object that owns its own memory

~~~{.example}
TYPE(XDR_T) :: xdrs

CALL xdrs%create(64)
CALL xdrs%destroy()
~~~

#### Destroy an XDR stream object that does not own memory

~~~{.example}
TYPE(XDR_T) :: xdrs
CHARACTER(KIND = C_CHAR, LEN = :), ALLOCATABLE, TARGET :: buffer

ALLOCATE(CHARACTER(KIND = C_CHAR, LEN = 64) :: buffer)

CALL xdrs%create(buffer, len(buffer))
CALL xdrs%destroy()

DEALLOCATE(buffer)
~~~


See also
--------

[create][]
[read_file][]
