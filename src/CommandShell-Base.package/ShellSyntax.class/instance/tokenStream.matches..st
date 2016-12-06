globbing
tokenStream: aTokenStream matches: aCharacterStream 
	"Iterate over both streams. If each character in aCharacterStream 
	matches its corresponding token in tokenStream, answer true."

	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'a?c')) matches: (ReadStream on: 'abc')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'ab*cde')) matches: (ReadStream on: 'abcde')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'ab*cde')) matches: (ReadStream on: 'abXXXcde')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'ab*cdX')) matches: (ReadStream on: 'abXXXcde')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'abc*')) matches: (ReadStream on: 'abcde')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'abc*')) matches: (ReadStream on: 'abc')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'a?cde*jkl')) matches: (ReadStream on: 'abcdefghijkl')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'abc[A-C]xyz')) matches: (ReadStream on: 'abcBxyz')"
	"ShellSyntax new tokenStream: (ReadStream on: (ShellSyntax new globTokensFrom: 'abc[!A-C]xyz')) matches: (ReadStream on: 'abcZxyz')"

	| c tok |
	[aCharacterStream atEnd]
		whileFalse: [aTokenStream atEnd
				ifTrue: [^ false].
			c := aCharacterStream peek.
			tok := aTokenStream next.
			tok == #not
				ifTrue: ["A negated character range follows"
					tok := aTokenStream next.
					(self character: c matches: tok)
						ifTrue: [^ false].
					aCharacterStream next]
				ifFalse: ["The normal case"
					tok == #matchRun
						ifTrue:
							["Skip characters until we resync the streams, or answer false"
							[self tokenStream: aTokenStream copy matches: aCharacterStream copy]
								whileFalse:
									[aCharacterStream atEnd ifTrue: [^ false].
									aCharacterStream next]]
						ifFalse: [(self character: c matches: tok)
								ifFalse: [^ false].
							aCharacterStream next]]].
	^ aTokenStream atEnd
		or: [aTokenStream next == #matchRun
				and: [aTokenStream atEnd]]
