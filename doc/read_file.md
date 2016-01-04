% read_file


Name
----

read_file - initialize an XDR stream object by reading the contents of a file


Synopsis
--------

~~~{.synopsis}
SUBROUTINE read_file(self, filename)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR, LEN = *), INTENT(IN) :: filename
~~~


Description
-----------

This method initializes an XDR stream object by reading a file and storing its
contents in memory.  The XDR stream object is then ready for decoding.  The
chunk of memory will be deallocated when the object's [destroy][] method is
called.


Example
-------

#### Write a file containing two encoded numbers

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs

CALL xdrs%create(12)
code = xdrs%put(123_C_INT32_T)
code = xdrs%put(1.23_C_DOUBLE)
CALL xdrs%write_file('example.xdr')
CALL xdrs%destroy()
~~~

#### Read two numbers from an encoded file

~~~{.example}
LOGICAL :: code
TYPE(XDR_T) :: xdrs
INTEGER(KIND = C_INT32_T) :: n
REAL(KIND = C_DOUBLE) :: x

CALL xdrs%read_file('example.xdr')
code = xdrs%get(n)
code = xdrs%get(x)
CALL xdrs%destroy()
~~~


See also
--------

[create][]
[destroy][]
[write_file][]
