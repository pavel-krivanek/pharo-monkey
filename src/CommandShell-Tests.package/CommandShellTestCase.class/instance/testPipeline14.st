testing-pipelines
testPipeline14

	"(CommandShellTestCase selector: #testPipeline14) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | cat < /etc/passwd | cat'.
	p := procs last.
	o := procs output.
	self should: [p class == PipeableOSProcess].
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
