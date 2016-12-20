VM_PATH="$PWD/pharo"
MONKEY_IMAGE_NAME=Pharo.image
TESTED_IMAGE_NAME=Pharo
INPUT_IMAGE_NAME=bootstrap
ISSUE=19466

EXPORTER=exporter
EXPORTER_VERSION=60

git clone https://github.com/pavel-krivanek/pharo-monkey.git

wget -O - http://get.pharo.org/60 | bash

${VM_PATH} "$MONKEY_IMAGE_NAME" st ./pharo-monkey/scripts/loadCI.st --save --quit

${VM_PATH} "$MONKEY_IMAGE_NAME" ci slice fetchAndLock --issue=$ISSUE > fetchResult.txt
 
if (($? > 0)); then
    echo "Internal error during issue fetching!"
    exit 1
fi

ISSUE=$( grep "issue locked" fetchResult.txt | cut -d':' -f2)
if [ -z "$ISSUE" ]; then 
  echo "No issue found"
  exit 0
fi

rm -rf ./workspace
mkdir workspace
cd workspace 

wget -O - get.pharo.org/${EXPORTER_VERSION} | bash
mv Pharo.image "$EXPORTER.image"
mv Pharo.changes "$EXPORTER.changes"

git clone https://github.com/pharo-project/pharo-minimal-scripts.git

git clone https://github.com/guillep/pharo-core.git

wget https://ci.inria.fr/pharo/view/Pharo%20bootstrap/job/60-Bootstrap-32bit-Minimal-GIT/lastSuccessfulBuild/artifact/*zip*/archive.zip
unzip -p archive.zip "archive/pharo-core/$INPUT_IMAGE_NAME.image" > "$INPUT_IMAGE_NAME.image"
unzip -p archive.zip "archive/pharo-core/tag.txt" > tag.txt
mv "$INPUT_IMAGE_NAME.image" "$TESTED_IMAGE_NAME.image"

bash ./pharo-minimal-scripts/6.0/scripts/determineVersion.sh tag.txt > version.txt
cd pharo-core
git checkout "tags/v$(cut -f1 ../version.txt)"
cd .. 

cd ..

echo "Exporting issue..."

${VM_PATH} "$MONKEY_IMAGE_NAME" ci slice export --issue="$ISSUE" --directory="./workspace/pharo-core/src" --reportFile="issue.ston".
if (($? > 1)); then
    echo "Internal error during processing of reports!"; 
fi

cd ./workspace/pharo-core 
git add *
git diff HEAD > ../../issue.diff
cd ..


echo "downloading bootstrap.image..."

mkdir kernelPackages
mkdir mcPackages
mkdir metacelloPackages

echo "exporting packages..."

${VM_PATH} "$EXPORTER.image" st ./pharo-minimal-scripts/6.0/bootstrap-initialization/exportKernelPackagesFromGit.st --quit
${VM_PATH} "$EXPORTER.image" st ./pharo-minimal-scripts/6.0/bootstrap-initialization/exportProtocols.st --quit

# local Monticello
${VM_PATH} "$EXPORTER.image" st ./pharo-minimal-scripts/6.0/localMonticello/exportLocalMonticelloFromGit.st --quit
${VM_PATH} "$EXPORTER.image" st ./pharo-minimal-scripts/6.0/localMonticello/exportLocalMonticelloPackagesFromGit.st --quit
${VM_PATH} "$EXPORTER.image" st ./pharo-minimal-scripts/6.0/bootstrap-initialization/exportKernelPackagesFromGit.st --quit

# Monticelo
${VM_PATH} "$EXPORTER.image" st ./pharo-minimal-scripts/6.0/monticello/exportNonlocalRepositoriesSupportFromGit.st --quit

# Metacello
${VM_PATH} "$EXPORTER.image" st ./pharo-minimal-scripts/6.0/minimal-loaded/exportMetacelloFromGit.st --quit

# fonts
unzip -o "./pharo-minimal-scripts/6.0/fonts/BitmapDejaVuSans.fuel.zip"

# icons
mkdir icon-packs
cd icon-packs
wget http://github.com/pharo-project/pharo-icon-packs/archive/idea11.zip
cd ..

