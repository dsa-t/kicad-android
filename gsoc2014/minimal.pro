#-------------------------------------------------
#
# Project created by QtCreator 2014-03-27T23:08:24
#
#-------------------------------------------------

QT       += core gui widgets opengl svg testlib

TARGET = gsoc2014
TEMPLATE = app

USE_STATIC = $$(CONF_BUILD_STATIC)
CONF_ANDROID_ARCHES = $$(CONF_ANDROID_ARCHES)

message(ARCH $$QT_ARCH)

contains(QT_ARCH, x86_64) {
    CONF_COMPILER_ARCH="x86_64"
    message("Compiling for x86_64")
}
contains(QT_ARCH, arm64-v8a) {
    CONF_COMPILER_ARCH="aarch64"
    message("Compiling for arm64-v8a")
}

ANDROID_ARCH_LIB=$$QT_ARCH

WX_VERSION = $$(WX_VERSION)

WX_CONFHOST = $${CONF_COMPILER_ARCH}-linux-android$$(CONF_ANDROID_LEVEL)
WX_LIB_DIR = $$(WX_ROOT)/buildqt5droid_$${ANDROID_ARCH_LIB}/lib

#WX_CONFHOST = $$(WX_CONFHOST)
#WX_LIB_DIR = $$(WX_LIB_DIR)

message(WX_CONFHOST $$WX_CONFHOST)
message(WX_LIB_DIR $$WX_LIB_DIR)

WX_INC_DIR = $$(WX_INC_DIR)

GL4ES_ROOT = $$(GL4ES_ROOT)
GL4ES_LIBS = $$(GL4ES_ROOT)/libs/$${QT_ARCH}
INCLUDEPATH += $${GL4ES_ROOT}/include

INCLUDEPATH += $${WX_INC_DIR}
LIBS += -L$${WX_LIB_DIR}/

equals(USE_STATIC, "1") {
    INCLUDEPATH += $${WX_LIB_DIR}/wx/include/$${WX_CONFHOST}-qt-unicode-static-$${WX_VERSION}

    LIBS += $${WX_LIB_DIR}/libwx_qtu_qa-$${WX_VERSION}-$${WX_CONFHOST}.a
    LIBS += $${WX_LIB_DIR}/libwx_qtu_adv-$${WX_VERSION}-$${WX_CONFHOST}.a
    LIBS += $${WX_LIB_DIR}/libwx_qtu_core-$${WX_VERSION}-$${WX_CONFHOST}.a
    LIBS += $${WX_LIB_DIR}/libwxpng-$${WX_VERSION}-$${WX_CONFHOST}.a 
    LIBS += $${WX_LIB_DIR}/libwx_baseu-$${WX_VERSION}-$${WX_CONFHOST}.a

} else {
    INCLUDEPATH += $${WX_LIB_DIR}/wx/include/$${WX_CONFHOST}-qt-unicode-$${WX_VERSION}

    unix {
        SHARED_LIB_FILES = $$files($${WX_LIB_DIR}/*_$${ANDROID_ARCH_LIB}.so)
        for(FILE, SHARED_LIB_FILES) {
            BASENAME = $$basename(FILE)
            LIBS += -l$$str_member($$BASENAME, 3, -4)
        }
    }
}

LIBS += -llog
DEFINES += __WXQT__

SOURCES += dialogs.cpp

HEADERS  +=

CONFIG += mobility
#CONFIG += debug
MOBILITY = 



