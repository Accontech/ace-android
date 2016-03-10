#!/bin/bash
set -xe
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

. $DIR/detect.sh
. $DIR/prepare.sh

ccache -M 5G
ccache -s

which bundler || gem install bundler
bundle install

for id in $(
  for component in build-tools-22.0.1 android-22 extra-google-google_play_services extra-google-m2repository extra-android-m2repository addon-google_apis-google-22 ; do
    android list sdk -u -e -a  | grep -e '^id:' | sed -e 's/"//g' | grep -e ' '$component'$' | awk '{print $2}'
  done
) ; do
  echo Installing android sdk component $id
  echo y | android update sdk -n --no-ui --filter $id > /dev/null 2>&1
done
