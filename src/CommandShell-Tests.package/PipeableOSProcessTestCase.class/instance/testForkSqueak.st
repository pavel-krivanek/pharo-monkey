testing-fork squeak
testForkSqueak

	"(PipeableOSProcessTestCase selector: #testForkSqueak) debug"

	| openFileCount child response in |
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
			[child := PipeableOSProcess forkSqueakAndDoThenQuit:
				[in := OSProcess thisOSProcess stdIn upToEnd.
				OSProcess thisOSProcess stdOut nextPutAll: in]]
		raise: Warning.
	child nextPutAll: 'hello'.
	child pipeToInput close.
	response := child upToEndOfFile.
	self should: response = 'hello'.
	self should: [self isNumberOfOpenFiles: openFileCount]
