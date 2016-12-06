command string parsing
isDoItCommand: aCommandString
	"Answer true if aCommandString should be evaluated as Smalltalk doIt."

	^ (CommandShell withBlanksTrimmed: aCommandString) last == $!