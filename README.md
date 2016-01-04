FXDR
====


Introduction
------------

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


Installation
------------

Installation instructions can be found in the `INSTALL.md` file.


Unsigned Integers
-----------------

XDR defines encodings for unsigned integer and unsigned hyper integer data, but
Fortran does not define data types for representing these values.  FXDR
procedures for encoding and decoding unsigned integer data, therefore, accept
signed integers of a kind that can accommodate the full range of the unsigned
type, as shown in the following table.

  C type | Fortran kind
---------|-------------
 uint8_t |    C_INT16_T
uint16_t |    C_INT32_T
uint32_t |    C_INT64_T
uint64_t |  unsupported

Attempting to encode a negative value as an unsigned value produces undefined
results.


License
-------

FXDR is, per 17 USC § 101, a work of the U.S. Government and is not subject to
copyright protection in the United States.

The External Data Representation Standard (XDR) protocol is defined in
RFC 4506.  Its citation is:

Eisler, M., Ed., "XDR: External Data Representation Standard", STD 67, RFC 4506,
    DOI 10.17487/RFC4506, May 2006, <http://www.rfc-editor.org/info/rfc4506>.
