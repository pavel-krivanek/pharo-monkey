testing-pipelines
testPipeline94
	"Test Smalltalk expression as the complete command. Should fail in evaluation."

	"(CommandShellTestCase selector: #testPipeline94) run"

	| p o |
	p := shell tryEvaluatingAsSmalltalk: 'Smalltalk noSuchSelector'.
	self should: [p class == ExpressionEvaluator].
	self should: [p isComplete].
	self should: [p exitStatus == #fail].
	o := p upToEnd.
	self should: [o isKindOf: String].
	self should: [o isEmpty]
