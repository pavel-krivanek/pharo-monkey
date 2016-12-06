globbing
globTokensFrom: aString
	"Answer a collection of tokens to be used for glob matching."

	"ShellSyntax new globTokensFrom: 'abc?def\ghi\?jkl*mno\*pqr[hello]there[Xa-eY]Z[!A-Z]end'"

	| lastToken r w t |
	lastToken := nil.
	r := ReadStream on: aString.
	w := WriteStream on: #().
	[r atEnd] whileFalse:
		[t := self nextGlobToken: r lastToken: lastToken tokenStream: w.
		(t ~~ #escape) ifTrue: [w nextPut: t].
		lastToken := t].
	^ w contents
