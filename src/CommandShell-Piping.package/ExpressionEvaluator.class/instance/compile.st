evaluating
compile
	"Compile my expression into a block with zero to four parameters. The parameters,
	if present, correspond to my pipeToInput, pipeFromOutput, errorPipelineStream, and
	an array of extra parameters (in that order). By convention, these are named 'stdin',
	'stdout', 'stderr', and 'args' within my expression string.

	If the compilation fails due to a syntax error (compile time failure, not run time
	failure), put an error message on the standard error stream and answer a block
	which evaluates to a null string."

	evaluationBlock ifNil:
		[evaluationBlock :=
			[Compiler evaluate: self blockString
					for: self
					notifying: self
					logged: false]
				on: Exception
				do: [:e |
					self errorPipelineStream
						nextPutAll: 'Compiler: invalid Smalltalk expression ', self blockString;
						nextPut: Character lf.
					self fail.
					nil]]
