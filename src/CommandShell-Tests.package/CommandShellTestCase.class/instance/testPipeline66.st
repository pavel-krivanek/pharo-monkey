testing-pipelines
testPipeline66
	"Run a fairly long Smalltalk expression and make sure the complete output
	gets picked up by the next internal process in the pipeline."

	"Warning: This test will produce a deadlock condition if the Smalltalk
	expression runs too long."

	"(CommandShellTestCase selector: #testPipeline66) run"

	| procs p o last count |
	count := 150. "<== Make this smaller if you get a deadlock"
	(Smalltalk respondsTo: #asArray)
		ifTrue: ["traditional system dictionary"
			last := (Smalltalk asArray first: count) last printString.
			procs := shell pipeline: 'Smalltalk asArray first: ', count printString, '! | cat']
		ifFalse: ["newer image with refactored system dictionary"
			(Smalltalk respondsTo: #globals)
				ifFalse: [self error: 'unknown system dictionary organization'].
			last := (Smalltalk globals keys first: count) last printString.
			procs := shell pipeline: 'Smalltalk globals keys first: ', count printString, '! | cat'].
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs output.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [((o copyFrom: (o size - (last size + 1)) to: o size) allButLast allButLast) = last]
