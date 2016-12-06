testing-pipelines
testPipeline11

	"(CommandShellTestCase selector: #testPipeline11) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ps | cat > /dev/null | cat'.
	p := procs last.
	o := procs output.
	self should: [p class == PipeableOSProcess].
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
