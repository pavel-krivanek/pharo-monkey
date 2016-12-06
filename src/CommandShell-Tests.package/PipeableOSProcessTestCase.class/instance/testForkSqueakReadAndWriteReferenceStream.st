testing-fork squeak
testForkSqueakReadAndWriteReferenceStream
	"Fork a connected Squeak child. The child reads one object through a
	ReferenceStream on its standard input, and writes it to a ReferenceStream
	on its standard output. The parent Squeak reads the object through a
	ReferenceStream on the output stream of the child proxy."

	"(PipeableOSProcessTestCase selector: #testForkSqueakReadAndWriteReferenceStream) debug"

	| openFileCount child refStream inputStream result s anObject objectStreamToChild rs |
	rs := Smalltalk at: #ReferenceStream.
	openFileCount := self numberOfOpenFiles.
	self shouldnt:
			[child := PipeableOSProcess forkSqueakAndDoThenQuit:
				["First set standard input to blocking. This avoids a delay to wait for
				data to be available, but note that it is dangerous to do this unless you
				are certain that you know in advance that the correct number of characters
				will be available on the input. If this is not the case, then the VM will block
				on the read and lock up the child squeak process."
				OSProcess thisOSProcess stdIn setBlocking.
				inputStream := rs on: OSProcess thisOSProcess stdIn.
				anObject := inputStream next. "read one object expected to have been sent by parent"
				refStream := rs on: OSProcess thisOSProcess stdOut.
				refStream nextPut: anObject "echo the object back to the parent Squeak"]]
		raise: Warning.
	objectStreamToChild := rs on: child pipeToInput writer.
	objectStreamToChild nextPut: Smalltalk; flush. "send a complex object to the child"
	s := RWBinaryOrTextStream with: child pipeFromOutput upToEndOfFile.
	s reset.
	inputStream := rs on: s.
	result := inputStream next.
	self assert: result = Smalltalk. "another instance of the system dictionary same as original"
	self should: [self isNumberOfOpenFiles: openFileCount]
