initialize - release
createErrorPipe
	"Create a pipe for the error stream from the child process."

	self pipeFromError: PipeJunction externalPipeClass nonBlockingPipe
