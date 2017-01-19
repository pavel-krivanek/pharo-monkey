#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")"

TEMP_NAME=tmp
TEMP=${DIR}/${TEMP_NAME}
OUTPUT=${PWD}/output/
mkdir -p ${TEMP}
mkdir -p ${OUTPUT}

clean() {
  rm -rf "${OUTPUT}"
  if test "$(ls -A "${TEMP}")"; then
    #If TEMP is empty, we copy all its contents to OUTPUT
    cp -a "${TEMP}/." "$OUTPUT"
  fi
  rm -rf "${TEMP}"
  if [ -f "$DIR/PharoDebug.log" ]; then
    cat "$DIR/PharoDebug.log" >> "$OUTPUT/PharoDebug.log"
    rm  "$DIR/PharoDebug.log"
  fi
}
trap clean 0 1 INT #INT stands for Ctrl-C

while getopts ":i:lu:p:v" opt; do
    case "${opt}" in
    v  ) VERBOSE_OUTPUT_STREAM="/dev/stdout";;
    \? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
    :  ) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
    *  ) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
    esac
done
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

#By default output is redirected to /dev/null
#Verbose option outputs to stdout
VERBOSE_OUTPUT_STREAM=${VERBOSE_OUTPUT_STREAM:-"/dev/null"}

echo "[DOWNLOAD_LATEST_BOOTSTRAP] Downloading latest bootstrap files from CI: ${TEMP}/bootstrap.zip https://ci.inria.fr/pharo/view/Pharo%20bootstrap/job/60-Bootstrap-32bit-Minimal-GIT/lastSuccessfulBuild/artifact/*zip*/archive.zip"
wget -O ${TEMP}/bootstrap.zip https://ci.inria.fr/pharo/view/Pharo%20bootstrap/job/60-Bootstrap-32bit-Minimal-GIT/lastSuccessfulBuild/artifact/*zip*/archive.zip  &> ${VERBOSE_OUTPUT_STREAM}

COMMITISH=`unzip -p ${TEMP}/bootstrap.zip "archive/pharo-core/tag.txt"`
VERSION=$(echo ${COMMITISH} | cut -c2-6)
echo "[DOWNLOAD_LATEST_BOOTSTRAP] Downloaded version $VERSION"

echo "[DOWNLOAD_LATEST_BOOTSTRAP] Restoring bootstrap-cache"
mkdir -p ${TEMP}/pharo-core
unzip -p ${TEMP}/bootstrap.zip "archive/pharo-core/bootstrap-cache.zip" > "${TEMP}/pharo-core/bootstrap-cache.zip"
unzip -o ${TEMP}/pharo-core/bootstrap-cache.zip -d ${TEMP}/pharo-core &> ${VERBOSE_OUTPUT_STREAM}

if (($? > 0)); then
  echo "[DOWNLOAD_LATEST_BOOTSTRAP] Error while downloading latest bootstrap"
  exit 1
else
  echo "[DOWNLOAD_LATEST_BOOTSTRAP] DONE"
fi
