testing-pipelines
testPipeline51

	"(CommandShellTestCase selector: #testPipeline51) run"

	| openFileCount procs p o fs |
	openFileCount := self numberOfOpenFiles.
	CommandShell deleteFileNamed: '/tmp/delete.me'.	
	procs := shell pipeline: 'copyToError /etc/hosts 2> /tmp/delete.me'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	fs := FileStream fileNamed: '/tmp/delete.me'.
	self should: [fs upToEnd isEmpty not].
	fs close.
	self should: [self isNumberOfOpenFiles: openFileCount]
