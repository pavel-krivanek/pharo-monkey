command scripting
if: aCommandStringOrScript then: successBlock else: failureBlock
	"Evaluate aCommandStringOrScript, then evaluate successBlock or failureBlock
	depending on the exit status of the command or script. The blocks may use
	either zero or one argument. If a single argument is used, the collection of
	evaluated pipelines is passed to the block as an argument."

	"CommandShell new open;
		if: 'who'
		then: ['the command succeeded']
		else: ['the command failed']"
	"CommandShell new
		if: 'who
			ls NOSUCHFILE
			pwd'
		then: ['the script succeeded']
		else: ['the script failed']"
	"CommandShell new
		if: 'who
			ls NOSUCHFILE
			pwd'
		then: [:p | 'the script succeeded ', p printString]
		else: [:p | 'the script failed ', p printString]"

	| pipelines |
	pipelines := self script: aCommandStringOrScript
		onFailureDo: [:p | (failureBlock numArgs == 0)
						ifTrue: [^ failureBlock value]
						ifFalse: [^ failureBlock value: p]].
	(successBlock numArgs == 0)
		ifTrue: [^ successBlock value]
		ifFalse: [^ successBlock value: pipelines]
