command pipelines - private
addToErrorPipeline: aString

	(aString isNil or: [aString isEmpty])
		ifFalse: [self errorPipelineStream nextPutAll: aString]