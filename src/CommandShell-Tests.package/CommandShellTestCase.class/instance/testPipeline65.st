testing-pipelines
testPipeline65
	"Run a fairly long Smalltalk expression and make sure the complete output
	gets picked up by the next internal process in the pipeline."

	"(CommandShellTestCase selector: #testPipeline65) run"

	| procs p o last |
	(Smalltalk respondsTo: #asArray)
		ifTrue: ["traditional system dictionary"
			last := (Smalltalk asArray first: 300) printString last: 20.
			procs := shell pipeline: 'Smalltalk asArray first: 300! | copyToOutput']
		ifFalse: ["newer image with refactored system dictionary"
			(Smalltalk respondsTo: #globals)
				ifFalse: [self error: 'unknown system dictionary organization'].
			last := (Smalltalk globals keys first: 300) printString last: 20.
			procs := shell pipeline: 'Smalltalk globals keys first: 300! | copyToOutput'].
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	"n.b. remove trailing line terminator from command output"
	self should: (o last: 21) allButLast = last
