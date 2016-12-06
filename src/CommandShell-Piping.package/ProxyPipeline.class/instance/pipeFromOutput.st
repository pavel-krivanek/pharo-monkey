accessing
pipeFromOutput
	"The output from the last proxy in the pipeline, if any"

	self isEmpty
		ifTrue: [^ nil]
		ifFalse: [^ self last pipeFromOutput]