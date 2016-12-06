proxy creation
pipeableProxyFor: commandString 
	"Create a new proxy for a PipeJunction. The proxy may be any type
	of PipeJunction, such as a PipeableOSProcess or ExpressionEvaluator.
	Send #value to evaluate the newly created proxy."

	"(CommandShell pipeableProxyFor: 'ls -l') value upToEndOfFile"
	"(CommandShell pipeableProxyFor: 'Array new: 4 !') value upToEndOfFile"
	"(CommandShell pipeableProxyFor: 'help') value upToEndOfFile"

	^ self new
		pipeableProxyFor: commandString
		input: nil
		output: nil
		error: nil
		predecessorProxy: nil