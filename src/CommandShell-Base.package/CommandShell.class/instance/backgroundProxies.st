accessing
backgroundProxies
	"All of my process proxies that are being evaluated in the background."

	backgroundProxies ifNil: [backgroundProxies := OrderedCollection new].
	^ backgroundProxies