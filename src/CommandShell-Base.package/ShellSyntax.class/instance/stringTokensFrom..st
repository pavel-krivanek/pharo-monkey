command string parsing
stringTokensFrom: aString
	"Answer a two element array with a collection of strings from a whitespace
	delimited string, and with an optional error message. Single quote characters
	protect substrings from expansion to tokens. Single quote characters may be
	escaped by the backslash character to prevent this interpretation."

	| result r w errorMessage quoteEnabled t |
	result := OrderedCollection new.
	r := ReadStream on: aString.
	w := WriteStream on: String new.
	errorMessage := nil.
	(quoteEnabled := r peek == self quoteChar) ifTrue: [r next].
	[r atEnd] whileFalse:
		[t := r next.
		(t == self quoteChar)
			ifTrue:
				[quoteEnabled := quoteEnabled not]
			ifFalse:
				[quoteEnabled
					ifTrue:
						[w nextPut: t]
					ifFalse:
						[(t == self escapeChar)
							ifTrue:
								["An escaped character is treated as a literal character."
								t := r next.
								t isNil
									ifTrue: ["FIXME: This would indicate an escaped end of line"]
									ifFalse: [w nextPut: t]]
							ifFalse:
								[t isSeparator
									ifTrue:
										["Whitespace delimits tokens."
										(w isEmpty) ifFalse: [result add: w contents].
										w := WriteStream on: String new.
										[r peek notNil and: [r peek isSeparator]] whileTrue: [r next].]
									ifFalse:
										[w nextPut: t]]]]].
	quoteEnabled ifTrue: [errorMessage := 'unbalanced quotes'].
	(w isEmpty) ifFalse: [result add: w contents].
	^ Array with: result with: errorMessage
