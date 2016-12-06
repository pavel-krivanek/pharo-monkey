implementations
historyCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Display the command history list."

	| ws rs |
	ws := WriteStream on: Character lf asString.
	rs := ReadStream on: commandShell commandHistory.
	[rs atEnd]
		whileFalse: [ws nextPutAll: rs next.
			ws nextPutAll: ' '.
			ws nextPutAll: rs next.
			rs atEnd
				ifFalse: [ws nextPut: Character lf]].
	stdout nextPutAll: (ws contents, Character lf asString)
