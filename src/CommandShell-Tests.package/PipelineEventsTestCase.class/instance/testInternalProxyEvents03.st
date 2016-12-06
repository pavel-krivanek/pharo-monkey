testing - internal proxy events
testInternalProxyEvents03
	"Proxy error data ready events and dependents. Internal proxies do not have
	pipeFromError streams, instead they use the errorPipelineStream directly.
	No events or dependencies are required."

	"(self selector: #testInternalProxyEvents03) run"

	| pipeline proxyOne proxyTwo proxyThree |
	pipeline := self threeInternalProxies.

	proxyOne := pipeline first.
	self assert: proxyOne pipeFromError dependents size = 3.
	self assert: (proxyOne pipeFromError dependents includes: proxyOne).
	self assert: proxyOne pipeFromError actionMap isEmpty.

	proxyTwo := pipeline second.
	self assert: proxyTwo pipeFromError dependents size = 3.
	self assert: (proxyOne pipeFromError dependents includes: proxyTwo).
	self assert: proxyTwo pipeFromError actionMap isEmpty.

	proxyThree := pipeline third.
	self assert: proxyThree pipeFromError dependents size = 3.
	self assert: (proxyOne pipeFromError dependents includes: proxyThree).
	self assert: proxyThree pipeFromError actionMap isEmpty.
