testing-pipelines
testPipeline05

	"(CommandShellTestCase selector: #testPipeline05) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ps | cat | od | cat'.
	p := procs last.
	o := procs output.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
