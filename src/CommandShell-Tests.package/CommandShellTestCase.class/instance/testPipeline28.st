testing-pipelines
testPipeline28

	"(CommandShellTestCase selector: #testPipeline28) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls -l | copyToOutput < /etc/hosts | copyToOutput'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty not].
	self should: [self isNumberOfOpenFiles: openFileCount]
