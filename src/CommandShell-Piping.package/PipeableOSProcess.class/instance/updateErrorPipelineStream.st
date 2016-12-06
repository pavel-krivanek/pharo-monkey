event handling
updateErrorPipelineStream
	"Ensure that all available error output is placed into errorPipelineStream."

	| p |
	(p := self pipeFromError) ifNotNil: [ | s |
		s := p upToEnd. "must be outside the critical block, race condition on #update:"
		accessProtect critical: [errorPipelineStream nextPutAll: s]]

