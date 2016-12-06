testing-pipelines
testPipeline95
	"Test Smalltalk expression as the complete command. Should fail in compiler."

	"(CommandShellTestCase selector: #testPipeline95) run"

	| p o |
	p := shell tryEvaluatingAsSmalltalk: '(Smalltalk classNames size'.
	self should: [p class == ExpressionEvaluator].
	self should: [p isComplete].
	self should: [p exitStatus == #fail].
	o := p upToEnd.
	self should: [o isKindOf: String].
	self should: [o isEmpty]
