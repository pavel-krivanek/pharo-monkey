instance creation
command: aShellBuiltin withArguments: argumentArray shell: commandShell pipeFrom: inputStream pipeTo: outputStream errorPipelineStream: errorStream

	^ super new
		shellBuiltin: aShellBuiltin;
		argumentArray: argumentArray;
		commandShell: commandShell;
		pipeToInput: inputStream;
		pipeFromOutput: outputStream;
		errorPipelineStream: errorStream;
		initialize