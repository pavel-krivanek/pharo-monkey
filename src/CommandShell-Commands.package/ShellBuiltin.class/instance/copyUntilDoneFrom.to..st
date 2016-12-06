private
copyUntilDoneFrom: aPipe to: aStream
	"Copy the contents of aPipe to aStream, where aPipe is the output of a process
	proxy. Whenever new data is available, aPipe will trigger #dataReady. This
	method responds to the #dataReady events until the end of the pipe is reached.
	It is possible for the #atEnd check to give a false negative, so a timeout alarm
	is used to prevent deadlock conditions."

	| sema s |
	sema := Semaphore new.
	aPipe when: #dataReady send: #signal to: sema.
	[aPipe atEndOfFile] whileFalse:
		[self timeoutAfter: 200 notifying: sema.
		sema wait. "Wait for data available"
		[(s := aPipe next: 10000) isEmpty] whileFalse:
			[aStream nextPutAll: s; flush]].
	aPipe release.
	^ aStream
