#!/bin/bash
# Source this file to inherit the exported environment variables
set -xe

which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install android-ndk android-sdk ccache

export ANDROID_HOME=$(ls -1 /usr/local/Cellar/android-sdk/ | tail -1)
export ANDROID_NDK=$(ls -1 /usr/local/Cellar/android-ndk/ | tail -1)
