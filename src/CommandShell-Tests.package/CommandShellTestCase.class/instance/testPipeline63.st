testing-pipelines
testPipeline63

	"(CommandShellTestCase selector: #testPipeline63) run"

	| procs p o openFileCount |
	openFileCount := self numberOfOpenFiles.
	procs := shell pipeline: 'stdin upToEnd ! < /etc/hosts'.
	p := procs last.
	self should: [p class == ExpressionEvaluator].
	o := procs output.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [self isNumberOfOpenFiles: openFileCount]
