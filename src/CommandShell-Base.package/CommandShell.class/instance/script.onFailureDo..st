command scripting
script: aScriptString onFailureDo: aBlockWithZeroOrOneParameter
	"A script is a String containing a list of commands separated by Character cr.
	Evaluate each command in aScriptString until a failure is encountered.
	On failure, answer the result of evaluating aBlockWithOneParameter with
	the collection of evaluated pipelines as its parameter. Otherwise, answer the
	last collection of pipelines to have been evaluated."

	"CommandShell new open; 
		script: 'who
				help
				ls -l NOSUCHFILE
				help'
		onFailureDo: [:p | 'the pipeline collection that failed was ', p printString]"
	"CommandShell new open; 
		script: 'who
				help
				ls
				help'
		onFailureDo: [:p | 'the pipeline collection that failed was ', p printString]"
	"CommandShell new open; 
		script: 'who
				help
				ls -l NOSUCHFILE
				help'
		onFailureDo: ['the pipeline collection failed']"

	| commandStream pipelines |
	commandStream := ReadStream on:
						(aScriptString
							copyReplaceAll: Character lf asString
							with: Character cr asString).
	pipelines := nil.
	[commandStream atEnd]
		whileFalse:
			[pipelines := self
				command: commandStream nextLine
				onFailureDo:
					[:p | (aBlockWithZeroOrOneParameter numArgs == 0)
						ifTrue: [^ aBlockWithZeroOrOneParameter value]
						ifFalse: [^ aBlockWithZeroOrOneParameter value: p]]].
	^ pipelines

