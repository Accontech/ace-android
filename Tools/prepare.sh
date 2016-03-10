#!/bin/bash
# Source this file to inherit the exported environment variables

export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export NDK_PATH=$ANDROID_NDK
export PATH=$ANDROID_NDK:$PATH

export PATH=${ANDROID_NDK}:${ANDROID_NDK}/ndk-build:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:$PATH
export CCACHE_DIR=$HOME/.ccache
export NDK_CCACHE=ccache
export LINPHONE_CCACHE=ccache
export CCACHE_SLOPPINESS=pch_defines,time_macros,include_file_mtime,include_file_ctime,file_macro
export CCACHE_COMPILERCHECK=content

export MALLOC_ARENA_MAX=2

export ANDROID_MOST_RECENT_TARGET=android-22 ANDROID_SDKS=android-22,sysimg-22 ANDROID_TARGET=android-22 ANDROID_ABI=armeabi-v7a 

export ENABLE_GPL_THIRD_PARTIES=0 BUILD_VIDEO=1 BUILD_OPENH264=1 ENABLE_OPENH264_DECODER=1 BUILD_X264=0 BUILD_AMRNB=0 BUILD_AMRWB=0 BUILD_ZRTP=0 BUILD_SILK=0 BUILD_G729=0 BUILD_TUNNEL=0 BUILD_WEBRTC_AECM=1 USE_JAVAH=1 BUILD_FOR_X86=1 BUILD_SQLITE=1 BUILD_TLS=1 BUILD_WEBRTC_ISAC=0 BUILD_OPUS=1 BUILD_UPNP=0 BUILD_MATROSKA=0 BUILD_ILBC=0 BUILD_MPEG4=0 BUILD_H263P=0 BUILD_VCARD=1 BUILD_GSM=0 BUILD_BV16=0 BUILD_MKV=0 BUILD_SPEEX=0
