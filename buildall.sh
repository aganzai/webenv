#!/bin/sh

#global setting
mkdir build

#build httpd
pushd httpd-2.4.18
./configure --prefix=$PWD/../build --sysconfdir=$PWD/../build/etc/httpd --enable-so --enable-ssl --enable-cgi --enable-rewrite --with-zlib --with-pcre --with-apr=/usr/local/apr --with-apr-util=/usr/local/apr-util --enable-modules=most
popd


