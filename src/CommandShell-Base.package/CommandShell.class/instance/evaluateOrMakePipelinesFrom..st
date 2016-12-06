command line parsing
evaluateOrMakePipelinesFrom: aCommandString
	"Convert aCommandString into a structured collection of process proxies,
	possibly after evaluating aCommandString as Smalltalk."

	"CommandShell new evaluateOrMakePipelinesFrom: 'who | cat | wc; ps -aef | cat& pwd | cat'"
	"CommandShell new evaluateOrMakePipelinesFrom: 'Array new: 10' "

	| process |
	"Ignore trivial case of a single word starting with $#"
	(self isOneWordCommentString: aCommandString)
		ifTrue:
			[^ #()]
		ifFalse:
			[process := self tryEvaluatingAsSmalltalk: aCommandString.
			(process exitStatus == #success)
				ifTrue: "aCommandString was successfully evaluated as a Smalltalk expression"
					[self outputStream nextPutAll: process upToEnd.
					self errorStream nextPutAll: process errorUpToEnd.
					self saveInHistoryList: aCommandString.
					^ #()]
				ifFalse: "Treat aCommandString as a command pipeline"
					[^ self pipelineCollectionFrom: aCommandString]]
