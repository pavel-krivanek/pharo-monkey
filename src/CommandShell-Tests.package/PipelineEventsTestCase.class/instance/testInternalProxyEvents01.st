testing - internal proxy events
testInternalProxyEvents01
	"A pipeline is a dependent of the last proxy, which sends #changed: when
	complete. Predecessor proxies could complete out of order if outputs or
	inputs, have been redirected, so the pipeline must ensure that all its
	proxies are complete after the last proxy has indicated its completion."

	"(self selector: #testInternalProxyEvents01) run"

	| pipeline |
	pipeline := self threeInternalProxies.
	self assert: pipeline first dependents isEmpty.
	self assert: pipeline second dependents isEmpty.
	self assert: pipeline third dependents size = 1.
	self assert: pipeline third dependents first == pipeline
