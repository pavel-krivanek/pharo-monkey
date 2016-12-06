command pipelines - private
prepareOutputForPipe
	"Output stream will be used by another process proxy as input. Set output stream
	characteristics accordingly."

	super prepareOutputForPipe.
	self setKeepInitialStdOutOpen; setBlockingOutput
