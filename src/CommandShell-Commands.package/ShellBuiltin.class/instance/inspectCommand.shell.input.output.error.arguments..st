implementations
inspectCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Open a Smalltalk inspector on the contents of stdin, or the file(s) named on the
	command line."

	| fs inputString pathName |
	(argArray isNil or: [argArray size == 0])
		ifTrue:
			[stdin ifNotNil:
				["When taking input from a command pipeline, the input must be
				read into inputString now. This is because, in MVC, the inspector
				is scheduled to be created later, and the input pipe will be closed by
				the caller of this method before the deferred block ever has a
				chance to read it."
				inputString := stdin ifNotNil:
					[(self copyUntilDoneFrom: stdin to: (WriteStream on: String new)) contents
						replaceAll: Character lf with: Character cr].
				commandShell scheduleToEvaluate: [inputString inspect]]]
		ifFalse:
			[argArray isEmpty
				ifTrue:
					[commandShell scheduleToEvaluate: [nil inspect]]
				ifFalse:
					[argArray do:
						[:e |
						pathName := commandShell shellSyntax
							firstExpandedArgument: e
							inDirectoryPath: commandShell shellSyntax workingDirectory.
						fs := (CommandShell fileExists: pathName)
							ifTrue: [FileStream readOnlyFileNamed: pathName]
							ifFalse: [nil].
						fs isNil
							ifTrue:
								[commandShell scheduleToEvaluate: [nil inspect]]
							ifFalse:
								[commandShell scheduleToEvaluate:
									[(fs contentsOfEntireFile
									replaceAll: Character lf
									with: Character cr) inspect.
									fs close]]]]]
