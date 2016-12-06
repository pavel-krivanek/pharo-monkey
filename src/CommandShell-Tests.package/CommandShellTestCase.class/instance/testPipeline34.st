testing-pipelines
testPipeline34

	"(CommandShellTestCase selector: #testPipeline34) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | copyToOutput>/tmp/delete.me | cat'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs output.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
