testing - external proxy events
testExternalPipelineEvents02
	"No events are defined for the pipeline"

	"(self selector: #testExternalPipelineEvents02) run"

	| pipeline |
	pipeline := self threeExternalProxies.
	self assert: pipeline actionMap isEmpty.
	pipeline value upToEndOfFile "evaluate and allow pipes to be closed"
