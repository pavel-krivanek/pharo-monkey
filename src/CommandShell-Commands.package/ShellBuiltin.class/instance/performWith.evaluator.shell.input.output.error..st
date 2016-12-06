evaluating
performWith: argumentArray evaluator: aPipeableEvaluator shell: aCommandShell input: inputStream output: outputStream error: errorStream

	self perform: self procedureSelector
		withArguments: (Array
			with: aPipeableEvaluator
			with: aCommandShell
			with: inputStream
			with: outputStream
			with: errorStream
			with: argumentArray).
	aPipeableEvaluator complete
