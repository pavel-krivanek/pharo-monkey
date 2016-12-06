testing - command parsing
testIsFlagParameter

	"(ShellSyntaxTestCase selector: #testIsFlagParameter) run"

	self should: (shellSyntax isFlagParameter: '-help').
	self shouldnt: (shellSyntax isFlagParameter: 'filename').
	self shouldnt: (shellSyntax isFlagParameter: '')
