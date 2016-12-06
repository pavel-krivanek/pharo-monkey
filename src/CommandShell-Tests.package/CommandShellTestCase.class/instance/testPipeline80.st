testing-pipelines
testPipeline80
	"Test error streaming for a PipeableOSProcess"

	"(CommandShellTestCase selector: #testPipeline80) run"

	| procs p o openFileCount errorLength e1 e2 |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls /etc/hosts /NO/SUCH/FILE'.
	p := procs last.
	self should: [p class == PipeableOSProcess].
	o := procs upToEndOfFile. "wait for output, otherwise may be lost when in polling mode"
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	errorLength := p errorPipelineStream size.
	e1 := procs nextFromError: 15.
	e2 := procs errorUpToEnd.
	self should: [errorLength == (e1 size + (e2 size))].
	self should: [procs errorUpToEnd isEmpty].
	self should: [p errorPipelineStream upToEnd size = 0].
	self should: [self isNumberOfOpenFiles: openFileCount]
