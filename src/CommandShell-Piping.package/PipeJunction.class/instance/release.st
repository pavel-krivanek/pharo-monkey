initialize - release
release
	"The input pipe may be released, but the output and error pipes may
	still be in use."

	self pipeToInput release.
	^ super release