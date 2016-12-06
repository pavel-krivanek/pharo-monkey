testing-fork squeak
testForkSqueakReferenceStream
	"Fork a connected Squeak child. The child sends a complex object through a
	ReferenceStream on its standard output, and the parent Squeak reads the
	object through a ReferenceStream on the output stream of the child proxy."

	"(PipeableOSProcessTestCase selector: #testForkSqueakReferenceStream) debug"

	| openFileCount child refStream inputStream result s |
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
			[child := PipeableOSProcess forkSqueakAndDoThenQuit:
				[refStream := (Smalltalk at: #ReferenceStream) on: OSProcess thisOSProcess stdOut.
				refStream nextPut: Smalltalk]]
		raise: Warning.
	s := RWBinaryOrTextStream with: child pipeFromOutput upToEndOfFile.
	s reset.
	inputStream := (Smalltalk at: #ReferenceStream) on: s.
	result := inputStream next.
	self assert: result = Smalltalk.
	self should: [self isNumberOfOpenFiles: openFileCount]
