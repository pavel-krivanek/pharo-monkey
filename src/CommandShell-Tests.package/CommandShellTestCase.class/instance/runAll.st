running
runAll
	"Functional failures will be reported as failures, and problems with number
	of open file handles will be reported as errors (they can be intermittent and
	possibly bogus). Note: setting checkFileHandleCount to true here forces a
	count check after all the tests are run. The individual tests may or may
	not do the file count check, depending on what is done in the #setUp method."

	"CommandShellTestCase new checkFileHandleCount: true; runAll"
	"CommandShellTestCase new checkFileHandleCount: false; runAll"

	| result suite openFileCount |
	suite := TestSuite new.
	openFileCount := self numberOfOpenFiles.
	suite addTest: (CommandShellTestCase selector: #testPipeline01).
	suite addTest: (CommandShellTestCase selector: #testPipeline02).
	suite addTest: (CommandShellTestCase selector: #testPipeline03).
	suite addTest: (CommandShellTestCase selector: #testPipeline04).
	suite addTest: (CommandShellTestCase selector: #testPipeline05).
	suite addTest: (CommandShellTestCase selector: #testPipeline06).
	suite addTest: (CommandShellTestCase selector: #testPipeline07).
	suite addTest: (CommandShellTestCase selector: #testPipeline08).
	suite addTest: (CommandShellTestCase selector: #testPipeline09).
	suite addTest: (CommandShellTestCase selector: #testPipeline10).
	suite addTest: (CommandShellTestCase selector: #testPipeline11).
	suite addTest: (CommandShellTestCase selector: #testPipeline12).
	suite addTest: (CommandShellTestCase selector: #testPipeline13).
	suite addTest: (CommandShellTestCase selector: #testPipeline14).
	suite addTest: (CommandShellTestCase selector: #testPipeline20).
	suite addTest: (CommandShellTestCase selector: #testPipeline21).
	suite addTest: (CommandShellTestCase selector: #testPipeline22).
	suite addTest: (CommandShellTestCase selector: #testPipeline23).
	suite addTest: (CommandShellTestCase selector: #testPipeline24).
	suite addTest: (CommandShellTestCase selector: #testPipeline25).
	suite addTest: (CommandShellTestCase selector: #testPipeline26).
	suite addTest: (CommandShellTestCase selector: #testPipeline27).
	suite addTest: (CommandShellTestCase selector: #testPipeline28).
	suite addTest: (CommandShellTestCase selector: #testPipeline30).
	suite addTest: (CommandShellTestCase selector: #testPipeline31).
	suite addTest: (CommandShellTestCase selector: #testPipeline32).
	suite addTest: (CommandShellTestCase selector: #testPipeline33).
	suite addTest: (CommandShellTestCase selector: #testPipeline34).
	suite addTest: (CommandShellTestCase selector: #testPipeline35).
	suite addTest: (CommandShellTestCase selector: #testPipeline36).
	suite addTest: (CommandShellTestCase selector: #testPipeline37).
	suite addTest: (CommandShellTestCase selector: #testPipeline38).
	suite addTest: (CommandShellTestCase selector: #testPipeline39).
	suite addTest: (CommandShellTestCase selector: #testPipeline40).
	suite addTest: (CommandShellTestCase selector: #testPipeline41).
	suite addTest: (CommandShellTestCase selector: #testPipeline42).
	suite addTest: (CommandShellTestCase selector: #testPipeline50).
	suite addTest: (CommandShellTestCase selector: #testPipeline51).
	suite addTest: (CommandShellTestCase selector: #testPipeline52).
	suite addTest: (CommandShellTestCase selector: #testPipeline53).
	suite addTest: (CommandShellTestCase selector: #testPipeline60).
	suite addTest: (CommandShellTestCase selector: #testPipeline61).
	suite addTest: (CommandShellTestCase selector: #testPipeline62).
	suite addTest: (CommandShellTestCase selector: #testPipeline63).
	suite addTest: (CommandShellTestCase selector: #testPipeline64).
	suite addTest: (CommandShellTestCase selector: #testPipeline65).
	suite addTest: (CommandShellTestCase selector: #testPipeline66).
	suite addTest: (CommandShellTestCase selector: #testPipeline70).
	suite addTest: (CommandShellTestCase selector: #testPipeline71).
	suite addTest: (CommandShellTestCase selector: #testPipeline72).
	suite addTest: (CommandShellTestCase selector: #testPipeline73).
	suite addTest: (CommandShellTestCase selector: #testPipeline74).
	suite addTest: (CommandShellTestCase selector: #testPipeline80).
	suite addTest: (CommandShellTestCase selector: #testPipeline81).
	suite addTest: (CommandShellTestCase selector: #testPipeline90).
	suite addTest: (CommandShellTestCase selector: #testPipeline91).
	suite addTest: (CommandShellTestCase selector: #testPipeline92).
	suite addTest: (CommandShellTestCase selector: #testPipeline93).
	suite addTest: (CommandShellTestCase selector: #testPipeline94).
	suite addTest: (CommandShellTestCase selector: #testPipeline95).
	result := suite run.
	self should: [result defects size == 0].
	self should: [self isNumberOfOpenFiles: openFileCount].
	^ result
