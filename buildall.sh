#!/bin/bash

#global setting
mkdir mybuild
export LD_LIBRARY_PATH=$PWD/mybuild/lib:$LD_LIBRARY_PATH

#build openssl
pushd openssl-1.0.1r
./Configure --prefix=$PWD/../mybuild no-asm no-shared linux-elf
make
make install
popd

#build zlib
pushd zlib-1.2.8
./configure --prefix=$PWD/../mybuild
make
make install
popd

#build bzip2
pushd bzip2-1.0.6
make
make install PREFIX=$PWD/../mybuild
popd

#build curl
pushd curl-7.47.1
#./configure --prefix=$PWD/../mybuild --enable-shared=no --with-ssl=$PWD/../mybuild
./configure --prefix=$PWD/../mybuild --enable-shared=no
make
make install
popd

#build jpeglib
pushd jpeg-9b
./configure --prefix=$PWD/../mybuild
make
make install
popd

#build libpng
pushd libpng-1.6.21
CPPFLAGS=-I$PWD/../mybuild/include/ LDFLAGS=-L$PWD/../mybuild/lib ./configure --prefix=$PWD/../mybuild
make
make install
popd

#build libmcrypt
pushd libmcrypt-2.5.7
./configure --prefix=$PWD/../mybuild
make
make install
popd

#build php
pushd php-5.4.45
./configure --prefix=$PWD/../mybuild --enable-fpm  --with-mcrypt=$PWD/../mybuild --with-zlib --with-zlib-dir=$PWD/../mybuild --with-bz2=$PWD/../mybuild --enable-mbstring --with-openssl-dir=$PWD/../mybuild --with-mysql --with-mysqli --with-mysql-sock --with-gd --with-jpeg-dir=$PWD/../mybuild --enable-gd-native-ttf  --enable-pdo --with-pdo-mysql --with-gettext --with-curl=$PWD/../mybuild --with-png-dir=$PWD/../mybuild --with-pdo-mysql --enable-sockets --enable-bcmath --enable-xml --enable-zip --enable-freetype
make
make install
popd


#build httpd
pushd httpd-2.4.18
./configure --prefix=$PWD/../mybuild --sysconfdir=$PWD/../mybuild/etc/httpd --enable-so --enable-ssl --enable-cgi --enable-rewrite --with-zlib --with-pcre --with-apr=$PWD/srclib/apr --with-apr-util=$PWD/srclib/apr-util --with-included-apr --with-ssl=$PWD/../mybuild --enable-modules=most
make
make install
popd

