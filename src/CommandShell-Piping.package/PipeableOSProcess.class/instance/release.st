initialize - release
release

	self processProxy release.
	self pipeFromError release.
	^ super release