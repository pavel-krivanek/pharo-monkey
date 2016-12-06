initialize - release
closeOutput

	| p |
	(p := self pipeFromOutput)
		ifNotNil: [p removeDependent: self; close]
