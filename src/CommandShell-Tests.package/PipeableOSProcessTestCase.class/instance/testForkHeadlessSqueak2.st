testing-fork squeak
testForkHeadlessSqueak2

	"(PipeableOSProcessTestCase selector: #testForkHeadlessSqueak2) debug"

	| openFileCount child response in |
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
			[child := PipeableOSProcess forkHeadlessSqueakAndDoThenQuit:
				[(Delay forMilliseconds: 100) wait. "wait for data to arrive"
				in := OSProcess thisOSProcess stdIn upToEnd.
				OSProcess thisOSProcess stdOut nextPutAll: in]]
		raise: Warning.
	child nextPutAll: 'hello'.
	child pipeToInput close.
	response := child upToEndOfFile.
	self should: response = 'hello'.
	self should: [self isNumberOfOpenFiles: openFileCount]
