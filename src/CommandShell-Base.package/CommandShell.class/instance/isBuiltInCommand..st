testing
isBuiltInCommand: aCommandString
	"Answer true if aCommandString can be evaluated as a built in command."

	"CommandShell new initialize isBuiltInCommand: 'help this should answer true'"
	"CommandShell new initialize isBuiltInCommand: 'this should answer false'"

	^ self builtinCommands includesKey: (aCommandString copyUpTo: Character space)