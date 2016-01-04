FXDR Installation Instructions
==============================

Introduction
------------

The generic process for setting up FXDR on a Unix-like or Mac OS X system,
with default configuration options, is:

~~~
mkdir build
cd build
cmake /path/to/fxdr-x.y.z
make install
~~~

Detailed instructions are provided below.


Prerequisites
-------------

FXDR relies on a handful of external packages that are not included in the FXDR
distribution.  The following are required:

CMake
  ~ The CMake build system is used to manage compilation, testing, and
    installation.  It can be downloaded at <https://cmake.org/download/>.
    CMake versions 3.0 and above provide the necessary functionality.

C compiler
  ~ The C compiler must support the C99 standard.  The following compilers are
    known to work: gcc 5.2, Apple Clang 7.0.

Fortran compiler
  ~ FXDR relies on features found in the Fortran 2003 standard.  The following
    compilers are known to work: gfortran 5.2.

The pandoc document conversion tool is used to generate documentation.  If you
wish to build the documentation, then you will need pandoc installed on your
system.  It can be found at <http://pandoc.org/>.


Configuration
-------------

Before you can build the software artifacts from the source code, you need to
generate a set of build instructions that are suitable for your system.  FXDR
uses the CMake program to make sure that all prerequisites are satisfied and to
see that the build process is properly configured.

FXDR can be configured and built in a different location than the root
distribution directory.  This is called an *out-of-source* build and is
recommended because it keeps all intermediate files separate from the original
source.  To prepare for an out-of-source build, create a temporary directory
and run `cmake` from within this directory.

~~~
mkdir build
cd build
cmake /path/to/fxdr-x.y.z
~~~

The `cmake` program runs without user interaction.   Text- and graphics-based
user interfaces for CMake may be installed on your system.  These will be named
`ccmake` and `cmake-gui`, respectively, and may be used in place of `cmake`.


### Compilers

CMake will probe your system for common C and Fortran compilers and select the
first ones that it finds.  If it has trouble finding suitable compilers or if
you wish to override its choices, you can force the choice as follows:

~~~
CC=icc FC=ifort cmake /path/to/fxdr-x.y.z
~~~

### Installation prefix

By default, the FXDR artifacts will be installed under `/usr/local`.  The
installation location can be changed by setting the `CMAKE_INSTALL_PREFIX`
CMake option.

~~~
cmake -DCMAKE_INSTALL_PREFIX=/path/to/install
~~~

### Unit tests

The FXDR unit tests are not built by default.  These tests can be enabled as
follows:

~~~
cmake -DBUILD_TESTS=ON /path/to/fxdr-x.y.z
~~~

### Documentation

The FXDR documentation is built by default.  You can disable generation of the
documentation by disabling the `BUILD_DOCS` option.

~~~
cmake -DBUILD_DOCS=OFF /path/to/fxdr-x.y.z
~~~


Building the library
--------------------

After the build has been configured with CMake, you can generate the FXDR
artifacts by executing:

~~~
make
~~~


Testing the library
-------------------

If testing was enabled during the configuration, you can run the tests through
the `make` program.

~~~
make test
~~~


Installing the library
----------------------

The final phase of the build process is to install the artifacts.

~~~
make install
~~~


Linking with your application
-----------------------------

Once FXDR has been installed, you can link your own programs against the
library like this:

~~~
gfortran -L /path/to/fxdr/lib -I /path/to/fxdr/include -o myprog myprog.f90 -lfxdr
~~~
