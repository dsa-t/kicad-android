set -e

. init-env

rm -rf ${CONF_SYSROOT}

# ./gl4es-build
# ./curl-build

# ./glu-build
# ./git-build # needs openssl
# ./cairo-build
# ./boost-build
# ./ngspice-build
# ./occt-build # needs freetype
# ./odbc-build
./wx-build
./kicad-build

./app-build

