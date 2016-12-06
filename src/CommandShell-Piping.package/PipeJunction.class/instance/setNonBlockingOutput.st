initialize - release
setNonBlockingOutput
	"Check first to make sure process is not complete because pipeFromOutput will not respond
	to #setNonBlocking after the process has exited."

	self isComplete ifFalse: [pipeFromOutput setNonBlocking]