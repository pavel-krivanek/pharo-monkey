testing-expression evaluator
testStdinPseudoVariable

	"(CommandShellTestCase selector: #testStdinPseudoVariable) debug"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help help | stdin upToEnd !'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty not].
	self should: [self isNumberOfOpenFiles: openFileCount]
