accessing
pipeToInput
	"The input to the first proxy in the pipeline, if any"

	self isEmpty
		ifTrue: [^ nil]
		ifFalse: [^ self first pipeToInput]