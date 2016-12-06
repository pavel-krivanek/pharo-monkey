command pipelines
setKeepInitialStdOutOpen
	"When child exits, do not close the output pipe. This is for an output pipe connected to
	another process in a pipeline, where it is assumed that the next process will close
	the pipe when it is done reading from it."

	self keepInitialStdOutOpen: true