running
runAll

	"InternalPipeTestCase new runAll"

	| result suite |
	suite := TestSuite new.
	suite addTest: (InternalPipeTestCase selector: #testBlocking).
	suite addTest: (InternalPipeTestCase selector: #testNonBlocking).
	result := suite run.
	self should: [result defects size == 0].
	^ result
