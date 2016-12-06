testing-pipelines
testPipeline47

	"(CommandShellTestCase selector: #testPipeline47) run"

	| procs p o e openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | sleep 1'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs upToEnd.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	e := p errorUpToEnd.
	self should: [e isKindOf: String].
	self should: [e isEmpty].
	self should: [procs output isEmpty]. "Force read to EOF, closes output pipe"
	self should: [self isNumberOfOpenFiles: openFileCount]
