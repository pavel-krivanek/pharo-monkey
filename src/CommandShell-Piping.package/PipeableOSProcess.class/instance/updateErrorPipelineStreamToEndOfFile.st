event handling
updateErrorPipelineStreamToEndOfFile
	"Move all error output up to end of file to the errorPipelineStream."

	| p |
	(p := self pipeFromError) ifNotNil: [ | s |
		s := p upToEndOfFile. "must be outside the critical block, race condition on #update:"
		accessProtect critical: [errorPipelineStream nextPutAll: s].
		p close]
