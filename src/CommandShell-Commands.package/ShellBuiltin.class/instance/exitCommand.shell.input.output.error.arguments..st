implementations
exitCommand: myProxy shell: commandShell input: stdin output: stdout error: stderr arguments: argArray
	"Exit the shell window. Answer a string or an invalid command message."

	argArray size == 0 ifFalse:
		[myProxy fail.
		^ commandShell invalidCommandMessage].
	commandShell changed: #exit
