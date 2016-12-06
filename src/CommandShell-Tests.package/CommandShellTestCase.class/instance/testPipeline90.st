testing-pipelines
testPipeline90
	"Test Smalltalk expression as the complete command. Do not worry about the
	actual output, as it gets clobbered by the prompt."

	"(CommandShellTestCase selector: #testPipeline90) run"

	| o |
	shell command: 'Smalltalk classNames size'.
	o := shell outputStream contents.
	self should: [o isKindOf: String].
	self shouldnt: [o isEmpty].
	self should: [o size > 3]
