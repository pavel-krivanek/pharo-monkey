testing-pipelines
testPipeline46

	"(CommandShellTestCase selector: #testPipeline46) run"

	| procs p o e openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | who'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs upToEndOfFile. "wait for output, otherwise may be lost when in polling mode"
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	e := p errorUpToEnd.
	self should: [e isKindOf: String].
	self should: [e isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
