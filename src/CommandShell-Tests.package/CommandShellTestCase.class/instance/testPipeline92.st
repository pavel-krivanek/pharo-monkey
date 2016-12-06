testing-pipelines
testPipeline92
	"Test Smalltalk expression as the complete command"

	"(CommandShellTestCase selector: #testPipeline92) run"

	| p o |
	p := shell tryEvaluatingAsSmalltalk: '#Smalltalk classNames size'.
	self should: [p class == ExpressionEvaluator].
	self should: [p isComplete].
	self should: [p exitStatus == #fail].
	o := p upToEnd.
	self should: [o isKindOf: String].
	self should: [o isEmpty]
