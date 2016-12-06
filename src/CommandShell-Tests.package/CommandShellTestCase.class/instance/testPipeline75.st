testing-pipelines
testPipeline75

	"(CommandShellTestCase selector: #testPipeline75) run"

	| procs p o openFileCount e |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'ls /no/such/file | stdout nextPutAll: stdin upToEnd ! | cat | copyToOutput | cat | cat | copyToOutput | copyToOutput'.
	p := procs last.
	self should: [p class == ShellBuiltinEvaluator].
	o := procs output.
	e := procs errorUpToEnd.
	self should: [o isKindOf: String].
	self should: [o isEmpty].
	self should: [e isKindOf: String].
	self shouldnt: [e isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
