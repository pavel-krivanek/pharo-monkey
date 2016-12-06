examples
unixCommandPipeLine
	"Run a pipeline of commands in a manner similar to Unix command shell
	usage, and answer the result as a string."

	"PipeableOSProcess unixCommandPipeLine"

	^ ((PipeableOSProcess command: 'ps') | 'grep squeak' | 'cut -c16-100') output