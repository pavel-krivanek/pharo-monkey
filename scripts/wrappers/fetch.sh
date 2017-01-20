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
  exit $?
}
trap clean 0 1 INT #INT stands for Ctrl-C

while getopts ":i:lu:p:v" opt; do
    case "${opt}" in
    i  ) ISSUE=${OPTARG};;
    l  ) LOCK=1;;
    u  ) PHARO_CI_USER=${OPTARG};;
    p  ) PHARO_CI_PWD=${OPTARG};;
    v  ) VERBOSE_OUTPUT_STREAM="/dev/stdout";;
    \? ) echo "Unknown option: -$OPTARG" >&2; exit 1;;
    :  ) echo "Missing option argument for -$OPTARG" >&2; exit 1;;
    *  ) echo "Unimplemented option: -$OPTARG" >&2; exit 1;;
    esac
done
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

if [ -z ${ISSUE} ]; then
  echo "Issue number is required. Please specify the issue number in -i option.";
  exit 1;
fi

if [[ -z ${PHARO_CI_USER} || -z ${PHARO_CI_PWD} ]]; then
  echo "Issue tracker username and password are required."
  echo "Please specify username and password using -u and -p or set environment variables PHARO_CI_USER and PHARO_CI_PWD.";
  exit 1;
fi

#By default output is redirected to /dev/null
#Verbose option outputs to stdout
VERBOSE_OUTPUT_STREAM=${VERBOSE_OUTPUT_STREAM:-"/dev/null"}

echo "[FETCH] Fetching issue ${ISSUE}"

OPTIONS="--html --stepName=\"Issue fetching and locking\" --reportFile=${TEMP_NAME}/fetch --issue=${ISSUE}"
if [ ! -z ${LOCK} ]; then
  echo "Lock specified. Will lock ${ISSUE}"
  OPTIONS+=" --lock"
fi


PHARO_CI_USER=$PHARO_CI_USER PHARO_CI_PWD=$PHARO_CI_PWD ${DIR}/pharo ${DIR}/Pharo.image ci issue fetch ${OPTIONS} 2>&1 ${VERBOSE_OUTPUT_STREAM}

if (($? > 0)); then
  echo "[FETCH] Error while fetching issue"
  exit 1
else
  echo "[FETCH] Fetched Issue https://pharo.fogbugz.com/f/cases/$ISSUE"
fi
