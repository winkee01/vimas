#!/bin/sh

## Introduction
# This script is used to set up development envrionment for CentOS 7
# This script need to be run as root user
# Author: winkee

# (1) libs
# - libarchive, libuv, etc.

# (2) tools
# - cmake, global, ctags, yarn, etc.

update() {
    yum update
    yum -y groupinstall 'Development Tools'
    yum -y install zlib-devel
    yum -y install curl-devel
    yum -y install expat-devel
    yum install wget
}

libtool() {
    git clone git://git.savannah.gnu.org/libtool.git
    # We can also download a source package to install
    # wget http://ftpmirror.gnu.org/libtool/libtool-2.4.6.tar.gz
    cd libtool && ./bootstrap
    ./configure --prefix=/usr && make
    make install
    libtool --finish /usr/lib
}

libarchive() {
    wget https://github.com/libarchive/libarchive/releases/download/v3.4.2/libarchive-3.4.2.tar.xz
    ./configure --prefix=/usr --disable-static && make && make install

    # upon success
    rm /usr/lib64/libarchive.so
    rm /usr/lib64/libarchive.so.13
    cp /usr/lib/libarchive.so.13.4.2 /usr/lib64/
    ln -sf /usr/lib64/libarchive.so.13.4.2 /usr/lib64/libarchive.so
    ln -sf /usr/lib64/libarchive.so.13.4.2 /usr/lib64/libarchive.so.13
}

libuv() {
    wget https://dist.libuv.org/dist/v1.35.0/libuv-v1.35.0.tar.gz
    sh autogen.sh &&
    ./configure --prefix=/usr --disable-static && make && make install
}

cmake() {
    wget https://cmake.org/files/v3.17/cmake-3.17.0.tar.gz
    sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake &&
    ./bootstrap --prefix=/usr        \
            --system-libs        \
            --mandir=/share/man  \
            --no-system-jsoncpp  \
            --no-system-librhash \
            --docdir=/share/doc/cmake-3.17.0 &&
    make &&
    make install
}

main() {
    libarchive
    libuv
    cmake
}

main $1