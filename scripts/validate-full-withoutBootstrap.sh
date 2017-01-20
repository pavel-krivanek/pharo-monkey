#!/bin/bash
DIR="$(dirname "$(readlink -f "$0")")"

# Perform the tests of an issue with standard slice/configuraiton loading using Monticello
# Arguments:
#   - issue id (or "next" for the next issue ready for validation)
#   - Pharo version number
# Examples:
#   bash validate-simple.sh next 60
#   bash validate-simple.sh 19488 60

VM_PATH="$PWD/pharo"
MONKEY_IMAGE_NAME=Pharo
TESTS_IMAGE_NAME=tests
ISSUE=$1

PHARO_VERSION=$2

CHECK_RESULT=true
RESULT_MESSAGE="" # error message for overall result

. ${DIR}/build.sh
exit 1
if (($? > 0)); then
    exit 1
fi

sh ${DIR}/wrappers/fetch.sh -i $ISSUE > /dev/null
if (($? > 0)); then
    echo "error during issue fetching!"
    exit 1
fi

if [ $CHECK_RESULT == "true" ]; then
  sh ${DIR}/wrappers/export_slice.sh -i $ISSUE > /dev/null
  if (($? > 0)); then
    RESULT_MESSAGE="Exporting issue changes failed"
    CHECK_RESULT="false"
  fi
fi
if [ $CHECK_RESULT == "true" ]; then
  sh ${DIR}/wrappers/download_latest_bootstrap.sh -i $ISSUE > /dev/null
  BOOTSTRAP_ARCH=32 bash ./bootstrap/scripts/build.sh
  if (($? > 0)); then
    RESULT_MESSAGE="Pharo reloading failed"
    CHECK_RESULT="false"
  fi
fi


if [ $CHECK_RESULT == "true" ]; then
  cd ..
  cp ./pharo-core/bootstrap-cache/Pharo.image "$TESTS_IMAGE_NAME.image"
  cp ./pharo-core/bootstrap-cache/Pharo.changes "$TESTS_IMAGE_NAME.changes"

  # run all tests
  exclude="^(?!Metacello)"
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[A-L].*"
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[M-Z].*"
  rm -rf ReleaseTests-*
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output ReleaseTests

  # load patch with whitelisted tests
  ${VM_PATH} "$MONKEY_IMAGE_NAME" st ./pharo-monkey/scripts/ignore-full-withoutBootstrap.st --save --quit

  # generate HTML report from test results obtained in form of XML
  ${VM_PATH} "$MONKEY_IMAGE_NAME" ci checkTestResults --html --stepName="SUnit tests" --reportFile="sunit" --issue=$ISSUE  --directory="./"
  if (($? > 0)); then
    RESULT_MESSAGE="SUnit tests failed"
    CHECK_RESULT="false"
  fi
fi

# join and publish information about particular steps
${VM_PATH} "$MONKEY_IMAGE_NAME" ci joinReports \
  --success="$CHECK_RESULT" \
  --resultMessage="$RESULT_MESSAGE" \
  --html --stepName="Overall result" \
  --reportFile="report" \
  --issue=$ISSUE \
  --html-resources="https://ci.inria.fr/pharo/view/6.0-Analysis/job/Pharo-6.0-Issue-Tracker-Image/ws/bootstrap/" \
  fetch.html \
  export.html \
  sunit.html

#  --update-issue \

exit 0
