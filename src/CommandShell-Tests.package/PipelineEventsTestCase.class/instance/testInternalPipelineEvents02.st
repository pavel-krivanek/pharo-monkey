testing - internal proxy events
testInternalPipelineEvents02
	"No events are defined for the pipeline"

	"(self selector: #testInternalPipelineEvents02) run"

	| pipeline |
	pipeline := self threeInternalProxies.
	self assert: pipeline actionMap isEmpty
