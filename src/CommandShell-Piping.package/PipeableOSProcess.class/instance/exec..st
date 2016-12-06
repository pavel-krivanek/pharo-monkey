evaluating
exec: aString
	"Pass aString to the child for execution. Presumably the child is running a
	command processor of some kind, such as a Unix shell."

	processProxy isRunning
		ifTrue:
			[self nextPutAll: aString;
			nextPut: Character lf;
			flush]
		ifFalse: [self notify: 'child process not running']


