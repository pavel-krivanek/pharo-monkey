testing
testBlocking

	"(InternalPipeTestCase selector: #testBlocking) run"

	| resultString |
	pipe setBlocking.
	self writeStuffOnThenClose: pipe.
	Processor yield.
	resultString := pipe upToEnd last: 16.
	self should: [resultString notNil].
	self should: ['this is line 10*' match: resultString]
