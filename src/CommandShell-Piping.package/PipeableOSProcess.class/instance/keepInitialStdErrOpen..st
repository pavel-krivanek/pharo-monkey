accessing
keepInitialStdErrOpen: trueOrFalse
	"True if stderr has been redirected and the handle must be kept open in case
	a predecessor in a command pipeline might have more error messages to write
	to the redirected error stream."

	keepInitialStdErrOpen := trueOrFalse