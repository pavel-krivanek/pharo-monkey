command scripting
command: aCommandString onFailureDo: aBlockWithZeroOrOneParameter
	"Evaluate aCommandString. On failure, answer the result of evaluating
	aBlockWithOneParameter with the collection of evaluated pipelines as
	its parameter. Otherwise, answer a collection of evaluated pipelines or
	nil if nothing was done."

	"CommandShell new open;
		command: 'who'
		onFailureDo: [:p | 'the proxy pipeline collection which failed was ', p printString]"
	"CommandShell new open;
		command: 'ls NOSUCHFILE'
		onFailureDo: [:p | 'the proxy pipeline collection that failed was ', p printString]"
	"CommandShell new open;
		command: 'ls NOSUCHFILE'
		onFailureDo: ['the command failed']"

	| pipelines |
	pipelines := self command: aCommandString.
	(pipelines anySatisfy: [:p | p succeeded not])
		ifTrue:
			[(aBlockWithZeroOrOneParameter numArgs == 0)
				ifTrue: [^ aBlockWithZeroOrOneParameter value]
				ifFalse: [^ aBlockWithZeroOrOneParameter value: pipelines]]
		ifFalse: [^ pipelines]

