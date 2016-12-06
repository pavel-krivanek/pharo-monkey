testing - external proxy events
testExternalProxyEvents02
	"No actions defined for the elements of a pipeline. Note: Some earlier development
	versions of CommandShell used events heavily, but this was complex and provided
	poor performance."

	"(self selector: #testExternalProxyEvents02) run"

	| pipeline |
	pipeline := self threeExternalProxies.
	self assert: pipeline first actionMap isEmpty.
	self assert: pipeline second actionMap isEmpty.
	self assert: pipeline third actionMap isEmpty.
	pipeline value upToEndOfFile "evaluate and allow pipes to be closed"
