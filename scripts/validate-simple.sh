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

# create image copy for issue loading and testing
cp "$MONKEY_IMAGE_NAME.image" "$TESTS_IMAGE_NAME.image"
cp "$MONKEY_IMAGE_NAME.changes" "$TESTS_IMAGE_NAME.changes"

# fetch and lock issue
# DELTE ME
# --lock
${VM_PATH} "$TESTS_IMAGE_NAME" ci issue fetch  --html  --stepName="Issue fetching and locking" --reportFile="fetch" --issue=$ISSUE > fetchResult.txt 

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

  # load issue slice/configuration
  ${VM_PATH} "$TESTS_IMAGE_NAME" ci issue load --html --stepName="Issue loading" --reportFile="load" --issue=$ISSUE --save
  if (($? > 0)); then
    RESULT_MESSAGE="Issue loading failed"
    CHECK_RESULT="false"
  fi

  # save image in the new context to allow clean Monkey unloading
  ${VM_PATH} "$TESTS_IMAGE_NAME" eval "Smalltalk saveImageInNewContext. Processor terminateActive"
  if (($? > 0)); then
    RESULT_MESSAGE="Monkey unloading failed"
    CHECK_RESULT="false"
  fi

  # unload the Monkey
  ${VM_PATH} "$TESTS_IMAGE_NAME" st ./pharo-monkey/scripts/unloadCI.st --save --quit
  if (($? > 0)); then
    RESULT_MESSAGE="Monkey unloading failed"
    CHECK_RESULT="false"
  fi

  # clean image
  ${VM_PATH} "$TESTS_IMAGE_NAME" clean --release
fi

if [ $CHECK_RESULT == "true" ]; then
  # run all tests
  exclude="^(?!Metacello)"
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[A-L].*"
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[M-Z].*"
  rm -rf ReleaseTests-* 
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output ReleaseTests

  # load patch with whitelisted tests
  ${VM_PATH} "$MONKEY_IMAGE_NAME" st ./pharo-monkey/scripts/ignore-simple.st --save --quit
 
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
  load.html \
  sunit.html 

# DELETE ME
#   --update-issue \

exit 0
