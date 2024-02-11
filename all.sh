#!/bin/bash

set -e

. init-env

./wx-clean

for android_arch in $CONF_ANDROID_ARCHES; do
    ./wx-build-arch $android_arch
done

cd gsoc2014
./build.sh
