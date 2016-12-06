testing-process proxy
testCommandEcho

	"(PipeableOSProcessTestCase selector: #testCommandEcho) debug"

	| p result |
	self shouldnt: [p := PipeableOSProcess command: '/bin/echo this is a test']
		raise: Warning.
	result := p output.
	p closePipes.
	self assert: ('this is a test*' match: result)