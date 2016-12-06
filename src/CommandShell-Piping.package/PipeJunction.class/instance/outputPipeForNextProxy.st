command pipelines
outputPipeForNextProxy

	^ self canProvideOutputPipe
		ifTrue: [pipeFromOutput]
		ifFalse: [nil]
