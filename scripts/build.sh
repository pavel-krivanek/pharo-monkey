#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PWD=`pwd`
BUILD_DIRECTORY=${PWD}/target

echo "[BUILD] Building Monkey in ${BUILD_DIRECTORY}"
mkdir -p "${BUILD_DIRECTORY}"
cd ${BUILD_DIRECTORY}

echo "[BUILD] Downloading Pharo 6.0"
wget -O - http://get.pharo.org/60+vm | bash > /dev/null

echo "[BUILD] Loading Monkey"
${BUILD_DIRECTORY}/pharo ${BUILD_DIRECTORY}/Pharo.image st ${DIR}/loadCI.st --save --quit > /dev/null

if (($? > 0)); then
    echo "error during monkey loading!"
    exit 1
fi

echo "[BUILD] Deploy Wrapper Scripts"

echo "[BUILD] DONE"
