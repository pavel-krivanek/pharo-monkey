testing-expression evaluator
testInvalidBangExpression
	"Bang forces evaluation as Smalltalk, with compiler error message going
	to error stream."

	"(CommandShellTestCase selector: #testInvalidBangExpression) debug"

	| pipelines procs openFileCount p o e |
	openFileCount := self numberOfOpenFiles.
	self should: [shell outputStream contents isEmpty].
	self should: shell outputStream isEmpty.
	pipelines := shell evaluateOrMakePipelinesFrom: 'foobar !'.
	self assert: pipelines size = 1.
	procs := pipelines last.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	procs value.
	o := procs output.
	self should: [o isEmpty].
	e := procs errorUpToEnd.
	self should: ['Compiler: invalid Smalltalk expression [foobar ]*' match: e].
	self shouldnt: [e isEmpty].
	self should: shell outputStream isEmpty.
	self should: [self isNumberOfOpenFiles: openFileCount]
