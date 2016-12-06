testing-pipelines
testPipeline81
	"Test error streaming for a ShellBuiltinEvaluator"

	"(CommandShellTestCase selector: #testPipeline81) run"

	| procs p o openFileCount errorLength e1 e2 |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls /etc/hosts /NO/SUCH/FILE | copyToOutput'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs upToEnd.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	errorLength := p errorPipelineStream size.
	e1 := procs nextFromError: 15.
	e2 := procs errorUpToEnd.
	self should: [errorLength == (e1 size + (e2 size))].
	self should: [procs errorUpToEnd isEmpty].
	self should: [p errorPipelineStream size == 0].
	self should: [self isNumberOfOpenFiles: openFileCount]
