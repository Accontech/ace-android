#!/bin/bash
set -xe
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

case $(uname -s) in
Darwin)
  . $DIR/mac.sh
  ;;
Linux)
  . $DIR/linux.sh
  ;;
*)
  echo "What platform is $(uname -s)?"
  exit 1
  ;;
esac
