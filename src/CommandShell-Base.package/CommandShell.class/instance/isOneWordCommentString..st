testing
isOneWordCommentString: aCommandString
	"Answer true if aCommandString is one word beginning with $#, or if it is an empty string."

	"CommandShell new isOneWordCommentString: '#oneWordComment'"
	"CommandShell new isOneWordCommentString: ' #oneWordComment'"
	"CommandShell new isOneWordCommentString: ' #oneWordComment '"
	"CommandShell new isOneWordCommentString: '#three word comment'"
	"CommandShell new isOneWordCommentString: 'not a comment'"
	"CommandShell new isOneWordCommentString: 'notAComment'"
	"CommandShell new isOneWordCommentString: ''"

	| s |
	s := CommandShell withBlanksTrimmed: aCommandString.
	^ s isEmpty
		or: [(s first == self shellSyntax commentChar)
			and: [(Scanner new scanTokens: s) size == 1]]
