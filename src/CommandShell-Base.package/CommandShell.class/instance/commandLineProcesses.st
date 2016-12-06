accessing
commandLineProcesses
	"The Smalltalk processes associated with currently executing command lines. Keep
	track of them here so that they can be conveniently terminated if something gets
	out of whack and needs cleaning up."

	commandLineProcesses ifNil: [commandLineProcesses := OrderedCollection new].
	^ commandLineProcesses
