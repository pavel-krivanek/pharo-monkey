path name expansion
expandArgumentsFrom: argArray inDirectoryPath: aDefaultFileDirectoryPath
	"Perform globbing expansion of command arguments. For each argument which is not a
	pathname, use aDefaultFileDirectory as the context for globbing."

	"ShellSyntax new
		expandArgumentsFrom: #('-help' '/b?n/s?' 'ho?ts' 'fs*' 'NOSUCHFILE')
		inDirectoryPath: '/etc'"
	"ShellSyntax new
		expandArgumentsFrom: #('this' 'is' 'a' 'test' 'Sq*log' '/us*/b?n/v?')
		inDirectoryPath: CommandShell defaultPathString"
	"ShellSyntax new
		expandArgumentsFrom: #('this' 'is' 'a' 'test' 'Sq*log' '/us*/b?n/v?')
		inDirectoryPath: nil"

	| newArgs |
	newArgs := OrderedCollection new.
	argArray do:
		[:arg |
		(self isFlagParameter: arg)
			ifTrue:
				[newArgs add: arg]
			ifFalse:
				[newArgs addAll: (self
					expandArgument: arg
					inDirectoryPath: aDefaultFileDirectoryPath)]].
	^ newArgs