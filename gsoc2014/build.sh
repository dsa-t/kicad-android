#!/bin/bash

set -e

. ../init-env

rm -rf build/*
mkdir -p build
cd build/

qmake -makefile ../minimal.pro ANDROID_ABIS="${CONF_ANDROID_ARCHES}"
make install INSTALL_ROOT=android
