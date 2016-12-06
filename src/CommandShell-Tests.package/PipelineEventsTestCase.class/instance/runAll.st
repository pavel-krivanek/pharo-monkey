running
runAll

	"self new runAll"

	| result suite |
	suite := TestSuite new.

	"testing - external proxy events"
	suite addTest: (self class selector: #testExternalPipelineEvents01).
	suite addTest: (self class selector: #testExternalPipelineEvents02).
	suite addTest: (self class selector: #testExternalProxyEvents01).
	suite addTest: (self class selector: #testExternalProxyEvents02).
	suite addTest: (self class selector: #testExternalProxyEvents03).
	suite addTest: (self class selector: #testExternalProxyEvents04).
	suite addTest: (self class selector: #testExternalProxyErrorPipelineEvents).

	"testing - internal proxy events"
	suite addTest: (self class selector: #testInternalPipelineEvents01).
	suite addTest: (self class selector: #testInternalPipelineEvents02).
	suite addTest: (self class selector: #testInternalProxyEvents01).
	suite addTest: (self class selector: #testInternalProxyEvents02).
	suite addTest: (self class selector: #testInternalProxyEvents03).
	suite addTest: (self class selector: #testInternalProxyEvents04).
	suite addTest: (self class selector: #testInternalProxyErrorPipelineEvents).

	result := suite run.
	self should: [result defects size == 0].
	^ result
