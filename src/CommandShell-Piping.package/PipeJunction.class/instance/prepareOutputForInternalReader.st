command pipelines - private
prepareOutputForInternalReader
	"Output stream will be used directly by a Smalltalk process. Set output 
	stream characteristics accordingly."

	self canProvideOutputPipe
		ifTrue: [pipeFromOutput setNonBlocking].
	self enableEventTriggers