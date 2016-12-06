initialize-release
installCommands: aCommandArray

	self builtinCommands: (ShellBuiltin commandDictionaryFor: self commands: aCommandArray)
