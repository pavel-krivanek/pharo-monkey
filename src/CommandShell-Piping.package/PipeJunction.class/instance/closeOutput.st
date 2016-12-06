initialize - release
closeOutput

	self pipeFromOutput ifNotNil: [pipeFromOutput close]
