command string parsing
doItStringFrom: aCommandString
	"Answer a string which can be evaluated as Smalltalk doIt, or nil."

	| s |
	s := CommandShell withBlanksTrimmed: aCommandString.
	s last == $!
		ifTrue: [^ aCommandString copyUpToLast: $!]
		ifFalse: [^ nil]