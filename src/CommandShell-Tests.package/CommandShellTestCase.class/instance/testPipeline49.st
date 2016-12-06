testing-pipelines
testPipeline49

	"(CommandShellTestCase selector: #testPipeline49) run"

	| procs p o e openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'help | copyToOutput 2> /tmp/delete.me | copyToOutput'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].

	self should: [p succeeded].

	o := procs upToEnd.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	e := p errorUpToEnd.
	self should: [e isKindOf: String].
	self should: [e isEmpty].
	self should: [procs output isEmpty]. "Force read to EOF, closes output pipe"
	self should: [self isNumberOfOpenFiles: openFileCount]
