streaming
nextFromError: count
	"Answer up to count characters from the error pipeline stream, or an empty string
	if no data is available. All characters are routed through the errorPipelineStream,
	which is shared by all my proxies."

	^ self last next: count
