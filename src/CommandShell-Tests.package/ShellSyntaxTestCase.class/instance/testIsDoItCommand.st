testing - command parsing
testIsDoItCommand

	"(ShellSyntaxTestCase selector: #testIsDoItCommand) run"

	self should: (shellSyntax isDoItCommand: 'this should answer true!').
	self should: (shellSyntax isDoItCommand: 'this should answer true!   ').
	self shouldnt: (shellSyntax isDoItCommand: 'this should answer false')