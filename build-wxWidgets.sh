#!/bin/bash

# this script build and install locally the wxWidgets distribution on macOS platform
BORC_PACKAGES_ROOT_DIR="`pwd`/packages"

BORC_PACKAGE_NAME="wxWidgets"
BORC_PACKAGE_VERSION="3.1.3"

BORC_PACKAGE_FILE="wxWidgets-3.1.3.tar.bz2"
BORC_PACKAGE_DIR="wxWidgets-3.1.3"

BORC_PACKAGE_INSTALL_PREFIX="$BORC_PACKAGES_ROOT_DIR/$BORC_PACKAGE_NAME/$BORC_PACKAGE_VERSION"

if ! [ -f $BORC_PACKAGE_FILE ]; then
    wget https://github.com/wxWidgets/wxWidgets/releases/download/v3.1.3/$BORC_PACKAGE_FILE
fi

if ! [ -d cache ]; then
    mkdir cache
fi

if ! [ -d cache/$BORC_PACKAGE_DIR ]; then
    tar -xf $BORC_PACKAGE_FILE -C cache/
fi

cd cache/$BORC_PACKAGE_DIR

./configure --prefix $BORC_PACKAGE_INSTALL_PREFIX
make
make install
