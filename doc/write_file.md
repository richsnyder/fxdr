% read_file


Name
----

write_file - write the contents of an XDR stream to a file


Synopsis
--------

~~~{.synopsis}
SUBROUTINE write_file(self, filename)

  CLASS(XDR_T) :: self
  CHARACTER(KIND = C_CHAR, LEN = *), INTENT(IN) :: filename
~~~


Description
-----------

This method writes the contents of an XDR stream object's internal memory to a
file.  The file will be overwritten if it already exists.


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


See also
--------

[create][]
[destroy][]
[read_file][]
