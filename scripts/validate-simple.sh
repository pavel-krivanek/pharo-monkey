VM_PATH="$PWD/pharo"
VM_PATH="pharo"
MONKEY_IMAGE_NAME=Pharo
TESTS_IMAGE_NAME=tests
ISSUE=$1

PHARO_VERSION=$2

CHECK_RESULT=true
RESULT_MESSAGE=""

wget -O - http://get.pharo.org/${PHARO_VERSION} | bash

${VM_PATH} "$MONKEY_IMAGE_NAME" st ./pharo-monkey/scripts/loadCI.st --save --quit

if (($? > 0)); then
    echo "error during monkey loading!"
    exit 1
fi

cp "$MONKEY_IMAGE_NAME.image" "$TESTS_IMAGE_NAME.image"
cp "$MONKEY_IMAGE_NAME.changes" "$TESTS_IMAGE_NAME.changes"

${VM_PATH} "$TESTS_IMAGE_NAME" ci issue fetch  --html  --stepName="Issue fetching and locking" --reportFile="fetch" --issue=$ISSUE --lock > fetchResult.txt 

if (($? > 0)); then
    echo "error during issue fetching!"
    exit 1
fi

ISSUE=$( grep "issue fetched" fetchResult.txt | cut -d':' -f2)
if [ -z "$ISSUE" ]; then 
  echo "No issue found"
  exit 0
fi

if [ $CHECK_RESULT == "true" ]; then

  ${VM_PATH} "$TESTS_IMAGE_NAME" ci issue load --html --stepName="Issue loading" --reportFile="load" --issue=$ISSUE --save
  if (($? > 0)); then
    RESULT_MESSAGE="Issue loading failed"
    CHECK_RESULT="false"
  fi

  ${VM_PATH} "$TESTS_IMAGE_NAME" eval "Smalltalk saveImageInNewContext. Processor terminateActive"
  if (($? > 0)); then
    RESULT_MESSAGE="Monkey unloading failed"
    CHECK_RESULT="false"
  fi


  ${VM_PATH} "$TESTS_IMAGE_NAME" st ./pharo-monkey/scripts/unloadCI.st --save --quit
  if (($? > 0)); then
    RESULT_MESSAGE="Monkey unloading failed"
    CHECK_RESULT="false"
  fi

  ${VM_PATH} "$TESTS_IMAGE_NAME" clean --release
fi

if [ $CHECK_RESULT == "true" ]; then
  exclude="^(?!Metacello)"
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[A-L].*"
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[M-Z].*"
  rm -rf ReleaseTests-* 
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output ReleaseTests

  ${VM_PATH} "$MONKEY_IMAGE_NAME" st ./pharo-monkey/scripts/ignore-simple.st --save --quit
 
 ${VM_PATH} "$MONKEY_IMAGE_NAME" ci checkTestResults --html --stepName="SUnit tests" --reportFile="sunit" --issue=$ISSUE  --directory="./"
  if (($? > 0)); then
    RESULT_MESSAGE="SUnit tests failed"
    CHECK_RESULT="false"
  fi
fi


${VM_PATH} "$MONKEY_IMAGE_NAME" ci joinReports \
  --success="$CHECK_RESULT" \
  --resultMessage="$RESULT_MESSAGE" \
  --html --stepName="Overall result" \
  --reportFile="report" \
  --issue=$ISSUE \
  --html-resources="https://ci.inria.fr/pharo/view/6.0-Analysis/job/Pharo-6.0-Issue-Tracker-Image/ws/bootstrap/" \
  --update-issue \
  fetch.html \
  load.html \
  sunit.html 
#
exit 0