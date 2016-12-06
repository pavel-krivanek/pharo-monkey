testing-pipelines
testPipeline24

	"(CommandShellTestCase selector: #testPipeline24) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | copyToOutput>/tmp/delete.me | copyToOutput'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
