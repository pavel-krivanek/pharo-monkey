process proxy creation
doItProxyFor: aCommandString input: in output: out error: err
	"Answer a PipeableEvaluator on a doIt command, or nil."

	"CommandShell new doItProxyFor: '#thisIsADoIt ! ' input: nil output: nil error: nil"

	^ (self shellSyntax isDoItCommand: aCommandString)
		ifTrue: [self evaluationProxyFor: (self shellSyntax doItStringFrom: aCommandString)
					input: in
					output: out
					error: err]
