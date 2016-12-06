testing-pipelines
testPipeline27

	"(CommandShellTestCase selector: #testPipeline27) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | copyToOutput < /etc/hosts | copyToError'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
