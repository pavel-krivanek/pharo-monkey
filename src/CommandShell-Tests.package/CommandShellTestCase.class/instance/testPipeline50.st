testing-pipelines
testPipeline50

	"(CommandShellTestCase selector: #testPipeline50) run"

	| procs p o openFileCount fs |
	openFileCount := self numberOfOpenFiles.
	CommandShell deleteFileNamed: '/tmp/delete.me'.	
	procs := shell pipeline: 'help > /tmp/delete.me'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	procs finalize.
	procs := CommandShell new pipeline: 'cat /tmp/delete.me'.
	self shouldnt: [procs last output isEmpty].
	fs := FileStream fileNamed: '/tmp/delete.me'.
	self should: [fs upToEnd isEmpty not].
	fs close.
	self should: [self isNumberOfOpenFiles: openFileCount]
