#!/bin/bash

set -e

. init-env

rm -rf "./toolchain_*"

./toolchain-init
./python-build

./boost-for-android-build
./openssl-build
./meson-build
./gl4es-build

./pcre2-build
./glu-build
./git-build # needs openssl
./cairo-build # builds freetype
./ngspice-build
./occt-build # needs freetype
./odbc-build
./zstd-build
./protobuf-build
./wx-build
./kicad-build

./app-build

