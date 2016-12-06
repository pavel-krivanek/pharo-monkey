testing-pipelines
testPipeline08

	"(CommandShellTestCase selector: #testPipeline08) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'cat < /etc/passwd | cat'.
	p := procs last.
	o := procs output.
	self should: [p class == PipeableOSProcess].
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
