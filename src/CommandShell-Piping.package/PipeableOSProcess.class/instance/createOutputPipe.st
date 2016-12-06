initialize - release
createOutputPipe
	"Create a pipe for output from the child process. The pipe should later be set
	to nonBlocking mode only if necessary to provent Squeak VM deadlocks."

	self pipeFromOutput: PipeJunction externalPipeClass blockingPipe
