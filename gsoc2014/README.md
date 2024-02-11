gsoc2014
========

Qt proof of concept app to experiment in cross-compiling [wxQT](http://wiki.wxwidgets.org/WxQt) for Android.
For more info see the full [proposal for Google Summer of Code 2014](http://www.google-melange.com/gsoc/proposal/public/google/gsoc2014/reingart/5629499534213120)

To compile wxQt for Qt5 and Android, look at this experimental branch with custom changes: https://github.com/reingart/wxWidgets/tree/wxQT
See also the provisional [Configuration script](https://dl.dropboxusercontent.com/u/75600582/gsoc2014/wxQT/config.sh)

Build instructions:

    export ANDROID_NDK_ROOT=/home/reingart/src/android-ndk-r9d
    /home/reingart/qt/5.2.1/android_armv5/bin/qmake -makefile minimal.pro
    make install INSTALL_ROOT=android
    #/home/reingart/qt/5.2.1/android_armv5/bin/androiddeployqt --output android --android-platform android-10
    cd android
    ant debug
 

Deploy:

    /home/reingart/src/android-sdk-linux/platform-tools/adb -e install -r bin/QtApp-debug.apk
    /home/reingart/src/android-sdk-linux/platform-tools/adb -e logcat

Debug:

    cd android
    ./gdb.sh

Tested with a "Nexus One" AVD Android 2.3.3, API Level 10, CPU/ABI ARM (armeabi).

wxQt Minimal hello world dialog sample running under android:

![](https://dl.dropboxusercontent.com/u/75600582/gsoc2014/wxQtAndroid_minimal_widgets.png)

![](https://dl.dropboxusercontent.com/u/75600582/gsoc2014/wxQtAndroid_minimal_info.png)

![](https://dl.dropboxusercontent.com/u/75600582/gsoc2014/wxQtAndroid_minimal_about.png)


Old screenshot captures:

![](https://dl.dropboxusercontent.com/u/75600582/gsoc2014/android_screen.png)

![](https://dl.dropboxusercontent.com/u/75600582/gsoc2014/android_app.png)


