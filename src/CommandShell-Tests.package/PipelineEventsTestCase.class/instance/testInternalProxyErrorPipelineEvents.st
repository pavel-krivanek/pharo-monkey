testing - internal proxy events
testInternalProxyErrorPipelineEvents

	"(self selector: #testInternalProxyErrorPipelineEvents) run"

	| pipeline |
	pipeline := self threeInternalProxies.

	"The proxies share an errorPipelineStream."
	self assert: pipeline errorPipelineStream == pipeline first errorPipelineStream.
	self assert: pipeline errorPipelineStream == pipeline second errorPipelineStream.
	self assert: pipeline errorPipelineStream == pipeline third errorPipelineStream.

	"The error pipeline has no events defined."
	self assert: pipeline errorPipelineStream actionMap isEmpty.

	"Internal proxies are dependents of the errorPipelineStream, because they
	use is directly as their pipeFromError."
	self assert: (pipeline errorPipelineStream dependents size = 3).
