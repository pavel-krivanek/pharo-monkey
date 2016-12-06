testing - internal proxy events
testInternalPipelineEvents01
	"No dependents for the pipeline (use events instead)"

	"(self selector: #testInternalPipelineEvents01) run"

	| pipeline |
	pipeline := self threeInternalProxies.
	self assert: pipeline dependents isEmpty.
