implementations
snapshotCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Save the image"

	| s |
	Smalltalk at: #WorldState ifPresent:
		[:ws |
		s := Semaphore new.
		commandShell safeToExit: false.
		stdout nextPutAll: self imageName; nextPut: Character lf.
		ws addDeferredUIMessage:
			[self snapshot: true andQuit: false.
			s ifNotNil: [s signal] "s is nil when resuming after snapshot"].
		s ifNotNil: [s wait]]
