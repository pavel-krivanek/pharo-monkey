running
runAll

	"ShellSyntaxTestCase new runAll"

	| result suite |
	suite := TestSuite new.

	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel01).
	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel02).
	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel03).
	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel01).
	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel10).
	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel11).
	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel12).
	suite addTest: (ShellSyntaxTestCase selector: #testUpOneDirectoryLevel13).

	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom01).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom02).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom03).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom04).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom05).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom06).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom07).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom08).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom09).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom10).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom11).
	suite addTest: (ShellSyntaxTestCase selector: #testStringTokensFrom12).

	suite addTest: (ShellSyntaxTestCase selector: #testArgsFromCommand01).
	suite addTest: (ShellSyntaxTestCase selector: #testArgsFromCommand02).
	suite addTest: (ShellSyntaxTestCase selector: #testArgsFromCommand03).
	suite addTest: (ShellSyntaxTestCase selector: #testArgsFromCommand04).
	suite addTest: (ShellSyntaxTestCase selector: #testArgsFromCommand05).

	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument01).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument02).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument03).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument04).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument05).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument06).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument07).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument08).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument09).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument10).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument11).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument12).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument13).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgument14).

	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgumentFrom01).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgumentFrom02).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandArgumentFrom03).

	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths01).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths02).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths03).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths04).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths05).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths06).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths07).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths08).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths09).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths10).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths11).

	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths20).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths21).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths22).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths23).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths24).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths25).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths26).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths27).
	suite addTest: (ShellSyntaxTestCase selector: #testExpandedPaths28).

	suite addTest: (ShellSyntaxTestCase selector: #testNewDirPathFrom01).
	suite addTest: (ShellSyntaxTestCase selector: #testNewDirPathFrom02).
	suite addTest: (ShellSyntaxTestCase selector: #testNewDirPathFrom03).
	suite addTest: (ShellSyntaxTestCase selector: #testNewDirPathFrom04).
	suite addTest: (ShellSyntaxTestCase selector: #testNewDirPathFrom05).

	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument01).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument02).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument04).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument05).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument06).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument07).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument08).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument09).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument10).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument11).
	suite addTest: (ShellSyntaxTestCase selector: #testFirstExpandedArgument12).

	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath01).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath02).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath03).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath04).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath05).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath06).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath10).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath11).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath12).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath13).
	suite addTest: (ShellSyntaxTestCase selector: #testAppendPathToPath14).

	result := suite run.
	self should: [result defects size == 0].
	^ result
