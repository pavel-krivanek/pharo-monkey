testing-pipelines
testPipeline44

	"(CommandShellTestCase selector: #testPipeline44) run"

	| procs p o e openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'copyToOutput | noSuchCommand'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	self shouldnt: [p succeeded].
	o := procs upToEnd.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	e := p errorUpToEnd.
	self should: [e isKindOf: String].
	self shouldnt: [e isEmpty].
	self should: [procs output isEmpty]. "Force read to EOF, closes output pipe"
	self should: [self isNumberOfOpenFiles: openFileCount]
