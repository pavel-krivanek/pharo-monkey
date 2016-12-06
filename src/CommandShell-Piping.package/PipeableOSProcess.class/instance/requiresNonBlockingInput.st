testing
requiresNonBlockingInput
	"A PipeJunction managed by Squeak may be subject to deadlocks associated with
	reading or writing an OSPipe. A PipeableOSProcess relies on the external operating
	system to provide process scheduling, so it will not block the Squeak VM when it
	is blocked on a read or a write."

	^ false