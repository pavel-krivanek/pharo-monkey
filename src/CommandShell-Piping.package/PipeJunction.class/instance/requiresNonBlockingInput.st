testing
requiresNonBlockingInput
	"A PipeJunction managed by Squeak may be subject to deadlocks associated with
	reading or writing an OSPipe. Answer true if the input pipe must function in
	nonBlocking mode in order to prevent deadlocks. This method exists simply to
	make the requirement explicit."

	^ true