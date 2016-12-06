testing - token expansion
testExpandArgumentFrom03

	"(ShellSyntaxTestCase selector: #testExpandArgumentFrom03) run"

	| args |
	self unix ifTrue:
		[args := shellSyntax
			expandArgumentsFrom: #('this' 'is' 'a' 'test' '*.image' '/us*/b?n/v?')
			inDirectoryPath: nil.
		self shouldnt: [args isEmpty].
		self should: [args includes: 'this'].
		self should: [args includes: 'is'].
		self should: [args includes: 'a'].
		self should: [args includes: 'test'].
		self should: [args includes: '/usr/bin/vi'].
		self shouldnt: [args includes: nil].
		self shouldnt: [args includes: ''].
		self should: [(args detect: [:e | '*.image' match: e] ifNone: []) notNil]]
