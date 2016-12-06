examples
addTwoPlusTwoInChildSqueak
	"Fork a headless child Squeak. Send three objects to the child, and read one object
	returned from the child. The child Squeak uses the three objects to compute a result,
	which it sends back to its parent Squeak before exiting."

	"PipeableOSProcess addTwoPlusTwoInChildSqueak"

	| serializerClass childBlock in out rcv op param result childProxy writer sum s inputStream |
	(serializerClass := Smalltalk at: #ReferenceStream ifPresent: [:cls | cls ])
		ifNil: [^ self notify: 'ReferenceStream not found'].
	"Create block to be evaluated in a Squeak child process."
	childBlock := ["First set standard input to blocking. This avoids a delay to wait for
		data to be available, but note that it is dangerous to do this unless you
		are certain that you know in advance that the correct number of characters
		will be available on the input. If this is not the case, then the VM will block
		on the read and lock up the child squeak process."
		OSProcess thisOSProcess stdIn setBlocking.
		in := serializerClass on: OSProcess thisOSProcess stdIn.
		out := serializerClass on: OSProcess thisOSProcess stdOut.
		"read three objects"
		rcv := in next.
		op := in next.
		param := in next.
		"add two plus two"
		result := rcv perform: op with: param.
		"answer the result"
		out nextPut: result].
	"Fork a child Squeak that will evaluate the childBlock then exit"
	childProxy := PipeableOSProcess forkHeadlessSqueakAndDoThenQuit: childBlock.
	"Write three objects to the child Squeak process"
	writer := serializerClass on: childProxy pipeToInput writer.
	writer nextPut: 2.
	writer nextPut: #+.
	writer nextPut: 2.
	"Read the result object from the child Squeak process"
	s := RWBinaryOrTextStream with: childProxy pipeFromOutput upToEndOfFile.
	s reset.
	inputStream := serializerClass on: s.
	sum := inputStream next.
	"show result of 2 + 2 evaluated in the child Squeak"
	self inform: '2 + 2 equals ', sum asString.
	^ sum
