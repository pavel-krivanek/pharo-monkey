private
unixFileNumbers
	"Utility method for debugging. Answer the Unix file numbers for the streams
	associated with this instance. This may be useful for debugging file handle
	leaks (files or sockets being opened but never closed).

	When a process proxy is initially set up, it will normally have six file
	numbers associated with it prior to forking the child (two file numbers each
	for stdin, stdout, and stderr). Once the child is forked, the process proxy in
	Squeak will close its copies of the child ends of the pipes, so only three of
	the original six file numbers remain visible to Squeak."

	"(PipeableOSProcess command: 'who') unixFileNumbers"

	"(PipeableOSProcess new: '/bin/ls'
		arguments: #('-ls' 'hosts' 'NOSUCHFILE') environment: nil
		descriptors: nil workingDir: '/etc'
		errorPipelineStream: ((WriteStream on: String new)
		nextPutAll: 'this is the error stream '; yourself)) unixFileNumbers"

	| d |
	Smalltalk at: #OSProcess ifPresent:
		[:osp |
		d := Dictionary new.
		d at: #initialStdIn put: (osp accessor unixFileNumber: processProxy initialStdIn ioHandle).
		d at: #initialStdOut put: (osp accessor unixFileNumber: processProxy initialStdOut ioHandle).
		d at: #initialStdErr put: (osp accessor unixFileNumber: processProxy initialStdErr ioHandle).
		d at: #'pipeToInput writer'
			put: (osp accessor unixFileNumber: pipeToInput writer ioHandle).
		d at: #'pipeFromOutput reader'
			put: (osp accessor unixFileNumber: pipeFromOutput reader ioHandle).
		d at: #'pipeFromError reader'
			put: (osp accessor unixFileNumber: pipeFromError reader ioHandle).
		^ d].
	^ nil
