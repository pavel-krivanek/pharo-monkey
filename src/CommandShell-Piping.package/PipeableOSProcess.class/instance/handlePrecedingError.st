initialize - release
handlePrecedingError
	"The stderr stream has been redirected. If there are any characters in the
	errorPipelineStream, write them to the stderr stream before proceeding. Fork
	a process to keep reading any additional error messages from preceding
	processes, and write them to the redirected error. When done, close the redirected
	error stream (this does not affect the actual external process, which has its own
	file handle on the error stream). A background process is used to copy the
	errorPipelineStream because it is not straightforward to attach all predecessor
	proxies in a command pipeline to the redirected error output. This design is
	kludgy, but it works."

	| d |
	d := Delay forMilliseconds: 200.
	self setKeepInitialStdErrOpen.
	Processor yield.	"A chance to clean up predecessor proxies in command pipeline"
	errorPipelineStream ifNotNil:
			[processProxy initialStdErr nextPutAll: errorPipelineStream upToEnd.
			[[self isRunning or: [self isNotYetRunning]]
				whileTrue:
					[processProxy initialStdErr nextPutAll: errorPipelineStream upToEnd.
					d wait].
				self keepInitialStdErrOpen ifFalse: [processProxy initialStdErr close]] fork]
