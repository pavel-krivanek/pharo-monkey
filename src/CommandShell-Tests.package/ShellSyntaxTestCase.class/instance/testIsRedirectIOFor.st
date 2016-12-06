testing - command parsing
testIsRedirectIOFor

	"(ShellSyntaxTestCase selector: #testIsRedirectIOFor) run"

	| r1 r2 |
	r1 := shellSyntax
		redirectIOFor: 'ls /tmp /NOSUCHFILE > /tmp/sqTempOut.tmp 2> /tmp/sqTempErr.tmp'
		inDirectoryPath: nil.
	self should: r1 first = 'ls /tmp /NOSUCHFILE '.
	self should: r1 second isNil.
	self should: (r1 third isKindOf: FileStream).
	self should: r1 third name =  '/tmp/sqTempOut.tmp'.
	r1 third close.
	self should: (r1 fourth isKindOf: FileStream).
	self should: r1 fourth name =  '/tmp/sqTempErr.tmp'.
	r1 fourth close.
	r2 :=shellSyntax
		redirectIOFor: 'cat < /etc/hosts > /tmp/sqHosts.tmp'
		inDirectoryPath: nil.
	self should: r2 first = 'cat '.
	self should: (r2 second isKindOf: FileStream).
	self should: r2 second name = '/etc/hosts'.
	r2 second close.
	self should: (r2 third isKindOf: FileStream).
	self should: r2 third name = '/tmp/sqHosts.tmp'.
	r2 third close.
	self should: r2 fourth isNil
