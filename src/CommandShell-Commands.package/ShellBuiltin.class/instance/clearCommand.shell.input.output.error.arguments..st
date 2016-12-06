implementations
clearCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Clear the terminal display screen. Answer a string or an invalid command message."

	argArray size == 0 ifFalse:
		[myProxy fail.
		^ commandShell invalidCommandMessage].
	commandShell startUpInNewSession.
	commandShell changed: #clearText
