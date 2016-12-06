testing - external proxy events
testExternalProxyEvents03
	"Proxy error data ready events and dependents"

	"(self selector: #testExternalProxyEvents03) run"

	| pipeline proxyOne proxyTwo proxyThree |
	pipeline := self threeExternalProxies.

	proxyOne := pipeline first.
	self assert: proxyOne pipeFromError dependents size = 1.
	self assert: proxyOne pipeFromError dependents first == proxyOne.
	self assert: proxyOne pipeFromError actionMap isEmpty.

	proxyTwo := pipeline second.
	self assert: proxyTwo pipeFromError dependents size = 1.
	self assert: proxyTwo pipeFromError dependents first == proxyTwo.
	self assert: proxyTwo pipeFromError actionMap isEmpty.

	proxyThree := pipeline third.
	self assert: proxyThree pipeFromError dependents size = 1.
	self assert: proxyThree pipeFromError dependents first == proxyThree.
	self assert: proxyThree pipeFromError actionMap isEmpty.
	pipeline value upToEndOfFile "evaluate and allow pipes to be closed"
