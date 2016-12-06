accessing
shellSyntax
	"A pluggable instance of a command processing syntax"

	^ shellSyntax ifNil: [shellSyntax := ShellSyntax new]