external command processing
command: aString environment: anEnvironmentDictionary

	"| env path |
	env := OSProcess thisOSProcess environment copy.
	path := (env at: #PATH), ':/opt/local/bin/'.
	env at: #PATH put: path.
	(PipeableOSProcess command: 'echo $PATH' environment: env) output"

	^ self command: aString
		environment: anEnvironmentDictionary
		workingDir: nil
		input: nil
		output: nil
		error: nil
		errorPipelineStream: nil
