testing-expression evaluator
testBangExpression
	"Bang character forces evaluation as a Smalltalk expression."

	"(CommandShellTestCase selector: #testBangExpression) debug"

	| pipelines procs openFileCount p o |
	openFileCount := self numberOfOpenFiles.
	self should: [shell outputStream contents isEmpty].
	self should: shell outputStream isEmpty.
	pipelines := shell evaluateOrMakePipelinesFrom: 'Smalltalk name!'.
	self assert: pipelines size = 1.
	procs := pipelines last.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	procs value.
	o := procs output.
	self shouldnt: [o isEmpty].
	self should: shell outputStream isEmpty.
	self should: [self isNumberOfOpenFiles: openFileCount]
