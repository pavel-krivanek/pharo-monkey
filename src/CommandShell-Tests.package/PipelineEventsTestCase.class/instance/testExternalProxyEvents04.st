testing - external proxy events
testExternalProxyEvents04
	"Proxy output data ready events and dependents"

	"(self selector: #testExternalProxyEvents04) run"

	| pipeline proxyOne proxyTwo proxyThree |
	pipeline := self threeExternalProxies.

	proxyOne := pipeline first.
	self assert: proxyOne pipeFromOutput dependents size = 1.
	self assert: proxyOne pipeFromOutput dependents first == proxyOne.
	self assert: proxyOne pipeFromOutput actionMap isEmpty.

	proxyTwo := pipeline second.
	self assert: proxyTwo pipeFromOutput dependents size = 1.
	self assert: proxyTwo pipeFromOutput dependents first == proxyTwo.
	self assert: proxyTwo pipeFromOutput actionMap isEmpty.

	proxyThree := pipeline third.
	self assert: proxyThree pipeFromOutput dependents size = 1.
	self assert: proxyThree pipeFromOutput dependents first == proxyThree.
	self assert: proxyThree pipeFromOutput actionMap isEmpty.
	pipeline value upToEndOfFile "evaluate and allow pipes to be closed"
