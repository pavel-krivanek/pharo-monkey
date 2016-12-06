implementations
typeCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Answer how each name would be interpreted if used as a command name."

	| results exe |
	argArray size == 0
		ifTrue:
			[^ '']
		ifFalse:
			[results := WriteStream on: Array new.
			argArray do:
			[:arg |
			(commandShell isBuiltInCommand: arg)
				ifTrue:
					[results nextPut: arg, ' is a shell builtin']
				ifFalse:
					[self canAccessOSProcess
					 	ifFalse:
							[self inform:
								((Smalltalk hasClassNamed: #OSProcess)
									ifTrue: [(Smalltalk at: #OSProcess) accessor class name]
									ifFalse: [commandShell class name]), ' cannot access system'.
							stdout nextPutAll: 'cannot access system'; nextPut: Character lf.
							^ self].
					exe := commandShell shellSyntax findExecutablePathFor: arg inDirectoryPath: commandShell workingDirectory.
					(commandShell shellSyntax isExecutable: exe) ifFalse: [exe := nil].
					exe isNil
						ifTrue: [results nextPut: arg, ': not found']
								ifFalse: [results nextPut: arg, ' is ', exe]]].
				results contents do: [:e | stdout nextPutAll: e; nextPut: Character lf]]
