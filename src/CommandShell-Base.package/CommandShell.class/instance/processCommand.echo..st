evaluation
processCommand: aCommandString echo: showCommand
	"Evaluate aCommandString in a separate Smalltalk process. This permits the
	user interface to remain responsive. If showCommand is true, update dependent
	views in order to display the command."

	self commandLineProcesses add:
		([self command: aCommandString echo: showCommand.
		self commandLineProcesses
				remove: Processor activeProcess
				ifAbsent: []] forkAt: Processor userBackgroundPriority)