# baselines
cp -R ./pharo-minimal-scripts/6.0/baselines/* ./pharo-core/src/

rm -rf ./pharo-local

${VM_PATH} "$TESTED_IMAGE_NAME.image" st ./pharo-minimal-scripts/6.0/bootstrap-initialization/init.st --save --quit
${VM_PATH} "$TESTED_IMAGE_NAME.image" st ./pharo-minimal-scripts/6.0/bootstrap-initialization/initRPackageOrganizer.st --save --quit

${VM_PATH} "$TESTED_IMAGE_NAME.image" eval --save "| updateString | updateString := 'version.txt' asFileReference readStream contents. SystemVersion classPool at: #Current put: (SystemVersion new type: 'Pharo'; major: updateString first asString asInteger; minor: updateString second asString asInteger; highestUpdate: updateString asInteger; suffix: ''; yourself)"

${VM_PATH} "$TESTED_IMAGE_NAME.image" st Monticello.st --save --quit
${VM_PATH} "$TESTED_IMAGE_NAME.image" st ./pharo-minimal-scripts/6.0/localMonticello/fixLocalMonticello.st --save --quit
${VM_PATH} "$TESTED_IMAGE_NAME.image" st ./pharo-minimal-scripts/6.0/localMonticello/loadMonticello.st --save --quit

${VM_PATH} "$TESTED_IMAGE_NAME.image" --no-default-preferences st ./pharo-minimal-scripts/6.0/monticello/loadMonticello.st --save --quit

${VM_PATH} "$TESTED_IMAGE_NAME.image" --no-default-preferences st ./pharo-minimal-scripts/6.0/minimal-loaded/loadMetacello.st --save --quit

${VM_PATH} "$TESTED_IMAGE_NAME.image" --no-default-preferences eval --save "Metacello new baseline: 'IDE'; repository: 'filetree://./pharo-core/src'; load."

${VM_PATH} "$TESTED_IMAGE_NAME.image" --no-default-preferences st ./pharo-minimal-scripts/6.0/ide/fixCorruptedPackagesFromGit.st --save --quit 2> packagesWithWrongVersions.txt
${VM_PATH} "$TESTED_IMAGE_NAME.image" --no-default-preferences clean --release


${VM_PATH} "$TESTED_IMAGE_NAME.image" eval --save "MCCacheRepository reset."

exclude="^(?!Metacello)"
${VM_PATH} "$TESTED_IMAGE_NAME.image" test --junit-xml-output "$exclude[A-L].*"
${VM_PATH} "$TESTED_IMAGE_NAME.image" test --junit-xml-output "$exclude[M-Z].*"
rm -rf ReleaseTests-* 
${VM_PATH} "$TESTED_IMAGE_NAME.image" test --junit-xml-output ReleaseTests

cd ..

CHECK_RESULT=true

${VM_PATH} "$MONKEY_IMAGE_NAME" ci checkTestResults \
  --issue="$ISSUE" \
  --directory="./workspace" \
  --reportFile="fullTests" \
  --stepName="Step: Full image tests"
  
if (($? > 0)); then
  CHECK_RESULT="false"
else
  CHECK_RESULT="true"
fi

${VM_PATH} "$MONKEY_IMAGE_NAME" ci joinReports \
  --issue="$ISSUE" \
  --reportFile="report" \
  --success="$CHECK_RESULT" \
  --html-resources="https://ci.inria.fr/pharo/view/6.0-Analysis/job/Pharo-6.0-Issue-Tracker-Image/ws/bootstrap/" \
  fullTests.html
  
 
if (($? > 1)); then
    echo "Internal error during processing of reports!"; 
fi    
    
${VM_PATH} "$MONKEY_IMAGE_NAME" ci publishResult \
  --issue="$ISSUE" \
  --reportFile="report.html" \
  --success="$CHECK_RESULT" \
  --html-resources="https://ci.inria.fr/pharo/view/6.0-Analysis/job/Pharo-6.0-Issue-Tracker-Image/ws/bootstrap/" \
  report.html  