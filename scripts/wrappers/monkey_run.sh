#!/bin/bash
PWD=`pwd`
DIR="$(dirname "$(readlink -f "$0")")"
MONKEY_BUILD_DIRECTORY=${PWD}/monkey_build

function monkey_get_build_directory {
  local STEP_NAME=$1
  local STEP_DIRECTORY=${MONKEY_BUILD_DIRECTORY}/${STEP_NAME}
  local BUILD_DIRECTORY_NAME=${BUILD_DIRECTORY_NAME:-build}
  local BUILD_DIRECTORY=${STEP_DIRECTORY}/${BUILD_DIRECTORY_NAME}
  echo ${BUILD_DIRECTORY}
}

function monkey_get_target_directory {
  local STEP_NAME=$1
  local STEP_DIRECTORY=${MONKEY_BUILD_DIRECTORY}/${STEP_NAME}
  local TARGET_DIRECTORY_NAME=${TARGET_DIRECTORY_NAME:-target}
  local TARGET_DIRECTORY=${STEP_DIRECTORY}/${TARGET_DIRECTORY_NAME}
  echo ${TARGET_DIRECTORY}
}

function monkey_setup_step {
  local STEP_NAME=$1
  local STEP_DIRECTORY=${PWD}/${STEP_NAME}

  local BUILD_DIRECTORY=$(monkey_get_build_directory ${STEP_NAME})
  if [ -d ${BUILD_DIRECTORY} ]; then
    echo "[${STEP_NAME}] BUILD directory ${BUILD_DIRECTORY} already exists. Deleting...";
    rm -rf ${BUILD_DIRECTORY}
  fi

  local TARGET_DIRECTORY=$(monkey_get_target_directory ${STEP_NAME})
  if [ -d ${TARGET_DIRECTORY} ]; then
    echo "[$STEP_NAME] TARGET directory ${TARGET_DIRECTORY} already exists. Deleting...";
    rm -rf ${TARGET_DIRECTORY}
  fi


  #By default output is redirected to /dev/null
  #Verbose option outputs to stdout
  VERBOSE_OUTPUT_STREAM=${VERBOSE_OUTPUT_STREAM:-"/dev/null"}
  mkdir -p "${BUILD_DIRECTORY}"
}

monkey_run(){
  local STEP_NAME="${1}"
  local SCRIPT="${@:2}"
  local exit_status=0

  monkey_setup_step ${STEP_NAME}
  local BUILD_DIRECTORY=$(monkey_get_build_directory ${STEP_NAME})
  cd "${BUILD_DIRECTORY}"

  LOGFILE_NAME=${LOGFILE_NAME:-"build.log"}
  LOGFILE=${BUILD_DIRECTORY}/${LOGFILE_NAME}

  touch ${LOGFILE}
  echo "$ ${SCRIPT}" | tee -a ${LOGFILE} > ${VERBOSE_OUTPUT_STREAM}
  ${SCRIPT} 2>&1 | tee -a ${LOGFILE} > ${VERBOSE_OUTPUT_STREAM} ; exit_status=${PIPESTATUS[0]}

  if [ ${exit_status} -ne 0 ]; then
      echo "[${STEP_NAME}] Error in script. Check ${LOGFILE} for more information"
      exit 1
  fi
}

if [ "${1}" != "--include" ]; then

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

  monkey_run ${1} ${@:2}
fi
