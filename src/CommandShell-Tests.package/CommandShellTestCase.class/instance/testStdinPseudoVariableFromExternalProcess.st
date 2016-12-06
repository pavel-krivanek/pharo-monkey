testing-expression evaluator
testStdinPseudoVariableFromExternalProcess

	"(CommandShellTestCase selector: #testStdinPseudoVariableFromExternalProcess) debug"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'who | stdin upToEndOfFile !'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty not].
	self should: [self isNumberOfOpenFiles: openFileCount]
