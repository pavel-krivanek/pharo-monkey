external command processing
command: aCommandString pipeFrom: aPipeStream errorPipelineStream: anErrorStream
	"Run a command in a shell process. Similar to the system(3) call in the standard C library,
	except that aCommandString runs asynchronously in a child process."

	^ self
		command: aCommandString
		environment: nil
		workingDir: nil
		input: aPipeStream
		output: nil
		error: nil
		errorPipelineStream: anErrorStream