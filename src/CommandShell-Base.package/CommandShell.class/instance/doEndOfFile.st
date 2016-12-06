input character filtering
doEndOfFile
	"EOF character detected, close stdin to pipeline."

	| pipelineInput |
	(pipelineInput := self keyboardConnector)
		ifNotNil: [pipelineInput closeWriter]
