testing-pipelines
testPipeline35

	"(CommandShellTestCase selector: #testPipeline35) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | copyToOutput2>/tmp/delete.me | cat'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty not].
	self should: [self isNumberOfOpenFiles: openFileCount]
