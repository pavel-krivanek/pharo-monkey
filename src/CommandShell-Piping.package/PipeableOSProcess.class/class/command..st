external command processing
command: aString

	"(PipeableOSProcess command: '/bin/echo this is a test') output"
	"(PipeableOSProcess command: 'echo this is a test') output"
	"(PipeableOSProcess command: '/bin/noSuchCommand this is a test') output"
	"(PipeableOSProcess command: 'ls -l Sq*log') output"
	"(PipeableOSProcess command: 'ls -l ?q*log') output"
	"(PipeableOSProcess command: '/bogusDirectory/ls -l Sq*log') output"

	^ self command: aString
		environment: nil
		workingDir: nil
		input: nil
		output: nil
		error: nil
		errorPipelineStream: nil