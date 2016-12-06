testing-pipelines
testPipeline03

	"(CommandShellTestCase selector: #testPipeline03) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ps | cat'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs output.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
