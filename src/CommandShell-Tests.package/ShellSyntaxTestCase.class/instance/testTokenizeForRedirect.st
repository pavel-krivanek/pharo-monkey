testing - command parsing
testTokenizeForRedirect

	"(ShellSyntaxTestCase selector: #testTokenizeForRedirect) debug"

	| r |
	r := shellSyntax tokenizeForRedirect: 'one > two < three 2> four five six 2>> seven eight > nine ten >> eleven twelve 2 > thirteen'.
	self should: r size = 15.
	self should: (r at: 1) = 'one '.
	self should: (r at: 2) = #outputRedirect.
	self should: (r at: 3) = ' two '.
	self should: (r at: 4) = #inputRedirect.
	self should: (r at: 5) = ' three '.
	self should: (r at: 6) = #errorRedirect.
	self should: (r at: 7) = ' four five six '.
	self should: (r at: 8) = #errorAppendRedirect.
	self should: (r at: 9) = ' seven eight '.
	self should: (r at: 10) = #outputRedirect.
	self should: (r at: 11) = ' nine ten '.
	self should: (r at: 12) = #outputAppendRedirect.
	self should: (r at: 13) = ' eleven twelve 2 '.
	self should: (r at: 14) = #outputRedirect.
	self should: (r at: 15) = ' thirteen'
