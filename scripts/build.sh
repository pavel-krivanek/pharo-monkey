#!/bin/bash
PWD=`pwd`
DIR="$(dirname "$(readlink -f "$0")")"

while getopts ":vb:t:" opt; do
    case "${opt}" in
    v  ) VERBOSE_OUTPUT_STREAM="/dev/stdout";;
    t  ) TARGET_DIRECTORY_NAME=${OPTARG};;
    b  ) BUILD_DIRECTORY_NAME=${OPTARG};;
    :  ) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
    esac
done
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

run_script(){
  local SCRIPT="$@"
  local exit_status=0
  touch ${LOGFILE}
  echo "$ $@" | tee -a ${LOGFILE} > ${VERBOSE_OUTPUT_STREAM}
  $@ #2>&1 | tee -a ${LOGFILE} > ${VERBOSE_OUTPUT_STREAM} ; exit_status=${PIPESTATUS[0]}

  if [ ${exit_status} -ne 0 ]; then
      echo "[BUILD] Error in script. Check ${LOGFILE} for more information"
      exit 1
  fi
}

#Where to build
BUILD_DIRECTORY_NAME=${BUILD_DIRECTORY_NAME:-build}
BUILD_DIRECTORY=${PWD}/${BUILD_DIRECTORY_NAME}
if [ -d ${BUILD_DIRECTORY} ]; then
  echo "[BUILD] BUILD directory ${BUILD_DIRECTORY} already exists. Deleting...";
  rm -rf ${BUILD_DIRECTORY}
fi

#Where to output the results of the build
TARGET_DIRECTORY_NAME=${TARGET_DIRECTORY_NAME:-target}
TARGET_DIRECTORY=${PWD}/${TARGET_DIRECTORY_NAME}
if [ -d ${TARGET_DIRECTORY} ]; then
  echo "[BUILD] TARGET directory ${TARGET_DIRECTORY} already exists. Deleting...";
  rm -rf ${TARGET_DIRECTORY}
fi

LOGFILE_NAME=build.log
LOGFILE=${BUILD_DIRECTORY}/${LOGFILE_NAME}

#By default output is redirected to /dev/null
#Verbose option outputs to stdout
VERBOSE_OUTPUT_STREAM=${VERBOSE_OUTPUT_STREAM:-"/dev/null"}


echo "[BUILD] Building Monkey in ${BUILD_DIRECTORY}"
mkdir -p "${BUILD_DIRECTORY}"

echo "[BUILD] Downloading ZeroConf Script http://get.pharo.org/60+vm"
run_script "wget -O ${BUILD_DIRECTORY}/download.sh http://get.pharo.org/60+vm"

echo "[BUILD] Downloading Pharo"
cd ${BUILD_DIRECTORY}
run_script "bash download.sh"
cd ${PWD}

echo "[BUILD] Installing Monkey"
run_script ""${BUILD_DIRECTORY}/pharo" "${BUILD_DIRECTORY}/Pharo.image" eval --save Metacello new baseline: 'CI'; repository: 'filetree://${DIR}/../src'; load: #Basic."

echo "[BUILD] Copying Results to "${TARGET_DIRECTORY}""
mkdir -p "${TARGET_DIRECTORY}"
cp -a "${BUILD_DIRECTORY}/Pharo.image" "${BUILD_DIRECTORY}/Pharo.changes" "${BUILD_DIRECTORY}/pharo" "${BUILD_DIRECTORY}/pharo-ui" "${BUILD_DIRECTORY}/pharo-vm" "${TARGET_DIRECTORY}"
if [ -d "${DIR}/wrappers" ]; then
  echo "[BUILD] Deploy Wrapper Scripts"
  cp -a "${DIR}/wrappers/." "${BUILD_DIRECTORY}"
fi
echo "[BUILD] DONE"
