instance creation
command: aCommandString
	"Evaluate aCommandString in the context of a CommandShell, using a
	CommandShellTranscript to display the results."

	"CommandShell command: 'help'"
	"CommandShell command: 'ls'"

	| cs w |
	cs := self new.
	w := cs openLabel: self defaultWindowName.
	w scheduleToEvaluate: [w nextPutAll: aCommandString; cr].
	w processCommand: aCommandString.
	^ w
