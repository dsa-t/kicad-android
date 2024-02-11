A minimal set of scripts to build wxWidgets with wxQt on Android, without OpenGL canvas.

# Requirements

- A modern Linux Distro (Ubuntu 22.04)
- Android SDK
- [Android NDK r21e](https://github.com/android/ndk/wiki/Unsupported-Downloads#r21e) (newer versions won't work)
- Android 9+ (API Level 28) Emulator or Device. xlocale support doesn't work on lower versions.
- QT 5.15.2

Use [aqt](https://github.com/miurahr/aqtinstall) to install QT:

```bash
cd qt
aqt install-qt linux android 5.15.2
```
Tweak paths to your tooling in `init-env` file.

# Install wxWidgets / Build

```bash
./all.sh
```

# References

- Original proof of concept: https://github.com/reingart/gsoc2014
