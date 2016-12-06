initialize - release
fromString: aCommandString shell: aCommandShell 
	"Initialize a new instance created from aCommandString using aCommandShell. "

	self commandLine: aCommandString.
	(aCommandShell splitPipelineCommands: aCommandString)
		inject: nil
		into: [:prevProxy :command | 
			| nextProxy |
			nextProxy := aCommandShell
				redirectedPipeableProxyFor: command
				predecessorProxy: prevProxy.
			prevProxy
				ifNotNil: [prevProxy prepareOutputFor: nextProxy.
					prevProxy canProvideOutputPipe
						ifFalse: [nextProxy closeWriter]].
			self add: nextProxy].
	self isEmpty
		ifFalse: [self last prepareOutputFor: self; addDependent: self]