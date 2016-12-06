testing-pipelines
testPipeline70

	"(CommandShellTestCase selector: #testPipeline70) run"

	| procs p o openFileCount e |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls /no/such/file'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs output.
	e := procs errorUpToEnd.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [e isKindOf: String].
	self shouldnt: [e isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
