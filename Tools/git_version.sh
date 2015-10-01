#!/bin/bash

which semver || bundle install

ace_android_version="$(bundle exec semver format '%M.%m.%p')-${TRAVIS_BUILD_NUMBER:-1}-$(git rev-parse --short HEAD)"

sed -i -e 's/android:versionName="[^\"]"/android:versionName="'$ace_android_version'"/g' AndroidManifest.xml
sed -i -e 's/android:versionCode="[^\"]"/android:versionCode="'$TRAVIS_BUILD_NUMBER'"/g' AndroidManifest.xml
