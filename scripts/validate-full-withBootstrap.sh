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

wget -O - http://get.pharo.org/${PHARO_VERSION} | bash

# load the Monkey
${VM_PATH} "$MONKEY_IMAGE_NAME" st ./pharo-monkey/scripts/loadCI.st --save --quit

if (($? > 0)); then
    echo "error during monkey loading!"
    exit 1
fi

# fetch and lock issue
# --lock
${VM_PATH} "$MONKEY_IMAGE_NAME" ci issue fetch  --html  --stepName="Issue fetching and locking" --reportFile="fetch" --issue=$ISSUE > fetchResult.txt 

if (($? > 0)); then
    echo "error during issue fetching!"
    exit 1
fi

# obtain issue id
ISSUE=$( grep "issue fetched" fetchResult.txt | cut -d':' -f2)
if [ -z "$ISSUE" ]; then 
  echo "No issue found"
  exit 0
fi

# print issue URL that will be set as the CI job description
echo "https://pharo.fogbugz.com/f/cases/$ISSUE"

if [ $CHECK_RESULT == "true" ]; then

  git clone https://github.com/guillep/pharo-core.git
#  cd pharo-core
#  git checkout "tags/$(cat ../tag.txt)"
#  cd ..

  ${VM_PATH} "$MONKEY_IMAGE_NAME" ci issue export --html --stepName="Exporting issue changes to Git working copy" --reportFile="export" --issue="$ISSUE" --directory="./pharo-core/src"
  if (($? > 0)); then
    RESULT_MESSAGE="Exporting issue changes failed"
    CHECK_RESULT="false"
  fi
fi

if [ $CHECK_RESULT == "true" ]; then

  cd pharo-core

  wget -O - http://get.pharo.org/${PHARO_VERSION}+vm | bash
  ./pharo Pharo.image ./bootstrap/scripts/prepare_image.st --save --quit
  if (($? > 0)); then
    RESULT_MESSAGE="Preparing of bootstrap environment failed"
    CHECK_RESULT="false"
  fi
fi

if [ $CHECK_RESULT == "true" ]; then
  ./pharo Pharo.image ./bootstrap/scripts/bootstrap.st --ARCH=32 --quit
  if (($? > 0)); then
    RESULT_MESSAGE="Bootstrapping failed"
    CHECK_RESULT="false"
  fi
fi

if [ $CHECK_RESULT == "true" ]; then
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

