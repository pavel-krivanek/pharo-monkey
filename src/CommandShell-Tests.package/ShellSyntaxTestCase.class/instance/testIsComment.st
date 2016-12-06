testing - command parsing
testIsComment

	"(ShellSyntaxTestCase selector: #testIsComment) run"

	self should: (shellSyntax isComment: '   #comment').
	self should: (shellSyntax isComment: '#comment').
	self shouldnt: (shellSyntax isComment: '   notComment').
	self shouldnt: (shellSyntax isComment: 'notComment').
	self should: (shellSyntax isComment: '')
