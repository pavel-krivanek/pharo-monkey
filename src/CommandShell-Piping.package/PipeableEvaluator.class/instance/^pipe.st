command pipelines
| anotherCommandString
	"Pipe my output to another evaluator, where the other evaluator evaluates
	anotherCommandString."

	"((ExpressionEvaluator command: 'Smalltalk')
		| 'stdout nextPutAll: stdin upToEnd'
		| 'stdout nextPutAll: stdin upToEnd') upToEnd"

	"(ExpressionEvaluator command: 'BOGUS')
		| 'stdout nextPutAll: stdin upToEnd'
		| 'stdout nextPutAll: stdin upToEnd'"

	"((ExpressionEvaluator command: '(true == false) not')
		| 'stdout nextPutAll: stdin upToEnd'
		| 'stdout nextPutAll: stdin upToEnd') upToEnd"

	| new |
	new := self species
			command: anotherCommandString
			pipeFrom: self pipeFromOutput
			errorPipelineStream: self errorPipelineStream.
	self value.
	^ new
