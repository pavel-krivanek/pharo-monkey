evaluation
unRegisterBackgroundPipeline: aPipeline at: index

	(self backgroundPipelines at: index) == aPipeline
		ifTrue: [self backgroundPipelines at: index put: nil]
		ifFalse: [self error: 'inconsistent registry']
