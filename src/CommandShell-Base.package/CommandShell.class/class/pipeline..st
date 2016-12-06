proxy creation
pipeline: aCommand
	"Find the individual commands in a command pipeline string, and evaluate
	them as a command pipeline. Answer a ProxyPipeline collection of processes
	in the pipeline."

	"(CommandShell pipeline: 'ps | grep ps | wc') upToEndOfFile"
	"(CommandShell pipeline: 'ls NOSUCHFILE * | dd | cat') errorUpToEndOfFile"
	"(CommandShell pipeline: 'ls NOSUCHFILE * | dd | cat') upToEndOfFile"

	^ self new pipeline: aCommand
