implementations
ttyExitCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Exit an ExternalCommandShell by quitting Squeak. The image is not saved and the shutdown
	list is not processed."

	commandShell safeToExit
		ifTrue: [Smalltalk quitPrimitive]
		ifFalse: [stderr nextPutAll: 'cannot exit in same command line with snapshot'; nextPut: Character lf]
