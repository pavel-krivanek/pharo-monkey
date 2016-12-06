testing-expression evaluator
testStdinPseudoVariableUpToEndOfFile

	"(CommandShellTestCase selector: #testStdinPseudoVariableUpToEndOfFile) debug"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help help | stdin upToEndOfFile !'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty not].
	self should: [self isNumberOfOpenFiles: openFileCount]
