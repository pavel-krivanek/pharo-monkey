#VM_PATH="$WORKSPACE/pharo"
VM_PATH="pharo"
MONKEY_IMAGE_NAME=Pharo-60329
TESTS_IMAGE_NAME=tests
ISSUE=19466

PHARO_VERSION=60

CHECK_RESULT=true

unzip -o 60329.zip
#wget -O - http://get.pharo.org/${PHARO_VERSION} | bash

${VM_PATH} "$MONKEY_IMAGE_NAME" st ./pharo-monkey/scripts/loadCI.st --save --quit

cp "$MONKEY_IMAGE_NAME.image" "$TESTS_IMAGE_NAME.image"
cp "$MONKEY_IMAGE_NAME.changes" "$TESTS_IMAGE_NAME.changes"

${VM_PATH} "$TESTS_IMAGE_NAME" ci issue fetch  --html  --stepName="Issue fetching and locking" --reportFile="fetch" --issue=$ISSUE > fetchResult.txt 
#--lock
 
if (($? > 0)); then
    echo "error during issue fetching!"
    exit 1
fi

ISSUE=$( grep "issue fetched" fetchResult.txt | cut -d':' -f2)
if [ -z "$ISSUE" ]; then 
  echo "No issue found"
  exit 0
fi

${VM_PATH} "$TESTS_IMAGE_NAME" ci issue load --html --stepName="Issue loading" --reportFile="load" --issue=$ISSUE --save
if (($? > 0)); then
  echo "Issue loading error"
  CHECK_RESULT="false"
fi

${VM_PATH} "$TESTS_IMAGE_NAME" eval "Smalltalk saveImageInNewContext. Processor terminateActive"
if (($? > 0)); then
  echo "Issue loading error during monkey unloading"
  CHECK_RESULT="false"
fi


${VM_PATH} "$TESTS_IMAGE_NAME" st ./pharo-monkey/scripts/unloadCI.st --save --quit
if (($? > 0)); then
  echo "Issue loading error during monkey unloading"
  CHECK_RESULT="false"
fi

${VM_PATH} "$TESTS_IMAGE_NAME" clean --release


if [ $CHECK_RESULT == "true" ]; then
  exclude="^(?!Metacello)"
  #${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[A-L].*"
  #${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output "$exclude[M-Z].*"
  rm -rf ReleaseTests-* 
  ${VM_PATH} "$TESTS_IMAGE_NAME.image" test --junit-xml-output ReleaseTests

 ${VM_PATH} "$MONKEY_IMAGE_NAME" ci checkTestResults --html --stepName="SUnit tests" --reportFile="sunit" --issue=$ISSUE  --directory="./"
  if (($? > 0)); then
    CHECK_RESULT="false"
  fi
fi



${VM_PATH} "$MONKEY_IMAGE_NAME" ci joinReports --success="$CHECK_RESULT" --html --stepName="Overall result" --reportFile="report" --issue=$ISSUE  fetch.html load.html sunit.html 
#--update-issue
