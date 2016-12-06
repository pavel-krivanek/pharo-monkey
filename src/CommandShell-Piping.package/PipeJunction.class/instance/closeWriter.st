initialize - release
closeWriter
	"No further input expected"

	(self pipeToInput notNil and: [pipeToInput isPipe])
		ifTrue: [pipeToInput closeWriter]
