testing-expression evaluator
testSimpleExpression
	"Simple expression is directly evaluated by the shell and does not produce
	a pipeline collection."

	"(CommandShellTestCase selector: #testSimpleExpression) debug"

	| procs openFileCount |
	openFileCount := self numberOfOpenFiles.
	self should: [shell outputStream contents isEmpty].
	procs := shell evaluateOrMakePipelinesFrom: 'Smalltalk name'.
	self should: [procs = #()].
	self shouldnt: [shell outputStream contents isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
