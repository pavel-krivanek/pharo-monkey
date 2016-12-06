evaluation
processCommand: aCommandString
	"Evaluate aCommandString in a separate Smalltalk process. This permits the
	user interface to remain responsive."

	^ self processCommand: aCommandString echo: true
