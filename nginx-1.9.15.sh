#!/bin/bash

cd $OPENSHIFT_TMP_DIR
wget http://nginx.org/download/nginx-1.9.15.tar.gz
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.37.tar.bz2
wget https://sourceforge.net/projects/libpng/files/zlib/1.2.8/zlib-1.2.8.tar.gz
wget https://www.openssl.org/source/openssl-1.0.1t.tar.gz

tar zxvf nginx-1.9.15.tar.gz
tar xvf pcre-8.37.tar.bz2
tar zxvf zlib-1.2.8.tar.gz
tar zxvf openssl-1.0.1t.tar.gz

cd nginx-1.9.15

#安装nginx
./configure --prefix=$OPENSHIFT_DATA_DIR --with-openssl=$OPENSHIFT_TMP_DIR/openssl-1.0.1t --with-http_ssl_module --with-pcre=$OPENSHIFT_TMP_DIR/pcre-8.37 --with-zlib=$OPENSHIFT_TMP_DIR/zlib-1.2.8 --with-http_gzip_static_module --with-http_realip_module --with-http_sub_module --with-http_flv_module --with-http_dav_module --with-http_stub_status_module --with-http_addition_module

#make&&make install
make install
mv $OPENSHIFT_DATA_DIR/conf/nginx.conf $OPENSHIFT_DATA_DIR/conf/nginx.conf.def