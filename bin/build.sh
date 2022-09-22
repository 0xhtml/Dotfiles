#!/bin/sh

if [ -z "$1" ]; then
    TARGET="main"
else
    TARGET=$1
fi

if [ -z "$2" ]; then
    BUILD_TYPE="debug"
else
    BUILD_TYPE=$2
fi

DIR="cmake-${BUILD_TYPE%%-*}"

mkdir -p $DIR &&
cd $DIR &&
cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE .. &&
cmake --build . --target $TARGET
