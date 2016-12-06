testing-pipelines
testPipeline04

	"(CommandShellTestCase selector: #testPipeline04) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ps | copyToOutput'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
