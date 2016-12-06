evaluating
value

	self isNotYetRunning ifTrue:
		[self success. "Hope for the best, send #fail if something goes wrong"
		self running.
		self ensurePipeFromOutput.
		self shellBuiltin
				performWith: self argumentArray
				evaluator: self
				shell: self commandShell
				input: self pipeToInput
				output: self pipeFromOutput
				error: self errorPipelineStream]
