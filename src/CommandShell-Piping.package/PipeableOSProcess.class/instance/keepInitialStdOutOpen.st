accessing
keepInitialStdOutOpen
	"If false, close the output pipe when the child exits. If true, do not close the output pipe.
	This should be set true for an output pipe connected to another process in a pipeline,
	where it is assumed that the next process will close the pipe when it is done reading
	from it. Otherwise, the default behavior is to close the output pipe after transferring its
	contents to a Smalltalk stream."

	^ keepInitialStdOutOpen ifNil: [keepInitialStdOutOpen := false]
