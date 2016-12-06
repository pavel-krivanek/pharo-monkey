testing-pipelines
testPipeline12

	"(CommandShellTestCase selector: #testPipeline12) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ps | cat < /etc/passwd | cat'.
	p := procs last.
	o := procs output.
	self should: [p class == PipeableOSProcess].
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	(self numberOfOpenFiles == openFileCount) ifFalse: [Smalltalk garbageCollect].
	self should: [self isNumberOfOpenFiles: openFileCount]
