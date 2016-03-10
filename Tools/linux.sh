#!/bin/bash
# Source this file to inherit the exported environment variables

sudo apt-get update -y -qq
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get install -y -qq yasm nasm curl ant rsync autoconf automake ccache libtool pkg-config bc libwww-perl ruby

if [ ! -f $HOME/ndk.bin ]; then
  if [ `uname -m` = x86_64 ]; then
    wget --timeout=120 http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86_64.bin -O $HOME/ndk.bin
  else
    wget --timeout=120 http://dl.google.com/android/ndk/android-ndk-r10e-linux-x86.bin -O $HOME/ndk.bin
  fi
  chmod 755 $HOME/ndk.bin
fi

if [ ! -d $HOME/android-ndk-r10e ]; then
  ( cd $HOME; ./ndk.bin 2>&1 | grep -v Extracting )
fi

export ANDROID_NDK=${ANDROID_NDK:-$PWD/android-ndk-r10e}

if [ ! -d $HOME/android-sdk-linux ]; then
  curl --location http://dl.google.com/android/android-sdk_r24.4-linux.tgz | tar -x -z -C $HOME
fi

export ANDROID_HOME=${ANDROID_HOME:-$PWD/android-sdk-linux}
