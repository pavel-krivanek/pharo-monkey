testing-pipelines
testPipeline61

	"(CommandShellTestCase selector: #testPipeline61) run"

	| procs p o openFileCount fs |
	openFileCount := self numberOfOpenFiles.
	CommandShell deleteFileNamed: '/tmp/delete.me'.	
	procs := shell pipeline: 'stdout nextPutAll: ''Hello world!'' ! > /tmp/delete.me'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	fs := FileStream fileNamed: '/tmp/delete.me'.
	self should: [fs upToEnd isEmpty not].
	fs close.
	self should: [self isNumberOfOpenFiles: openFileCount]
