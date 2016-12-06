command pipelines - private
prepareOutputForPipe
	"Output stream will be used by another process proxy as input. Set output stream
	characteristics accordingly. The output stream will be owned by the next process
	in a pipeline, but the error stream is shared by all processes in the pipeline, and
	can be event driven."

	Smalltalk
		at: #AioEventHandler
		ifPresent: [:aio | aio aioPluginPresent
				ifTrue: [self enableErrorStreamTriggers]]