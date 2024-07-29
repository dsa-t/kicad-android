#!/bin/bash

set -e

. init-env

rm -rf "${CONF_SYSROOT}"

./icu-build
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
./boost-build
./protobuf-build
./python-build
./wx-build
./kicad-build

./app-build

