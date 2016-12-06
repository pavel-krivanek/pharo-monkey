command pipelines
| anotherCommandString
	"Pipe my output to another external process, where the other external process
	executes anotherCommandString."

	"(PipeableOSProcess command: 'ps') | 'grep squeak' | 'cut -c16-100'"

	self setKeepInitialStdOutOpen.
	self setBlockingOutput.
	^ self species
			command: anotherCommandString
			pipeFrom: pipeFromOutput reader
			errorPipelineStream: self errorPipelineStream
