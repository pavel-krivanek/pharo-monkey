testing - external proxy events
testExternalPipelineEvents01
	"No dependents for the pipeline (use events instead)"

	"(self selector: #testExternalPipelineEvents01) run"

	| pipeline |
	pipeline := self threeExternalProxies.
	self assert: pipeline dependents isEmpty.
	pipeline value upToEndOfFile "evaluate and allow pipes to be closed"
