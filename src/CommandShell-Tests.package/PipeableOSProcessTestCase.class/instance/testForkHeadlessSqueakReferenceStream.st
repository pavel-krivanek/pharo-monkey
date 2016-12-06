testing-fork squeak
testForkHeadlessSqueakReferenceStream
	"Fork a connected Squeak child with no user interface. The child sends a complex
	object through a ReferenceStream on its standard output, and the parent Squeak
	reads the object through a ReferenceStream on the output stream of the child proxy."

	"(PipeableOSProcessTestCase selector: #testForkHeadlessSqueakReferenceStream) debug"

	| openFileCount child refStream inputStream result s |
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
			[child := PipeableOSProcess forkHeadlessSqueakAndDoThenQuit:
				[refStream := (Smalltalk at: #ReferenceStream) on: OSProcess thisOSProcess stdOut.
				refStream nextPut: Smalltalk]]
		raise: Warning.
	s := RWBinaryOrTextStream with: child pipeFromOutput upToEndOfFile.
	s reset.
	inputStream := (Smalltalk at: #ReferenceStream) on: s.
	result := inputStream next.
	self assert: result = Smalltalk.
	self should: [self isNumberOfOpenFiles: openFileCount]
