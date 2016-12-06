testing-pipelines
testPipeline02

	"(CommandShellTestCase selector: #testPipeline02) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'echo hello world'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs output.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: ['hello world*' match: o].
	self should: [(CommandShell withBlanksTrimmed: o) = 'hello world'].
	self should: [self isNumberOfOpenFiles: openFileCount]
