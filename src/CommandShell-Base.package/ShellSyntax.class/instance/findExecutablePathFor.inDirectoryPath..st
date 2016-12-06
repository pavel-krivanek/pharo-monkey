path name expansion
findExecutablePathFor: aString inDirectoryPath: pathString
	"Look for the executable, following Unix conventions for searching the PATH.
	If no likely candidate is found, answer nil."

	"ShellSyntax new findExecutablePathFor: 'bash' inDirectoryPath: nil"
	"ShellSyntax new findExecutablePathFor: 'ReadMe.txt' inDirectoryPath: nil"
	"ShellSyntax new findExecutablePathFor: 'SqueakDebug.log' inDirectoryPath: nil"
	"ShellSyntax new findExecutablePathFor: 'noSuchFileName' inDirectoryPath: nil"
	"ShellSyntax new findExecutablePathFor: 'a' inDirectoryPath: nil"
	"ShellSyntax new findExecutablePathFor: 'sqcat' inDirectoryPath: '/home/lewis/bin'"

	| delimiter path localNames fullName fileExists |
	self canAccessOSProcess ifFalse: [^ nil].
	delimiter := CommandShell pathNameDelimiter.
	path := (pathString
				ifNil: [self workingDirectory])
					ifNil: [CommandShell defaultPathString].
	"Unix compatibility note: If aString contains wildcard characters,
	it is expanded in the context of the current working directory. Expansion
	does not take place in the context of the PATH directories."
	(aString includes: delimiter)
		ifTrue:
			["A fully or partially qualified path, do not search PATH"
			^ (self expandedPathsFrom: aString beginningAt: pathString)
				detect: [:fileName |
					(CommandShell fileExists: fileName inPath: path) and: [self isExecutable: fileName]]
				ifNone: [nil]]
		ifFalse:
			["Look for the file in the PATH locations"
			localNames := self glob: aString inDirectory: path.
			(localNames size == 0)
				ifTrue:
					["Name was not expanded, so use the unmodified value of aString"
					localNames := Array with: aString].
			(self pathEntriesInDirectoryPath: path)
				do: [:pathName |
					localNames
						do: [:fileName |
							fileExists := [ CommandShell useFileSystem
									ifTrue: [ CommandShell fileExists: fileName inDirectory: (pathName perform: #asFileReference) ]
									ifFalse: [ CommandShell fileExists: fileName inDirectory: ((Smalltalk at: #FileDirectory) on: pathName) ]
								] on: (Smalltalk at: #InvalidDirectoryError ifAbsent: [ Error ]) "Pharo does not have InvalidDirectoryError"
									do: [:e | false].
							fileExists ifTrue:
								[fullName := pathName, CommandShell pathSeparator, fileName.
								(self isExecutable: fullName)
									ifTrue: [^ fullName]]]].
			^ nil]