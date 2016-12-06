testing-pipelines
testPipeline60

	"(CommandShellTestCase selector: #testPipeline60) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	CommandShell deleteFileNamed: '/tmp/delete.me'.	
	procs := shell pipeline: 'Smalltalk! > /tmp/delete.me'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	procs finalize.
	procs := CommandShell new pipeline: 'cat /tmp/delete.me'.
	self shouldnt: [procs last output isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
