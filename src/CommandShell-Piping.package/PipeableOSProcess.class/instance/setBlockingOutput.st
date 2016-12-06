private
setBlockingOutput
	"Set the pipe from the child stdout to blocking mode. This is the normal
	mode for a pipe, although for Squeak we set pipe outputs to nonblocking
	to protect ourselves from blocking the Squeak VM when reading from
	a pipe. Unix command pipelines use the normal blocking behavior, and
	let the operating system timeslice the processes to keep the rest of the
	world from hanging on a blocked read."

	Smalltalk at: #OSProcess ifPresent:
		[:osp | pipeFromOutput ifNotNil: [osp accessor setBlocking: self pipeFromOutput reader ioHandle]]
