evaluation
value
	"Initiate evaluation of each member of the pipeline, and answer the
	last proxy in the pipeline. Evaluation may proceed asynchronously, and
	the sender should wait for the last proxy to complete its evalation in order
	to obtain complete output and error contents from the pipeline."

	"(ProxyPipeline command: 'ls | cat | wc' shell: CommandShell new) value"

	self completionWatcher: (self handleCompletionWhenSignaled: self completionSemaphore).
	self do: [:proxy |
		proxy value.
		"A proxy may have associated Smalltalk processes for stream handling.
		Schedule a short delay to permit these processes to be started prior to
		starting the next proxy in the pipeline."
		(Delay forMilliseconds: 10) wait]
