path name expansion
programNameAndArgumentsFrom: aString inDirectoryPath: pathString findExecutable: expandExePath
	"Answer an array with the name of the program to run, and with the expanded
	arguments list. If expandExePath is true, search the file system for an executable
	program to run, otherwise use the literal command name."

	"ShellSyntax new
		programNameAndArgumentsFrom: 'sleep 6'
		inDirectoryPath: '/etc'
		findExecutable: true"
	"ShellSyntax new
		programNameAndArgumentsFrom: 'sleep 6'
		inDirectoryPath: '/etc'
		findExecutable: false"
	"ShellSyntax new
		programNameAndArgumentsFrom: 'ls -l h?s*'
		inDirectoryPath: '/etc'
		findExecutable: true"

	| tokens tok args exe |
	tokens := self argsFromCommand: aString.
	tokens size == 0
		ifTrue: [tok := '']
		ifFalse: [tok := tokens at: 1].
	args := self
		expandArgumentsFrom: (tokens copyFrom: 2 to: tokens size)
		inDirectoryPath: pathString.
	exe := expandExePath
		ifTrue: [self findExecutablePathFor: tok inDirectoryPath: pathString]
		ifFalse: [tok].
	^ exe ifNotNil: [Array with: exe with: args]
