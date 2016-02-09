#!/bin/bash

#global setting
mkdir mybuild

#build openssl
pushd openssl-1.0.1r
./Configure --prefix=$PWD/../mybuild no-asm no-shared linux-elf
make
make install
popd

#build httpd
pushd httpd-2.4.18
./configure --prefix=$PWD/../mybuild --sysconfdir=$PWD/../mybuild/etc/httpd --enable-so --enable-ssl --enable-cgi --enable-rewrite --with-zlib --with-pcre --with-apr=$PWD/srclib/apr --with-apr-util=$PWD/srclib/apr-util --with-included-apr --with-ssl=$PWD/../mybuild --enable-modules=most
make
make install
popd


