command pipelines
errorPipeForNextProxy

	^ self errorHasBeenRedirected
		ifTrue: [nil]
		ifFalse: [self errorPipelineStream]
