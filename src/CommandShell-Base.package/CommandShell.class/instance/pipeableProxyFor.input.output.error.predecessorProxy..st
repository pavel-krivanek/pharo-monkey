process proxy creation
pipeableProxyFor: aCommandString input: in output: out error: err predecessorProxy: lastProxy
	"Answer a proxy for an external OS process, or for an internal builtin command,
	or for an evaluation string. The proxy is suitable for use in a command pipeline,
	possibly mixing internal and external commands."

	"(CommandShell new pipeableProxyFor: '#''this is a doIt'' ! ' input: nil output: nil error: nil predecessorProxy: nil) value upToEnd"
	"(CommandShell new pipeableProxyFor: 'help' input: nil output: nil error: nil predecessorProxy: nil) value upToEnd"
	"(CommandShell new pipeableProxyFor: 'cat /etc/hosts' input: nil output: nil error: nil predecessorProxy: nil) value upToEnd"

	| errorPipelineStream cmd |
	errorPipelineStream := lastProxy ifNotNil: [lastProxy errorPipeForNextProxy].
	^ (((self doItProxyFor: aCommandString						"try entire line as a Smalltalk expression"
			input: in
			output: out
			error: (err ifNil: [errorPipelineStream]))
		ifNil: [self builtinCommandProxyFor: aCommandString	"is it a shell builtin?"
				input: in
				output: out
				error: (err ifNil: [errorPipelineStream])])
			ifNil: [self processProxyFor: aCommandString			"then it must be an external command"
					input: in
					output: out
					error: err
					predecessorProxy: lastProxy])
				ifNil: [cmd := (aCommandString findTokens: ' ') first.		"otherwise create evaluator to print error message"
					self evaluationProxyFor: 'stderr nextPutAll: ''sqsh: ', cmd, ': command not found''; cr. self fail'
						input: in
						output: out
						error: err]
