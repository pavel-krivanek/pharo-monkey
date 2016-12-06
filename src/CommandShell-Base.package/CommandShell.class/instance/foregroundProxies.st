accessing
foregroundProxies
	"All of my process proxies that are being evaluated in the foreground."

	^ foregroundProxies ifNil: [foregroundProxies := OrderedCollection new]
