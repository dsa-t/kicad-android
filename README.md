A set of scripts to build KiCad on Android using wxQt wxWidgets port.

# Requirements

- A modern Linux Distro (Ubuntu 22.04)
- Android SDK
- [Android NDK r25c (25.2.9519653)](https://github.com/android/ndk/wiki/Unsupported-Downloads#r25c) (newer versions won't work)
- Android 9+ (API Level 28) Emulator or Device. xlocale support doesn't work in older versions.
- Qt 6.6.2
- Meson 1.3.0+
- Ninja 1.8.2+
- CMake

# Init repo

```bash
git submodule update --init --recursive
```

# Get tarballs

```bash
mkdir -p OCCT && curl -L -o - 'https://github.com/Open-Cascade-SAS/OCCT/archive/refs/tags/V7_8_1.tar.gz' | tar -xz --strip-components=1 -C OCCT
mkdir -p libgit2 && curl -L -o - 'https://codeload.github.com/libgit2/libgit2/tar.gz/refs/tags/v1.8.0' | tar -xz --strip-components=1 -C libgit2
mkdir -p ngspice && curl -L -o - 'https://altushost-swe.dl.sourceforge.net/project/ngspice/ng-spice-rework/42/ngspice-42.tar.gz' | tar -xz --strip-components=1 -C ngspice
mkdir -p cairo && curl -L -o - 'https://gitlab.freedesktop.org/cairo/cairo/-/archive/02754405330989198548d1945b3c55566ba0c6b7/cairo-02754405330989198548d1945b3c55566ba0c6b7.tar.gz' | tar -xz --strip-components=1 -C cairo
mkdir -p unixODBC && curl -L -o - 'ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.12.tar.gz' | tar -xz --strip-components=1 -C unixODBC
mkdir -p zstd && curl -L -o - 'https://github.com/facebook/zstd/releases/download/v1.5.6/zstd-1.5.6.tar.gz' | tar -xz --strip-components=1 -C zstd
mkdir -p protobuf && curl -L -o - 'https://github.com/protocolbuffers/protobuf/archive/refs/tags/v3.12.4.tar.gz' | tar -xz --strip-components=1 -C protobuf
mkdir -p python && curl -L -o - 'https://www.python.org/ftp/python/3.13.0/Python-3.13.0rc1.tgz' | tar -xz --strip-components=1 -C python
mkdir -p openssl && curl -L -o - 'https://github.com/openssl/openssl/releases/download/openssl-3.3.1/openssl-3.3.1.tar.gz' | tar -xz --strip-components=1 -C openssl          
mkdir -p icu && curl -L -o - 'https://github.com/unicode-org/icu/releases/download/release-73-2/icu4c-73_2-src.tgz' | tar -xz --strip-components=1 -C icu
mkdir -p pcre2 && curl -L -o - 'https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.44/pcre2-10.44.tar.gz' | tar -xz --strip-components=1 -C pcre2
```

# Apply patches

```bash
cp _glu_meson.build glu/meson.build
cp _glu_meson_options.txt glu/meson_options.txt
cp _ngspice_configure.ac ngspice/configure.ac
cp _icu_mh-linux icu/source/config/mh-linux
```

# Qt installation
1. Download Qt sources (qt-everywhere-src-6.6.2)
2. Build Qt for Desktop
3. Build Qt for Android

# Start build (set your paths here)

```bash
export QT_HOST_PATH=/usr/local/Qt-6.6.2
export QT_TARGET_BASE=$HOME/qt6-android
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_NDK_ROOT=$HOME/android-ndk-r25c
./all.sh
```

# References

- Original proof of concept: https://github.com/reingart/gsoc2014
- Minimal wxWidgets tooling: https://github.com/dsa-t/wx-android-minimal-cmake
