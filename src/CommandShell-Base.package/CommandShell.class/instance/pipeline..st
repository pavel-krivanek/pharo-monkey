evaluation
pipeline: aCommand
	"Find the individual commands in a command pipeline string, and execute them
	as a command pipeline. Answer a ProxyPipeline collection of processes in the pipeline."

	"(CommandShell new pipeline: 'ps | grep ps | wc') last output"
	"CommandShell new pipeline: 'ls NOSUCHFILE * | dd | cat'"

	| sema pipeline |
	sema := Semaphore new.
	pipeline := ProxyPipeline fromString: aCommand shell: self.
	pipeline when: #complete send: #signal to: sema.
	pipeline value.
	sema wait.
	^ pipeline
