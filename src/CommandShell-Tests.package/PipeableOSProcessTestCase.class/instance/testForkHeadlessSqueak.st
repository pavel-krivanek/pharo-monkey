testing-fork squeak
testForkHeadlessSqueak

	"(PipeableOSProcessTestCase selector: #testForkHeadlessSqueak) debug"

	| openFileCount child |
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
			[child := PipeableOSProcess forkHeadlessSqueakAndDoThenQuit:
				[OSProcess thisOSProcess stdOut
					nextPutAll: 'hello from headless Squeak child']]
		raise: Warning.
	self should: child upToEndOfFile = 'hello from headless Squeak child'.
	self should: [self isNumberOfOpenFiles: openFileCount]
