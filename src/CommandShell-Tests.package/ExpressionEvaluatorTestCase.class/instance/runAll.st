Running
runAll

	"self new runAll"

	| result suite |
	suite := TestSuite new.
	suite addTest: (self class selector: #testCommand01).
	suite addTest: (self class selector: #testCommand02).
	suite addTest: (self class selector: #testCommand03).
	suite addTest: (self class selector: #testCommand04).
	suite addTest: (self class selector: #testCommand05).
	suite addTest: (self class selector: #testCommand06).
	suite addTest: (self class selector: #testBlock01).
	suite addTest: (self class selector: #testBlock02).
	suite addTest: (self class selector: #testBlock03).
	result := suite run.
	self should: [result defects size == 0].
	^ result
