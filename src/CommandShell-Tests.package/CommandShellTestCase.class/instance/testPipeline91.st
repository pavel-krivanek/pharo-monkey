testing-pipelines
testPipeline91
	"Test Smalltalk expression as the complete command"

	"(CommandShellTestCase selector: #testPipeline91) run"

	| numberOfClasses p o numberCounted |
	numberOfClasses := Smalltalk classNames size.
	p := shell tryEvaluatingAsSmalltalk: 'Smalltalk classNames size'.
	self should: [p class == ExpressionEvaluator].
	self should: [p isComplete].
	o := p upToEnd.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	numberCounted := o asInteger.
	self should: [numberCounted == numberOfClasses]
