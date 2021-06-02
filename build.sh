#!/bin/bash

# Usage:
#   ./build.sh [install_path]

if [ $# -ne 1 ]; then
    echo -e "\033[0;32mUsage\033[0m:"
    echo -e "    ./build.sh [install_path]"
    exit
fi

ROOT_DIR=$PWD
mkdir temp
tar xvzf qd-2.3.22.tar.gz
cd temp
mkdir qd-build && cd qd-build
$ROOT_DIR/qd-2.3.22/configure --prefix=$ROOT_DIR/temp/qd CXXFLAGS="-fPIC" CFLAGS="-fPIC" FCFLAGS="-fPIC"
make -j8 && make install

cd $ROOT_DIR
tar xvzf blackhat-0.9.9.tar.gz
cd temp && mkdir blackhat-build && cd blackhat-build
/bin/cp -rf $ROOT_DIR/patch/OptionsHandler.hpp $ROOT_DIR/blackhat-0.9.9/src/Interface
/bin/cp -rf $ROOT_DIR/patch/cut_Darren.h $ROOT_DIR/blackhat-0.9.9/src
/bin/cp -rf $ROOT_DIR/patch/cached_OLHA.cpp $ROOT_DIR/blackhat-0.9.9/src
$ROOT_DIR/blackhat-0.9.9/configure --prefix=$1 --with-QDpath=$ROOT_DIR/temp/qd CXXFLAGS="-std=c++98 -Wno-deprecated -fpermissive"
make -j8 && make install