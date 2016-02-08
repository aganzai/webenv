#!/bin/sh

#global setting
mkdir build

#build openssl
pushd openssl-1.0.1r
./Configure --prefix=$PWD/../build no-asm no-shared linux-elf
make
make install
popd

#build httpd
pushd httpd-2.4.18
./configure --prefix=$PWD/../build --sysconfdir=$PWD/../build/etc/httpd --enable-so --enable-ssl --enable-cgi --enable-rewrite --with-zlib --with-pcre --with-included-apr --with-ssl=$PWD/../build --enable-modules=most
popd


