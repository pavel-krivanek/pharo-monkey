process proxy creation
redirectedPipeableProxyFor: aCommandString predecessorProxy: lastProxy
	"Answer a proxy for an external OS process, or for an internal builtin command,
	or for an evaluation string. The proxy is suitable for use in a command pipeline,
	possibly mixing internal and external commands."

	"(CommandShell new redirectedPipeableProxyFor: '#''this is a doIt'' ! '
							predecessorProxy: nil) value upToEnd"
	"(CommandShell new redirectedPipeableProxyFor: 'help'
							predecessorProxy: nil) value upToEnd"
	"(CommandShell new redirectedPipeableProxyFor: 'cat /etc/hosts'
							predecessorProxy: nil) value upToEnd"

	| redirectedCommand nextProxy input |
	redirectedCommand := self shellSyntax
								redirectIOFor: aCommandString
								inDirectoryPath: self workingDirectory.
	lastProxy isNil
		ifTrue:
			[input := redirectedCommand at: 2]
		ifFalse:
			[(redirectedCommand at: 2) isNil
				ifTrue:
					[input := lastProxy outputPipeForNextProxy]
				ifFalse:
					[lastProxy replaceOutputStreamWith: nil.
					input := redirectedCommand at: 2]].
	nextProxy := self pipeableProxyFor: (redirectedCommand at: 1)
		input: input
		output: (redirectedCommand at: 3)
		error: (redirectedCommand at: 4)
		predecessorProxy: lastProxy.
	^ nextProxy handleRedirectedOutputOf: lastProxy
