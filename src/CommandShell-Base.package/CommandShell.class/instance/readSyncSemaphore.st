accessing
readSyncSemaphore
	"Used in MVC to pause the screen output when presenting a dialogue to the user"

	readSyncSemaphore ifNil: [readSyncSemaphore := Semaphore forMutualExclusion].
	^ readSyncSemaphore