command pipelines - private
prepareOutputForInternalReader
	"Output stream will be used directly by a Smalltalk process. Set output stream
	characteristics accordingly."

	| err |
	super prepareOutputForInternalReader.
	self setKeepInitialStdOutOpen.
	(err := self pipeFromError) ifNotNil: [err setNonBlocking]
