implementations
fcCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Fix command. If argArray is emply, answer the last command in the
	history list. If there is one argument, interpret it as an integer index
	into the history list. Otherwise answer an invalid command message."

	| index cmd |
	commandShell commandHistory ifNotNil:
		[commandShell scheduleToEvaluate:
			[argArray size == 0
				ifTrue:
					[cmd := commandShell editCommand: (commandShell historyAt: 0)]
				ifFalse:
					[[index := (argArray at: 1) asNumber]
								on: Error
								do: [:ex | index := nil].
					cmd := commandShell editCommand:
							(index isNil
								ifTrue: ['']
								ifFalse: [commandShell historyAt: index])].
					commandShell notifyPrompt.
					cmd isEmpty ifFalse:
						[commandShell outputStream nextPutAll: cmd; cr; flush; processCommand: cmd echo: false]]]
