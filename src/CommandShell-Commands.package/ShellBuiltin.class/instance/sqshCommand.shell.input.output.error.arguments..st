implementations
sqshCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Open a new shell window."

	| ws |
	argArray size == 0
		ifTrue:
			[commandShell scheduleToEvaluate: [commandShell class open]]
		ifFalse:
			[ws := WriteStream on: String new.
			argArray inject: true into:
				[:first :each |
				first ifFalse: [ws nextPut: Character space].
				ws nextPutAll: each.
				false].
			commandShell scheduleToEvaluate: [commandShell class openLabel: ws contents]]
