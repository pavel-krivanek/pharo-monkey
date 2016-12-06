testing-pipelines
testPipeline67

	"(CommandShellTestCase selector: #testPipeline67) run"

	| procs p o openFileCount e |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'bogusExpression !'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	e := procs errorUpToEnd.
	self assert: (('Compiler: invalid Smalltalk expression [bogusExpression ]', String lf) = e).
	procs finalize.
	self should: [self isNumberOfOpenFiles: openFileCount]
