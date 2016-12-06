testing-pipelines
testPipeline73

	"(CommandShellTestCase selector: #testPipeline73) run"

	| procs p o openFileCount e |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls /no/such/file | stdout nextPutAll: stdin upToEnd !'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs upToEnd.
	e := p errorPipelineStream contents.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [e isKindOf: String].
	self shouldnt: [e isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
