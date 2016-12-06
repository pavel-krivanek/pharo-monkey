testing-pipelines
testPipeline09

	"(CommandShellTestCase selector: #testPipeline09) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls /etc/hosts /etc/NOSUCHFILE 2> /tmp/delete.me | cat'.
	p := procs last.
	o := procs output.
	self should: [p class == PipeableOSProcess].
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
