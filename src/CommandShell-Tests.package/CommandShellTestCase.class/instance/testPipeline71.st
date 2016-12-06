testing-pipelines
testPipeline71

	"(CommandShellTestCase selector: #testPipeline71) run"

	| procs p o openFileCount e |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls /no/such/file | cat'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs output.
	e := p errorPipelineStream contents.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [e isKindOf: String].
	self shouldnt: [e isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
