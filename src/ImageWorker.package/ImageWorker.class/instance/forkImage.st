private
forkImage
	self updateSession.
	"Trying to avoid running any commandline handlers when running the forked image"
	Smalltalk backupTo: self baseFile fullName.
	NonInteractiveTranscript allInstancesDo: [ :each | each initializeStream ].