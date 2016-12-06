accessing
builtinCommands

	^ builtinCommands ifNil: [builtinCommands := Dictionary new]