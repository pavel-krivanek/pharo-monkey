testing-pipelines
testPipeline06

	"(CommandShellTestCase selector: #testPipeline06) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ps > /tmp/delete.me | cat'.
	p := procs last.
	o := procs output.
	self should: [p class == PipeableOSProcess].
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
