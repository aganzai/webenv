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

#build zlib
pushd zlib-1.2.8
./configure --prefix=$PWD/../mybuild
make
make install
popd

#build php
pushd php-5.4.45 
./configure --prefix=$PWD/../mybuild --enable-fpm  --with-mcrypt=/usr/local/libmcrypt --with-zlib --with-zlib-dir=$PWD/../mybuild --enable-mbstring --with-openssl-dir=$PWD/../mybuild --with-mysql --with-mysqli --with-mysql-sock --with-gd --with-jpeg-dir=/usr/lib --enable-gd-native-ttf  --enable-pdo --with-pdo-mysql --with-gettext --with-curl --with-pdo-mysql --enable-sockets --enable-bcmath --enable-xml --with-bz2 --enable-zip --enable-freetype
popd

