set -e

. init-env

rm -rf ${CONF_SYSROOT}

./gl4es-build
./curl-build

./glu-build
./git-build # needs openssl
./cairo-build # builds freetype
./boost-build # needs freetype
./ngspice-build
./occt-build # needs freetype
./odbc-build
./zstd-build
./harfbuzz-build  # needs freetype
./protobuf-build
./python-build
./wx-build
./kicad-build

./app-build

