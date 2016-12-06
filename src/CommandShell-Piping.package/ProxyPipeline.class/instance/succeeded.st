testing
succeeded
	"Answer true if all proxies succeeded, otherwise false"

	self detect: [:proxy | proxy succeeded not] ifNone: [^ true].
	^ false
