testing
testNonBlocking

	"(InternalPipeTestCase selector: #testNonBlocking) run"

	| ws str |
	pipe setNonBlocking.
	self writeStuffOnThenClose: pipe.
	ws := self readFromAndClose: pipe writingTo: (WriteStream on: String new).
	str := (ws contents last: 16).
	self should: ['this is line 10*' match: str]
