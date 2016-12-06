command dictionary creation
commandDictionaryFor: aCommandShell commands: commandNameArray
	"Answer a Dictionary of ShellBuiltin instances suitable for use by a CommandShell"

	"ShellBuiltin commandDictionaryFor: CommandShell new commands: #(cd: clear: copyToError: copyToOutput: edit: exit: fc: help: history: inspect: pwd: sls: sqsh: type:)"

	^ commandNameArray
		inject: Dictionary new
		into:
			[:d :cmd | | b |
			b := self perform: cmd with: aCommandShell.
			d at: b name put: b; yourself]