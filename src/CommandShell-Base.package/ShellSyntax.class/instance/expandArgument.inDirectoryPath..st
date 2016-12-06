path name expansion
expandArgument: aString inDirectoryPath: aDefaultFileDirectoryPath
	"Perform globbing expansion of a command argument. If argument is not a
	pathname, use aDefaultFileDirectory as the context for globbing. Answer a
	(possibly empty) collection of all matching paths relative to the default
	directory path."

	"ShellSyntax new expandArgument: 'ho?ts' inDirectoryPath: '/etc'"
	"ShellSyntax new expandArgument: '/b?n/s?' inDirectoryPath: '/etc'"
	"ShellSyntax new expandArgument: 'fs*' inDirectoryPath: '/etc'"
	"ShellSyntax new expandArgument: 'NOSUCHFILE' inDirectoryPath: '/etc'"
	"ShellSyntax new expandArgument: '/us*/b?n/v?' inDirectoryPath: '/etc'"
	"ShellSyntax new expandArgument: 'b?n/v?' inDirectoryPath: '/usr'"
	"ShellSyntax new expandArgument: nil inDirectoryPath: '/etc'"

	| dirPath pathNames newArgs |
	aString ifNil: [^ Array new: 0].
	dirPath := (aDefaultFileDirectoryPath
				ifNil: [self workingDirectory])
					ifNil: [CommandShell defaultPathString].
	pathNames := (self containsExpansionTokens: aString)
				ifTrue: [self expandedPathsFrom: aString beginningAt: dirPath]
				ifFalse: [OrderedCollection new].
	newArgs := pathNames collect:
				[:p | (aDefaultFileDirectoryPath notNil and: [p beginsWith: aDefaultFileDirectoryPath, CommandShell pathSeparator])
					ifTrue: [(ReadStream on: p) next: aDefaultFileDirectoryPath size + CommandShell pathSeparator size; upToEnd]
					ifFalse: [p]].
	newArgs isEmpty ifTrue: [newArgs add: aString].
	^ newArgs
