implementations
cdCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Set the current working directory. Answer an empty string or #invalidCommand."

	| newPath path arg pathCwd p |
	argArray size == 0
		ifTrue:
			[newPath := commandShell home]
		ifFalse:
			[argArray size == 1
				ifTrue:
					[path := argArray at: 1.
					(path = commandShell shellSyntax pathStringAboveRoot)
						ifTrue:
							[newPath := commandShell shellSyntax pathAboveRoot]
						ifFalse:
							[pathCwd := commandShell shellSyntax getCwdForPath: path.
							arg := (path = CommandShell pathSeparator)
								ifTrue: [path]
								ifFalse: [commandShell shellSyntax
												firstExpandedArgument: path
												inDirectoryPath: pathCwd].
							newPath := arg isEmpty
								ifTrue: [arg]
								ifFalse:
									[p := commandShell shellSyntax newDirPath: arg from: pathCwd.
									p ifNotNil: [CommandShell fullNameFor: p]]]]
				ifFalse:
					[myProxy fail.
					^ commandShell invalidCommandMessage]].
	newPath isNil
		ifTrue:
			["No directory found with this name"
			myProxy fail.
			stderr nextPutAll: argArray first, ': No such file or directory'; nextPut: Character lf]
		ifFalse:
			[(commandShell workingDirectory ~= newPath)
				ifTrue:
					[(newPath isEmpty or: [commandShell shellSyntax isDirectoryPath: newPath])
						ifTrue:
							[commandShell workingDirectory: newPath.
							commandShell changed: #relabel.
							commandShell environment ifNotNil:
								[commandShell environment at: #PWD put: commandShell workingDirectory]]
						ifFalse:
							["File of this name exists, but is not a directory"
							myProxy fail.
							stderr nextPutAll: newPath, ': not a directory'; nextPut: Character lf]]]
