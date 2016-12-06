command pipelines
replaceOutputStreamWith: anotherStreamOrNil
	"Sender is my successor in a command pipeline."

	processProxy isNotYetRunning
		ifFalse:
			[self error: 'too late to change the output now'].
	anotherStreamOrNil isNil
		ifFalse:
			[processProxy initialStdOut: anotherStreamOrNil.
			self pipeFromOutput: nil "Not accessible any more"]
		ifTrue:
			["Sender is my successor in a command pipeline, but does not want to use
			my standard output. Therefore, dump my standard output to the null device."
			pipeFromOutput
				ifNotNil:
					[pipeFromOutput close.
					self pipeFromOutput: nil].
			processProxy initialStdOut: self nullStream]
