command line parsing
tryEvaluatingAsSmalltalk: aCommandString
	"Attempt to treat aCommandString as a Smalltalk expression running in an
	evaluation process. Evaluate the proxy and set exit status to reflect failure
	on either the expression compilation or the runtime evaluation. Answer the
	process proxy."

	"CommandShell new tryEvaluatingAsSmalltalk: 'this expression should fail in the compiler'"
	"CommandShell new tryEvaluatingAsSmalltalk: '#this expressionShouldFailInRuntimeEvaluation'"
	"CommandShell new tryEvaluatingAsSmalltalk: '#thisIsAValidSymbolExpression'"
	"CommandShell new tryEvaluatingAsSmalltalk: 'Smalltalk'"
	"CommandShell new tryEvaluatingAsSmalltalk: '#oneWordCommentShouldFail'"

	| process |
	process := self evaluationProxyFor: aCommandString input: nil output: nil error: nil.
	process value.
	process closeErrorPipeline. "Last process in pipeline, so it can be closed."
	^ process