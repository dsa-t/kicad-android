#!/bin/bash

set -e

. ../init-env

rm -rf build/*
mkdir -p build
cd build/

qmake -makefile ../minimal.pro ANDROID_ABIS="${CONF_ANDROID_ARCHES}"
make install INSTALL_ROOT=android

cp -r ${WX_LIBS_STAGING}/* android/libs/

# yes | sdkmanager --licenses
#$SDK/tools/emulator -avd Tablet_API_28

androiddeployqt --input android-gsoc2014-deployment-settings.json --output android --android-platform $ANDROID_NDK_PLATFORM --install

#androiddeployqt --release --input android-gsoc2014-deployment-settings.json --output android --android-platform $ANDROID_NDK_PLATFORM --install --sign $HOME/Android/KeyStore/key1.jks key0 --storepass 123456 --keypass 123456

adb shell monkey -p org.qtproject.example.gsoc2014 1
