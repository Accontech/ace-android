#!/bin/bash
set -xe
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

. $DIR/detect.sh
. $DIR/prepare.sh

make clean
make -j 8
