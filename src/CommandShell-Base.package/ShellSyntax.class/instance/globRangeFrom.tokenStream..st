globbing
globRangeFrom: aString tokenStream: aTokenStream
	"Answer a string containing the characters specified by a range expression
	such as [a-z]. Sorry, this is just a simple implementation which assumes ASCII."

	| r w c t |
	(aString includes: $-) ifFalse: [^ aString]. "Simple case"
	r := ReadStream on: aString.
	w := WriteStream on: String new.
	(r peek == $!) ifTrue:
		[r next.
		aTokenStream nextPut: #not].
	[r atEnd] whileFalse: [
		c := r next.
		(r peek == $-)
			ifTrue: [r next.
					t := r next.
					(c asciiValue to: t asciiValue) do:
						[:e | w nextPut: (Character value: e)]]
			ifFalse: [w nextPut: c]].
	^ w contents