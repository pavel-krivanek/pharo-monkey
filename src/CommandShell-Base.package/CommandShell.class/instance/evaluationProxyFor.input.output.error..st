process proxy creation
evaluationProxyFor: aCommandString input: in output: out error: err
	"Answer a PipeableEvaluator on a doIt command, or nil."

	"CommandShell new evaluationProxyFor: 'Smalltalk' input: nil output: nil error: nil"
	"CommandShell new evaluationProxyFor: 'BOGUS' input: nil output: nil error: nil"

	| proxy |
	proxy := ExpressionEvaluator
				command: aCommandString
				pipeFrom: in
				pipeTo: out
				errorPipelineStream: err.
	^ proxy
