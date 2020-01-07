#!/bin/bash

BORC_PACKAGE_NAME="boost"
BORC_PACKAGE_ROOT_DIR="`pwd`/packages"

BOOST_VERSION_MAJOR="1"
BOOST_VERSION_MINOR="72"
BOOST_VERSION_REVISION="0"

BOOST_RELEASE="1.72.0"
BOOST_PACKAGE="boost_1_72_0.tar.bz2"
BOOST_PACKAGE_DIR="boost_1_72_0"

BOOST_INSTALL_PREFIX="$BORC_PACKAGE_ROOT_DIR/$BORC_PACKAGE_NAME/$BOOST_RELEASE"

if ! [ -f $BOOST_PACKAGE ]; then
    wget https://dl.bintray.com/boostorg/release/$BOOST_RELEASE/source/$BOOST_PACKAGE
fi

if ! [ -d cache ]; then
    mkdir cache
fi

if ! [ -d cache/$BOOST_PACKAGE_DIR ]; then
    tar -xf $BOOST_PACKAGE -C cache/
fi

cd cache/$BOOST_PACKAGE_DIR
if ! [ -f project-config.jam ]; then
    ./bootstrap.sh
fi

./b2 --prefix=$BOOST_INSTALL_PREFIX install 
