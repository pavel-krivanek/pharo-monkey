testing - external proxy events
testExternalProxyErrorPipelineEvents

	"(self selector: #testExternalProxyErrorPipelineEvents) run"

	| pipeline |
	pipeline := self threeExternalProxies.

	"The proxies share an errorPipelineStream."
	self assert: pipeline errorPipelineStream == pipeline first errorPipelineStream.
	self assert: pipeline errorPipelineStream == pipeline second errorPipelineStream.
	self assert: pipeline errorPipelineStream == pipeline third errorPipelineStream.

	"The error pipeline has no events defined."
	self assert: pipeline errorPipelineStream actionMap isEmpty.

	"The error pipeline has no dependents."
	self assert: pipeline errorPipelineStream dependents isEmpty.
	pipeline value upToEndOfFile "evaluate and allow pipes to be closed"
