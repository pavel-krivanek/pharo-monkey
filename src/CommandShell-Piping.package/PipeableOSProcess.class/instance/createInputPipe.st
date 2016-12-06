initialize - release
createInputPipe
	"Create a pipe for input to the child process."

	self pipeToInput: PipeJunction externalPipeClass blockingPipe
