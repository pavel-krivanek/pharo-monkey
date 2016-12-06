accessing
evaluationBlock
	"Answer the block to be evaluated, possibly compiling it from the expression string."

	evaluationBlock ifNil: [self compile].
	^ evaluationBlock