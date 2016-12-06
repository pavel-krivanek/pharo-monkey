implementations
pwdCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Answer the current working directory (a string) or an invalid command message."

	| directoryString |
	directoryString := commandShell workingDirectory.
	directoryString isEmpty ifTrue: [directoryString := self nullDirectoryString].
	argArray size == 0 ifFalse:
		[myProxy fail.
		^ commandShell invalidCommandMessage].
	stdout nextPutAll: directoryString; nextPut: Character lf
