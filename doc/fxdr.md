% fxdr


Name
----

fxdr - Fortran implementation of the XDR protocol


Synopsis
--------

~~~{.synopsis}
USE xdr
~~~

~~~{.synopsis}
fc [flags] files -lfxdr [libraries]
~~~


Description
-----------

The External Data Representation Standard (XDR) provides a way to describe and
encode data.  The FXDR library provides a partial implementation of XDR in
Fortran 2003.  The Fortran API differs from the widely available C API, but
data encoded with FXDR can be decoded using the C API.  Conversely, data
encoded using the C API can be decoded using FXDR as long as the encoded data
types are supported by FXDR.  Currently unsupported features include:

* unsigned hyper integers (64 bits)
* quadruple precision floating-point numbers (128 bits)
* discriminated unions
* pointers and references

The FXDR library defines an `XDR_T` data type that encapsulates all of the
behavior needed to employ the XDR protocol.  The type's methods are divided
into three categories: buffer utilities, encoding, and decoding.  These are
summarized below.

### Buffer utilities

As the FXDR library encodes data, it writes the resulting sequence of bytes
into a buffer that can afterwards be written to a file, sent over a network, or
otherwise put to use.  Conversely, data can be decoded from the bytes stored in
a buffer read from a file or received over a network connection.  The following
methods can be used to manage the buffer held by an `XDR_T` object:

Buffer management
  ~ [create][]
    [destroy][]

Working with files
  ~ [read_file][]
    [write_file][]

Size and position
  ~ [getsize][]
    [getpos][]
    [setpos][]


### Encoding data

A family of functions are provided for encoding data into an existing `XDR_T`
object.  The particular method to use depends on two criteria: structure and
type.  All methods return `.TRUE.` if encoding is successful and `.FALSE.` if
there was insufficient space or some other problem.

Encode scalar quantities
  ~ [put][]
    [put_character][]
    [put_unsigned][]

Encode fixed-length arrays
  ~ [put_vector][]
    [put_character_vector][]
    [put_unsigned_vector][]

Encode variable-length arrays

  ~ [put_array][]
    [put_character_array][]
    [put_unsigned_array][]


### Decoding data

For each encoding method, there is a corresponding method for decoding data.
These methods all return `.TRUE.` if successful and `.FALSE.` otherwise.

The `XDR_T` type also defines methods for decoding variable-length data into an
allocatable array.  The API allocates the precise amount of space needed to
store the data and the user is responsible for deallocating the array when it
is no longer needed.

Decode scalar quantities
  ~ [get][]
    [get_character][]
    [get_unsigned][]

Decode fixed-length arrays
  ~ [get_vector][]
    [get_character_vector][]
    [get_unsigned_vector][]

Decode variable-length arrays
  ~ [get_array][]
    [get_character_array][]
    [get_unsigned_array][]

Decode variable-length arrays with allocation
  ~ [allocate_array][]
    [allocate_character_array][]
    [allocate_unsigned_array][]


Resources
---------

FXDR web site: <https://www.github/richsnyder/fxdr>

RFC 4506: <http://www.rfc-editor.org/info/rfc4506>


Copying
-------

Unless otherwise marked, this software is, per 17 USC § 101, declared a work of
the U.S. Government and is not subject to copyright protection in the United
States.
