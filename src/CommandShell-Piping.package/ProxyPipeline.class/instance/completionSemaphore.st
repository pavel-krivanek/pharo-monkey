accessing
completionSemaphore
	"Answer the value of completionSemaphore. This semaphore is signaled
	when the last proxy completes. Subsequent cleanup is preformed by a
	process waiting on the semaphore. Completion notification is often triggered
	by the grimReaperProcess, so the separate pipeline cleanup prevents
	those activities from being processed in the context of the grimReaperProcess."

	^ completionSemaphore ifNil: [completionSemaphore := Semaphore new]